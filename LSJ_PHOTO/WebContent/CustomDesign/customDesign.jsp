<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<HTML><HEAD>
<TITLE>내 디자인</TITLE></HEAD>

<script language=javascript>
function add_design()
{
	document.frm_addD.action = "/LSJ_PHOTO/home.jsp?page=/CustomDesign/addDesign";
	document.frm_addD.submit();
}

</script>


<%
String code= request.getParameter("pcode");
String ID = (String)session.getAttribute("G_MEMID");
   if (ID == null)
   {
	   out.println("<script language=javascript>");
	   out.println("alert('로그인 후 이용해주세요');");
	   //out.println("location.href='home.jsp';");
	   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/ch09/member_login';");
	   out.println("</script>");
   }
   
%>


<BODY>

<%
    //String in_usernm = request.getParameter("search_value");
    //if (in_usernm == null) in_usernm = "";
    
    
    String in_search_key   = request.getParameter("search_key");
	String in_search_value = request.getParameter("search_value");
    //  페이지 번호 – 없으면(처음) 1, 아니면 전달 받은 페이지                                                                                             
    String strPageNum = request.getParameter("PageNum");     // paging
    // 표시할 목록의 개수 – 없으면 지정하여 사용 
  	String strPageSize = request.getParameter("PageSize");   // paging
  	if (in_search_key   == null) in_search_key   = "";
 	if (in_search_value == null) in_search_value = "";
    if (strPageNum == null) strPageNum = "1";        // paging  
    if (strPageSize == null) strPageSize = "5";      // paging    이 크기는 화면 사이즈에 따라 다름
    int currentPage = Integer.parseInt(strPageNum);  // paging  현재 선택 페이지 값 INT 로 변경
    int pageSize = Integer.parseInt(strPageSize);     // paging    목록의 갯수 INT로 변경
%>






<FORM NAME = frm_addD  ACTION="/LSJ_PHOTO/home.jsp?page=/CustomDesign/addDesign" METHOD=post>
<TABLE border = "0" cellspacing = "0" cellpadding = "2" width = "600">
<TR><TD WIDTH = "100%" ALIGN = "center" valign="bottom" height="100"COLSPAN = "4">
<img src="homepageImage/MyPage/customDtitle.png" height="60" border="0"/></TD></TR> 
<TR><TD WIDTH = "100%" ALIGN = "center" valign="top" height="50" COLSPAN = "4">
<INPUT TYPE = "button" VALUE = "디자인 추가" onclick="add_design()"></TD></TR>      

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
Connection con = DriverManager.getConnection(connectionURL);
PreparedStatement pstmt = null;
ResultSet rs = null;		// 데이터 베이스에서 가져온 정보를 저장하는 객체 
ResultSet rs2 = null;      // paging    rs 객체 하나 더 생성 
ResultSet rso = null;      // option


     
	 String SQL = "SELECT * from CustomDesign where UserID = ? ";
     SQL = SQL + "order by D_NAME ";
     
     pstmt = con.prepareStatement(SQL);
 	 pstmt.setString(1, ID);
 	 rs = pstmt.executeQuery();
	
     // 페이징을 이용하기 위한 MSSQL 함수로 페이지를 계산한다.
     String SQL2 = SQL;                             //  위의 기존 SQL 에 더 추가       // paging 
     SQL2 = SQL2 + "OFFSET "+ ( currentPage - 1 ) * pageSize + " ROWS ";   // paging 
     SQL2 = SQL2 + "FETCH NEXT " + pageSize + " ROWS ONLY ";                // paging                     
       // 전체 카운트를 가져오기위한 sql을 실행해야한다.
      rs2 = pstmt.executeQuery();   // select 문                             //paging
      int totalRecords = 0;                                                             //paging
      while(rs2.next()){       // 처음부터 끝까지                                  //paging
      totalRecords++;       // 전체 레코드 수 카운트                             //paging
      }


   // 페이지가 계산된 목록을 가져오는 SQL2를 실행한다.
   	  pstmt = con.prepareStatement(SQL2);
 	  pstmt.setString(1, ID);
 	  rs = pstmt.executeQuery();	//  SQL2=기존 SQL + 페이징 SQL      // paging

 			  


 	  
   while(rs.next())    
   {
	    int d_num= rs.getInt("D_NUM");
	    int category= rs.getInt("D_CA");
		String d_name= rs.getString("D_NAME");
		String cname="";
		
		if(category == 1) cname="액자";
		else if(category == 2) cname="앨범";
		else if(category == 3) cname="디자인 소품";
       
   		%>
  	 	<TR bgcolor = "EAEAEA">
  	 	<TD WIDTH = "100%" ALIGN = "left" COLSPAN = "4"><font size = 2>카테고리 : <%=cname %></font></TD></TR>
		<TR bgcolor = "EAEAEA">
		<TD WIDTH = "100%" ALIGN = "left" COLSPAN = "2"><font size = 2>디자인 이름 : <%=d_name %></font></TD>
		<TD WIDTH = "100%" ALIGN = "right" COLSPAN = "2">
		
		<%
			if(code== null)
			{
				%><a href="/LSJ_PHOTO/home.jsp">
				<img src="homepageImage/addo.png" border="0"/></a><%
			}
			else
			{
				%><a href="/LSJ_PHOTO/CustomDesign/addOption_ok.jsp?&category=<%=category%>&dnum=<%=d_num%>&pcode=<%=code%>">
				<img src="homepageImage/addo.png" border="0"/></a><%
			}
		
		
		String SQL_O="SELECT P.Product_Name, P.SubCategory_Num, P.Product_Price, P.Product_Image ";
		SQL_O = SQL_O +"FROM Design_Option D, Product P where D.D_NUM = ? and D.Product_Code=P.Product_Code ";
		pstmt = con.prepareStatement(SQL_O);
		pstmt.setInt(1, d_num);
  		rso = pstmt.executeQuery();

  		
  			int check = 0, option_check = 0, allPrice=0;
  			while(rso.next())
  			{
  				option_check++;
  				int sub_category= rso.getInt("SubCategory_Num");
  				String p_name= rso.getString("Product_Name");
  				String p_image= rso.getString("Product_Image");
  				int p_price= rso.getInt("Product_Price");
  		        allPrice += p_price;
  		        String s_category = "";
  		        
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
			</TD>
			</TR>
			<TR>
			<TD COLSPAN = "4">
				<Table width = "600">
   	 			<TR bgcolor = "F6F6F6">
   				<TD><font size = 2><center><%=s_category%></center></font></TD>   
   				<TD width="25%"><font size = 2><center><img src="/LSJ_PHOTO/productImage/<%=p_image%>" height="50"/></center></font></TH>      
  				<TD width="40%"><font size = 2><center><%=p_name%></center></font></TD>      
  				<TD width="20%"><font size = 2><center><%=p_price%>원</center></font></TD>      
				</TR> 
				</Table>
			</TD>
			</TR>
   		<%
   		
 	  			if(category== 1)
				{
					if(option_check==2) check=1;
				}
				else if(category==2)
				{
					if(option_check==2) check=1;
				}
				else if(category==3){
					if(option_check==1) check=1;
				}
  			
  				
  			}
  			
  	  		%>
				<TR>
				<TD COLSPAN = "2" ALIGN = "left" valign="top" height="50">
				<a href="/LSJ_PHOTO/home.jsp?page=/Order/orderWrite&d_num=<%=d_num%>&check=<%=check%>&all=<%=allPrice%>">
				<img src="homepageImage/orderBtn.png" border="0"/></a></TD>
				<TD COLSPAN = "2" ALIGN = "right" valign="top" height="50">
				<font size = 2>총 가격 : <%=allPrice %></font>
				</TD>
				</TR>
				
		<% 

   }
   %>
   
</TABLE>
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
 [<A href="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign&PageNum=<%= intGrpStartPage - 1 %>">이전</A>]
<%                                                               // 이전 이니까 -1
}

int intGrpPageCount= intGrpSize; // 그룹 당 페이지 수    
int intIndex= intGrpStartPage; // 현 그룹 시작 페이지
while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign&PageNum=<%= intIndex %>"><%= intIndex %></A>] &nbsp; 
<%
intIndex = intIndex + 1;
intGrpPageCount  = intGrpPageCount - 1;
}
if (intIndex <= intTotPages){  // 다음 그룹이 있으면 
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign&PageNum=<%= intIndex %>">다음</A>]
<%
}

pstmt.close();
rs.close();
rs2.close();
if(rso != null) rso.close();
con.close();

%>

</BODY>
				