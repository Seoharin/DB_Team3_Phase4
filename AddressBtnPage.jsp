<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR" />
    <title>KNU MOVIE_TEAM3</title>
</head>

<body>
<form action = "Address_fin.jsp" method="post">
    <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    //String inputid = request.getParameter("cus_id");
    
    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);
    %>
      주소변경 : <input type="text" name="changeAddress">
  
    
    <br />
    <br />
    <input type="submit" name="finish" value="변경완료" />
    <input type="button" name="close" value="닫기" onclick="window.close()" />

</form>
</body>
</html>