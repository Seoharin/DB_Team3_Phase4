<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update movie info</title>
</head>
<body>
<form action = "movieupdating.jsp" method = "POST">
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
String title= "";
String is_adult="";
String runtime_minute = "";
String ost ="";
String audience = "";
String hasclip ="";
String director ="";
String writer = "";
String startyear ="";
String endyear = "";
String type = "";
Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);

//title과 type 읽어오기
try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT title, type FROM MOVIE WHERE title_id = "+title_id;
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		  title = rs.getString(1);
		  type = rs.getString(2);
		  
	  }
	  rs.close();
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}
session.setAttribute("title_id",title_id);
session.setAttribute("manager_id",manager_id);
out.println("<h3> << "+title+" 정보 수정>> </h3>");
%>
방영시작일(mm-dd-yyyy) : <input type = "text" name = "startyear"><br>
방영종료일(mm-dd-yyyy), TV Series의 경우만 기입 : <input type = "text" name = "endyear"><br>
상영시간(분) : <input type = "text" name = "runtime"><br>
OST : <input type = "text" name = "ost"><br>
감독 : <input type = "text" name  = "director"><br>
작가 : <input type = "text" name = "writer"><br>
관객 수(단위: 만) : <input type = "text" name = "audience"><br>

클립영상 여부 : <input type = "checkbox" name = "hasclip"><br>
청소년 관람불가 여부 : <input type = "checkbox" name = "is_adult"><br>
				
타입 : <br>
	<input type = "radio" name = "type" value ="m">Movie</input>
	<input type = "radio" name = "type" value = "s">Tv Series</input>
	<input type = "radio" name = "type" value = "o">Knu MovieDB Original</input><br>
				
			
장르 : <br>
				<input type="checkbox" name="genre" value="1">Horror</input>
				<input type="checkbox" name="genre" value="2">Thriller</input>
				<input type="checkbox" name="genre" value="3">Sci-Fi</input>
				<input type="checkbox" name="genre" value="4">Crime</input><br>
				<input type="checkbox" name="genre" value="5">Drama</input>
				<input type="checkbox" name="genre" value="6">Fantasy</input>
				<input type="checkbox" name="genre" value="7">Animation</input>
				<input type="checkbox" name="genre" value="8">Comedy</input><br>
				<input type="checkbox" name="genre" value="9">Romance</input>
				<input type="checkbox" name="genre" value="10">Action</input>	<br>
버전 : 		<br>	
				<input type="checkbox" name="version" value="1">Korean</input>
				<input type="checkbox" name="version" value="2">English(US)</input>
				<input type="checkbox" name="version" value="3">English(UK)</input><br>
				<input type="checkbox" name="version" value="4">Japanese</input>
				<input type="checkbox" name="version" value="5">Chinese</input>
				<input type="checkbox" name="version" value="6">French</input><br>
<input type = "button" value = "배우 추가" onclick = "location.href = 'addactor.jsp'">
<input type = "button" value = "배우 삭제" onclick = "location.href = 'deleteactor.jsp'">
<%
/* if(type.equals("s"))
{
	out.println("<input type = \"button\" value = \"에피소드 추가\" onclick = \"location.href = \'addepisode.jsp\'\">");
} */


%> 
<br>
<br>
<input type = "submit" value = "수정완료">
<input type = "button" value = "영상삭제" onclick = "location.href = 'deletemovie.jsp'">
</form>
</body>
</html>