<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배우추가</title>
</head>
<body>
<form action = "addingactor.jsp" method = "POST">
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
ArrayList <Integer> id = new ArrayList<>();
ArrayList<String> name = new ArrayList<>();
ArrayList<String> sex = new ArrayList<>();
ArrayList<String> birth = new ArrayList<>();

int cnt = 0;
String title="";


try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql =  "SELECT Act_id FROM ACTOR minus SELECT A_id FROM ROLED WHERE Movie_id = "+title_id;		  
	  rs = stmt.executeQuery(sql);
	  int i = 0;
	  while(rs.next())
	  {
		  
		  id.add(rs.getInt(1));
		  try {
			  conn.setAutoCommit(false);
			  stmt = conn.createStatement();
			  sql = "SELECT name, sex, birth FROM ACTOR where act_id = "+id.get(i);	
			  i++;
			  ResultSet rs2 = stmt.executeQuery(sql);
			 
			  while(rs2.next())
			  {
				 name.add(rs2.getString(1));
				 if(rs2.getString(2).equals("F"))
				 {
					 sex.add("woman");
				 }
				 else
				 {
					 sex.add("man");
				 }
				 
				 birth.add(rs2.getString(3).substring(0,10));
			  }
			  rs2.close();
		  }catch(SQLException ex)
		  {
			  System.err.println("sql error = "+ex.getMessage());
			  System.exit(1);
		  }
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


out.println("<h3> "+title+"의 출연배우 추가하기</h3>");


for(int i=0; i<id.size();i++)
{
	out.println("<br> <input type=\"radio\" name = \"act_id\" value = \""+ id.get(i)+"\">"+ "이름 : "+name.get(i)+", 성별: "+sex.get(i)+", 생년월일: "+birth.get(i) +"</input>");
}
session.setAttribute("title_id",title_id);
session.setAttribute("manager_id",manager_id);

%>
<br>
<input type = "submit" value = "배우 추가하기"> 
</form>
</body>
</html>