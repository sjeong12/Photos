<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML> <HEAD>  <TITLE>로그인</TITLE> </HEAD>
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" %>
<script language=javascript>

function valid_check()
{
if (document.frmLogins.userid.value == "")
{
     alert("아이디를 입력하여 주시기 바랍니다");
      document.frmLogins.userid.focus();
      return false;
}
if (document.frmLogins.passwd.value == "")
    {
     alert("비밀번호를 입력하여 주시기 바랍니다");
      document.frmLogins.passwd.focus();
      return false;
   }
    document.frmLogins.submit();
}

</script>
 
<%
String in_userid = (String)session.getAttribute("G_MEMID");
   if (in_userid == null)
   {

%>
<BODY>
<h2>Login</h2>
<FORM NAME="frmLogins" ACTION="ch09/member_login_ok.jsp" METHOD= "post">
<center>
<font size="2">
<TABLE WIDTH = "170" BORDER = "0" CellPadding = "0" CellSpacing = "0">
<TR><TD WIDTH = "120" ALIGN = "left" > I&nbsp;&nbsp;D</TD>
<TD width = "50" ALIGN = "left" >
<INPUT TYPE = "text" SIZE = "10" MAXLENGTH = "10" NAME = "userid">
</TD></TR>
<TR><TD WIDTH = "120" ALIGN = "left"> Password</TD>
<TD WIDTH = "50" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "11" MAXLENGTH = "10" NAME = "passwd">
</TD></TR>
<TR><TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
<br/>
&nbsp;&nbsp;&nbsp;<INPUT TYPE = "button" VALUE = "로그인" onclick="valid_check()"> &nbsp;
<br>

</TD></TR>
</TABLE>
</font>
</center>
</FORM>
<%
}
else 
{ 
out.print(in_userid);
out.print("님 환영합니다");

%>
<BODY>
<FORM NAME = "frmLog"  METHOD = "post">
<TABLE WIDTH = "130" BORDER = "0" CellPadding = "5" CellSpacing = "0" align="center" valign="middle">
<TR><TD WIDTH = "100%" ALIGN = "center" >
<a href="/LSJ_PHOTO/home.jsp?page=ch09/member_logout"><font size = 2>로그아웃</font></a>

<a href= "/LSJ_PHOTO/home.jsp?page=ch09/member_update.jsp?puserid=<%= in_userid %>"><font size = 2>정보수정</font></a>

<% 
if (in_userid.equals("admin"))
{
 %>
<br> <a href="/LSJ_PHOTO/home.jsp?page=ch09/member_list"><font size = 2>회원리스트보기</font></a><br>
<%} %>
</TD></TR>
</TABLE>
</FORM>

<%
   }
%>
</BODY></HTML>
