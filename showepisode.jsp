<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에피소드 보기</title>
</head>
<body>

<%
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
ArrayList<Integer> Season_number = new ArrayList<>();
ArrayList<Integer> Episode_number = new ArrayList<>();
ArrayList<String> Episode_title = new ArrayList<>();
ArrayList<Integer> id = new ArrayList<>();
String title="";
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);
String sql ="";
String title_id = (String)session.getAttribute("title_id");


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

out.println("<h4> << "+title+"의 에피소드 목록 >> </h4>");
//title_id에 따른 title불러오기 


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
	  out.println("<br> "+"Season"+Season_number.get(i)+"-"+Episode_number.get(i)+" : "+Episode_title.get(i));
}
%>
</body>
</html>