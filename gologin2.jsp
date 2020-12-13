<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  action="Login.jsp" method = "POST">

<%

String pw = "";

pw = (String)session.getAttribute("pw");


	if(pw.equals(""))
	{
		out.println("<h4> That pw isn't exist"+" </h4>");
	}
	else
	{
		out.println("<h4> Pw is "+pw+" </h4>");
	}


%>



<input type = "submit" value = "Go login">

</form>

</body>
</html>