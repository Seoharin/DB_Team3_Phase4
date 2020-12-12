<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList, java.util.Collections"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU MOVIE_TEAM3</title>
</head>
<body style="margin-left:250px;margin-right:250px">
  <%
   String[] type = request.getParameterValues("type");
  
   String[] genre = request.getParameterValues("genre");
   
   String[] ver = request.getParameterValues("ver");
   
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
  // out.println("디비 연결 성공");

	try {
		
		if (type!=null)
		{	
			for (int i = 0;i < type.length;i++)
			{
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				
				if (type[i].equals("m")==true)
				{
					sql = "select * from movie where type ='m'";
					rs = stmt.executeQuery(sql);
	
					while(rs.next())
					{
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (type[i].equals("s")==true)
				{
					sql = "select title_id from movie where type ='s'";
					rs = stmt.executeQuery(sql);
					while(rs.next())
						titlelist.add(rs.getInt("title_id"));
				}
				else if (type[i].equals("o")==true)
				{
					sql = "select title_id from movie where type ='o'";
					rs = stmt.executeQuery(sql);
					while(rs.next())
						titlelist.add(rs.getInt("title_id"));
				}
			}
				
		}
	
		if (genre!=null)
		{
			
			
			for (int i = 0;i< genre.length;i++)
			{
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				
				if (genre[i].equals("1")==true)
				{
					sql = "select * from movie, has_genre where title_id = M_id AND Gnum=1";
					rs = stmt.executeQuery(sql);
					
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
					
				}
				else if (genre[i].equals("2")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=2";
					rs = stmt.executeQuery(sql);
					
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("3")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=3";
					rs = stmt.executeQuery(sql);
					
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("4")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=4";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("5")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=5";
					rs = stmt.executeQuery(sql);
					
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("6")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=6";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("7")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=7";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("8")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=8";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("9")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=9";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				else if (genre[i].equals("10")==true)
				{
					sql = "select title_id from movie, has_genre where title_id = M_id AND Gnum=10";
					rs = stmt.executeQuery(sql);
					
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
			}
		}
		
		//version 추가하기
		if (ver!=null)
		{
			for (int i = 0;i<ver.length;i++)
			{
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				
				if (ver[i].equals("1")==true)
				{
					sql = "select * from movie, has_version where title_id = Acs_id AND V_id=1";
					rs = stmt.executeQuery(sql);
				
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				
				else if (ver[i].equals("2")==true)
				{
					sql = "select * from movie, has_version where title_id = Acs_id AND V_id=2";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				
				else if (ver[i].equals("3")==true)
				{
					sql = "select title_id from movie, has_version where title_id = Acs_id AND V_id =3";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				
				else if (ver[i].equals("4")==true)
				{
					sql = "select title_id from movie, has_version where title_id = Acs_id AND V_id =4";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				
				else if (ver[i].equals("5")==true)
				{
					sql = "select title_id from movie, has_version where title_id = Acs_id AND V_id =5";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
				
				else if (ver[i].equals("6")==true)
				{
					sql = "select title_id from movie, has_version where title_id = Acs_id AND V_id =6";
					rs = stmt.executeQuery(sql);
					while (rs.next())
					{
						if (titlelist.contains(rs.getInt("title_id"))==true)
							break;
						titlelist.add(rs.getInt("title_id"));
					}
				}
			}
		}
		
		
		if (titlelist.isEmpty()==true)//아무것도 체크 안했으면
		{
			 %>
            <script>
            alter('옵션을 선택해주세요.')
            location.href="OptionSearch.jsp"
            </script>
             <%

		}
		else { // titlelist에 있는 애들 select문 돌려서 결과 띄워주기
			
		%>
			<div style="font-size:30px;text-align: center;">
			<h1>검색 결과</h1>
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
			        out.println("<br><input type=\"radio\" name = \"title_id\" value = \"" +Integer.toString(rs.getInt("title_id")) + "\">" + rs.getString("title_id") +"  "+ rs.getString("title") + "</input>");
					
				}
		    }
			
		
			
		}
		
	} catch(SQLException ex)
	{
		System.exit(1);
	}
	
   %>
   <div style="margin-top:20px; text-align: center;">
	   <input type="submit" value="상세정보" style="width: 110px; height: 35px; font-size: 15px; text-align:center;"onclick="location.href='showdetail.jsp'"/>
	   <input type="button" value="취소" style="width: 110px; height: 35px; font-size: 15px; text-align:center;"onclick="location.href='OptionSearch.jsp'"></input>
	</div>
   </form>
</body>
</html>
