<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/include/dbinfo.inc" %>
<%
String realFolder = "";
String saveFolder = "/Order/orderFile";
String encType = "utf-8";

int sizeLimit = 10 * 1024 * 1024;
realFolder = application.getRealPath(saveFolder);
MultipartRequest multi	= new MultipartRequest(request, realFolder, sizeLimit, encType);
ResultSet rs = null;
ResultSet rs2 = null;
PreparedStatement pstmt = null;

try
{
	String ID = (String)session.getAttribute("G_MEMID");
	String name			= multi.getParameter("name");  
	int price			= Integer.valueOf(multi.getParameter("price"));
	String text			= multi.getParameter("text");
	int dnum			= Integer.valueOf(multi.getParameter("dnum"));
	String file			= multi.getFilesystemName("file");
	int count			= 0;
	int countInfo		= 0;

	String SQL = "select count(*) as cnt from Orders ";
    pstmt = con.prepareStatement(SQL);
	rs = pstmt.executeQuery();
	
	if(rs.next()){ count = rs.getInt("cnt"); }
	
	String SQL2 = "select count(*) as cntI from Orders_Info ";
    pstmt = con.prepareStatement(SQL2);
	rs2 = pstmt.executeQuery();
	
	if(rs2.next()){ countInfo = rs2.getInt("cntI"); }
	
	
	String strSQL ="INSERT INTO Orders(O_Num, O_UserID, O_DATE, O_TEXT) VALUES (?, ?, ?, ?)";
	pstmt = con.prepareStatement(strSQL);

	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))		+ "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)	+ "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE))		+ " ";
	
	String indateMore = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY))	+ ":";
	indateMore = indateMore + Integer.toString(dateIn.get(Calendar.MINUTE))		+ ":";
	indateMore = indateMore + Integer.toString(dateIn.get(Calendar.SECOND));
	
	String order_num= indate+"-"+String.valueOf(count);

	pstmt.setString(1, order_num);
	pstmt.setString(2, ID);
	pstmt.setString(3, indateMore);
	pstmt.setString(4, text);
	pstmt.executeUpdate();
	
	
	
	String strSQL2 ="INSERT INTO Orders_Info(OINFO_Num, OINFO_DesignNum, OINFO_OrderNum, OINFO_Price, OINFO_File) VALUES (?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(strSQL2);

	pstmt.setString(1, String.valueOf(countInfo));
	pstmt.setInt(2, dnum);
	pstmt.setString(3, order_num);
	pstmt.setInt(4, price);
	pstmt.setString(5, file);
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
	if (rs   != null) rs.close();
	if (rs2   != null) rs2.close();
	if (con   != null) con.close();

	response.sendRedirect("/LSJ_PHOTO/home.jsp?page=/Order/orderList");
} // finally end
%>