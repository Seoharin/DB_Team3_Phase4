<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU MOVIE_TEAM3</title>
</head>
<body>
	<form  action="logining.jsp" method = "POST">
	<h1 style="text-align:center">KNU MOVIE DB - TEAM3 </h1>
	ID : <input type = "text" name = "id">
	<br>
	PW :<input type = "password" name = "pw">
	<input type = "submit" value = "로그인" >
	<br>
	<br>
	<input type ="button"  value = "회원가입" onclick = "location.href = 'Join.jsp'">
	<input type = "button" value = "ID/PW찾기" onclick = "location.herf = 'find.jsp'">
	</form>
</body>
</html>