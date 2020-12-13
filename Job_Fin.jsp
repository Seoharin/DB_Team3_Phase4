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
  <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String newJob = request.getParameter("changeJob");
    String cus_id = (String)session.getAttribute("cus_id");
    //String inputId = request.getParameter("id");
    String sql= "";

    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);

    try{
    conn.setAutoCommit(false);
    stmt = conn.createStatement();
    sql = "update account set job = '"+newJob+"' where Account_id = '"+cus_id+"'";
    ResultSet rs = stmt.executeQuery(sql);
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