<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평가항목 보여주기</title>
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
ArrayList<String> customer_id = new ArrayList<>();
ArrayList<Integer> rate = new ArrayList<>();
String title= "	";
Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);


try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT Rate_id, Score FROM Rating WHERE Mt_id = "+title_id;
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		  customer_id.add(rs.getString(1));
		  rate.add(rs.getInt(2));
		  
	  }
	  rs.close();
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}
//해당 movie의 title 가져옴
try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT title FROM MOVIE WHERE title_id = "+title_id;
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		  title = rs.getString(1);
		  
	  }
	  rs.close();
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}

out.println(":: "+title+"의 평가내역 ::");
for(int i=0;i<customer_id.size();i++)
{
	out.println("<br> ID : "+customer_id.get(i)+", Score : "+rate.get(i));
}

session.setAttribute("manager_id", manager_id);
%>
<br>
<input type = "submit" value = "Go mypage">
</form>

</body>
</html>