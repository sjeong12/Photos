<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<html> 
<body>

	<div id="bottom" style="text-align:center;">
		<img src="/LSJ_PHOTO/homepageImage/eventBanner2.png" border="0" width="680"/>
		<br/><br/><br/>
	</div>
	
	<table width="800" border="0" cellpadding="7" align="center" valign="middle"> 
	


<%  
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=1234";
Connection con = DriverManager.getConnection(connectionURL);
Statement stmt = null;
ResultSet rs = null;

 //    try
 //    {
String SQL= "select Product_Code, Product_Name, Product_Image, Product_Amount, Product_Price, Product_Info, Product_Popular from Product order by Product_Popular desc";
//String SQL= "select * from Product";
stmt = con.createStatement();
rs = stmt.executeQuery(SQL);


int count=0; //한 줄에 몇개의 상품이 들어가는지 카운트. 0이면 다음 행으로

	while(rs.next()) {
		
	String code = rs.getString("Product_Code");
	String name = rs.getString("Product_Name");
	String image = rs.getString("Product_Image");
	String info	= rs.getString("Product_Info");
	
	int price = rs.getInt("Product_Price");
	int amount = rs.getInt("Product_Amount");
	int popular = rs.getInt("Product_Popular");
	
	
	if(count >= 5){
		count=0;
		%> <tr/> <%
	}
	
	if(count == 0){
		%> <tr> <%
	}

%>
		<td onmouseover="this.style.backgroundColor='F6F6F6';" onmouseout="this.style.backgroundColor='white'; ">
		<div id="bottom" style="font-size:12px; text-align:center;">
			<a href="/LSJ_PHOTO/home.jsp?page=/category/productView&pcode=<%=code%>">
			<img src="/LSJ_PHOTO/productImage/<%=image%>" border="0" width="100" height="100"/>
			</a><br/><br/>
			<%=name %> <br/>
			<%=price %>원
		</div>
		</td>
<%

	count++;

}    


//     } //try end

//     catch(SQLException e1){
 //    	out.println(e1.getMessage());
  //   } // catch SQLException end

//     catch(Exception e2){
//     	e2.printStackTrace();
//     } // catch Exception end

//     finally{
     	if (stmt != null) stmt.close();;
     	if (rs    != null) rs.close();
     	if (con   != null) con.close();
//     } // finally end
%>

	</tr>
	</table>
	
	</body>
	</html>
