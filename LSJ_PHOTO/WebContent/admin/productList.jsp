<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<HTML><HEAD>
<TITLE>제품 목록</TITLE></HEAD>
<h2>Products</h2>

<script language=javascript>
function add_product()
{
	document.frm_s.action = "/LSJ_PHOTO/home.jsp?page=/admin/addProduct";
	document.frm_s.submit();
}
</script>


<BODY>

<%
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
%>

<FORM NAME = frm_s  ACTION="/LSJ_PHOTO/home.jsp?page=/admin/productList" METHOD=post>
<SELECT NAME=search_key>

<OPTION VALUE = ""
	<%
 	     if (in_search_key.equals("")) out.print(" selected");
	%>
    >모든 상품</OPTION> 
<OPTION VALUE = "1"
	<%
 	     if (in_search_key.equals("1")) out.print(" selected");
	%>
    >액자</OPTION> 
<OPTION VALUE = "2"
    <%
         if (in_search_key.equals("2")) out.print(" selected");
    %>
  >앨범</OPTION>
 <OPTION VALUE = "3"
    <%
         if (in_search_key.equals("3")) out.print(" selected");
    %>
  >디자인 소품</OPTION>
  
  
   </SELECT>

<INPUT TYPE=button VALUE="새 상품 추가" onclick = "add_product()">
<right>
<INPUT TYPE=text NAME=search_value VALUE="<%= in_search_value %>">
<INPUT TYPE=submit VALUE="검색">
</right>
</FORM>


    
<TABLE border = "0" cellspacing = "1" cellpadding = "5" width = "700" >   
<TR bgcolor = "EAEAEA" height="30">      
<TD><font size = 2><center>제품 이미지</center></font></TD>      
<TD><font size = 2><center>제품 코드</center></font></TD>      
<TD><font size = 2><center>제품명</center></font></TD>      
<TD><font size = 2><center>가격</center></font></TD>      
<TD><font size = 2><center>설명</center></font></TD>      
</TR> 
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
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

   %>
      <TR onmouseover="this.style.backgroundColor='F6F6F6';"
      onmouseout="this.style.backgroundColor='white'; ">  <TD>
      <a href="/LSJ_PHOTO/home.jsp?page=/admin/productView&pcode=<%= code %>">
      <img src="/LSJ_PHOTO/productImage/<%= image %>" border="0" width="80" height="80"/>
	  </a>
      </TD>      
               <TD><font size = 2> <%= code%> </font></TD>      
               <TD><font size = 2> <%= name%> </font></TD>      
               <TD><font size = 2> &nbsp;&nbsp;<%= price %>&nbsp;&nbsp; </font></TD>      
               <TD><font size = 2> <%= Info%> </font></TD> </TR>   
   <% } %>
   
</TABLE>

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
 [<A href="/LSJ_PHOTO/home.jsp?page=/admin/productList&PageNum=<%= intGrpStartPage - 1 %>">이전</A>]
<%                                                               // 이전 이니까 -1
}

int intGrpPageCount= intGrpSize; // 그룹 당 페이지 수    
int intIndex= intGrpStartPage; // 현 그룹 시작 페이지
while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/admin/productList&PageNum=<%= intIndex %>"><%= intIndex %></A>] &nbsp; 
<%
intIndex = intIndex + 1;
intGrpPageCount  = intGrpPageCount - 1;
}
if (intIndex <= intTotPages){  // 다음 그룹이 있으면 
%>
[<A href="/LSJ_PHOTO/home.jsp?page=/admin/productList&PageNum=<%= intIndex %>">다음</A>]
<%
}

stmt.close();
rs.close();
rs2.close();
con.close();

%>

</BODY>
