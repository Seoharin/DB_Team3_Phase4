<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  action="gologin.jsp" method = "POST">
<%
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String serverIP = "localhost";
		String strSID = "orcl";
		String portNum = "1521";
		String user = "university";
		String pass = "comp322";
		String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		String id = "";
		Connection conn = null; // Connection object
		Statement stmt = null;   // Statement object
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,user,pass);
		String id_exist= "";
		

		String sql ="";
		try{
		conn.setAutoCommit(false);
		stmt = conn.createStatement();
		sql = "SELECT Account_id FROM ACCOUNT WHERE name = '"+name+"' AND phone_number ='"+phone+"'";
		rs = stmt.executeQuery(sql);
		System.out.println(sql);
		if(rs.next()) {	//일치하는 정보가 있을 때 
			id = rs.getString(1);
			
		}
	

		}catch(SQLException ex2) {
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
		}
		session.setAttribute("id",id);
		
		response.sendRedirect("gologin.jsp");
		%>
</form>
</body>
</html>