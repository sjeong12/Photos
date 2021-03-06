<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>제품 보기</TITLE>
 </HEAD>



<script language=javascript>
function submit_modify()
{
	document.fview.action = "/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign";
	document.fview.submit();
}

</script>

<%@ include file = "/include/dbinfo.inc" %>		

<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try
{
	//int num = Integer.parseInt(request.getParameter("pnum"));
	String code = request.getParameter("pcode");

	String strSQL = "SELECT * FROM Product WHERE Product_Code = ?";
	pstmt = con.prepareStatement(strSQL);
	pstmt.setString(1, code);
	rs = pstmt.executeQuery();

	if (rs.next() == false)
		out.print("등록된 상품이 없습니다");
	else
	{
		String name				= rs.getString("Product_Name");
		int price				= rs.getInt("product_Price");
		String info		 		= rs.getString("Product_Info");
		String popular  		= rs.getString("Product_Popular");
		int amount				= rs.getInt("Product_Amount");
		int sub_category_num	= rs.getInt("SubCategory_Num");
		String image 			= rs.getString("Product_Image");
		
		String ext1     = null;
		if (image != null && !image.equals("")) {
			ext1 =  image.substring(image.indexOf(".") + 1);
		}
%>

		<BODY>
		<TABLE WIDTH = "600" BORDER = "1" CellPadding = "5" CellSpacing = "0">
			<TR>
				<TD bgcolor = "EAEAEA" WIDTH = "15%" ALIGN = "left"><font size = 2>제품명</font></TD>
				<TD WIDTH = "85%" ALIGN = "left"><font size = 2><%= name %></font></TD>
			</TR>
			<TR>
				<TD bgcolor = "EAEAEA" WIDTH = "15%" ALIGN = "left"><font size = 2>개수</font></TD>
				<TD WIDTH = "85%" ALIGN = "left"><font size = 2><%= amount %></font></TD>
			</TR>
			<TR>
				<TD bgcolor = "EAEAEA" WIDTH = "15%" ALIGN = "left"><font size = 2>가격</font></TD>
				<TD WIDTH = "85%" ALIGN = "left"><font size = 2><%= price %>원</font></TD>
			</TR>
			<TR>
				<TD WIDTH = "100%" ALIGN = "center" colspan="2">
				<BR/>
<%
		if (image != null) {
			ext1 = ext1.toLowerCase();
		if (ext1.equals("jpg") || ext1.equals("bmp") || ext1.equals("gif") || ext1.equals("png"))
			out.print ("<IMG SRC='/LSJ_PHOTO/productImage/" + image +"' width=200 height=200>");
		else
			out.print ("<A HREF='boardDfiledown.jsp?pcode=" + code +"&ftype=1'><IMG SRC='./icon_file.gif'> " + image + "</A>");
		}

%>
				<BR/><BR/>
				</TD>
			</TR>
			<TR>
				<TD WIDTH = "100%" ALIGN = "center" colspan="2"><font size = 2>
				<%= info %>
				</font></TD>
			</TR>
			<TR>
				<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
				<FORM NAME = "fview" METHOD = "post">
				<INPUT TYPE = "hidden" NAME = pcode VALUE = <%= code %>>
				<TABLE>
					<TR>
						<TD WIDTH = "33%" ALIGN = "center">
							<a href="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign&pcode=<%=code%>">
							<img src="homepageImage/addcustom.png" border="0"/></a>
						</TD>
					</TR>
				</TABLE>
				</FORM>
				</TD>
			</TR>
		</TABLE>
		</BODY>
<%
}
} //try end


catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (pstmt != null) pstmt.close();
	if (rs    != null) rs.close();
	if (con   != null) con.close();
} // finally end
%>
</HTML>