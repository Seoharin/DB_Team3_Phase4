<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String sql= "";
    String inputId = request.getParameter("id");
    int cntMember = 0;
    int Regular_payment_day = Integer.parseInt(request.getParameter("Regular_payment_day"));
    String Connect_account = request.getParameter("Connect_account");
    int Membership_token = Integer.parseInt(request.getParameter("Membership_token"));    
     

    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);

    try{
        conn.setAutoCommit(false);
        stmt = conn.createStatement();
        sql = "select count(*) from membership";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next())
        {
            cntMember = rs.getInt(1);
        }
            
    conn.setAutoCommit(false);
    stmt = conn.createStatement();
    sql = "delete from acccount values where Account_id = "+inputId+" ";
    ResultSet rs2 = stmt.executeQuery(sql);
    
    
    conn.commit();
    }catch(SQLException ex) {System.out.println(ex.getMessage());}
       finally {
           try {
        	   conn.setAutoCommit(false);
	    	   stmt = conn.createStatement();
               stmt.close();
               conn.close();
             }catch(SQLException ex) {
           }
       }
    
   %>
</body>
</html>