<%@ page contentType="text/html;charset=utf-8" %>
<html><head><title>ONLINE PHOTO STUDIO</title></head>
<body>

<div id="bottom" style="text-align:center;"> 
		<%String userid = (String)session.getAttribute("G_MEMID");%>
		
		<img src="homepageImage/MyPage/title_myPage.png" height="50"/><br/>
		
		<a href="/LSJ_PHOTO/home.jsp?page=/ch09/member_update&puserid=<%= userid %>">
		<img src="homepageImage/MyPage/myInfo.png" width="100"/></a>
		<a href="/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign&puserid=<%= userid %>">
		<img src="homepageImage/MyPage/customDesign.png" width="100"/></a> 
		<a href="/LSJ_PHOTO/home.jsp?page=/Order/orderList">
		<img src="homepageImage/MyPage/order.png" width="100"/></a>

</div>
</BODY>
</HTML>
