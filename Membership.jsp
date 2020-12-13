<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="EUC-KR" />
    <title>KNU MOVIE_TEAM3</title>
</head>

<body>
    <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String cusmy_id = (String)session.getAttribute("cus_id");
    String result_name="";
    String Regular_payment_day="";
    String Connect_account="";
    String Membership_token="";
    
    String sql="";

    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);

    try{
    conn.setAutoCommit(false);
    stmt = conn.createStatement();

    sql = "select name from account where Account_id = '"+cusmy_id+"'";
    ResultSet rs = stmt.executeQuery(sql);
    while(rs.next())
    {
    result_name = rs.getString(1);
    }

    sql = "select Regular_payment_day, Connect_account, Membership_token from membership where Ac_id = '"+cusmy_id+"'";
    ResultSet rs2 = stmt.executeQuery(sql);
    while(rs2.next())
    {
    Regular_payment_day = rs2.getString(1);
    Connect_account = rs2.getString(2);
    Membership_token = rs2.getString(3);
    } %>

    <h1><% out.println(result_name +"의 멤버십 정보");%></h1>
    <div><%
        out.println("<br>결제일 : "+Regular_payment_day+"</p>");
        out.println("<br>연결 계좌 : "+Connect_account+"");
        out.println("<br>멤버십 종류 : "+Membership_token+"");%>
    </div>

    
    <br />
    <input type="button" name="finish" value="멤버십 끊기" style="float:left" onclick="location.href= 'MemFin.jsp'" />
    <input type="button" name="close" value="닫기" style="float:right" onclick="window.close()" />
    <%
    session.setAttribute("memfin_id", cusmy_id);
    
    }catch(SQLException ex){System.out.println(ex.getMessage());}
	    
    
	    finally{
	    	try{
	    		conn.setAutoCommit(false);
	    		stmt = conn.createStatement();
	    		stmt.close();
	    		conn.close();
	    	}catch(SQLException ex){
	    		
	    	}
	    }
    %>


</body>
</html>