/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2016-11-30 10:26:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;

public final class member_005fjoin_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 request.setCharacterEncoding("utf-8"); 
      out.write('\r');
      out.write('\n');

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

      out.write("\r\n");
      out.write("가입이 완료 되었읍니다.\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
