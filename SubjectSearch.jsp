<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link href="style.css" rel="stylesheet" type="text/css">
	<title>Insert title here</title>
</head>
<body style="width:100%; height: 100%;">
	<!-- 제목 div -->
	<div class="searchtitle">
		<h1 >Input title to Search!</h1>
	</div>
	<div style="text-align:center; margin-left:250px;margin-right:250px;margin-bottom: 50px">
		<form action = "Search_titleResult.jsp" method = "POST">
			<div style="text-align:center; margin-bottom:30px;">
				<input type="text" style=" width:700px; height:30px;"name="title">
			</div>
			<!-- 조회 버튼 -->
			<div style="text-align:center;">
				<input style="width: 110px; height: 35px; font-size: 15px; text-align:center;" type="submit" value="search" />
			</div>
		</form>
	</div>
	
</body>
</html>
