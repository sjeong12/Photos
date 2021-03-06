<%@ page contentType="application; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.io.*, java.sql.*, java.text.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file = "/include/dbinfo.inc" %>		
<%
String num   	= request.getParameter("onum"); 
String ftype 	= request.getParameter("ftype"); 

Statement stmt = null;
ResultSet rs   = null;

try
{

	stmt = con.createStatement();
		
	rs = stmt.executeQuery("SELECT OINFO_File FROM Orders_Info WHERE OINFO_NUM =" + num);
	rs.next();

		String dbfilename = null;

		dbfilename = rs.getString("OINFO_File");


		int BUFSIZE = 4096;
		String filePath;
		 
		filePath = getServletContext().getRealPath("/Order/orderFile")+ File.separator + dbfilename; // + "a.txt";
		File file = new File(filePath);

		int length   = 0;

		out.clear();
		out = pageContext.pushBody();

		ServletOutputStream outStream = response.getOutputStream();
		response.setContentType("text/html");
		response.setContentLength((int)file.length());

		String fileName = (new File(filePath)).getName();

		response.setContentType("application/x-msdownload");
		String convFileName = java.net.URLEncoder.encode(fileName,"UTF-8");    
		response.setHeader("Content-Disposition", "attachment; filename=\"" + convFileName + "\"");
		
		byte[] byteBuffer = new byte[BUFSIZE];
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		 
		while ((in != null) && ((length = in.read(byteBuffer)) != -1))
		{
			outStream.write(byteBuffer, 0,length);
		}
		 
		in.close();
		outStream.close();
		 

	} // try end

	catch(SQLException e1){
		out.println(e1.getMessage());
	} // catch SQLException end

	catch(Exception e2){
		e2.printStackTrace();
	} // catch Exception end

	finally{
		if (stmt != null) stmt.close();
		if (rs   != null) rs.close();
		if (con  != null) con.close();
	} // finally end
	%>
