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
    <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "university";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String inputid = (String)session.getAttribute("cus_id");
    String sql= "";

    String result_name= "";
    String result_account_id= "";
    String result_password= "";
    String result_birth= "";
    String result_sex= "";
    String re_result_sex= "";
    String result_job= "";
    String result_address= "";
    String result_phone_number= "";

    Connection conn = null;
    Statement stmt;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection(url,user,pass);
    
    //session.setAttribute("idKey", inputid);    // id�� �Ѱ���

    try{
    conn.setAutoCommit(false);
    stmt = conn.createStatement();
    sql = "select name, account_id, password, birth, sex, job, address, phone_number from account where account_id = '"+inputid+"'";
    ResultSet rs = stmt.executeQuery(sql);

	    while(rs.next())
	    {
	    result_name = rs.getString(1);
	    result_account_id = rs.getString(2);
	    result_password = rs.getString(3);
	    result_birth = rs.getString(4);
	    result_sex = rs.getString(5);
	    
	      if(result_sex == null)
	    	  re_result_sex = "null";
	      else if(result_sex.equals("false"))
	    	  re_result_sex = "female";
	      else
	    	  re_result_sex = "male";
	    result_job = rs.getString(6);
	    result_address = rs.getString(7);
	    result_phone_number = rs.getString(8);
	    }
    %>

    <h1><% out.println(result_name+"�� ����� ����");%></h1>
    <br />
    <div><%
    out.println("<br><p>�̸� :"+result_name+"</p>");
    out.println("<br>ID :"+result_account_id+"");
    out.println("<br>PW : "+result_password+"");
   
    %>
    <input type="button" name="pwBtn" value="PW����" onclick="location.href = 'PWBtn.jsp'" /><br>
    <%
    out.println("<br>������� : "+result_birth+" ");
    out.println("<br>���� : "+re_result_sex+" ");
    out.println("<br>���� : "+result_job+" ");
    %>
    <input type="button" name="jobBtn" value="���� ����" onclick="location.href = 'JobBtn.jsp'" />
    <%
    out.println("<br>�ּ� : "+result_address+" ");
    %>
    <input type="button" name="addressBtn" value="�ּ� ����" onclick="location.href = 'AddressBtnPage.jsp'" />
    
    <%
    out.println("<br>��ȭ��ȣ : "+result_phone_number+" ");
    %>
    <input type="button" name="phoneBtn" value="��ȭ��ȣ ����" onclick="location.href = 'PhoneBtn.jsp'" />
    </div>
    <%
    } catch(SQLException ex2)
    {
          System.exit(1);
    }
  
	   try{
	      conn.setAutoCommit(false);
	      stmt = conn.createStatement();
	    sql = "select count(*) from membership where Ac_id = '"+inputid+"'";
	    ResultSet rs2 = stmt.executeQuery(sql);
	    
	    
	    int result_button=0;
	    
	    while(rs2.next())
	      result_button = rs2.getInt(1);
	      
	      
	      System.out.println("before"+result_button);
	      session.setAttribute("cus_id", inputid);
	      session.setAttribute("memberCnt", result_button);
	      System.out.println("after"+result_button);
	     // out.println("<br><input type=\"submit\"  style=\"float:left\" name = \"btnManage\" value = \"" + result_button + "\">" +"</input>");
	      
	    }catch(SQLException ex){System.out.println(ex.getMessage());}
	    
	    finally{
	    	try{
	    		conn.setAutoCommit(false);
	    		stmt = conn.createStatement();
	    		stmt.close();
	    		conn.close();
	    	}catch(SQLException ex){
	    		
	    	}
	    }%>
	    
	    
    <input type="button" id="btnManage" value="����� ���� " onclick="location.href = 'MypageSub.jsp'"/>          
         
    <input type="button" id="btnClose" value="�ݱ�" onclick="window.close()"/> 
    
    <input type="button" id="btnStop" value="Ż��"  onclick="location.href = 'Main_Fin.jsp'"></input>
    
   

</body>
</html>