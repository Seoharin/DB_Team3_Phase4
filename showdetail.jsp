<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
	 
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<form  action="rating.jsp" method = "POST">
	<%
	
	String id= request.getParameter("title_id");
	String cus_id = (String)session.getAttribute("cus_id");
	
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
	String year = "";
	String type = "";
	String score = "";
	ArrayList<Integer> version = new ArrayList<Integer>(); 
	ArrayList<Integer> genre = new ArrayList<Integer>(); 
	
	try {
		  conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		  sql = "SELECT title, is_adult, runtime_minute, ost, audience, hasclip, director, writer, startyear, endyear, type "
				  +"FROM MOVIE WHERE title_id = "+id;
		  
		  rs = stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  title = rs.getString(1);
			  is_adult = rs.getString(2);
			  runtime_minute = rs.getString(3);
			  ost = rs.getString(4);
			  audience = rs.getString(5);
			  hasclip = rs.getString(6);
			  director = rs.getString(7);
			  writer= rs.getString(8);
			  startyear = rs.getString(9);
			  endyear = rs.getString(10);
			  type = rs.getString(11);
			  
			  //System.out.println(title);
		  }
		  rs.close();
	  }catch(SQLException ex)
	  {
		  System.err.println("sql error = "+ex.getMessage());
		  System.exit(1);
	  }
	switch(is_adult) {
	  case"false" :
		  is_adult = "청소년 관람 가능";
		  break;
	  case"true":
		  is_adult = "청소년 관람 불가";
		  break;
	  }
	 switch(hasclip) {
	  case"false" :
		  hasclip = "클립영상 없음";
		  break;
	  case"true":
		  hasclip = "클립영상 있음";
		  break;
	  }
	
	 out.println("<br> Title : " +title+ "(" + is_adult + ")"+ " ");
	 out.println("<br> Runtime : "+runtime_minute+" (분)");
	 out.println("<br> Director : "+director+" ");
	 out.println("<br> Writer : "+writer+" ");
	 out.println("<br> Ost : "+ost+" ");
	 out.println("<br> Audience : "+audience+" (만명)");
	 out.println("<br> "+hasclip+" ");
	 
	 
	
	  //movie 의 평점 읽어오기 
	  try {
		  conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		  sql = "SELECT Mt_id, AVG(Score) FROM RATING"
				  +" WHERE Mt_id = "+id
				  +" GROUP BY Mt_id";
		  
		  rs = stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  score = rs.getString(2);
			  if(score.length()>4)
			  {
				  score = score.substring(0, 3);
			  }
			  
		  }
		  rs.close();
	  }catch(SQLException ex)
	  {
		  System.err.println("sql error = "+ex.getMessage());
		  System.exit(1);
	  }
	  out.println("<br> Score : "+score+" ");
	  
	  //movie의 장르 읽어오기 
	 try {
		  conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		  sql = "SELECT Gnum FROM HAS_GENRE WHERE M_id = "+id;
		  
		  rs = stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  genre.add(rs.getInt(1));
		  }
		  rs.close();
	  }catch(SQLException ex)
	  {
		  System.err.println("sql error = "+ex.getMessage());
		  System.exit(1);
	  }
	  
	  //movie의 version 읽어오기
	  try {
		  conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		  sql = "SELECT V_id FROM HAS_VERSION WHERE Acs_id ="+id;
		  rs = stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  version.add(rs.getInt(1));
		  }
		  rs.close();
	  }catch(SQLException ex)
	  {
		  System.err.println("sql error = "+ex.getMessage());
		  System.exit(1);
	  }
	  
	  if(endyear==null)
	  {
		  startyear = startyear.substring(0,10);
		  year = startyear;
	  }
	  else
	  {
		 startyear = startyear.substring(0,9);
		 endyear = endyear.substring(0,9);
		  year = startyear+"~"+endyear;
	  }
		 
	
	  out.println("<br> Year : "+year+" ");
	  String genrestr="";
	  for(int i =0;i<genre.size();i++)
	  {
		  switch(genre.get(i)) {
		  case 1 :
			  genrestr = genrestr+(i+1)+"."+"Horror"+" " ;
			  break;
		  case 2 :
			  genrestr = genrestr+(i+1)+"."+"Thriller"+" " ;
			  break;
		  case 3 :
			  genrestr = genrestr+(i+1)+"."+"Sci-Fi"+" " ;
			  break;
		  case 4 :
			  genrestr = genrestr+(i+1)+"."+"Crime"+" " ;
			  break;
		  case 5 :
			  genrestr = genrestr+(i+1)+"."+"Drama"+" " ;
			  break;
		  case 6 :
			  genrestr = genrestr+(i+1)+"."+"Fantasy"+" " ;
			  break;
		  case 7 :
			  genrestr = genrestr+(i+1)+"."+"Animation"+" " ;
			  break;
		  case 8 :
			  genrestr = genrestr+(i+1)+"."+"Comedy"+" " ;
			  break;
		  case 9 :
			  genrestr = genrestr+(i+1)+"."+"Romance"+" " ;
			  break;
		  case 10 :
			  genrestr = genrestr+(i+1)+"."+"Action"+" " ;
			  break;
			  
		  }
	  }
	  out.println("<br> Genre : "+genrestr+" ");
	  String versionstr="";
	  for(int i =0;i<version.size();i++)
	  {
		  switch(version.get(i)) {
		  case 1 :
			  versionstr = versionstr+(i+1)+"."+"KR"+" " ;
			  break;
		  case 2 :
			  versionstr = versionstr+(i+1)+"."+"US"+" " ;
			  break;
		  case 3 :
			  versionstr = versionstr+(i+1)+"."+"UK"+" " ;
			  break;
		  case 4 :
			  versionstr = versionstr+(i+1)+"."+"JP"+" " ;
			  break;
		  case 5 :
			  versionstr = versionstr+(i+1)+"."+"CN"+" " ;
			  break;
		  case 6 :
			  versionstr = versionstr+(i+1)+"."+"FR"+" " ;
			  break;
			  
		  }
	  }
	  out.println("<br> Version : "+versionstr+" ");
	  switch(type) {
	  case "s":
		  out.println("<br> Type : TV Series");
		  //시리즈의 경우, 에피소드가 존재함...
		  %>
		  <input type = "button" value = "에피소드 보기" onclick = "location.href = 'showepisode.jsp'">
		  <%
		  out.println("");
		  
		  break;
	  case "m":
		  out.println("<br> Type : Movie");
		  break;
	  case "o":
		  out.println("<br> Type : KnuMovieDB Original");
		  break;

  }
	  
	
	  out.println("<br> 평가하기");
	  out.println("<select name = \"score\" >");
	  for(int i=1;i<=10;i++)
	  {
		  out.println("<option value = \""+i+"\" selected>"+i+"</option>");
	  }
	  out.println("</select>");
	 
	 	session.setAttribute("title_id",id);
	 	session.setAttribute("cus_id",cus_id);	
	 	
	 	
		
	 	%>
	 	
	 	<input type="submit" value="점수주기" >
	 	<br>
		<input type="button" value="출연배우보기" onclick = "location.href = 'showactor.jsp'">
		
</form>
</body>
</html>