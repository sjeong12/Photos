<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="EUC-KR"%>
<%
     String pagefile=request.getParameter("page");  //  ���� �̸� ȹ��
     if (pagefile==null){pagefile="/category/main_popular";}         //  ������ main_first
%>

<html><head>
<title>ONLINE PHOTO STUDIO</title>
</head>
<body>
<table width="1000" border="0" cellpadding="5" align="center" >
   <tr>  <td colspan="2">
       <jsp:include page="include/top.jsp" flush="false" />  </td>
  </tr>
  
<tr>
	<td valign="top"><jsp:include page="include/menu.jsp" flush="false" /></td>
	<td width="800" valign="middle">
	
	<center>
	<text size="2">
	<jsp:include page='<%=pagefile+".jsp" %>'/>
	</text>
	</center>
	</td>
</tr>

<tr> <td colspan="2">
    <jsp:include page="include/bottom.jsp" flush="false" />
  </td>
</tr>
</table>
</body></html>

