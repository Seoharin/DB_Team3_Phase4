
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR" />
    <title>KNU MOVIE_TEAM3</title>
</head>

<body style="margin-left:200px;margin-right:200px;text-align:center">
    <%

    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	String sql="";
	
	String id = (String)session.getAttribute("id"); // 사람id 받아옴.
	String name="";
	ArrayList<Integer> titlelist = new ArrayList<Integer>();
	String avgscore="";
	
    Connection conn = null;
    Statement stmt=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);


    try {
        conn.setAutoCommit(false);
        stmt = conn.createStatement();
        sql = "SELECT name FROM ACCOUNT WHERE Account_id = '"+id+"'";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next())
        {
            name = rs.getString("name");
        }
        rs.close();
    } catch(SQLException ex)
    {
    	//System.err.println("sql error = "+ex.getMessage());
   		 System.exit(1);
    }

    %>
    
    <div style="text-align:center;">
        <h2>관리자: <%=name%></h2>
    </div>
	<form>
	    <div>
	        <h4>내가 올린 영상물</h4>
	        <div style="border:solid;border-color:black;">
	<%
	            try {
	                conn.setAutoCommit(false);
	                stmt = conn.createStatement();
	                sql = "SELECT title_id, title FROM ACCOUNT, MOVIE WHERE admin_id = Account_id AND Account_id='" + id + "'";
	                ResultSet rs = stmt.executeQuery(sql);
	                while(rs.next())
	                {
	               		titlelist.add(rs.getInt("title_id"));
	                }
	                
	              //관리자가 올린 영상물들의 title_id 를 titlelist에 담음
	
	
	              //titlelist 에 있는 애들의 title_id, title, 평점을 보여줌
	                System.out.println("titlelist size:"+titlelist.size());
	                for(int i=0; i<titlelist.size();i++)
	                {
	                	conn.setAutoCommit(false);
	                	stmt = conn.createStatement();
	                	sql = "select  Mt_id, AVG(Score) from movie, rating where Mt_id="+titlelist.get(i)+"group by Mt_id";
	                	rs = stmt.executeQuery(sql);
	                	while (rs.next()) 
	                	{
	                		avgscore = rs.getString(2);
	                        out.println("<br><input type=\"radio\" name = \"id\" value = \"" + Integer.toString(rs.getInt("Mt_id")) + "\">"  +"  "+avgscore+ "</input>");
	                		
	                	}
	                }
	                session.setAttribute("manager_id",id);
	                
	
	            } catch(SQLException ex)
	            {
	            	System.err.println("sql error = "+ex.getMessage());
	            	System.exit(1);
	            }
	
	%>
	
	        </div>
	    </div>
		<div>
		
		
			<input type="submit" value="영상정보수정"  >
			<input type="submit" value="평가내역보기" >
			<input type="button" value="새로운영상등록" onclick="location.href='addmovie.jsp'">
			<input type="button" value="로그아웃" onclick="location.href='Login.jsp'">
		</div>
	</form>

</body>
</html>
