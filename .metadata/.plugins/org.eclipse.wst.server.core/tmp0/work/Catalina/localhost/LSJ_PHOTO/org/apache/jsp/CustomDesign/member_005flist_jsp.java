/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2016-12-06 09:10:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.CustomDesign;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class member_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<TITLE>내 디자인</TITLE></HEAD>\r\n");
      out.write("<H3>내 디자인 리스트</H3>\r\n");
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
    if (strPageSize == null) strPageSize = "3";      // paging    이 크기는 화면 사이즈에 따라 다름
    int currentPage = Integer.parseInt(strPageNum);  // paging  현재 선택 페이지 값 INT 로 변경
    int pageSize = Integer.parseInt(strPageSize);     // paging    목록의 갯수 INT로 변경

      out.write("\r\n");
      out.write("\r\n");
      out.write("<FORM NAME = frm_s  ACTION=\"member_list.jsp\" METHOD=post>\r\n");
      out.write("검색조건 : <SELECT NAME=search_key>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<OPTION VALUE = \"nm\"\r\n");
      out.write("\t");

 	     if (in_search_key.equals("nm")) out.print(" selected");
	
      out.write("\r\n");
      out.write("    >회원명</OPTION> \r\n");
      out.write("<OPTION VALUE = \"id\"\r\n");
      out.write("    ");

         if (in_search_key.equals("id")) out.print(" selected");
    
      out.write("\r\n");
      out.write("  >회원ID</OPTION>\r\n");
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
      out.write("<TABLE border = \"0\" cellspacing = \"1\" cellpadding = \"2\" width = \"600\">      \r\n");
      out.write("\r\n");
      out.write("<TR bgcolor = \"cccccc\">      \r\n");
      out.write("<TH><font size = 2><center><b>회원ID</b></center></font></TH>      \r\n");
      out.write("<TH><font size = 2><center><b>회원명</b></center></font></TH>      \r\n");
      out.write("<TH><font size = 2><center><b>성별</b></center></font></TH>      \r\n");
      out.write("<TH><font size = 2><center><b>생년월일</b></center></font></TH>      \r\n");
      out.write("<TH><font size = 2><center><b>직업</b></center></font></TH>      \r\n");
      out.write("</TR> \r\n");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=lsj1531;user=sa;password=11";
Connection con = DriverManager.getConnection(connectionURL);

ResultSet rs = null;   // 데이터 베이스에서 가져온 정보를 저장하는 객체 
ResultSet rs2 = null;      // paging    rs 객체 하나 더 생성 

     Statement stmt = con.createStatement();
   //String SQL = "select userid, usernm, gender, jumin, jobcd from members order by userid";
     
     String SQL = "select ";
     SQL = SQL + "userid, ";
     SQL = SQL + "usernm, ";
     SQL = SQL + "case gender when '1' then '남' when '2' then '여' else '' end gender, ";
     SQL = SQL + "jumin, ";
/*     SQL = SQL + "case jobcd when '1' then '학생' when '2' then '회사원'  when '3' then '군인'   when '9' then '기타' else '' end jobcd ";
     SQL = SQL + "from members ";
     
     if (in_usernm != "")
     {
     SQL = SQL + " where usernm like '%" + in_usernm + "%'";
     }
   
     SQL = SQL + "order by userid ";
*/
SQL = SQL + "case jobcd when '1' then '학생' when '2' then '회사원'  when '3' then '군인'  else '기타' end jobcd ";
SQL = SQL + "from members ";

if (in_search_key.equals("nm"))
      SQL = SQL + " where usernm like '%" + in_search_value + "%'";
else if (in_search_key.equals("id"))
            SQL = SQL + " where userid = '" + in_search_value + "'";
     SQL = SQL + "order by userid ";


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

    //  rs = stmt.executeQuery(SQL);    // 기존 소스는 주석 처리 하고 매개변수로 SQL2 추가

   // 페이지가 계산된 목록을 가져오는 SQL2를 실행한다.
      rs = stmt.executeQuery(SQL2);    //  SQL2=기존 SQL + 페이징 SQL      // paging
   
   while(rs.next())    
   {
       String userid= rs.getString("userid");
       String usernm= rs.getString("usernm");
       String jumin= rs.getString("jumin");
       String jumin1= "";
//     if (jumin != null)
     //      {
     //        jumin1= jumin.substring(0, 6);
     //      }
     String jumin2 ="";
     String jumin3 ="";
     if(jumin != null) {
    	 jumin1 = jumin.substring(0, 2);
    	 jumin2 = jumin.substring(2, 4);
    	 jumin3 = jumin.substring(4, 6);
     }
     
     String gender= rs.getString("gender");
/*     if (gender == null)
            gender= "";
      else if (gender.equals("1"))
              gender= "남";
      else if (gender.equals("2"))
             gender= "여";
       else
              gender= "기타";
 */   

    
    String job= rs.getString("jobcd");
/*    if (job == null)
          job= "";
    else if (job.equals("1"))
           job= "학생";
    else if (job.equals("2"))
          job= "회사원";
    else if (job.equals("3"))
          job= "군인";
    else
         job= "기타";
*/   

   
      out.write("\r\n");
      out.write("      <TR onmouseover=\"this.style.backgroundColor='orange';\"\r\n");
      out.write("      onmouseout=\"this.style.backgroundColor='white'; \" >  <TD>\r\n");
      out.write("      <a href=\"member_update.jsp?puserid=");
      out.print( userid );
      out.write('"');
      out.write('>');
      out.print( userid );
      out.write("</a><img src=\"new.gif\" />\r\n");
      out.write("      </TD>      \r\n");
      out.write("               <TD>");
      out.print( usernm);
      out.write("</TD>      \r\n");
      out.write("               <TD>");
      out.print( gender);
      out.write("</TD>      \r\n");
      out.write("               <TD><!-- %= jumin1% -->\r\n");
      out.write("               ");
      out.print(jumin1 );
      out.write('-');
      out.print(jumin2 );
      out.write('-');
      out.print(jumin3 );
      out.write("</TD>      \r\n");
      out.write("               <TD>");
      out.print( job);
      out.write("</TD> </TR>   \r\n");
      out.write("   ");
 }
//stmt.close();
//rs.close();
//con.close(); //아직 안끝났다는 뜻. 내용 추가한뒤 밑에 붙여넣기

      out.write("\r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");
      out.write("<!--  // paging process   2 step-->\r\n");

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
      out.write(" [<A href=\"member_list.jsp?PageNum=");
      out.print( intGrpStartPage - 1 );
      out.write("\">이전</A>]\r\n");
                                                               // 이전 이니까 -1
}

int intGrpPageCount= intGrpSize; // 그룹 당 페이지 수    
int intIndex= intGrpStartPage; // 현 그룹 시작 페이지
while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){

      out.write("\r\n");
      out.write("[<A href=\"member_list.jsp?PageNum=");
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
      out.write("[<A href=\"member_list.jsp?PageNum=");
      out.print( intIndex );
      out.write("\">다음</A>]\r\n");

}

stmt.close();
rs.close();
rs2.close();
con.close();


      out.write("\r\n");
      out.write("<!--  // paging process   2 step -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("   ");
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
