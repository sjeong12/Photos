<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>제품 업로드</TITLE>
 </HEAD>

<script language=javascript>
function valid_check()
{
	if (document.frm_d.category.value == "") 
	{
		alert("카테고리를 선택하세요");
		document.frm_d.category.focus(); 
		return false;
	}
	
	if (document.frm_d.name.value == "") 
	{
		alert("디자인 이름을 입력하세요");
		document.frm_d.name.focus(); 
		return false;
	}
	
	document.frm_d.submit();
}
 </script>
 
<h3>디자인 생성</h3>
<BODY>
<FORM NAME = "frm_d" ACTION = "/LSJ_PHOTO/CustomDesign/addDesign_ok.jsp" METHOD = "post" ENCTYPE="multipart/form-data">
<TABLE WIDTH = "400" BORDER = "0" CellPadding = "0" CellSpacing = "0">
	<TR>
		<TD WIDTH = "30%" ALIGN = "left">
		<SELECT NAME="category">
        <OPTION VALUE="">==카테고리==</OPTION>
        <OPTION VALUE="1">액자</OPTION>
        <OPTION VALUE="2">앨범</OPTION>
        <OPTION VALUE="3">디자인 소품</OPTION>
        </SELECT>
		</TD>

		<TD WIDTH = "30%" ALIGN = "left"><font size = 2> 디자인 이름</font></TD>
		<TD WIDTH = "40%" ALIGN = "left">
			<INPUT TYPE ="text" NAME="name" SIZE = "30" MAXLENGTH = "50">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "3">
		<TABLE>
			<TR>
				<TD WIDTH = "34%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "등록" onClick="valid_check()">
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>
</HTML>