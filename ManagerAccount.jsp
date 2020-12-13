<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" />
<title>KNU MOVIE_TEAM3</title>
</head>
<form action = "middle.jsp" method = "POST">
<body
	style="margin-left: 200px; margin-right: 200px; text-align: center">
	<%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	String sql="";
	
	String id = (String)session.getAttribute("manager_id"); // 사람id 받아옴.
	String name="";
	ArrayList<Integer> titleidlist = new ArrayList<Integer>();
	ArrayList<String>titlelist = new ArrayList<String>();
	ArrayList<String> score = new ArrayList<String>();
	String avgscore="";
	
    Connection conn = null;
    Statement stmt=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);
    try {
        conn.setAutoCommit(false);
        stmt = conn.createStatement();
        sql = "SELECT name FROM ACCOUNT WHERE Account_id = '"+id+"'";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next())
        {
            name = rs.getString("name");
        }
        rs.close();
    } catch(SQLException ex)
    {
    	//System.err.println("sql error = "+ex.getMessage());
   		 System.exit(1);
    }
    %>

	<div style="text-align: center;">
		<h2>
			관리자:
			<%=name%></h2>
	</div>
		<div>
			<h4>내가 올린 영상물</h4>
			<div style="border: solid; border-color: black;">
				<%
	            try {
	                conn.setAutoCommit(false);
	                stmt = conn.createStatement();
	                sql = "SELECT title_id, title FROM ACCOUNT, MOVIE WHERE admin_id = Account_id AND Account_id='" + id + "'";
	                ResultSet rs = stmt.executeQuery(sql);
	                while(rs.next())
	                {
	               		titleidlist.add(rs.getInt(1));
	               		titlelist.add(rs.getString(2));
	                }
	                }catch(SQLException ex)
		            {
		            	System.err.println("sql error = "+ex.getMessage());
		            	System.exit(1);
		            }
	                
	              //관리자가 올린 영상물들의 title_id 를 titlelist에 담음
	
	
	              //titlelist 에 있는 애들의 title_id, title, 평점을 보여줌
	               // System.out.println("titlelist size:"+titlelist.size());
	              
	              
	              
	              for(int i =0; i<titleidlist.size();i++)
	              {
	            	  try {
	  	                conn.setAutoCommit(false);
	  	                stmt = conn.createStatement();
	  	              sql = "select  Mt_id, AVG(Score) from rating where Mt_id = "+titleidlist.get(i)+" group by Mt_id";
	  	                ResultSet rs = stmt.executeQuery(sql);
	  	                if(rs.next())
	  	                {
	  	                	 String rate = rs.getString(2);
	  	          
	  						  if(rate.length()>4)
	  						  {
	  							  
	  							rate = rate.substring(0,3);
	  							 score.add(rate);
	  							 
	  						  }
	  						  else
	  						  {
	  							 score.add(rate);
	  						  }
	 
	  	                }
	  	                else{
	  	                	score.add("0");
	  	                }
	  	                
	  	             
	  	                }catch(SQLException ex)
	  		            {
	  		            	System.err.println("sql error = "+ex.getMessage());
	  		            	System.exit(1);
	  		            }
	              }
	              
	              for(int i =0; i<titleidlist.size();i++)
	              {
	            	  out.println("<br> <input type=\"radio\" name = \"id\" value = \"" + titleidlist.get(i) + "\">"+ titlelist.get(i)  +" : "+score.get(i)+ "</input>");
	          
	              }
	              
	              session.setAttribute("manager_id",id);
	              
	
	              
	
	%>

			</div>
		</div>
		<div>
				<input type="submit" value="관리"> 
				<input type="button" value="새로운영상등록" onclick="location.href='addmovie.jsp'"> 
				<input type="button" value="로그아웃" onclick="location.href='Login.jsp'">
		</div>
	</form>

</body>
</html>