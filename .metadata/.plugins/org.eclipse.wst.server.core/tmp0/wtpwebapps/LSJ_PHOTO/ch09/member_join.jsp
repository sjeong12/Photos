<%@ page language="java" contentType="text/html; charset=utf-8" %>

<script language=javascript>
function valid_check()
{

if (document.frm1.userid.value == "")
{
alert("아이디를 입력하여 주시기 바랍니다.");
document.frm1.userid.focus();
return false;
}

if (document.frm1.userid.value.length < 4)
{
alert("아이디는 4자 이상입니다.");
document.frm1.userid.focus();
return false;
}

if (document.frm1.usernm.value == "")
{
alert("이름을 입력하여 주시기 바랍니다.");
document.frm1.usernm.focus();
return false;
}

if (document.frm1.passwd.value == "")
{
alert("비밀번호를 입력하여 주시기 바랍니다.");
document.frm1.passwd.focus();
return false;
}

if (document.frm1.passwd.value != document.frm1.passwd2.value)
{
alert("비밀번호가 다릅니다. 확인하여 주시기 바랍니다.");
document.frm1.passwd.focus();
return false;
}

if (document.frm1.phone1.value.length < 3)
{
  alert("전화번호를 다시 확인해주세요");
  document.frm1.phone1.focus();
  return false;
}

if (document.frm1.phone2.value.length < 4)
{
  alert("전화번호를 다시 확인해주세요");
  document.frm1.phone2.focus();
  return false;
}

if (document.frm1.phone3.value.length < 4)
{
  alert("전화번호를 다시 확인해주세요");
  document.frm1.phone3.focus();
  return false;
}

for (var i = 0; i < document.frm1.phone1.value.length; i++)
{
if (document.frm1.phone1.value.charAt(i) < "0" || document.frm1.phone1.value.charAt(i) > "9")
{
alert("전화번호는 숫자만 가능합니다.");
document.frm1.jumin1.focus();
return;  }   }

for (var i = 0; i < document.frm1.phone2.value.length; i++)
{
if (document.frm1.phone2.value.charAt(i) < "0" || document.frm1.phone2.value.charAt(i) > "9")
{
alert("전화번호는 숫자만 가능합니다.");
document.frm1.jumin2.focus();
return;  }  }  

for (var i = 0; i < document.frm1.phone3.value.length; i++)
{
if (document.frm1.phone3.value.charAt(i) < "0" || document.frm1.phone3.value.charAt(i) > "9")
{
alert("전화번호는 숫자만 가능합니다.");
document.frm1.jumin2.focus();
return;  }  }   


if (document.frm1.addr1.value == "")
{
alert("주소를 입력하여 주시기 바랍니다.");
document.frm1.addr1.focus();
return false;
}

if (document.frm1.addr2.value == "")
{
alert("주소를 입력하여 주시기 바랍니다.");
document.frm1.addr2.focus();
return false;
}

document.frm1.submit();
}

function KeyNumber()
{
var event_key = event.keyCode;

if((event_key < 48 || event_key > 57) && (event_key != 8 && event_key != 46))
{
event.returnValue=false;
}
}
function cursor_move(a)
{

if ( a == 1 )
{
var str = document.frm1.phone1.value.length;
if (str == 3) 
document.frm1.phone2.focus();
}
else if ( a == 2 )
{
var str = document.frm1.phone2.value.length;
if (str == 4) 
document.frm1.phone3.focus();
}
else if ( a == 3 )
{
var str = document.frm1.phone3.value.length;
if (str == 4) 
document.frm1.addr1.focus();
}
}
 </script>

<h2>Join</h2><BODY>
<form Name="frm1" action="/LSJ_PHOTO/ch09/member_join_ok.jsp" method="post">
<center>
<TABLE WIDTH = "500" BORDER = "0" CellPadding = "5" CellSpacing = "0">
<TR><TD WIDTH = "40%" ALIGN = "left" ><font size = 2>아이디</font></TD>
<TD width = "80%" ALIGN = "left" >
<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "userid">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>이름</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "usernm">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>비밀번호</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>비밀번호확인</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd2">
</TD></TR>

<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>연락처</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "3" MAXLENGTH = "3" NAME = "phone1">-
<INPUT TYPE = "text" SIZE = "4" MAXLENGTH = "4" NAME = "phone2">-
<INPUT TYPE = "text" SIZE = "4" MAXLENGTH = "4" NAME = "phone3">
</TD></TR>

<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>주소</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "30" MAXLENGTH = "30" NAME = "addr1">
</TD></TR>

<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>상세주소</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "30" MAXLENGTH = "30" NAME = "addr2">
</TD></TR>

<TR>
<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
<INPUT TYPE = "button" VALUE = "가입" onclick="valid_check()">
</TD></TR>

</TABLE>
</center>
</FORM>
</BODY>
</HTML>
       