/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2016-12-07 05:56:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class deleteProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');
 request.setCharacterEncoding("utf-8"); 
      out.write("\r\n");
      out.write("<HTML><HEAD>\r\n");
      out.write("<TITLE>제품 목록</TITLE></HEAD>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("\r\n");

    //String in_usernm = request.getParameter("search_value");
    //if (in_usernm == null) in_usernm = "";
    
    String in_search_key   = request.getParameter("search_key");
	String in_search_value = request.getParameter("search_value");
    //  페이지 번호 – 없으면(처음) 1, 아니면 전달 받은 페이지                                                                                             
    String strPageNum = request.getParameter("PageNum");     // paging
    // 표시할 목록의 개수 – 없으면 지정하여 사용 
  	String strPageSize = request.getParameter("PageSize");   // paging
  	if (in_search_key   == null) in_search_key   = "";
 	if (in_search_value == null) in_search_value = "";
    if (strPageNum == null) strPageNum = "1";        // paging  
    if (strPageSize == null) strPageSize = "10";      // paging    이 크기는 화면 사이즈에 따라 다름
    int currentPage = Integer.parseInt(strPageNum);  // paging  현재 선택 페이지 값 INT 로 변경
    int pageSize = Integer.parseInt(strPageSize);     // paging    목록의 갯수 INT로 변경

      out.write("\r\n");
      out.write("\r\n");
      out.write("<FORM NAME = frm_s  ACTION=\"deleteProduct.jsp\" METHOD=post>\r\n");
      out.write("<SELECT NAME=search_key>\r\n");
      out.write("\r\n");
      out.write("<OPTION VALUE = \"\"\r\n");
      out.write("\t");

 	     if (in_search_key.equals("")) out.print(" selected");
	
      out.write("\r\n");
      out.write("    >모든 상품</OPTION> \r\n");
      out.write("<OPTION VALUE = \"1\"\r\n");
      out.write("\t");

 	     if (in_search_key.equals("1")) out.print(" selected");
	
      out.write("\r\n");
      out.write("    >액자</OPTION> \r\n");
      out.write("<OPTION VALUE = \"2\"\r\n");
      out.write("    ");

         if (in_search_key.equals("2")) out.print(" selected");
    
      out.write("\r\n");
      out.write("  >앨범</OPTION>\r\n");
      out.write(" <OPTION VALUE = \"3\"\r\n");
      out.write("    ");

         if (in_search_key.equals("3")) out.print(" selected");
    
      out.write("\r\n");
      out.write("  >디자인 소품</OPTION>\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("   </SELECT>\r\n");
      out.write(" <INPUT TYPE=text NAME=search_value VALUE=\"");
      out.print( in_search_value );
      out.write("\">\r\n");
      out.write("<INPUT TYPE=submit VALUE=\"검색\">\r\n");
      out.write("</FORM>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<TABLE border = \"0\" cellspacing = \"0\" cellpadding = \"2\" width = \"700\">      \r\n");
      out.write("\r\n");
      out.write("<TR bgcolor = \"EAEAEA\" height=\"30\">      \r\n");
      out.write("<TD><font size = 2><center>제품 이미지</center></font></TD>      \r\n");
      out.write("<TD><font size = 2><center>제품 코드</center></font></TD>      \r\n");
      out.write("<TD><font size = 2><center>제품명</center></font></TD>      \r\n");
      out.write("<TD><font size = 2><center>가격</center></font></TD>      \r\n");
      out.write("<TD><font size = 2><center>설명</center></font></TD>      \r\n");
      out.write("</TR> \r\n");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=11";
Connection con = DriverManager.getConnection(connectionURL);

ResultSet rs = null;   // 데이터 베이스에서 가져온 정보를 저장하는 객체 
ResultSet rs2 = null;      // paging    rs 객체 하나 더 생성 

     Statement stmt = con.createStatement();
   //String SQL = "select userid, usernm, gender, jumin, jobcd from members order by userid";
     
   
     String SQL = "SELECT * ";
     
if (in_search_key.equals("")){
	SQL = SQL + "from Product ";
    SQL = SQL + "where Product_Name LIKE '%" + in_search_value + "%'";
    SQL = SQL + "or Product_Code Like '%" + in_search_value + "%' ";
}   
else if (in_search_key.equals("1")){
	SQL = SQL + "from Product P, Sub_Category S ";
    SQL = SQL + "where (P.Product_Name LIKE '%" + in_search_value + "%' ";
    SQL = SQL + "or P.Product_Code Like '%" + in_search_value + "%') ";
    SQL = SQL + "and (P.SubCategory_Num = S.Sub_Category_Num) ";
	SQL = SQL + "and (S.Category_Num = '1') ";
}
else if (in_search_key.equals("2")){
	SQL = SQL + "from Product P, Sub_Category S ";
    SQL = SQL + "where (P.Product_Name LIKE '%" + in_search_value + "%' ";
    SQL = SQL + "or P.Product_Code Like '%" + in_search_value + "%') ";
    SQL = SQL + "and (P.SubCategory_Num = S.Sub_Category_Num) ";
	SQL = SQL + "and (S.Category_Num = '2') ";
}
else if (in_search_key.equals("3")){
	SQL = SQL + "from Product P, Sub_Category S ";
    SQL = SQL + "where (P.Product_Name LIKE '%" + in_search_value + "%' ";
    SQL = SQL + "or P.Product_Code Like '%" + in_search_value + "%') ";
	SQL = SQL + "and (P.SubCategory_Num = S.Sub_Category_Num) ";
	SQL = SQL + "and (S.Category_Num = '3') ";
}
	SQL = SQL + "order by Product_Name ";


     // 페이징을 이용하기 위한 MSSQL 함수로 페이지를 계산한다.
     String SQL2 = SQL;                             //  위의 기존 SQL 에 더 추가       // paging 
     SQL2 = SQL2 + "OFFSET "+ ( currentPage - 1 ) * pageSize + " ROWS ";   // paging 
     SQL2 = SQL2 + "FETCH NEXT " + pageSize + " ROWS ONLY ";                // paging                     
       // 전체 카운트를 가져오기위한 sql을 실행해야한다.
      rs2 = stmt.executeQuery(SQL);   // select 문                             //paging
      int totalRecords = 0;                                                             //paging
      while(rs2.next()){       // 처음부터 끝까지                                  //paging
      totalRecords++;       // 전체 레코드 수 카운트                             //paging
      }


   // 페이지가 계산된 목록을 가져오는 SQL2를 실행한다.
      rs = stmt.executeQuery(SQL2);    //  SQL2=기존 SQL + 페이징 SQL      // paging
   
   while(rs.next())    
   {
       String image= rs.getString("Product_Image");
       String code= rs.getString("Product_Code");
       String name= rs.getString("Product_Name");
       int price= rs.getInt("product_Price");
       String Info= rs.getString("Product_Info");

   
      out.write("\r\n");
      out.write("      <TR onmouseover=\"this.style.backgroundColor='orange';\"\r\n");
      out.write("      onmouseout=\"this.style.backgroundColor='white'; \" >  <TD>\r\n");
      out.write("      <a href=\"member_update.jsp?puserid=");
      out.print( code );
      out.write("\">\r\n");
      out.write("      <img src=\"/LSJ_PHOTO/productImage/");
      out.print( image );
      out.write("\" border=\"0\" width=\"100\"/>\r\n");
      out.write("      </a>\r\n");
      out.write("      </TD>      \r\n");
      out.write("               <TD><font size = 2> ");
      out.print( code);
      out.write(" </font></TD>      \r\n");
      out.write("               <TD><font size = 2> ");
      out.print( name);
      out.write(" </font></TD>      \r\n");
      out.write("               <TD><font size = 2> &nbsp;&nbsp;");
      out.print( price );
      out.write("&nbsp;&nbsp; </font></TD>      \r\n");
      out.write("               <TD><font size = 2> ");
      out.print( Info);
      out.write(" </font></TD> </TR>   \r\n");
      out.write("   ");
 } 
      out.write("\r\n");
      out.write("   \r\n");
      out.write("</TABLE>\r\n");

int intTotPages= 0; // 총 페이지 수 계산
int intR= totalRecords % pageSize;   // 6 % 3 = 0
if(intR == 0) {
intTotPages = totalRecords / pageSize;
}
else  {   // 7 % 3 != 0
intTotPages = totalRecords / pageSize + 1;  // 나머지가 0 아니면 총 페이지수는 몫 + 1
}

int intGrpSize  = 2; // 그룹 수 설정 - 화면에 보여질 그룹  수              
int currentGrp  = 0; // 현 그룹 No.
intR= currentPage % intGrpSize;     // 3 % 2 = ?
if(intR == 0) {                              
currentGrp= currentPage / intGrpSize;  //4/2=2 그룹
}
else  {   // 3/2 =1 +1 =2그룹
currentGrp= currentPage / intGrpSize + 1;  
}
//Page 282
int intGrpStartPage= (currentGrp  - 1) * intGrpSize + 1;   // 2그룹일 때 (2-1)*2+1=3
int intGrpEndPage=  currentGrp * intGrpSize;                  // 2그룹일 때  2*2=4
if (intGrpEndPage > intTotPages){    //  그룹의 끝 페이지가 총 페이지수보다 크면 
intGrpEndPage= intTotPages;           //  끝 페이지 수가 총 페이지 수 
}

if (currentGrp > 1){    //  그룹 2부터는 이전 페이지 표시

      out.write("\r\n");
      out.write(" [<A href=\"deleteProduct.jsp?PageNum=");
      out.print( intGrpStartPage - 1 );
      out.write("\">이전</A>]\r\n");
                                                               // 이전 이니까 -1
}

int intGrpPageCount= intGrpSize; // 그룹 당 페이지 수    
int intIndex= intGrpStartPage; // 현 그룹 시작 페이지
while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){

      out.write("\r\n");
      out.write("[<A href=\"deleteProduct.jsp?PageNum=");
      out.print( intIndex );
      out.write('"');
      out.write('>');
      out.print( intIndex );
      out.write("</A>] &nbsp; \r\n");

intIndex = intIndex + 1;
intGrpPageCount  = intGrpPageCount - 1;
}
if (intIndex <= intTotPages){  // 다음 그룹이 있으면 

      out.write("\r\n");
      out.write("[<A href=\"deleteProduct.jsp?PageNum=");
      out.print( intIndex );
      out.write("\">다음</A>]\r\n");

}

stmt.close();
rs.close();
rs2.close();
con.close();


      out.write("\r\n");
      out.write("\r\n");
      out.write("</BODY>\r\n");
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
