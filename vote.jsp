<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VOTING</title>
</head>
<body>

<table border="1" >
<tr>
<th>CANDIDATE_ID</th>
<th>CANDIDATE_NAME</th>
<th>PARTY NO</th>
</tr>
<%
	try{
		String s1=null;
		String s2=null;
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl","system","Password");
		String vid=(String)session.getAttribute("V_id");
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("SELECT AREANO FROM ADDRESS WHERE voterid='" +vid+ "'");
		if(rs.next())
		{
			s1=rs.getString(1);
		}
		Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery("SELECT * FROM candidates WHERE areano='"+s1+"'");
		while(rs1.next())
		{%>
		<tr>
		<td>	<%=rs1.getInt(4)%></td>
		<td>	<%=rs1.getString(2)%></td>
		<td>	<%=rs1.getString(1)%> </td>
		</tr>
		<%}%>
		</table>
		<form action="results.jsp" method="POST">
		ENTER THE CANDIDATE ID FOR WHOM YOU WANT TO CASTE YOUR VOTE <input type="text" name="c_id" required><br>
		<input type="SUBMIT" value="ACCEPT">
		</form>		
		<%}
	catch(Exception e)
	{
		out.println(e);
	}%>
</body>
</html>