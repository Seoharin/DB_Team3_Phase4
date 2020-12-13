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
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String title_id = (String)session.getAttribute("title_id");
String manager_id = (String)session.getAttribute("manager_id");

Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
String sql = "";
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);

try {
		conn.setAutoCommit(false);
		  stmt = conn.createStatement();
	sql = "DELETE FROM MOVIE WHERE title_id = "+title_id;
	int res = stmt.executeUpdate(sql);
	conn.commit();
}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}

out.println("successful deletion!");
//session.setAttribute("title_id",title_id);
session.setAttribute("manager_id",manager_id);
%>
<input type = "submit" value = "Go mypage">
</body>
</html>