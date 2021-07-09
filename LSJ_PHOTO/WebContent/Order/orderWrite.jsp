<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>주문작성</TITLE>
 </HEAD>

<script language=javascript>
function valid_check()
{

	if (document.frm1.name.value == "")
	{
		alert("주문자명을 입력바랍니다");
		document.frm1.writername.focus(); 
		return false;
	}

	if (document.frm1.addr1.value == "") 
	{
		alert("주소를 입력바랍니다");
		document.frm1.addr1.focus(); 
		return false;
	}
	
	if (document.frm1.addr2.value == "") 
	{
		alert("상세 주소를 입력바랍니다");
		document.frm1.addr2.focus(); 
		return false;
	}

	if (document.frm1.file.value == "") 
	{
		alert("제작을 맡기실 사진 파일을 업로드 해주세요");
		document.frm1.file.focus(); 
		return false;
	}

	document.frm1.submit();
}

function submit_list()
{
	document.frm1.action = "/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign";
	document.frm1.submit();
}
</script>


<%
int check= Integer.valueOf(request.getParameter("check"));
int dnum= Integer.valueOf(request.getParameter("d_num"));
int allPrice= Integer.valueOf(request.getParameter("all"));
String ID = (String)session.getAttribute("G_MEMID");
   if (ID == null)
   {
	   out.println("<script language=javascript>");
	   out.println("alert('로그인 후 이용해주세요');");
	   //out.println("location.href='home.jsp';");
	   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/ch09/member_login';");
	   out.println("</script>");
   }
   
   if (check == 0)
   {
	   out.println("<script language=javascript>");
	   out.println("alert('모든 옵션을 추가한 뒤 주문해주세요');");
	   //out.println("location.href='home.jsp';");
	   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign';");
	   out.println("</script>");
   }
   
   
   
   
   
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
   Connection con = DriverManager.getConnection(connectionURL);
   PreparedStatement pstmt = null;
   ResultSet rs = null;		// 데이터 베이스에서 가져온 정보를 저장하는 객체 
   ResultSet rs2 = null;      // paging    rs 객체 하나 더 생성 
   ResultSet rso = null;      // option


      //String SQL = "select userid, usernm, gender, jumin, jobcd from members order by userid";
        
      
	String SQL = "SELECT * from Member where M_ID = ?";
        
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, ID);
	rs = pstmt.executeQuery();
    	
	if(rs.next())    
	{
   		String name= rs.getString("M_NAME");
   		String phone= rs.getString("M_PHONE");
   		String addr1= rs.getString("M_ADDRESS1");
		String addr2= rs.getString("M_ADDRESS2");
		
		String phone1= "";
		String phone2= "";
		String phone3= "";
	          if (phone != null)  {
	        	  phone1= phone.substring(0, 3);
	        	  phone2= phone.substring(3,7);
	        	  phone3= phone.substring(7,11);
				}
	    phone=phone1+"-"+phone2+"-"+phone3;
	
      
      
	String SQL2 = "SELECT * from CustomDesign where UserID = ? and D_Num = ?";
      
	pstmt = con.prepareStatement(SQL2);
	pstmt.setString(1, ID);
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
<FORM NAME = "frm1" ACTION = "/LSJ_PHOTO/Order/orderWrite_ok.jsp" METHOD = "post" ENCTYPE="multipart/form-data">

<img src="homepageImage/MyPage/orderTitle.png" height="60" border="0"/>

	<Table WIDTH = "550">
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
	%>
			

	   	 	<TR bgcolor = "F6F6F6">
	   	 	<INPUT TYPE = "hidden" NAME = "dnum" VALUE="<%=dnum%>">
	   		<TD width="15%"><font size = 2><center><%=sub_category%></center></font></TD>   
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


<TABLE WIDTH = "550" BORDER = "0" CellPadding = "5" CellSpacing = "0">

	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>주문자명</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2> <%=name %></font>
			<INPUT TYPE = "hidden" SIZE = "15" MAXLENGTH = "10" NAME = "name" value=<%=name %>>
		</TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>연락처</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2> <%=phone %> </font>
			<INPUT TYPE = "hidden" SIZE = "15" MAXLENGTH = "10" NAME = "name" value=<%=phone %>>
		</TD>
	</TR>
	<TR>
		<TD ALIGN = "left" width="30%"><font size = 2>주소</font></TD>
		<TD ALIGN = "left" width="70%"><font size = 2> <%=addr1 %> </font>
			<INPUT TYPE ="hidden" NAME="addr1" SIZE = "50" MAXLENGTH = "50" value=<%=addr1 %>>
		</TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>상세주소</font></TD>
		<TD  ALIGN = "left" width="70%"><font size = 2> <%=addr2 %> </font>
			<INPUT TYPE ="hidden" NAME="addr2" SIZE = "50" MAXLENGTH = "50" value=<%=addr2 %>>
		</TD>
	</TR>
	<TR>
		<TD ALIGN = "left" width="30%"><font size = 2>요청사항</font></TD>
		<TD ALIGN = "left" width="70%">
			<TEXTAREA NAME="text" ROWS=5 COLS=50></TEXTAREA>
		</TD>
	</TR>
	<TR>
		<TD  ALIGN = "left" width="30%"><font size = 2>사진파일</font></TD>
		<TD  ALIGN = "left" width="70%">
			<INPUT TYPE ="file" NAME="file" >
		</TD>
	</TR>
	<TR>
		<TD ALIGN = "center" COLSPAN = "2"  width="100%" height="40">
		<TABLE>
			<TR>
				<TD WIDTH = "50%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "주문" onClick="valid_check()">
				</TD>
				<TD WIDTH = "50%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "취소" onClick = "submit_list()">
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%
	}
	
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(rs2 != null) rs2.close();
	if(rso != null) rso.close();
	if(con != null) con.close();
%>
</FORM>
</BODY>
</HTML>