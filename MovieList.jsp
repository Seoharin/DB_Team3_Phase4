<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KNU MOVIE_TEAM3</title>
</head>
<body>
	<form  action="showdetail.jsp" method = "POST">
 	<%
	String cus_id = (String)session.getAttribute("id");
 	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "university";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	String username = "";
	Connection conn = null; // Connection object
	Statement stmt = null;   // Statement object
	ArrayList non_rate_movie = new ArrayList<Integer>();
	ArrayList title = new ArrayList<String>();
	ResultSet rs;
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pass);
	
	try {
		 conn.setAutoCommit(false);
		 stmt = conn.createStatement();
		
		
		 String sql = "SELECT title_id, title FROM MOVIE"
				+ " minus"
				+ " SELECT title_id, title FROM MOVIE,RATING WHERE title_id ="
				+ " MT_id AND Rate_id = '"+cus_id+"'";
		
		 rs = stmt.executeQuery(sql);
		 int title_id;
		 String title_string;
		 while(rs.next()) {
			 title_id =rs.getInt(1);
			 non_rate_movie.add(title_id);
			 title_string = rs.getString(2);
			 title.add(title_string);
			 //평가하지 않은 movie들의 title_id를 arraylist non_rate_movie에 저장
		 }
		 
		 rs.close();
	}catch(SQLException ex2)
	{
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
	}
	 //사용자 이름 받아오기
	try {
		 conn.setAutoCommit(false);
		 stmt = conn.createStatement();
		
		
		 String sql = "SELECT name FROM ACCOUNT WHERE Account_id = '"+cus_id+"'";
		 rs = stmt.executeQuery(sql);
		 
		 while(rs.next()) {
			 username = rs.getString(1);
		 }
		 rs.close();
	}catch(SQLException ex2)
	{
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
	}
	 out.println(username +"님 환영합니다!");
	%>
	<input type = "button" value = "마이페이지" onclick = "location.href = 'mypage.jsp'">
	<input type = "button" value = "로그아웃" onclick = "location.href = 'Login.jsp'">
	
	<br>
	<input type = "button" value = "제목으로 검색하기" onclick = "location.href = 'SubjectSearch.jsp'" >
	<input type = "button" value = "조건으로 검색하기" onclick = "location.href = 'Optionsearch.jsp'">
	<input type = "button" value = "추천목록 보기" onclick ="location.href = 'recommend.jsp'" >
	
	<% 
	
		for(int i=0; i<non_rate_movie.size();i++)
		{
			out.println("<br> <input type=\"radio\" name = \"title_id\" value = \""+ non_rate_movie.get(i)+"\">"+title.get(i)+"</input>");
		}
		
		session.setAttribute("cus_id",cus_id);
	%>
	<br>
	<input type = "submit" value = "세부사항 보기" onclick = "location.href = 'showdetail.jsp'">

	</form>
</body>
</html>