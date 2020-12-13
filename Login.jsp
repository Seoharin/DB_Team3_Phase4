<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KNU MOVIE_TEAM3</title>
</head>
<body>
<%
 String idcheck = "false";
 String id = "";
 session.setAttribute("key", idcheck);
 session.setAttribute("id",id);

%>
	<form  action="logining.jsp" method = "POST">
	<h1 style="text-align:center">KNU MOVIE DB - TEAM3 </h1>
	ID : <input type = "text" name = "id">
	<br>
	PW : <input type = "password" name = "pw">
	<input type = "submit" value = "로그인" >
	<br>
	<br>
	<input type ="button"  value = "회원가입" onclick = "location.href = 'Join.jsp'">
	<input type = "button" value = "ID찾기" onclick = "location.href = 'findid.jsp'">
	<input type = "button" value = "PW찾기" onclick = "location.href = 'findpw.jsp'">
	
	</form>
</body>
</html>