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
<form action = "PhoneFinish.jsp" method = "POST">
<%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String inputid = (String)session.getAttribute("cus_id");

    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);
    %>

     ��ȭ��ȣ ���� : <input type="text" name="changePhone">
    
    <br />
    
    <input type="submit" name="finish" value="���� �Ϸ�" style="float:left" />
    <input type="button" name="close" value="�ݱ�" style="float:right" onclick="window.close()" />
    
  
</form>

</body>
</html>