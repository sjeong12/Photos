

<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" %>



<script language=javascript>
function valid_check()
{

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


<%
String in_userid = request.getParameter("puserid");
//String usernm = request.getParameter("pusernm");
//String in_jumin1 = request.getParameter("pjumin1");
//String in_jumin2 = request.getParameter("pjumin2");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
Connection con = DriverManager.getConnection(connectionURL);
PreparedStatement pstmt = null;
ResultSet rs = null;

String SQL = "select * from Member where M_ID = ?";
pstmt = con.prepareStatement(SQL);
pstmt.setString(1, in_userid);
rs = pstmt.executeQuery();

if (rs.next()==false)
	   out.print("등록되지 않은 회원입니다.");
	else
	{
		String usernm= rs.getString("M_NAME");
		String phone= rs.getString("M_PHONE");

				String phone1= "";
				String phone2= "";
				String phone3= "";
			          if (phone != null)  {
			        	  phone1= phone.substring(0, 3);
			        	  phone2= phone.substring(3,7);
			        	  phone3= phone.substring(7,11);
						}
		
		String pass= rs.getString("M_PASSWORD");
		String addr1= rs.getString("M_ADDRESS1");
		String addr2= rs.getString("M_ADDRESS2");
%>

 <h2>My Info</h2><BODY>
<!--form action="member_join_ok.jsp" method="post"-->
<form Name="frm1" action="/LSJ_PHOTO/ch09/member_update_ok.jsp" method="post">
<center>
<!--아이디 히든시키기 -->
<!-- <INPUT TYPE = "hidden" NAME = "userid" VALUE="<%=in_userid%>"> -->
<TABLE WIDTH = "500" BORDER = "0" CellPadding = "5" CellSpacing = "0">
<TR><TD WIDTH = "40%" ALIGN = "left" ><font size = 2>아이디</font></TD>
<TD width = "80%" ALIGN = "left" >
<!--%=in_userid%  -->
<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "userid1" VALUE="<%= in_userid %>" disabled>
<INPUT TYPE = "hidden" NAME = "userid" VALUE="<%=in_userid%>">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>이름</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "usernm" VALUE="<%= usernm %>">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>비밀번호</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd">
</TD></TR>
<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>비밀번호 확인</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd2">
</TD></TR>

<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>연락처</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "3" MAXLENGTH = "3" NAME = "phone1" VALUE="<%= phone1 %>">-
<INPUT TYPE = "text" SIZE = "4" MAXLENGTH = "4" NAME = "phone2" VALUE="<%= phone2 %>">-
<INPUT TYPE = "text" SIZE = "4" MAXLENGTH = "4" NAME = "phone3" VALUE="<%= phone3 %>">
</TD></TR>

<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>주소</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "30" MAXLENGTH = "30" NAME = "addr1" VALUE="<%= addr1 %>">
</TD></TR>

<TR><TD WIDTH = "40%" ALIGN = "left"><font size = 2>상세주소</font></TD>
<TD WIDTH = "60%" ALIGN = "left">
<INPUT TYPE = "text" SIZE = "30" MAXLENGTH = "30" NAME = "addr2" VALUE="<%= addr2 %>">
</TD></TR>

<TR>
<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
<INPUT TYPE = "button" VALUE = "수정하기" onclick="valid_check()">
</TD></TR>

</TABLE>
</center>
</FORM>
</BODY>
<%
	}
%>
</HTML>
       
       