/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2016-12-11 07:57:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ch09;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class member_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n");
      out.write("<HTML> <HEAD>  <TITLE>로그인</TITLE> </HEAD>\r\n");
      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("\r\n");
      out.write("function valid_check()\r\n");
      out.write("{\r\n");
      out.write("if (document.frmLogins.userid.value == \"\")\r\n");
      out.write("{\r\n");
      out.write("     alert(\"아이디를 입력하여 주시기 바랍니다\");\r\n");
      out.write("      document.frmLogins.userid.focus();\r\n");
      out.write("      return false;\r\n");
      out.write("}\r\n");
      out.write("if (document.frmLogins.passwd.value == \"\")\r\n");
      out.write("    {\r\n");
      out.write("     alert(\"비밀번호를 입력하여 주시기 바랍니다\");\r\n");
      out.write("      document.frmLogins.passwd.focus();\r\n");
      out.write("      return false;\r\n");
      out.write("   }\r\n");
      out.write("    document.frmLogins.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write(" \r\n");

String in_userid = (String)session.getAttribute("G_MEMID");
   if (in_userid == null)
   {


      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("<h2>Login</h2>\r\n");
      out.write("<FORM NAME=\"frmLogins\" ACTION=\"ch09/member_login_ok.jsp\" METHOD= \"post\">\r\n");
      out.write("<center>\r\n");
      out.write("<font size=\"2\">\r\n");
      out.write("<TABLE WIDTH = \"170\" BORDER = \"0\" CellPadding = \"0\" CellSpacing = \"0\">\r\n");
      out.write("<TR><TD WIDTH = \"120\" ALIGN = \"left\" > I&nbsp;&nbsp;D</TD>\r\n");
      out.write("<TD width = \"50\" ALIGN = \"left\" >\r\n");
      out.write("<INPUT TYPE = \"text\" SIZE = \"10\" MAXLENGTH = \"10\" NAME = \"userid\">\r\n");
      out.write("</TD></TR>\r\n");
      out.write("<TR><TD WIDTH = \"120\" ALIGN = \"left\"> Password</TD>\r\n");
      out.write("<TD WIDTH = \"50\" ALIGN = \"left\">\r\n");
      out.write("<INPUT TYPE = \"password\" SIZE = \"11\" MAXLENGTH = \"10\" NAME = \"passwd\">\r\n");
      out.write("</TD></TR>\r\n");
      out.write("<TR><TD WIDTH = \"100%\" ALIGN = \"center\" COLSPAN = \"2\">\r\n");
      out.write("<br/>\r\n");
      out.write("&nbsp;&nbsp;&nbsp;<INPUT TYPE = \"button\" VALUE = \"로그인\" onclick=\"valid_check()\"> &nbsp;\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("</TD></TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("</font>\r\n");
      out.write("</center>\r\n");
      out.write("</FORM>\r\n");

}
else 
{ 
out.print(in_userid);
out.print("님 환영합니다");


      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("<FORM NAME = \"frmLog\"  METHOD = \"post\">\r\n");
      out.write("<TABLE WIDTH = \"130\" BORDER = \"0\" CellPadding = \"5\" CellSpacing = \"0\" align=\"center\" valign=\"middle\">\r\n");
      out.write("<TR><TD WIDTH = \"100%\" ALIGN = \"center\" >\r\n");
      out.write("<a href=\"/LSJ_PHOTO/home.jsp?page=ch09/member_logout\"><font size = 2>로그아웃</font></a>\r\n");
      out.write("\r\n");
      out.write("<a href= \"/LSJ_PHOTO/home.jsp?page=ch09/member_update.jsp?puserid=");
      out.print( in_userid );
      out.write("\"><font size = 2>정보수정</font></a>\r\n");
      out.write("\r\n");
 
if (in_userid.equals("admin"))
{
 
      out.write("\r\n");
      out.write("<br> <a href=\"/LSJ_PHOTO/home.jsp?page=ch09/member_list\"><font size = 2>회원리스트보기</font></a><br>\r\n");
} 
      out.write("\r\n");
      out.write("</TD></TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("</FORM>\r\n");
      out.write("\r\n");

   }

      out.write("\r\n");
      out.write("</BODY></HTML>\r\n");
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