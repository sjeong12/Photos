<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/include/dbinfo.inc" %>
<%
String realFolder = "";
//String saveFolder = "d:/lsj531/workspace531/LSJ_HOME/WebContent/lsj531/chap10/boardD/upfile";
//String saveFolder = "d:/website/ROOT/LSJ_HOME/WebContent/lsj531/chap10/boardD/upfile";
String saveFolder = "/productImage";
String encType = "utf-8";


String code= request.getParameter("pcode");
int category= Integer.valueOf(request.getParameter("category"));
int d_num= Integer.valueOf(request.getParameter("dnum"));

ResultSet rs = null;
ResultSet rs2 = null;
PreparedStatement pstmt = null;

try
{
	String SQL = "select S.Category_Num, P.SubCategory_Num from Product P, Sub_Category S ";
	SQL = SQL + "where P.SubCategory_Num = S.Sub_Category_Num ";
	SQL = SQL + "and Product_Code= ? ";
    
    pstmt = con.prepareStatement(SQL);
    pstmt.setString(1, code);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
	 int subCategory= rs.getInt("SubCategory_Num");
     int getCategory= rs.getInt("Category_Num");
     
     if (getCategory!=category)
	   {
		   out.println("<script language=javascript>");
		   out.println("alert('선택하신 카테고리에 해당하지 않는 옵션입니다');");
		   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign';");
		   out.println("</script>");
	   }
     else{
     
     
     
     String SQL3 = "select DOP_NUM, SubCategory_Num from Design_Option D, Product P ";
	 SQL3 = SQL3 + "where P.Product_Code=D.Product_Code and D.D_NUM = ? and P.SubCategory_Num= ?";
	    
	    pstmt = con.prepareStatement(SQL3);
	    pstmt.setInt(1, d_num);
	    pstmt.setInt(2, subCategory);
		rs2 = pstmt.executeQuery();
	 
	 if(rs2.next()){
		 int doNum= rs2.getInt("DOP_NUM");
		 
		 String SQL2 ="update Design_Option set Product_Code = ? ";
		 SQL2 = SQL2 + "where DOP_NUM = ? and D_NUM = ? ";

			pstmt = con.prepareStatement(SQL2);
			pstmt.setString(1, code);
			pstmt.setInt(2, doNum);
			pstmt.setInt(3, d_num);
			pstmt.executeUpdate();
		 
		   out.println("<script language=javascript>");
		   out.println("alert('옵션을 변경하였습니다');");
		   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign';");
		   out.println("</script>");
	 }
	 else
	 {
	
	String SQL2 ="INSERT INTO Design_Option(Product_Code ,D_NUM) VALUES (?, ?)";
	pstmt = con.prepareStatement(SQL2);

	pstmt.setString(1, code);
	pstmt.setInt(2, d_num);
	pstmt.executeUpdate();
	
	out.println("<script language=javascript>");
	   out.println("alert('옵션을 추가하였습니다');");
	   out.println("location.href='/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign';");
	   out.println("</script>");
	 }
     
     
     
	}
    

	}
} // try end

catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (pstmt != null) pstmt.close();
	if (con   != null) con.close();

	//response.sendRedirect("/LSJ_PHOTO/home.jsp?page=/CustomDesign/customDesign");
} // finally end
%>