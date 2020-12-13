<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id중복확인</title>
</head>
<body>
<form  action="Join.jsp" method = "POST">
<%
String id= request.getParameter("id");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String idcheck = "false";
Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);
String sql ="";


try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	 sql = "SELECT * FROM ACCOUNT WHERE Account_id = '"+id+"'";
	 rs = stmt.executeQuery(sql);
	 
	 if(id.compareTo("")==0) { //idfield에 아무입력 없을 때
			out.println("please input id");
	 	id="";
		}
	 else 
	 {
	 if(rs.next()) //이미 있는 id일 때
		{
		 out.println("That id is already exists.");
			id = "";
		 }
		 
		//사용가능한 id일 때
	else {
			out.print("That id is available.");
			idcheck = "true";
		}
	 }
	 }catch(SQLException ex2) {					  
	  System.exit(1);
	 }
	session.setAttribute("key",idcheck);
	session.setAttribute("id",id);
%>
<input type = "submit" value = "Go Join">

</form>
</body>
</html>