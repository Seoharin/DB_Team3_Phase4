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
<form action = "PW_Fin.jsp" method = "POST">
    <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String inputid = request.getParameter("id");
    String newPW="";

    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);
    %>
     PW 변경 : <input type="text" name="changePW">
  
    <br />
    <br />
    <input type="submit" name="finish" style="float:left" value="변경 완료" />
    <input type="button" name="close" style="float:right" value="닫기" onclick="window.close()" />
</form>
</body>
</html>