<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
// 단계1 : JDBC 드라이버 로드
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

// 단계2 : 커넥션 객체 생성
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=lsj1531;user=sa;password=11";
Connection con = java.sql.DriverManager.getConnection(connectionURL);

// 단계3 : PreparedStatement 객체 생성
PreparedStatement pstmt = null;
//단계4 :폼에서 입력한 값을 받아서 각각의 메모리 변수에 저장
String suserid= request.getParameter("userid");
String susernm= request.getParameter("usernm");
String spasswd= request.getParameter("passwd");
//주민번호 앞 6자와 뒷 7자를 각각  입력 받아 합침
String sjumin= request.getParameter("jumin1") + request.getParameter("jumin2");
String smailrcv= request.getParameter("mailrcv");
if (smailrcv != null && smailrcv.equals("on"))
    smailrcv = "Y";// 수신을 동의함(체크함)
 else
      smailrcv = "N";// 수신을 체크하지 않음
String sgender= request.getParameter("gender");
String sjob= request.getParameter("job");
String sintro= request.getParameter("intro").replace("\r\n", "<br>"); 
//단계5 : PreparedStatement 객체로 실행할 SQL 문 생성
String SQL= "insert into members(userid, usernm, passwd, jumin, mailrcv, gender, jobcd, intro) values(?, ?, ?, ?, ?, ?, ?, ?)";
pstmt = con.prepareStatement(SQL);
//단계6 : PreparedStatement 객체로 실행할 SQL 문의 ? 위치에 각각의 값을 세팅
pstmt.setString(1, suserid);
pstmt.setString(2, susernm);
pstmt.setString(3, spasswd);
pstmt.setString(4, sjumin);
pstmt.setString(5, smailrcv);
pstmt.setString(6, sgender);
pstmt.setString(7, sjob);
pstmt.setString(8, sintro);
//단계7 : PreparedStatement 객체 실행
pstmt.executeUpdate();   // 리턴값 없을 때
//단계8 :객체 종료
pstmt.close();
con.close();
%>
가입이 완료 되었읍니다.

