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


String ID = (String)session.getAttribute("G_MEMID");

int sizeLimit = 10 * 1024 * 1024;
realFolder = application.getRealPath(saveFolder);
MultipartRequest multi	= new MultipartRequest(request, realFolder, sizeLimit, encType);

PreparedStatement pstmt = null;

try
{
	String name			= multi.getParameter("name");
	String category		= multi.getParameter("category");

	String strSQL ="INSERT INTO CustomDesign(D_NAME, D_CA, UserID) VALUES (?, ?, ?)";
	pstmt = con.prepareStatement(strSQL);

	pstmt.setString(1, name);
	pstmt.setString(2, category);
	pstmt.setString(3, ID);
	pstmt.executeUpdate();


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

	response.sendRedirect("/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign");
} // finally end
%>