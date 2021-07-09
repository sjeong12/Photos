<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, java.io.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/include/dbinfo.inc" %>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try
{
	String code		= request.getParameter("pcode");

	String strSQL 	= "SELECT Product_Image FROM Product WHERE Product_Code = ?";
	pstmt = con.prepareStatement(strSQL);
	pstmt.setString(1, code);
	rs = pstmt.executeQuery();

	while (rs.next()){

		String image = rs.getString("Product_Image");

		String filePath = getServletContext().getRealPath("/productImage") + File.separator + image; 
		File f1 = new File(filePath);

		if (f1.exists()) new File(filePath).delete();

		strSQL	= "DELETE FROM Product WHERE Product_Code = ?";

		if (pstmt != null) pstmt.close();
		pstmt = con.prepareStatement(strSQL);
		pstmt.setString(1, code);
		pstmt.executeUpdate();

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
	if (con   != null) con.close();
		
	out.println("<script language=javascript>");
	out.println("alert('삭제 되었습니다');");
	out.println("location.href='/LSJ_PHOTO/home.jsp?page=/admin/productList';");
	out.println("</script>");
}
%>