<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList, java.util.Collections"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU MOVIE_TEAM3</title>
</head>
<body>
  <%
   String title=request.getParameter("title");
   
   String serverIP = "localhost";
   String strSID = "orcl";
   String portNum = "1521";
   String user = "university";
   String pass = "comp322";
   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
   
   String sql= "";
   ArrayList<Integer> titlelist = new ArrayList<Integer>();
   
   Connection conn = null;
   Statement stmt;
   ResultSet rs;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   conn=DriverManager.getConnection(url,user,pass);
  // out.println("��� ���� ����");
	try {
		
		if (title==null)//�ƹ��͵� üũ ��������
		{
			 %>
            <script>
            alter('������ �Է����ּ���.')
            location.href="SubjectSearch.jsp"
            </script>
             <%
		}
		
		
		conn.setAutoCommit(false);
		stmt = conn.createStatement();
		sql = "select * from movie where title ='" + title + "'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			titlelist.add(rs.getInt("title_id"));
		}
		
		
		
		
		 // titlelist�� �ִ� �ֵ� select�� ������ ��� ����ֱ�
		
		%><div style="font-size:30px;text-align: center;">
			<h1>�˻� ���</h1>
		    </div>
			<form action = "showdetail.jsp" method = "POST">
			
			<%
			Collections.sort(titlelist);
			for(int i=0; i<titlelist.size();i++)
			{
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select title_id, title from movie where title_id = " + titlelist.get(i);
				rs = stmt.executeQuery(sql);
				while (rs.next()) 
				{
			        out.println("<br><input type=\"radio\" name = \"title_id\" value = \"" + Integer.toString(rs.getInt("title_id")) + "\">" + rs.getString("title_id") +"  "+ rs.getString("title") + "</input>");
					
				}
		    }
			
		
			
		
		
	} catch(SQLException ex)
	{
		System.exit(1);
	}
	
   %>
   	<div style="margin-top:20px; text-align: center;">
	   <input type="submit" value="������" style="width: 110px; height: 35px; font-size: 15px; text-align:center;"onclick="location.href='showdetail.jsp'"/>
	   <input type="button" value="���" style="width: 110px; height: 35px; font-size: 15px; text-align:center;"onclick="location.href='OptionSearch.jsp'"></input>
	</div>
   </form>
</body>
</html>