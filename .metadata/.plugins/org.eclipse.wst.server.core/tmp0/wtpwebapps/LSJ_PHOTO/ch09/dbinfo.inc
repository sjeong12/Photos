<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=DBPstudio;user=sa;password=11";
Connection con = DriverManager.getConnection(connectionURL);
%>
