<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adding ep</title>
</head>
<body>
<form action = "ManagerAccount.jsp" method = "POST">

<%
String title_id = (String)session.getAttribute("title_id");
String manager_id = (String)session.getAttribute("manager_id");
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
ArrayList<Integer> id = new ArrayList<>();
String snum = request.getParameter("snum");
String epnum = request.getParameter("epnum");
String eptitle = request.getParameter("eptitle");


 try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT Episode_id FROM EPISODE";
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
 try {
	  
	  int epid = id.get(id.size()-1)+1;
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "INSERT INTO EPISODE VALUES("+epid+","+snum+","
			  +epnum+",'"+eptitle+"',"+title_id+")";
	 int res = stmt.executeUpdate(sql);
		conn.commit();
  }catch(SQLException ex)
  {
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
  }
 

 session.setAttribute("manager_id",manager_id);
 out.println("<h2> Success add Episode! </h2>");
%>

<input type = "submit" value = "Go mypage">
</form>
</body>
</html>