<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>KNU MOVIE_TEAM3</title>
</head>
<h3>회원가입</h3>
<body>
	<form action="joining.jsp" method = "POST">
	<%
	String idcheck = "false";
	idcheck = (String)session.getAttribute("key");
	session.setAttribute("key",idcheck);
	String getid = (String)session.getAttribute("id");
	if(getid.equals(""))
	{
	out.println("ID : <input type = \"text\" name = \"id\">");		
	}
	else{
		out.println("ID : "+getid);
		session.setAttribute("id",getid);
	}
	%>
	
	&nbsp;<input type = "button" value = "ID중복확인" onclick = "location.href = 'idcheck.jsp'">
	
	<br>
	이름 : <input type = "text" name = "name">
	<br>
	PW :<input type = "password" name = "pw">
	<br>
	PW 확인: <input type = "password" name = "pw2">
	<br>
	생년월일(mm-dd-yyyy) : <input type = "text" name = "birth">
	<br>
	주소 : <input type = "text" name = "address">
	<br>
	성별 :
	<input type = "radio" name = "sex" value ="m">남
	<input type = "radio" name = "sex" value = "f">여
	<br>
	직업 : <input type = "text" name = "job">
	<br>
	전화번호 : <input type = "text" name = "phone">
	<br><br>
	<input type = "submit" value = "회원가입">
	</form>
	
</body>
</html>