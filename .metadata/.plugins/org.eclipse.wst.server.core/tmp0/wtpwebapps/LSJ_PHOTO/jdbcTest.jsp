<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<%  
    // 단계1 : JDBC 드라이버 로드
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
     // 단계2 : 커넥션 객체 생성
     String connectionURL           ="jdbc:sqlserver://localhost:1433;databaseName=lsj1531;user=sa;password=11";
     Connection con = java.sql.DriverManager.getConnection(connectionURL);
     con.close();
  %>

<h3>  DB 에 연결되었습니다.    </h3>

