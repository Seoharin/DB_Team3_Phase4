<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU MOVIE_TEAM3</title>
</head>
<body>
	<form  action="showdetail.jsp" method = "POST">
 	<%
	String id = (String)session.getAttribute("id");
 	out.println(id);
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
				+ " MT_id AND Rate_id = '"+id+"'";
		
		 rs = stmt.executeQuery(sql);
		 int title_id;
		 String title_string;
		 while(rs.next()) {
			 title_id =rs.getInt(1);
			 non_rate_movie.add(title_id);
			 title_string = rs.getString(2);
			 title.add(title_string);
			 //������ ���� movie���� title_id�� arraylist non_rate_movie�� ����
		 }
		 
		 rs.close();
	}catch(SQLException ex2)
	{
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
	}
	 //����� �̸� �޾ƿ���
	try {
		 conn.setAutoCommit(false);
		 stmt = conn.createStatement();
		
		
		 String sql = "SELECT name FROM ACCOUNT WHERE Account_id = '"+id+"'";
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
	 out.println(username +"�� ȯ���մϴ�!");
	%>
	<input type = "submit" value = "����������" onclick = "location.href = 'mypage.jsp'">
	<input type = "submit" value = "�α׾ƿ�" onclick = >
	
	<br>
	<input type = "submit" value = "�������� �˻��ϱ�" onclick = "location.href = 'Titlesearch.jsp'" >
	<input type = "submit" value = "�������� �˻��ϱ�" onclick = "location.href = 'Optionsearch.jsp'">
	<input type = "submit" value = "��õ��� ����" onclick = >
	
	<% 
		for(int i=0; i<non_rate_movie.size();i++)
		{
			out.println("<br> <input type=\"radio\" name = \"title_id\" value = \""+ non_rate_movie.get(i)+"\">"+title.get(i)+"</input>");
		}
	%>
	<br>
	<input type = "submit" value = "���λ��� ����" onclick = "location.href = 'showdetail.jsp'">

	</form>
</body>
</html>