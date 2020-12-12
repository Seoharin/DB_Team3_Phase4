<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출연 배우목록</title>
</head>
<body>
<h2> 출연 배우 목록</h2>
<br>

<br>
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
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);
String sql ="";
String id = (String)session.getAttribute("id");
ArrayList<Integer>actorlist = new ArrayList<>();
ArrayList<String>actor_name = new ArrayList<>();
ArrayList<String>Character_age = new ArrayList<>();
ArrayList<String>Character_nationality = new ArrayList<>();
ArrayList<String>Role_name = new ArrayList<>();
ArrayList<String>is_leading_role = new ArrayList<>();

try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  sql = "SELECT A_id FROM ROLED WHERE Movie_id = "+id;
	  rs = stmt.executeQuery(sql);
	  while(rs.next())
	  {
		 actorlist.add(rs.getInt(1));
	  }
	  rs.close();
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}
//movie에 출연한 actor들의 id를 actorlist에 저장
	
try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  for(int i =0;i<actorlist.size();i++)
	  {
		  sql = "SELECT Character_age, Character_nationality,Role_name,is_leading_role FROM ROLED"
				  +" WHERE Movie_id = "+id+"AND A_ID = "+actorlist.get(i);
		  			
		  rs = stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  Character_age.add(rs.getString(1));
			  Character_nationality.add(rs.getString(2));
			  Role_name.add(rs.getString(3));
			  is_leading_role.add(rs.getString(4));
		  }
		  rs.close();
	  }
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}

//movie에 출연한 actor들의 id를 actorlist에 저장
try {
	  conn.setAutoCommit(false);
	  stmt = conn.createStatement();
	  for(int i =0;i<actorlist.size();i++)
	  {
		  sql = "SELECT Name FROM ACTOR WHERE Act_id ="+actorlist.get(i);
		  			
		  rs = stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  actor_name.add(rs.getString(1));
		  }
		  rs.close();
	  }
}catch(SQLException ex)
{
	  System.err.println("sql error = "+ex.getMessage());
	  System.exit(1);
}
//actor 들의 이름 저장 

 for(int i=0;i<actorlist.size();i++)
		  
	  {
		  String rname = "";
		  rname = Role_name.get(i);
		  if(is_leading_role.get(i).equals("true"))
		  {
			  rname = rname +"(주연)";
		  }
		  else
		  {
			  rname= rname + "(조연)";
		  }
		  out.println("<br> ("+(i+1)+") 이름: "+actor_name.get(i)+", 작중역할: "+rname+", 작중나이: "+Character_age.get(i)+", 작중국적: "+Character_nationality.get(i)+" ");
		  
	  }


%>

</body>
</html>