/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2016-12-06 04:44:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.boardD;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class boardDwrite_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
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

      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n");
      out.write("<HTML>\r\n");
      out.write(" <HEAD>\r\n");
      out.write("  <TITLE>파일 업로드</TITLE>\r\n");
      out.write(" </HEAD>\r\n");
      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("function valid_check()\r\n");
      out.write("{\r\n");
      out.write("\r\n");
      out.write("\tif (document.frm1.writername.value == \"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"작성자명을 입력바랍니다.\");\r\n");
      out.write("\t\tdocument.frm1.writername.focus(); \r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (document.frm1.title.value == \"\") \r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"제목을 입력바랍니다.\");\r\n");
      out.write("\t\tdocument.frm1.title.focus(); \r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (document.frm1.contents.value == \"\") \r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"내용을 입력바랍니다.\");\r\n");
      out.write("\t\tdocument.frm1.contents.focus(); \r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tdocument.frm1.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function submit_list()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.frm1.action = \"boardDlist.jsp\";\r\n");
      out.write("\tdocument.frm1.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(" </script>\r\n");
      out.write("<h3>파일 업로드</h3>\r\n");
      out.write("<BODY>\r\n");
      out.write("<FORM NAME = \"frm1\" ACTION = \"boardDwrite_ok.jsp\" METHOD = \"post\" ENCTYPE=\"multipart/form-data\">\r\n");
      out.write("<TABLE WIDTH = \"500\" BORDER = \"1\" CellPadding = \"0\" CellSpacing = \"0\">\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH = \"40%\" ALIGN = \"left\">작성자명</TD>\r\n");
      out.write("\t\t<TD WIDTH = \"60%\" ALIGN = \"left\">\r\n");
      out.write("\t\t\t<INPUT TYPE = \"text\" SIZE = \"15\" MAXLENGTH = \"10\" NAME = \"writername\">\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH = \"40%\" ALIGN = \"left\">제목</TD>\r\n");
      out.write("\t\t<TD WIDTH = \"60%\" ALIGN = \"left\">\r\n");
      out.write("\t\t\t<INPUT TYPE =\"text\" NAME=\"title\" SIZE = \"50\" MAXLENGTH = \"50\">\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH = \"40%\" ALIGN = \"left\">내용</TD>\r\n");
      out.write("\t\t<TD WIDTH = \"60%\" ALIGN = \"left\">\r\n");
      out.write("\t\t\t<TEXTAREA NAME=\"contents\" ROWS=5 COLS=50></TEXTAREA>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH = \"40%\" ALIGN = \"left\">첨부파일1</TD>\r\n");
      out.write("\t\t<TD WIDTH = \"60%\" ALIGN = \"left\">\r\n");
      out.write("\t\t\t<INPUT TYPE =\"file\" NAME=\"file1\" >\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH = \"40%\" ALIGN = \"left\">첨부파일2</TD>\r\n");
      out.write("\t\t<TD WIDTH = \"60%\" ALIGN = \"left\">\r\n");
      out.write("\t\t\t<INPUT TYPE =\"file\" NAME=\"file2\" >\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH = \"100%\" ALIGN = \"center\" COLSPAN = \"2\">\r\n");
      out.write("\t\t<TABLE>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD WIDTH = \"33%\" ALIGN = \"center\">\r\n");
      out.write("\t\t\t\t\t<INPUT TYPE = \"reset\" VALUE = \"다시 작성\">\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD WIDTH = \"34%\" ALIGN = \"center\">\r\n");
      out.write("\t\t\t\t\t<INPUT TYPE = \"button\" VALUE = \"등록\" onClick=\"valid_check()\">\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD WIDTH = \"33%\" ALIGN = \"center\">\r\n");
      out.write("\t\t\t\t\t<INPUT TYPE = \"button\" VALUE = \"목록으로\" onClick = \"submit_list()\">\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t</TABLE>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("</FORM>\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>");
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
