<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>CANDIDATE REGISTRATION</title>
  </head>
  <body>
    <% 
    String cid=request.getParameter("cid"); 
    String cname=request.getParameter("cname"); 
    String pno=request.getParameter("partyno"); 
    String ano=request.getParameter("areano"); 
    try{
      Class.forName("oracle.jdbc.OracleDriver"); 
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Password");
      PreparedStatement ps=con.prepareStatement("insert into candidates values(?,?,?,?)"); 
      ps.setString(1,pno); 
      ps.setString(2,cname);
      ps.setString(3,ano); 
      ps.setString(4,cid); 
      int i=ps.executeUpdate(); 
      if(i!=0)
        out.println("CANDIDATE INSERTED SUCCESSFULLY"); 
      else 
      out.println("INVALID PARTYNO OR AREANO"); 
    } catch(Exception e) { out.println(e); } %>
  </body>
</html>
