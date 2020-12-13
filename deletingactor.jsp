<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "ManagerAccount.jsp" method = "POST">
<%

String title_id = (String)session.getAttribute("title_id");
String manager_id = (String)session.getAttribute("manager_id");
String act_id = request.getParameter("act_id");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String sql="";

Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);

try {
		conn.setAutoCommit(false);
		  stmt = conn.createStatement();
	sql = "DELETE FROM ROLED WHERE A_id = "+act_id;
	int res = stmt.executeUpdate(sql);
	conn.commit();
}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}
out.println("<h3>complete actor deletion </h3>");
session.setAttribute("manager_id", manager_id);
%>
<br>
<input type = "submit" value = "Go mypage">
</form>

</body>
</html>