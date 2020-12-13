<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상물 추가</title>
</head>
<body>
<form action = "movieadding.jsp" method = "POST">
<%
String manager_id = (String)session.getAttribute("manager_id");
session.setAttribute("manager_id",manager_id);
%>
제목 : <input type = "text" name = "title"><br>
방영시작일(mm-dd-yyyy) : <input type = "text" name = "startyear"><br>
방영종료일(mm-dd-yyyy), TV Series의 경우만 기입 : <input type = "text" name = "endyear"><br>
상영시간(분) : <input type = "text" name = "runtime"><br>
OST : <input type = "text" name = "ost"><br>
감독 : <input type = "text" name  = "director"><br>
작가 : <input type = "text" name = "writer"><br>
관객 수(단위: 만) : <input type = "text" name = "audience"><br>

클립영상 여부 : <input type = "checkbox" name = "hasclip"><br>
청소년 관람불가 여부 : <input type = "checkbox" name = "is_adult"><br>
				
타입 : <br>
	<input type = "radio" name = "type" value ="m">Movie</input>
	<input type = "radio" name = "type" value = "s">Tv Series</input>
	<input type = "radio" name = "type" value = "o">Knu MovieDB Original</input><br>
				
			
장르 : <br>
				<input type="checkbox" name="genre" value="1">Horror</input>
				<input type="checkbox" name="genre" value="2">Thriller</input>
				<input type="checkbox" name="genre" value="3">Sci-Fi</input>
				<input type="checkbox" name="genre" value="4">Crime</input><br>
				<input type="checkbox" name="genre" value="5">Drama</input>
				<input type="checkbox" name="genre" value="6">Fantasy</input>
				<input type="checkbox" name="genre" value="7">Animation</input>
				<input type="checkbox" name="genre" value="8">Comedy</input><br>
				<input type="checkbox" name="genre" value="9">Romance</input>
				<input type="checkbox" name="genre" value="10">Action</input>	<br>
버전 : 		<br>	
				<input type="checkbox" name="version" value="1">Korean</input>
				<input type="checkbox" name="version" value="2">English(US)</input>
				<input type="checkbox" name="version" value="3">English(UK)</input><br>
				<input type="checkbox" name="version" value="4">Japanese</input>
				<input type="checkbox" name="version" value="5">Chinese</input>
				<input type="checkbox" name="version" value="6">French</input><br>

<input type = "submit" value = "영상등록">
</form>


</body>
</html>