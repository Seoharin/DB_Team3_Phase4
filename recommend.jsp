<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page language="java"
	import="java.util.ArrayList,javax.swing.JButton,javax.swing.ButtonGroup "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 MOVIE_LIST</title>
</head>
<body>
	<form action="showdetail.jsp" method="POST">

		<%
		String cus_id = (String)session.getAttribute("cus_id");
		String serverIP = "localhost";
		String username = "";
		String strSID = "orcl";
		String portNum = "1521";
		String user = "university";
		String pass = "comp322";
		String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
		String idcheck = "false";
		Connection conn = null; // Connection object
		Statement stmt = null; // Statement object
		ResultSet rs, rs2;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "";
		String sex = "";
		ArrayList title_id = new ArrayList<Integer>();
		ArrayList title = new ArrayList<String>();

		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "SELECT name, sex FROM ACCOUNT WHERE Account_id = '" + cus_id + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				username = rs.getString(1);
				sex = rs.getString(2);
			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}

		out.print("<h2> 전체영상물중 평점이 가장 높은 top5 </h2>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating group by mt_id order by avg(score) desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				title_id.add(rs.getInt(1));
			}
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
 
		
		for (int i = 0; i < 5; i++) {
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select title from movie where title_id = " + title_id.get(i);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			title.add(rs.getString(1));
				}
				out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
				+ "</input>");
				rs.close();
			} catch (SQLException ex2) {
				System.err.println("sql error = " + ex2.getMessage());
				System.exit(1);
			}
		}
		title_id.clear();
		title.clear();
		out.print("<h2> " + username + " 님과 같은 성별의 고객들이 평가한 top5 </h2>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating" + " where rate_id in " + "(select account_id from account where sex ='" + sex
			+ "')group by mt_id " + "order by avg(score) desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				title_id.add(rs.getInt(1));
			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		if(title_id.size()<5)
		{
			for (int i = 0; i < title_id.size(); i++) {
				try {
					conn.setAutoCommit(false);
					stmt = conn.createStatement();
					sql = "select title from movie where title_id = " + title_id.get(i);
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
				title.add(rs.getString(1));
					}
					out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
					+ "</input>");
					rs.close();
				} catch (SQLException ex2) {
					System.err.println("sql error = " + ex2.getMessage());
					System.exit(1);
				}
			}
		}
		else
		{
			for (int i = 0; i < 5; i++) {
				try {
					conn.setAutoCommit(false);
					stmt = conn.createStatement();
					sql = "select title from movie where title_id = " + title_id.get(i);
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
				title.add(rs.getString(1));
					}
					out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
					+ "</input>");
					rs.close();
				} catch (SQLException ex2) {
					System.err.println("sql error = " + ex2.getMessage());
					System.exit(1);
				}
			}
		}
		
		title_id.clear();
		title.clear();

		out.print("<h2> " + username + " 님과 같은 연령대의 고객들이 평가한 top5 </h2>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating where rate_id in"
			+ "(select account_id from account where EXTRACT(year from birth) - 5 <="
			+ "((select EXTRACT(year from birth) from account where account_id = '" + cus_id + "'))"
			+ "and EXTRACT(year from birth) + 5 >= ((select EXTRACT(year from birth) from account where account_id = '"
			+ cus_id + "')))" + " group by mt_id" + " order by avg(score) desc ";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				title_id.add(rs.getInt(1));

			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		if(title_id.size()<5)
		{
			for (int i = 0; i < title_id.size(); i++) {
				try {
					conn.setAutoCommit(false);
					stmt = conn.createStatement();
					sql = "select title from movie where title_id = " + title_id.get(i);
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
				title.add(rs.getString(1));
					}
					out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
					+ "</input>");
					rs.close();
				} catch (SQLException ex2) {
					System.err.println("sql error = " + ex2.getMessage());
					System.exit(1);
				}
			}
		}
		else
		{
			for (int i = 0; i < 5; i++) {
				try {
					conn.setAutoCommit(false);
					stmt = conn.createStatement();
					sql = "select title from movie where title_id = " + title_id.get(i);
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
				title.add(rs.getString(1));
					}
					out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
					+ "</input>");
					rs.close();
				} catch (SQLException ex2) {
					System.err.println("sql error = " + ex2.getMessage());
					System.exit(1);
				}
			}
		}
		title_id.clear();
		title.clear();

		out.print("<h2> 장르별 top3 </h2>");

		for (int i = 1; i <= 10; i++) {
			String genre = "";
			switch (i) {
			case 1:
				genre = "Horror";
				break;
			case 2:
				genre = "Thriller";
				break;
			case 3:
				genre = "Sci-Fi";
				break;
			case 4:
				genre = "Crime";
				break;
			case 5:
				genre = "Drama";
				break;
			case 6:
				genre = "Fantasy";
				break;
			case 7:
				genre = "Animation";
				break;
			case 8:
				genre = "Comedy";
				break;
			case 9:
				genre = "Romance";
				break;
			case 10:
				genre = "Action";
				break;
			}

			out.print("<h3> " + genre + "장르의 top3 </h3>");
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select mt_id from rating where mt_id in (select m_id from has_genre where gnum = " + i
				+ ")group by mt_id order by avg(score) desc";
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			title_id.add(rs.getInt(1));
				}
				rs.close();
			} catch (SQLException ex2) {
				System.err.println("sql error = " + ex2.getMessage());
				System.exit(1);
			}
			for (int j = 0; j < 3; j++) {
				try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select title from movie where title_id = " + title_id.get(j);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				title.add(rs.getString(1));
			}
			out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(j) + "\">"
					+ title.get(j) + "</input>");
			rs.close();
				} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
				}
			}
			title_id.clear();
			title.clear();

		}

		out.print("<h2> 가장 많은 고객이 평가한 top5 </h2>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating group by mt_id order by count(mt_id) desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				title_id.add(rs.getInt(1));

			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		for (int i = 0; i < 5; i++) {
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select title from movie where title_id = " + title_id.get(i);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			title.add(rs.getString(1));
				}
				out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
				+ "</input>");
				rs.close();
			} catch (SQLException ex2) {
				System.err.println("sql error = " + ex2.getMessage());
				System.exit(1);
			}
		}
		title_id.clear();
		title.clear();
		out.print("<h2> Type별 top3 </h2>");

		out.print("<h3> Movie type의 top3 </h3>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating where mt_id in (select title_id from movie where type = 'm') group by mt_id order by avg(score) desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				title_id.add(rs.getInt(1));

			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		for (int i = 0; i < 3; i++) {
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select title from movie where title_id = " + title_id.get(i);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			title.add(rs.getString(1));
				}
				out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
				+ "</input>");
				rs.close();
			} catch (SQLException ex2) {
				System.err.println("sql error = " + ex2.getMessage());
				System.exit(1);
			}
		}
		title_id.clear();
		title.clear();
		out.print("<h3> Tv Series type의 top3 </h3>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating where mt_id in (select title_id from movie where type = 's') group by mt_id order by avg(score) desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				title_id.add(rs.getInt(1));

			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		for (int i = 0; i < 3; i++) {
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select title from movie where title_id = " + title_id.get(i);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			title.add(rs.getString(1));
				}
				out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
				+ "</input>");
				rs.close();
			}catch (SQLException ex2) {
				System.err.println("sql error = " + ex2.getMessage());
				System.exit(1);
			}
		}
		title_id.clear();
		title.clear();
		out.print("<h3> Knu Movie DB Original 의 top3 </h3>");
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			sql = "select mt_id from rating where mt_id in (select title_id from movie where type = 'o') group by mt_id order by avg(score) desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				title_id.add(rs.getInt(1));
			}
			rs.close();
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}

		for (int i = 0; i < 3; i++) {
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				sql = "select title from movie where title_id = " + title_id.get(i);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			title.add(rs.getString(1));
				}
				out.println("<br> <input type=\"radio\" name = \"title_id\" value = \"" + title_id.get(i) + "\">" + title.get(i)
				+ "</input>");
				rs.close();
			} catch (SQLException ex2) {
				System.err.println("sql error = " + ex2.getMessage());
				System.exit(1);
			}
		}
		title_id.clear();
		title.clear();
		%>
		<br>
		<input type="submit" value="세부사항 보기"
		onclick="location.href = 'showdetail.jsp'">
	</form>
	
</body>
</html>