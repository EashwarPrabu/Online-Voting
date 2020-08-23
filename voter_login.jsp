<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VOTER LOGIN JSP</title>
</head>
<body>
<%
	String vid= request.getParameter("vid");
	String pass= request.getParameter("pass");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl","system","Password");
		session.setAttribute("V_id",vid);
		Statement st=con.createStatement();
		String sql="select * from voters";
		ResultSet rs=st.executeQuery(sql);
		boolean flag=false;
		while(rs.next())
		{
			if(vid.equals(rs.getString(1)) && pass.equals(rs.getString(2)))
					{
						flag=true;
					}
		}
			if(flag)
			{
				out.println("LOGGED IN SUCCESSFULLY");%>	
				<br> <a href="vote.jsp">CLICK HERE TO CAST YOUR VOTE</a>
			<%}
			else
			{
				out.println("INVALID USERNAME OR PASSWORD");%>
				<br><a href="Voter.html">CLICK HERE TO SIGN IN AGAIN</a>
			<%}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>