<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU MOVIE_TEAM3</title>
</head>
<body>
	<%
	
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "university";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
	String inputid = request.getParameter("id");
	String inputpw = request.getParameter("pw");
	String sql= "";
	
	Connection conn = null;
	Statement stmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pass);
	
	
	 try {
		  conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		 sql = "SELECT * FROM ACCOUNT WHERE Account_id = '"+inputid+"'";
		 	rs = stmt.executeQuery(sql);
		 //System.out.println(sql);
		 
		 if(rs.next())
			{
			 conn.setAutoCommit(false);
			  stmt = conn.createStatement();
			 sql = "SELECT password FROM ACCOUNT WHERE Account_id ='"
					 +inputid+"'";
			 ResultSet rs2 = stmt.executeQuery(sql);
			 String pw="";
			 while(rs2.next()) {
				 pw = rs2.getString(1);
			 }
			 
			 if(pw.equals(inputpw)) {		//비밀번호 맞으면
				 conn.setAutoCommit(false);
				  stmt = conn.createStatement();
				 sql = "SELECT is_customer FROM ACCOUNT WHERE Account_id = '"
						 +inputid+"'";
				ResultSet rs3 = stmt.executeQuery(sql);
				 String iscustomer="";
				 while(rs3.next())
				 {
					 iscustomer = rs3.getString(1);
					 iscustomer = iscustomer.substring(0, 5);
				 }
					if(iscustomer.equals("false")) { //when administer account
						session.setAttribute("id",inputid);
						response.sendRedirect("ManagerAccount.jsp");
						%>
						<script>
						alter('관리자계정으로 로그인 합니다.')
						location.herf = "ManagerAccount.jsp"
						</script>
						 <%
						
					}
					else { //when customer account
						session.setAttribute("id",inputid);
						response.sendRedirect("MovieList.jsp");
						%>
						<script>
						alter('로그인 성공.')
						location.herf = "MovieList.jsp"
						</script>
						 <%
					}
				}
			 else { //비밀번호 틀리면 
				 out.println("아이디 또는 비밀번호가 틀립니다.<br>");
			 }
			}
			//DB에 해당 ACCOUNT 가 없으면 
			else
			{
				out.println("아이디 또는 비밀번호가 틀립니다.<br>");
			}
		 
	  }catch(SQLException ex2) {					  
		  System.exit(1);
	  }
	%>
</body>
</html>