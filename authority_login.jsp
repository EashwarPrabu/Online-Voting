<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>AUTHORITY LOGIN JSP</title>
  </head>
  <body>
    <% 
    String authid=request.getParameter("authid"); 
    String pass=request.getParameter("pass"); 
    try{
        Class.forName("oracle.jdbc.OracleDriver"); 
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Password");
        Statement st=con.createStatement(); 
        String sql="select * from authority";
        ResultSet rs=st.executeQuery(sql); 
        boolean flag=false; 
        while(rs.next()) {
          if(authid.equals(rs.getString(1)) && pass.equals(rs.getString(2)))
              flag=true; 
          } if(flag) { 
              out.println("SUCCESSFULLY LOGGED IN");
    %>
    <br />
    <a href="Candidate_Creation.html">CLICK HERE TO ENROLL A CANDIDATE</a>
    <%} else { out.println("INVALID ID OR PASSWORD");%>
    <br />
    <a href="Authority.html">CLICK HERE TO SIGN IN AGAIN</a>
    <%} } catch(Exception e) { out.println(e); } %>
  </body>
</html>
