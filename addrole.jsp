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
String act_id = (String)session.getAttribute("act_id");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String sql="";
ArrayList<Integer> id = new ArrayList<>(); 

Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);

try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT Role_id FROM ROLED";		  
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		 id.add(rs.getInt(1));
	  }
	  rs.close();
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}

int roleid = id.get(id.size()-1);
String age = request.getParameter("age");
String nationality = request.getParameter("nationality");
String rname = request.getParameter("name");
String isleading = request.getParameter("isleading");
if(isleading!=null)
{
	isleading = "true";
}
else{
	isleading = "false";
}

try {
	sql = "INSERT INTO ROLED VALUES("+title_id+","+act_id+","+roleid+1+","+age+",'"+nationality+"','"
			+rname+"','"+isleading+"')";
	System.out.println(sql);
	int res = stmt.executeUpdate(sql);
	conn.commit();
}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}
out.println("<h3>complete actor add </h3>");
session.setAttribute("manager_id", manager_id);
%>

<input type = "submit" value = "Go mypage">
</form>
</body>
</html>