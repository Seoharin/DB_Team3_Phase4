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
<form action = "Cus_Fin.jsp" method = "POST">
    <%
    
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String cus_id = (String)session.getAttribute("cus_id");
    String name ="";
    String sql="";
    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);

    try {
		conn.setAutoCommit(false);
		stmt = conn.createStatement();
		
		sql = "select name from account where account_id = '"+cus_id+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			name = rs.getString(1);
		}
	}catch(SQLException ex2)
	  {
		  System.err.println("sql0 error");
		  System.exit(1);
	  }

    out.println("<h1> " +name+ " ���� ����� ���</h1>");
    session.setAttribute("cus_id",cus_id);
    %>
    
        ������ :
        <select name="Regular_payment_day">
            <option value="1">1��</option>
            <option value="2">2��</option>
            <option value="3">3��</option>
            <option value="4">4��</option>
            <option value="5">5��</option>
            <option value="6">6��</option>
            <option value="7">7��</option>
            <option value="8">8��</option>
            <option value="9">9��</option>
            <option value="10">10��</option>
            <option value="11">11��</option>
            <option value="12">12��</option>
            <option value="13">13��</option>
            <option value="14">14��</option>
            <option value="15">15��</option>
            <option value="16">16��</option>
            <option value="17">17��</option>
            <option value="18">18��</option>
            <option value="19">19��</option>
            <option value="20">20��</option>
            <option value="21">21��</option>
            <option value="22">22��</option>
            <option value="23">23��</option>
            <option value="24">24��</option>
            <option value="25">25��</option>
            <option value="26">26��</option>
            <option value="27">27��</option>
            <option value="28">28��</option>
            <option value="29">29��</option>
            <option value="30">30��</option>
            <option value="31">31��</option>
        </select>
   
    
  
    <br />
    ������� : <input type="text" name="connectAs" />
    <br />
   
    <div class="checkbox" name="memTypes"></div>
    ����� ���� :

    
        <input type="radio" name="memType" value="0">basic</input>
        <input type="radio" name="memType" value="1"> premium</input>
        <input type="radio" name="memType" value="2"> prime</input>
    
   
    
  
    <br />
    <br />
    <br />
    <input type="submit" value = "make membership" />
    <input type="button" value = "close" style="float:right" onclick="window.close()" />
    
   
    </form>
</body>

</html>