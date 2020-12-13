<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language = "java" import ="java.text.*, java.sql.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
<%

String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String idcheck = "false";
Connection conn = null; // Connection object
Statement stmt = null;   // Statement object
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection(url,user,pass);
String sql ="";
String id = (String)session.getAttribute("id");
String name = request.getParameter("name");
String pw = request.getParameter("pw");
String pw2 = request.getParameter("pw2");
String birth = request.getParameter("birth");
String address = request.getParameter("address");
String sex = request.getParameter("sex");
String job = request.getParameter("job");
String phone = request.getParameter("phone");
String key = (String)session.getAttribute("key");
String error= "";
String haserror = "true";

if(pw.equals(""))
{
	error +="please check your password<br>";
	
}
if(pw2.equals(""))
{
	error += "please check your password2<br>";
	
}
if(name.equals(""))
{
	error += "please check your name<br>";
	
}
if(birth.equals(""))
{
	error += "please check your birthday<br>";
	
}
if(address.equals(""))
{
	error += "please check your address<br>";
	
}
if(job.equals(""))
{
	error += "please check your job<br>";
	
}
if(phone.equals(""))
{
	error += "please check your phone number<br>";
	
}


if(!pw.equals(pw2))
{
	error += "please check your password<br>";
	
} 
else if(key.equals("true"))
{
	if(sex.equals("m"))
	{
		sex = "true";
	}
	else{
		sex = "false";
	}
	try {
		 conn.setAutoCommit(false);
		  stmt = conn.createStatement();
		sql = "INSERT INTO ACCOUNT VALUES('"+id+"','"+name+"','"+sex
				+"',TO_DATE('"+birth+"','mm-dd-yyyy'),'"+address+"','"+job+"','"+phone
				+"','"+pw+"','true')";
		
		System.out.println(sql);
		int res = stmt.executeUpdate(sql);
		haserror = "false";
		conn.commit();
	}catch(SQLException ex2) {
		System.err.println("sql error = "+ex2.getMessage());
		System.exit(1);
	}
}
else{
	error += "please check id duplication<br>";
	haserror = "true";
}


if(haserror.equals("true"))
{
	session.setAttribute("error", error);
	response.sendRedirect("failjoin.jsp");
}
else
{
	response.sendRedirect("welecome.jsp");
}

%>
</body>
</html>