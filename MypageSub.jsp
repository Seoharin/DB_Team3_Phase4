<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="">

<%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

   int msg = (Integer)session.getAttribute("memberCnt");
   String cusmy_id = (String)session.getAttribute("cus_id");
   
   session.setAttribute("cus_id", cusmy_id);

    if(msg == 0)
    {
    	  response.sendRedirect("No_membership.jsp");
    }
    else 
    {
    	  response.sendRedirect("Membership.jsp");
    }
   
	  
	
%>

</form>

</body>
</html>





