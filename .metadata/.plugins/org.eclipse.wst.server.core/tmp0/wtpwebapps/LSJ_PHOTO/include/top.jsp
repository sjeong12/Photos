<%@ page contentType="text/html;charset=utf-8" %>

<div id="bottom" style="text-align:center;"> 
<a href="home.jsp"><img src="homepageImage/main.png" border="0"/></a> <br/>

</div> 

	<div id="bottom" style="text-align:right;">
	<font size="2">
	
<%
String in_userid = (String)session.getAttribute("G_MEMID");
   if (in_userid == null)
   {

%>

	GUEST님 
	<a href="/LSJ_PHOTO/home.jsp?page=/ch09/member_login">[로그인]</a> | 
	<a href="/LSJ_PHOTO/home.jsp?page=/ch09/member_join">회원가입</a> | 

<%
   } else{
%>

	<%= in_userid %>님 &nbsp;
	<a href="/LSJ_PHOTO/home.jsp?page=/ch09/member_logout">로그아웃</a> | 
	<a href="/LSJ_PHOTO/home.jsp?page=myPage">마이페이지</a> | 
	<a href="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign&puserid=<%= in_userid %>">내 디자인</a> | 
	<a href="/LSJ_PHOTO/home.jsp?page=/Order/orderList">주문조회</a>
	
<%
	if(in_userid.equals("admin")){
%>
		 | <a href="/LSJ_PHOTO/home.jsp?page=/admin/productList">제품 관리</a>
		 | <a href="/LSJ_PHOTO/home.jsp?page=/ch09/member_list">회원 리스트</a>
<%
	}
   }
%>
</font> 

<br/>
<img src="homepageImage/line.PNG" border="0" width="890" height="10"/>
</div> 