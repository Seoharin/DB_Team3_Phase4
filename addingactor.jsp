<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*"%>
<%@ page language = "java" import = "java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "addrole.jsp" method = "POST">
<%
String title_id = (String)session.getAttribute("title_id");
String manager_id = (String)session.getAttribute("manager_id");
String act_id = request.getParameter("act_id");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String sql="";


Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);
%>
영상 내 나이 : <input type = "text" name = "age"><br>
영상 내 국적 : <input type = "text" name = "nationality"><br>
영상 내 역할명 : <input type = "text" name = "name"><br>
주연여부 : <input type = "checkbox" name = "isleading">주연일 경우 체크</input><br>
<%
session.setAttribute("title_id",title_id);
session.setAttribute("manager_id", manager_id);
session.setAttribute("act_id", act_id);

%>
<input type = "submit" value = "추가하기">
</form>

</body>
</html>