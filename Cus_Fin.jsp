<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR" />
    <title>KNU MOVIE_TEAM3</title>
</head>

<body>
<form action = "Mypage_real.jsp" method = "POST">
  <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String sql= "";
    String cus_id = (String)session.getAttribute("cus_id");
    int cntMember = 0;
    String Regular_payment_day = request.getParameter("Regular_payment_day");
    String Connect_account = request.getParameter("connectAs");
    String Membership_token = request.getParameter("memType");    
    ArrayList <String> id = new ArrayList<>();

    
    
    
    
    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);
    
    try {
  	  conn.setAutoCommit(false);
  	  stmt = conn.createStatement();
  	  sql = "SELECT Membership_id FROM membership";
  	  System.out.println(sql);
  	  ResultSet rs = stmt.executeQuery(sql);
  	  while(rs.next())
  	  {
  		  id.add(rs.getString(1));
  		  
  	  }
  	  rs.close();
    }catch(SQLException ex)
    {
  	  System.err.println("sql error = "+ex.getMessage());
  	  System.exit(1);
    }
    
	String size = id.get(id.size()-1)+1;
   
	
	try {
		  conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		  sql = "insert into membership values ('"+cus_id+"', "+(size)+", "+Regular_payment_day+", '"+Connect_account+"', "+Membership_token+")";
		  System.out.println(sql);
		 int res = stmt.executeUpdate(sql);
		  conn.commit();
	
	}catch(SQLException ex)
	{
		  System.err.println("sql error = "+ex.getMessage());
		  System.exit(1);
	}

    out.println("<h2>successfully connet membership!!</h2>");
    session.setAttribute("cus_id",cus_id);
   %>
   <input type = "submit" value = "Go mypage">
   </form>
</body>

</html>