<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>제품 업로드</TITLE>
 </HEAD>

<script language=javascript>
function valid_check()
{
	if (document.frm_file.category.value == "") 
	{
		alert("카테고리를 선택하세요");
		document.frm_file.category.focus(); 
		return false;
	}
	
	if (document.frm_file.sub_category.value == "") 
	{
		alert("세부 카테고리를 선택하세요");
		document.frm_file.sub_category.focus(); 
		return false;
	}
	
	if (document.frm_file.code.value == "") 
	{
		alert("제품코드를 입력바랍니다");
		document.frm_file.code.focus(); 
		return false;
	}
	
	for (var i = 0; i < document.frm_file.amount.value.length; i++)
	{
	if (document.frm_file.amount.value.charAt(i) < "0" || document.frm_file.amount.value.charAt(i) > "9")
	{
	alert("개수는 숫자로 입력해주세요");
	document.frm1.jumin1.focus();
	return;  }   }
	
	if (document.frm_file.name.value == "") 
	{
		alert("제품명을 입력바랍니다");
		document.frm_file.name.focus(); 
		return false;
	}

	if (document.frm_file.price.value == "") 
	{
		alert("가격을 입력바랍니다");
		document.frm_file.price.focus(); 
		return false;
	}
	
	for (var i = 0; i < document.frm_file.price.value.length; i++)
	{
	if (document.frm_file.price.value.charAt(i) < "0" || document.frm_file.price.value.charAt(i) > "9")
	{
	alert("가격은 숫자로 입력해주세요");
	document.frm1.jumin1.focus();
	return;  }   }
	
	if (document.frm_file.image.value == "") 
	{
		alert("제품이미지를 첨부바랍니다");
		document.frm_file.image.focus(); 
		return false;
	}

	document.frm_file.submit();
}


function doChange(srcE, targetId){
    var val = srcE.value;
    var targetE = document.getElementById(targetId);
    var url;
    targetE.length = 0;
    switch (val) {
      case "1" :
        addOption(['프레임', '1'], targetE);
        addOption(['용지', '2'], targetE);
      break;

      case "2" :
        addOption(['커버', '3'], targetE);
        addOption(['용지', '4'], targetE);
      break;
      
      case "3" :
          addOption(['쿠션', '5'], targetE);
          addOption(['머그컵', '6'], targetE);
          addOption(['액세서리', '7'], targetE);
        break;
    }

}

function addOption(text, obj) {
  obj.options[obj.length] = new Option(text[0] ,text[1]);
}



function submit_list()
{
	document.frm_file.action = "/LSJ_PHOTO/home.jsp?page=/admin/productList";
	document.frm_file.submit();
}

 </script>
<h3>파일 업로드</h3>
<BODY>
<FORM NAME = "frm_file" ACTION = "admin/addProduct_ok.jsp" METHOD = "post" ENCTYPE="multipart/form-data">
<TABLE WIDTH = "600" BORDER = "0" CellPadding = "0" CellSpacing = "0">
	<TR><TD WIDTH = "40%" ALIGN = "left">카테고리</TD>
        <TD WIDTH = "60%" ALIGN = "left">
        <SELECT NAME="category" id="category" onchange="doChange(this, 'sub_category')">
        <OPTION VALUE="">==카테고리==</OPTION>
        <OPTION VALUE="1">액자</OPTION>
        <OPTION VALUE="2">앨범</OPTION>
        <OPTION VALUE="3">디자인 소품</OPTION>
        </SELECT>
        
        <SELECT NAME="sub_category" id="sub_category">
       	<OPTION VALUE="">==세부 카테고리==</OPTION>
      	</SELECT>

       </TD>
    </TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">제품코드</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE = "text" SIZE = "50" MAXLENGTH = "10" NAME = "code">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">개수</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE = "text" SIZE = "50" MAXLENGTH = "10" NAME = "amount">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">제품명</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="text" NAME="name" SIZE = "50" MAXLENGTH = "50">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">가격</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="text" NAME="price" SIZE = "50" MAXLENGTH = "50">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">제품설명</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<TEXTAREA NAME="text" ROWS=5 COLS=50></TEXTAREA>
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">제품 이미지</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="file" NAME="image" >
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
		<TABLE>
			<TR>
				<TD WIDTH = "33%" ALIGN = "center">
					<INPUT TYPE = "reset" VALUE = "다시 작성">
				</TD>
				<TD WIDTH = "34%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "등록" onClick="valid_check()">
				</TD>
				<TD WIDTH = "33%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "목록으로" onClick = "submit_list()">
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>
</HTML>