<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<HTML><HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>회원 리스트</TITLE></HEAD>
<H2>Member List</H2>

<BODY>

<%
    
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
%>

<FORM NAME = frm_s  ACTION="/LSJ_PHOTO/home.jsp?page=/ch09/member_list" METHOD=post>
<SELECT NAME=search_key>


<OPTION VALUE = "id"
    <%
         if (in_search_key.equals("id")) out.print(" selected");
    %>
  >회원ID</OPTION>
<OPTION VALUE = "nm"
	<%
 	     if (in_search_key.equals("nm")) out.print(" selected");
	%>
    >회원명</OPTION> 
  
  
   </SELECT>
 <INPUT TYPE=text NAME=search_value VALUE="<%= in_search_value %>">
<INPUT TYPE=submit VALUE="검색">
</FORM>




<TABLE border = "0" cellspacing = "1" cellpadding = "4" width = "600">      

<TR bgcolor = "EAEAEA">      
<TD height="25"><font size = 2><center>회원ID</center></font></TD>      
<TD height="25"><font size = 2><center>회원명</center></font></TD>      
<TD height="25"><font size = 2><center>비밀번호</center></font></TD>      
<TD height="25"><font size = 2><center>연락처</center></font></TD>      
<TD height="25"><font size = 2><center>주소</center></font></TD>
<TD height="25"><font size = 2><center>상세주소</center></font></TD>      
</TR> 
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
Connection con = DriverManager.getConnection(connectionURL);

ResultSet rs = null;   // 데이터 베이스에서 가져온 정보를 저장하는 객체 
ResultSet rs2 = null;      // paging    rs 객체 하나 더 생성 

     Statement stmt = con.createStatement();
   //String SQL = "select userid, usernm, gender, jumin, jobcd from members order by userid";
     
     String SQL = "select M_ID, M_NAME, M_PASSWORD, M_ADDRESS1, M_ADDRESS2, M_PHONE ";
	 SQL = SQL + "from Member ";

if (in_search_key.equals("nm"))
      SQL = SQL + " where M_NAME like '%" + in_search_value + "%'";
else if (in_search_key.equals("id"))
            SQL = SQL + " where M_ID like '%" + in_search_value + "%'";
     SQL = SQL + "order by M_ID ";


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
       String userid= rs.getString("M_ID");
       String usernm= rs.getString("M_NAME");
       String phone= rs.getString("M_PHONE");
       String phone1= "";
     String phone2 ="";
     String phone3 ="";
     if(phone != null) {
    	 phone1 = phone.substring(0, 3);
    	 phone2 = phone.substring(3, 7);
    	 phone3 = phone.substring(7, 11);
     }
     
     String paswd= rs.getString("M_PASSWORD");
     String addr1= rs.getString("M_ADDRESS1");
     String addr2= rs.getString("M_ADDRESS2");

   %>
      <TR onmouseover="this.style.backgroundColor='F6F6F6';"
      onmouseout="this.style.backgroundColor='white'; " >
     		   <TD><font size = 2><%= userid %></font></TD>      
               <TD><font size = 2><%= usernm%></font></TD>      
               <TD><font size = 2><%= paswd%></font></TD>      
               <TD><font size = 2><%=phone1 %>-<%=phone2 %>-<%=phone3 %></font></TD>      
               <TD><font size = 2><%= addr1%></font></TD>
               <TD><font size = 2><%= addr2%></font></TD> 
      </TR>   
   <% }

%>
</TABLE>

<!--  // paging process   2 step-->
<%
int intTotPages= 0; // 총 페이지 수 계산
int intR= totalRecords % pageSize;   // 6 % 3 = 0
if(intR == 0) {
intTotPages = totalRecords / pageSize;
}
else  {   // 7 % 3 != 0
intTotPages = totalRecords / pageSize + 1;  // 나머지가 0 아니면 총 페이지수는 몫 + 1
}

int intGrpSize  = 10; // 그룹 수 설정 - 화면에 보여질 그룹  수              
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
%>
 [<A href="/LSJ_PHOTO/home.jsp?page=/ch09/member_list&PageNum=<%= intGrpStartPage - 1 %>">이전</A>]
<%                                                               // 이전 이니까 -1
}

int intGrpPageCount= intGrpSize; // 그룹 당 페이지 수    
int intIndex= intGrpStartPage; // 현 그룹 시작 페이지
while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/ch09/member_list&PageNum=<%= intIndex %>"><%= intIndex %></A>] &nbsp; 
<%
intIndex = intIndex + 1;
intGrpPageCount  = intGrpPageCount - 1;
}
if (intIndex <= intTotPages){  // 다음 그룹이 있으면 
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/ch09/member_list&PageNum=<%= intIndex %>">다음</A>]
<%
}

stmt.close();
rs.close();
rs2.close();
con.close();

%>
<!--  // paging process   2 step -->


</BODY>
   