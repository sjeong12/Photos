<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<HTML><HEAD>
<TITLE>내 디자인</TITLE></HEAD>

<script language=javascript>
function order_design()
{
	document.frm_o.action = "/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign";
	document.frm_o.submit();
}

function add_option()
{
	document.frm_addD.action = "/LSJ_PHOTO/home.jsp?page=/CustomDesign/addOption";
	document.frm_addD.submit();
}

</script>


<%
  
String in_search_key   = request.getParameter("search_key");
String in_search_value = request.getParameter("search_value");
//  페이지 번호 – 없으면(처음) 1, 아니면 전달 받은 페이지                                                                                             
String strPageNum = request.getParameter("PageNum");     // paging
// 표시할 목록의 개수 – 없으면 지정하여 사용 
	String strPageSize = request.getParameter("PageSize");   // paging
	if (in_search_key   == null) in_search_key   = "";
	if (in_search_value == null) in_search_value = "";
if (strPageNum == null) strPageNum = "1";        // paging  
if (strPageSize == null) strPageSize = "1";      // paging    이 크기는 화면 사이즈에 따라 다름
int currentPage = Integer.parseInt(strPageNum);  // paging  현재 선택 페이지 값 INT 로 변경
int pageSize = Integer.parseInt(strPageSize);     // paging    목록의 갯수 INT로 변경







String ID = (String)session.getAttribute("G_MEMID");
   if (ID == null)
   {
	   out.println("<script language=javascript>");
	   out.println("alert('로그인 후 이용해주세요');");
	   //out.println("location.href='home.jsp';");
	   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/ch09/member_login';");
	   out.println("</script>");
   }
   
   
   
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
   Connection con = DriverManager.getConnection(connectionURL);
   PreparedStatement pstmt = null;
   ResultSet rs = null;		// 데이터 베이스에서 가져온 정보를 저장하는 객체 
   ResultSet rs2 = null;      // paging    rs 객체 하나 더 생성 
   ResultSet rso = null;      // option
   ResultSet rsOrders = null;
   ResultSet rsOrders2 = null;
   ResultSet rsOInfo = null;



      //String SQL = "select userid, usernm, gender, jumin, jobcd from members order by userid";
        
   
      
   String SQLO;
   
   if(ID.equals("admin"))
   {
	   SQLO = "SELECT * from Orders order by O_DATE desc ";
	   pstmt = con.prepareStatement(SQLO);

   }
   else
   {
	   SQLO = "SELECT * from Orders where O_UserID = ? order by O_DATE desc ";
	   pstmt = con.prepareStatement(SQLO);
	   pstmt.setString(1, ID);
   }

	rsOrders = pstmt.executeQuery();
	
    // 페이징을 이용하기 위한 MSSQL 함수로 페이지를 계산한다.
    String SQLO2 = SQLO;                             //  위의 기존 SQL 에 더 추가       // paging 
    SQLO2 = SQLO2 + "OFFSET "+ ( currentPage - 1 ) * pageSize + " ROWS ";   // paging 
    SQLO2 = SQLO2 + "FETCH NEXT " + pageSize + " ROWS ONLY ";                // paging                     
      // 전체 카운트를 가져오기위한 sql을 실행해야한다.
     rsOrders2 = pstmt.executeQuery();   // select 문                             //paging
     int totalRecords = 0;                                                             //paging
     while(rsOrders2.next()){       // 처음부터 끝까지                                  //paging
     totalRecords++;       // 전체 레코드 수 카운트                             //paging
     }

     
     
  // 페이지가 계산된 목록을 가져오는 SQL2를 실행한다.
     if(ID.equals("admin"))
   {
    	 pstmt = con.prepareStatement(SQLO2);
   }
   else
   {
	   pstmt = con.prepareStatement(SQLO2);
	   pstmt.setString(1, ID);
   }

	  rsOrders = pstmt.executeQuery();	//  SQL2=기존 SQL + 페이징 SQL      // paging
			  
	
	while(rsOrders.next())    
	{
		String oID= rsOrders.getString("O_UserID");
  		String onum= rsOrders.getString("O_NUM");
  		String odate= rsOrders.getString("O_DATE");
  		String otext= rsOrders.getString("O_TEXT");
  		
  		
  		String SQLOInfo = "SELECT * from Orders_Info where OINFO_OrderNum = ? order by OINFO_NUM";
  	   
  		pstmt = con.prepareStatement(SQLOInfo);
  		pstmt.setString(1, onum);
  		rsOInfo = pstmt.executeQuery();
  		
  		while(rsOInfo.next())    
  		{
  			int dnum= rsOInfo.getInt("OINFO_DesignNum");
  	  		int allPrice= rsOInfo.getInt("OINFO_Price");
  	  		String file= rsOInfo.getString("OINFO_File");
  	  		String oinfoNum= rsOInfo.getString("OINFO_NUM");

   
  //////////////////////////////////////////////////////////////////////////////////////////////    
	String SQL = "SELECT * from Member where M_ID = ?";
        
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, oID);
	rs = pstmt.executeQuery();
    	
	if(rs.next())    
	{
   		String name= rs.getString("M_NAME");
   		String phone= rs.getString("M_PHONE");
   		String addr1= rs.getString("M_ADDRESS1");
		String addr2= rs.getString("M_ADDRESS2");
	
      
      
	String SQL2 = "SELECT * from CustomDesign where UserID = ? and D_Num = ?";
      
	pstmt = con.prepareStatement(SQL2);
	pstmt.setString(1, oID);
	pstmt.setInt(2, dnum);
	rs2 = pstmt.executeQuery();
	
	if(rs2.next())    
	   {
		    int d_num= rs2.getInt("D_NUM");
			String d_name= rs2.getString("D_NAME");
	       
			
			String SQL_O="SELECT P.Product_Name, P.SubCategory_Num, P.Product_Price, P.Product_Image ";
			SQL_O = SQL_O +"FROM Design_Option D, Product P where D.D_NUM = ? and D.Product_Code=P.Product_Code ";
			pstmt = con.prepareStatement(SQL_O);
			pstmt.setInt(1, dnum);
	  		rso = pstmt.executeQuery();
%>


<BODY>
<FORM NAME = frm_o  ACTION="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign" METHOD=post>
<img src="homepageImage/MyPage/orderTitle.png" height="60" border="0"/>
<Table WIDTH = "550" cellspacing = "1" cellpadding = "4">
	<TR bgcolor = "EAEAEA">
	<TD WIDTH = "100%" ALIGN = "left" COLSPAN = "4"><font size = 2>디자인 이름 : <%=d_name %></font></TD>
	</TR>
	<%
		while(rso.next())
	  	{
	  		int sub_category= rso.getInt("SubCategory_Num");
	 		String p_name= rso.getString("Product_Name");
	  		String p_image= rso.getString("Product_Image");
			int p_price= rso.getInt("Product_Price");
			String s_category="";
			
			switch(sub_category){
	        	case 1 : s_category="프레임"; break;
	        	case 2 : s_category="용지"; break;
	        	case 3 : s_category="커버"; break;
	        	case 4 : s_category="용지"; break;
	        	case 5 : s_category="쿠션"; break;
	        	case 6 : s_category="머그컵"; break;
	        	case 7 : s_category="액세서리"; break;
	        }
	%>
			

	   	 	<TR bgcolor = "F6F6F6">
	   	 	<INPUT TYPE = "hidden" NAME = "dnum" VALUE="<%=dnum%>">
	   		<TD width="15%"><font size = 2><center><%=s_category%></center></font></TD>   
	   		<TD width="25%"><font size = 2><center><img src="/LSJ_PHOTO/productImage/<%=p_image%>" height="50"/></center></font></TD>      
	  		<TD width="40%"><font size = 2><center><%=p_name%></center></font></TD>      
	  		<TD width="20%"><font size = 2><center><%=p_price%>원</center></font></TD>      
			</TR> 
				
	<%
		} 
	}

	%>
	<TR bgcolor = "EAEAEA">
	<TD  ALIGN = "left" COLSPAN = "4"><font size = 2>총 가격 : <%=allPrice%></font>
	<INPUT TYPE = "hidden" NAME = "price" VALUE="<%=allPrice%>"></TD>
	</TR>	
	</Table>


<TABLE WIDTH = "550" BORDER = "0" CellPadding = "1" CellSpacing = "5">

	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>주문번호</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2><%=onum %></font></TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>주문날짜</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2><%=odate %></font></TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>주문자명</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2><%=name %></font></TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>연락처</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2><%=phone %></font></TD>
	</TR>
	<TR>
		<TD ALIGN = "left" width="30%"><font size = 2>주소</font></TD>
		<TD ALIGN = "left" width="70%"><font size = 2><%=addr1 %></font></TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>상세주소</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2><%=addr2 %></font></TD>
	</TR>
	<TR>
		<TD ALIGN = "left" width="30%"><font size = 2>요청사항</font></TD>
		<TD ALIGN = "left" width="70%"><font size = 2><%=otext %></font></TEXTAREA>
		</TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>사진파일</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2>
		<%
		String ext1=null;
		if (file != null) {
			ext1 =  file.substring(file.indexOf(".") + 1);
		}
		
		if (file != null) {
			ext1 = ext1.toLowerCase();
		if (ext1.equals("jpg") || ext1.equals("bmp") || ext1.equals("gif") || ext1.equals("png"))
			out.print ("<IMG SRC='/LSJ_PHOTO/Order/orderFile/" + file +"' WIDETH = 100 HEIGHT = 100>");
		else
			out.print ("<A HREF='/LSJ_PHOTO/Order/orderFiledown.jsp?onum=" + oinfoNum +"&ftype=1'><IMG SRC='/LSJ_PHOTO/Order/icon_file.gif'> " + file + "</A>");
		}
		%>
		</font></TD>
	</TR>
</TABLE>
<%
  		} //if
	}//while
	}//while
%>		
</FORM>

<%
int intTotPages= 0; // 총 페이지 수 계산
int intR= totalRecords % pageSize;   // 6 % 3 = 0
if(intR == 0) {
intTotPages = totalRecords / pageSize;
}
else  {   // 7 % 3 != 0
intTotPages = totalRecords / pageSize + 1;  // 나머지가 0 아니면 총 페이지수는 몫 + 1
}

int intGrpSize  = 10; // 그룹 수 설정 - 화면에 보여질 그룹  수              
int currentGrp  = 0; // 현 그룹 No.
intR= currentPage % intGrpSize;     // 3 % 2 = ?
if(intR == 0) {                              
currentGrp= currentPage / intGrpSize;  //4/2=2 그룹
}
else  {   // 3/2 =1 +1 =2그룹
currentGrp= currentPage / intGrpSize + 1;  
}
//Page 282
int intGrpStartPage= (currentGrp  - 1) * intGrpSize + 1;   // 2그룹일 때 (2-1)*2+1=3
int intGrpEndPage=  currentGrp * intGrpSize;                  // 2그룹일 때  2*2=4
if (intGrpEndPage > intTotPages){    //  그룹의 끝 페이지가 총 페이지수보다 크면 
intGrpEndPage= intTotPages;           //  끝 페이지 수가 총 페이지 수 
}

if (currentGrp > 1){    //  그룹 2부터는 이전 페이지 표시
%>
 [<A href="/LSJ_PHOTO/home.jsp?page=/Order/orderList&PageNum=<%= intGrpStartPage - 1 %>">이전</A>]
<%                                                               // 이전 이니까 -1
}

int intGrpPageCount= intGrpSize; // 그룹 당 페이지 수    
int intIndex= intGrpStartPage; // 현 그룹 시작 페이지
while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/Order/orderList&PageNum=<%= intIndex %>"><%= intIndex %></A>] &nbsp; 
<%
intIndex = intIndex + 1;
intGrpPageCount  = intGrpPageCount - 1;
}
if (intIndex <= intTotPages){  // 다음 그룹이 있으면 
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/Order/orderList&PageNum=<%= intIndex %>">다음</A>]
<%
}

if(pstmt != null)pstmt.close();
if(rs != null)rs.close();
if(rs2 != null)rs2.close();
if(rso != null) rso.close();
if(rsOrders != null) rsOrders.close();
if(rsOrders2 != null) rsOrders2.close();
if(con != null) con.close();

%>

</BODY>