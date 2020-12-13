<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<form  action="gologin.jsp" method = "POST">
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String pw="";
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";

String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);
String is_exist="";


String sql ="";
try {
	conn.setAutoCommit(false);
	stmt = conn.createStatement();
	sql = "SELECT password FROM ACCOUNT WHERE name = '"+name+"' AND Account_id ='"+id+"'";
	rs = stmt.executeQuery(sql);
	if(rs.next()) {	//일치하는 정보가 있을 때 
		pw = rs.getString(1);
		
	}
	

}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}
session.setAttribute("pw",pw);
response.sendRedirect("gologin2.jsp");

%>
</form>
</body>
</html>