<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
// 단계1 : JDBC 드라이버 로드
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

// 단계2 : 커넥션 객체 생성
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
Connection con = java.sql.DriverManager.getConnection(connectionURL);

// 단계3 : PreparedStatement 객체 생성
PreparedStatement pstmt = null;
//단계4 :폼에서 입력한 값을 받아서 각각의 메모리 변수에 저장
String suserid= request.getParameter("userid");
String susernm= request.getParameter("usernm");
String spasswd= request.getParameter("passwd");
//주민번호 앞 6자와 뒷 7자를 각각  입력 받아 합침
String sphone= request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
String saddr1= request.getParameter("addr1");
String saddr3= request.getParameter("addr2");


//단계5 : PreparedStatement 객체로 실행할 SQL 문 생성
String SQL= "insert into Member(M_ID, M_NAME, M_PASSWORD, M_PHONE, M_ADDRESS1, M_ADDRESS2) values(?, ?, ?, ?, ?, ?)";
pstmt = con.prepareStatement(SQL);
//단계6 : PreparedStatement 객체로 실행할 SQL 문의 ? 위치에 각각의 값을 세팅
pstmt.setString(1, suserid);
pstmt.setString(2, susernm);
pstmt.setString(3, spasswd);
pstmt.setString(4, sphone);
pstmt.setString(5, saddr1);
pstmt.setString(6, saddr3);

//단계7 : PreparedStatement 객체 실행
pstmt.executeUpdate();
//단계8 :객체 종료
pstmt.close();
con.close();

out.println("<script language=javascript>");
out.println("alert('가입이 완료되었습니다');");
//out.println("location.href='home.jsp';");
out.println("location.href='/LSJ_PHOTO/home.jsp?page=/ch09/member_login';");
out.println("</script>");
%>

