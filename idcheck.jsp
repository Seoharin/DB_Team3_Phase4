<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h2>아이디 중복체크</h2>
<form action = "idchecking.jsp" method = "POST">
	<input type = "text" name = "id" >
	<input type = "submit" value ="중복확인" onclick = "location.href = 'idchecking.jsp'">

</form>

</body>
</html>