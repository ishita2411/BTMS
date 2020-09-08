<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<HTML>
<HEAD>
<style>
body{
  background-image:url('bus.jpg');
  height:"100";
  width:"100";
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
<TITLE>Show my booking</TITLE>
</HEAD>
<BODY >
<% 
String name=(String)session.getAttribute("uid"); 
System.out.println("Hello User: You have entered the name: "+name);

%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btbs_db?zeroDateTimeBehavior=convertToNull","root","");
            String b=request.getParameter("busdrop");
            String bustable="";
 		   bustable=bustable.concat("bus"+b);
            
            PreparedStatement stmt = conn.prepareStatement("select seatno from "+bustable.trim()+" where uid='"+name+"'"); 
            //stmt.executeQuery("query");
            ResultSet rs = stmt.executeQuery();  
        
    %>
    <body><center><table border=1 width=100><tr><td>Seat Number</td><tr>
                <%
                    while (rs.next()) {   
                %>
            <tr><td><%=rs.getString(1)%></td></tr>
            <% } %>
            <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</BODY>
</HTML>