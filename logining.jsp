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
			 
			 if(pw.equals(inputpw)) {		//��й�ȣ ������
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
						alter('�����ڰ������� �α��� �մϴ�.')
						location.herf = "ManagerAccount.jsp"
						</script>
						 <%
						
					}
					else { //when customer account
						session.setAttribute("id",inputid);
						response.sendRedirect("MovieList.jsp");
						%>
						<script>
						alter('�α��� ����.')
						location.herf = "MovieList.jsp"
						</script>
						 <%
					}
				}
			 else { //��й�ȣ Ʋ���� 
				 out.println("���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.<br>");
			 }
			}
			//DB�� �ش� ACCOUNT �� ������ 
			else
			{
				out.println("���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.<br>");
			}
		 
	  }catch(SQLException ex2) {					  
		  System.exit(1);
	  }
	%>
</body>
</html>