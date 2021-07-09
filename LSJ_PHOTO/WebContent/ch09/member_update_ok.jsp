<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

//단계2 : 커넥션 객체 생성
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
Connection con = java.sql.DriverManager.getConnection(connectionURL);

//단계3 : PreparedStatement 객체 생성
Statement stmt = con.createStatement();
//단계4 :폼에서 입력한 값을 받아서 각각의 메모리 변수에 저장
String suserid= request.getParameter("userid");
String susernm= request.getParameter("usernm");
String spasswd= request.getParameter("passwd");
//주민번호 앞 6자와 뒷 7자를 각각  입력 받아 합침
String sphone= request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
String saddr1= request.getParameter("addr1");
String saddr2= request.getParameter("addr2");


//단계5 : Statement 객체로 실행할 SQL 문 생성
String SQL= "update Member set ";
SQL=  SQL + " M_NAME=  " + "'" + susernm  + "', ";
SQL=  SQL + " M_PHONE=  " + "'" + sphone   + "', ";
SQL=  SQL + " M_ADDRESS1  =  " + "'" + saddr1 + "', ";
SQL=  SQL + " M_ADDRESS2  =  " + "'" + saddr2  + "', ";
SQL=  SQL + " M_PASSWORD=  " + "'" + spasswd  + "' ";
SQL=  SQL + " where M_ID= '" + suserid  + "'";

int cnt = stmt.executeUpdate(SQL);

stmt.close();
con.close();
if (cnt > 0) 
{
out.println("<script language=javascript>");
out.println("alert('정보 변경이 완료 되었습니다');");
out.println("location.href='/LSJ_PHOTO/home.jsp';");
out.println("</script>");
}
else 
{
out.println("<script language=javascript>");
out.println("alert('정보를 변경하지 못하였습니다');");
out.println("location.href='/LSJ_PHOTO/home.jsp';");
out.println("</script>");
}


%>
