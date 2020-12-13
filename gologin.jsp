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
String id = "";
id = (String)session.getAttribute("id");


	if(id.equals(""))
	{
		out.println("<h4> That id isn't exist"+" </h4>");
	}
	else
	{
		out.println("<h4> Id is "+id+" </h4>");
	}


%>



<input type = "submit" value = "Go login">

</form>

</body>
</html>