<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<!DOCTYPE html>

<html>
<head>
    <h1>멤버십 새로 만들기</h1>
    <br />
     <%
    String cus_id = (String)session.getAttribute("cus_id");
    session.setAttribute("cus_id", cus_id);
    
    %>
    

    <input type="button" name="finish" style="float:left" value="예 "  onclick="location.href = 'MakeMembership.jsp'" />
    <input type="button" name="close" style="float:right" value="아니오 "  onclick="window.close()" />
   

</head>
</html>