<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PW찾기</title>
</head>
<body>
<form action = "findpwing.jsp" method = "POST">
ID : <input type = "text" name = "id">
Name : <input type = "text" name = "name">
<input type = "submit" value = "Find PW">

</body>
</html>