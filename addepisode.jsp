<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에피소드 등록</title>
</head>
<body>
<form action = "addingepisode.jsp" method = "POST">
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
String title="";
ArrayList<Integer> Season_number = new ArrayList<>();
ArrayList<Integer> Episode_number = new ArrayList<>();
ArrayList<String> Episode_title = new ArrayList<>();
ArrayList<Integer> id = new ArrayList<>();

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
out.println("<h2> :: "+title+" 의 에피소드 :: " );

try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT Season_number, Episode_number, Episode_title FROM EPISODE WHERE Parent_id = "+title_id;
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		 Season_number.add(rs.getInt(1));
		 Episode_number.add(rs.getInt(2));
		 Episode_title.add(rs.getString(3));
	  }
	  rs.close();
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}
//title_id 에 따른 episode 불러오기 
	
int cnt = Season_number.size();
for(int i=0;i<cnt;i++)
{
	out.println("<br>Season"+Season_number.get(i)+"-"+Episode_number.get(i)+" : "+Episode_title.get(i));
	
}

session.setAttribute("title_id", title_id);
session.setAttribute("manager_id",manager_id);

%>
<br><br>
Season number : <input type ="text" name = "snum"><br>
Episode number : <input type = "text" name = "epnum"><br>
Episode Title : <input type = "text" name = "eptitle"><br>
<input type = "submit" value = "에피소드 추가">
</form>

</body>
</html>