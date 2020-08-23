<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADDRESS JSP</title>
</head>
<body>
<%
	String aid=(String)session.getAttribute("A_id");
	String dno= request.getParameter("dno");
	String street= request.getParameter("street");
	String city=request.getParameter("city");
	String areano= request.getParameter("area");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl","system","Password");
		PreparedStatement st=con.prepareStatement("insert into address values(?,?,?,?,?)");
		st.setString(1,aid);
		st.setString(2,dno);
		st.setString(3,street);
		st.setString(4,city);
		st.setString(5,areano);
		int i=st.executeUpdate();
		if(i!=0)
		{%>
			<br> <a href="Password.html">CLICK HERE TO ENTER PASSWORD</a>
		<%}			
		else
			out.println("SOMETHING WENT WRONG IN TABLE 1");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>