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

    out.println("<h1> " +name+ " 丛狼 糕滚绞 殿废</h1>");
    session.setAttribute("cus_id",cus_id);
    %>
    
        搬力老 :
        <select name="Regular_payment_day">
            <option value="1">1老</option>
            <option value="2">2老</option>
            <option value="3">3老</option>
            <option value="4">4老</option>
            <option value="5">5老</option>
            <option value="6">6老</option>
            <option value="7">7老</option>
            <option value="8">8老</option>
            <option value="9">9老</option>
            <option value="10">10老</option>
            <option value="11">11老</option>
            <option value="12">12老</option>
            <option value="13">13老</option>
            <option value="14">14老</option>
            <option value="15">15老</option>
            <option value="16">16老</option>
            <option value="17">17老</option>
            <option value="18">18老</option>
            <option value="19">19老</option>
            <option value="20">20老</option>
            <option value="21">21老</option>
            <option value="22">22老</option>
            <option value="23">23老</option>
            <option value="24">24老</option>
            <option value="25">25老</option>
            <option value="26">26老</option>
            <option value="27">27老</option>
            <option value="28">28老</option>
            <option value="29">29老</option>
            <option value="30">30老</option>
            <option value="31">31老</option>
        </select>
   
    
  
    <br />
    楷搬拌谅 : <input type="text" name="connectAs" />
    <br />
   
    <div class="checkbox" name="memTypes"></div>
    糕滚绞 辆幅 :

    
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