<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
     String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
     Connection con = DriverManager.getConnection(connectionURL);
     PreparedStatement pstmt = null;
     ResultSet rs = null;

String suserid= request.getParameter("userid");
String spasswd= request.getParameter("passwd");

String SQL= "select M_NAME from Member where M_ID = ?";	//아이디 유무
String SQL2= "select M_NAME from Member where M_ID = ? and M_PASSWORD = ?";	//패스워드 일치 여부

pstmt = con.prepareStatement(SQL);
pstmt.setString(1, suserid);
rs = pstmt.executeQuery();

if (rs.next() == false)
{
	out.println("<script language=javascript>");
    out.println("alert('존재하지 않는 아이디입니다');");
    out.println("location.href='/LSJ_PHOTO/home.jsp?page=/ch09/member_login';");
    out.println("</script>");
}
else{


pstmt = con.prepareStatement(SQL2);
pstmt.setString(1, suserid);
pstmt.setString(2, spasswd);
rs = pstmt.executeQuery();

if (rs.next() == true)
{
session.setAttribute("G_MEMID", suserid);
session.setAttribute("G_MEMNM", rs.getString(1));
session.setMaxInactiveInterval(60 * 60);


out.println("<script language=javascript>");
out.println("alert('로그인 되었습니다');");
//out.println("location.href='home.jsp';");
out.println("location.href='/LSJ_PHOTO/home.jsp';");
out.println("</script>");
    
   //response.sendRedirect("index.jsp");
  // RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
 //  dispatcher.forward(request,response);
}
else 
{
    out.println("<script language=javascript>");
    out.println("alert('비밀번호가 일치하지 않습니다');");
    out.println("location.href='/LSJ_PHOTO/home.jsp?page=/ch09/member_login';");
    out.println("</script>");
}
}
pstmt.close();
rs.close();
con.close();
%>
