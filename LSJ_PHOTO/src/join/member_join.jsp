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

if (document.frm1.userid.value.length < 6)
{
alert("아이디는 6자 이상입니다.");
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
alert("비밀번호가 다릅니다.  확인하여 주시기 바랍니다.");
document.frm1.passwd.focus();
return false;
}
if (document.frm1.jumin1.value.length != 6)
{
  alert("주민번호 앞 자릿수는 6자입니다.");
  document.frm1.jumin1.focus();
  return false;
}

if (document.frm1.jumin2.value.length != 7)
{
  alert("주민번호 뒷 자릿수는 7자입니다.");
  document.frm1.jumin2.focus();
  return false;
}
for (var i = 0; i < document.frm1.jumin1.value.length; i++)
{
if (document.frm1.jumin1.value.charAt(i) < "0" || document.frm1.jumin1.value.charAt(i) > "9")
{
alert("주민등록번호는 숫자만 가능합니다.");
document.frm1.jumin1.focus();
return;  }   }

for (var i = 0; i < document.frm1.jumin2.value.length; i++)
{
if (document.frm1.jumin2.value.charAt(i) < "0" || document.frm1.jumin2.value.charAt(i) > "9")
{
alert("주민등록번호는 숫자만 가능합니다.");
document.frm1.jumin2.focus();
return;  }  }  

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
var str = document.frm1.jumin1.value.length;
if (str == 6) 
document.frm1.jumin2.focus();
}
else if ( a == 2 )
{
var str = document.frm1.jumin2.value.length;
if (str == 7) 
document.frm1.mailrcv.focus();
}
}
 </script>




 <h3>회원 가입</h3><BODY>
<!--form action="member_join_ok.jsp" method="post"-->
<form Name="frm1" action="member_join_ok.jsp" method="post">


<TABLE WIDTH = "500" BORDER = "1" CellPadding = "0" CellSpacing = "0">
<TR><TD WIDTH = "40%" ALIGN = "left" >아이디</TD>
<TD width = "80%" ALIGN = "left" >
<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "userid">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">이름</TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "usernm">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">비밀번호</TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">비밀번호확인</TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd2">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">주민번호</TD>
        <TD WIDTH = "60%" ALIGN = "left">
        <INPUT TYPE ="text" NAME="jumin1" SIZE = "6" MAXLENGTH = "6"     
                 onKeyDown="KeyNumber()" onKeyup="cursor_move(1) ">-

<INPUT TYPE ="text" NAME="jumin2" SIZE = "7" MAXLENGTH = "7"  
                 onKeyDown="KeyNumber()" onKeyup="cursor_move(2) ">

        </TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">메일수신여부</TD>
        <TD WIDTH = "60%" ALIGN = "left"> 동의함 <INPUT TYPE ="checkbox" NAME="mailrcv">
        </TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">성별.</TD>
        <TD WIDTH = "60%" ALIGN = "left">남<INPUT TYPE ="radio" NAME="gender" VALUE="1">
                                                         여<INPUT TYPE ="radio" NAME="gender" VALUE="2">
        </TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">직업</TD>
        <TD WIDTH = "60%" ALIGN = "left">
        <SELECT NAME="job">
         <OPTION VALUE="">==직업을 선택하세요==</OPTION>
         <OPTION VALUE="1">학생</OPTION>
         <OPTION VALUE="2">회사원</OPTION>
        <OPTION VALUE="3">군인</OPTION>
        <OPTION VALUE="9">기타</OPTION>
        </SELECT>
       </TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left">자기소개</TD>
<TD WIDTH = "60%" ALIGN = "left">
<TEXTAREA NAME="intro" ROWS=5 COLS=50></TEXTAREA>
</TD></TR>

<TR>
<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
<INPUT TYPE = "button" VALUE = "가입" onclick="valid_check()">
</TD></TR>

</TABLE></FORM>
</BODY></HTML>
       