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
<form  action="MovieList.jsp" method = "POST">
<%
String title_id= (String)session.getAttribute("title_id");
String cus_id = (String)session.getAttribute("cus_id");
String rate = request.getParameter("score");
System.out.println(title_id+cus_id+rate);
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String username = "";
Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);



String sql ="";
ArrayList<Integer> cnt = new ArrayList<>();
try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT Rating_id FROM RATING";
	  System.out.println(sql);
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		  cnt.add(rs.getInt(1));
		  
	  }
	  rs.close();
  }catch(SQLException ex)
  {
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
  }

try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "INSERT INTO RATING VALUES("+(cnt.get(cnt.size()-1)+1)+","+title_id+",'"+cus_id+
			  "',"+rate+")";
	  System.out.println(sql);
	 int res = stmt.executeUpdate(sql);
	  conn.commit();
	
	
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}

session.setAttribute("id",cus_id);
response.sendRedirect("MovieList.jsp");

%>
</form>
</body>
</html>