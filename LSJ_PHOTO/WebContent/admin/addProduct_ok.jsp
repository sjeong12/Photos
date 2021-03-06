<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/include/dbinfo.inc" %>
<%
String realFolder = "";
//String saveFolder = "d:/lsj531/workspace531/LSJ_HOME/WebContent/lsj531/chap10/boardD/upfile";
//String saveFolder = "d:/website/ROOT/LSJ_HOME/WebContent/lsj531/chap10/boardD/upfile";
String saveFolder = "/productImage";
String encType = "utf-8";

int sizeLimit = 10 * 1024 * 1024;
realFolder = application.getRealPath(saveFolder);
MultipartRequest multi	= new MultipartRequest(request, realFolder, sizeLimit, encType);

PreparedStatement pstmt = null;
ResultSet rs = null;	



try
{
	String sub_category	= multi.getParameter("sub_category"); 
	String code			= multi.getParameter("code");  
	String name			= multi.getParameter("name");
	String price		= multi.getParameter("price");
	String amount		= multi.getParameter("amount");
	String text			= multi.getParameter("text");

	String image		= multi.getFilesystemName("image");
	if (image == null) image="";

	
	String strSQL ="INSERT INTO Product(Product_Code, SubCategory_Num, Product_Name, Product_Image, Product_Amount, product_Price, Product_Info) VALUES (?, ?, ?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(strSQL);

	pstmt.setString(1, code);
	pstmt.setString(2, sub_category);
	pstmt.setString(3, name);
	pstmt.setString(4, image);
	pstmt.setString(5, amount);
	pstmt.setString(6, price);
	pstmt.setString(7, text);
	pstmt.executeUpdate();

	out.println("<script language=javascript>");
    out.println("alert('제품을 추가하였습니다');");
    out.println("location.href='/LSJ_PHOTO/home.jsp?page=/admin/productList';");
    out.println("</script>");

} // try end

catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (pstmt != null) pstmt.close();
	if (con   != null) con.close();

	response.sendRedirect("/LSJ_PHOTO/home.jsp?page=/admin/productList");
} // finally end
%>