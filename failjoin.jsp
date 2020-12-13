<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>retry</title>
</head>
<body>
<form action = "Join.jsp" method = "POST">
<%
	String error = (String)session.getAttribute("error");
	out.println("<h4> "+error+" </h4>");
%>

<input type = "submit" value = "Try again">

</form>
</body>
</html>