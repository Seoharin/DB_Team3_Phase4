<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link href="style.css" rel="stylesheet" type="text/css">
	<title>Check option here</title>
</head>
<body style="margin-left:250px;margin-right:250px">
	<!-- 제목 div -->
	<div style="font-size:30px;text-align: center;">
		<h1 >Check options!</h1>
	</div>
	<!-- 옵션 3가지 div를 싸고 있는 div -->
	<div style="align-content:center;margin-bottom: 50px">
		<form action = "Search_optionResult.jsp" method = "POST">
			<h3>TYPE</h3>
			<div class="checkbox" name="types">
				<input type="checkbox" name="type" value="m">Movie</input>
				<input type="checkbox" name="type" value="s">Tv Series</input>
				<input type="checkbox" name="type" value="o">Knu MovieDB Original</input>
			</div>
		
			<h3>GENRE</h3>
			<div style="vertical-align:bottom; margin-bottom: 20px;" name="genres">
				<input type="checkbox" name="genre" value="1">Horror</input>
				<input type="checkbox" name="genre" value="2">Thriller</input>
				<input type="checkbox" name="genre" value="3">Sci-Fi</input>
				<input type="checkbox" name="genre" value="4">Crime</input>
				<input type="checkbox" name="genre" value="5">Drama</input>
				<input type="checkbox" name="genre" value="6">Fantasy</input>
				<input type="checkbox" name="genre" value="7">Animation</input>
				<input type="checkbox" name="genre" value="8">Comedy</input>
				<input type="checkbox" name="genre" value="9">Romance</input>
				<input type="checkbox" name="genre" value="10">Action</input>	
			</div>
			
			<h3>VERSION</h3>
			<div class="checkbox" name="versions">
				<input type="checkbox" name="ver" value="1">Korean</input>
				<input type="checkbox" name="ver" value="2">English(US)</input>
				<input type="checkbox" name="ver" value="3">English(UK)</input>
				<input type="checkbox" name="ver" value="4">Japanese</input>
				<input type="checkbox" name="ver" value="5">Chinese</input>
				<input type="checkbox" name="ver" value="6">French</input>
			</div>
			<!-- 조회 버튼 -->
			<div style="text-align:center;">
				<input style="width: 110px; height: 35px; font-size: 15px; text-align:center;" type="submit" value="search" />
			</div>
		</form>
	</div>
	
</body>
</html>