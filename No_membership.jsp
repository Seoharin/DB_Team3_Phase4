<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<!DOCTYPE html>

<html>
<head>
    <h1>����� ���� �����</h1>
    <br />
     <%
    String cus_id = (String)session.getAttribute("cus_id");
    session.setAttribute("cus_id", cus_id);
    
    %>
    

    <input type="button" name="finish" style="float:left" value="�� "  onclick="location.href = 'MakeMembership.jsp'" />
    <input type="button" name="close" style="float:right" value="�ƴϿ� "  onclick="window.close()" />
   

</head>
</html>