<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


String manager_id =(String)session.getAttribute("manager_id");
String title_id = (String)session.getAttribute("title_id");
String startyear= request.getParameter("startyear");
String endyear= request.getParameter("endyear");
String runtime=request.getParameter("runtime");
String ost=request.getParameter("ost");
String director=request.getParameter("director");
String writer=request.getParameter("writer");
String audience=request.getParameter("audience");
String hasclip=request.getParameter("hasclip");
String is_adult=request.getParameter("is_adult");
String type=request.getParameter("type");
String [] getgenre = request.getParameterValues("genre");
String [] getversion = request.getParameterValues("version");
ArrayList<Integer> genre = new ArrayList<>();
ArrayList<Integer> version = new ArrayList<>();
ArrayList<Integer> id = new ArrayList<>(); // 현재 디비에 저장된 movie의 id 개수를 구하기 위함
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);

if(is_adult == null)
{
	is_adult = "false";
}
else
{
	is_adult= "true";
}

if(hasclip==null)
{
	hasclip = "false";
}
else{
	hasclip = "true";
}
try {
		conn.setAutoCommit(false);
		  stmt = conn.createStatement();
	if(endyear.equals(""))
	{
		sql = "UPDATE MOVIE SET is_adult = '"+is_adult+"', runtime_minute = "+runtime+", ost = '"+ost+"', audience = "
				+audience+", hasclip = '"+hasclip+"', director = '"+director +"', writer = '"+writer+"', startyear = TO_DATE('"+
				startyear +"','mm-dd-yyyy'), endyear = NULL WHERE title_id = "+title_id;
	}
	else
	{
		sql = "UPDATE MOVIE SET is_adult = '"+is_adult+"', runtime_minute = "+runtime+", ost = '"+ost+"', audience = "
				+audience+", hasclip = '"+hasclip+"', director = '"+director +"', writer = '"+writer+"', startyear = TO_DATE('"+
				startyear +"','mm-dd-yyyy'), endyear = TO_DATE('"+endyear+"','mm-dd-yyyy') WHERE title_id = "+title_id;
	}
	
	//System.out.println(sql);
	int res = stmt.executeUpdate(sql);
	conn.commit();
}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}
	
try {
		conn.setAutoCommit(false);
		  stmt = conn.createStatement();
	sql = "DELETE FROM HAS_VERSION WHERE Acs_id = "+title_id;
	int res = stmt.executeUpdate(sql);
	conn.commit();
}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}
//버전삭제

try {
		conn.setAutoCommit(false);
		  stmt = conn.createStatement();
	sql = "DELETE FROM HAS_GENRE WHERE M_id = "+title_id;
	int res = stmt.executeUpdate(sql);
	conn.commit();
}catch(SQLException ex2) {
	System.err.println("sql error = "+ex2.getMessage());
	System.exit(1);
}
//장르삭제

for(int i =0;i<getgenre.length;i++)
{
	try {
			conn.setAutoCommit(false);
		    stmt = conn.createStatement();
		    sql = "INSERT INTO HAS_GENRE VALUES("+title_id+","+getgenre[i]+")";
		    System.out.println(sql);
		 int res = stmt.executeUpdate(sql);
		conn.commit();
		}catch(SQLException ex2) {
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
	}
}
for(int i =0;i<getversion.length;i++)
{
	try {
			conn.setAutoCommit(false);
		    stmt = conn.createStatement();
		    sql = "INSERT INTO HAS_GENRE VALUES("+title_id+","+getversion[i]+")";
		    System.out.println(sql);
		 int res = stmt.executeUpdate(sql);
		conn.commit();
		}catch(SQLException ex2) {
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
	}
}


out.println("<h3>complete add new movie</h3>");
session.setAttribute("manager_id",manager_id);


%>
<input type = "submit" value = "Go mypage">
</form>
</body>
</html>