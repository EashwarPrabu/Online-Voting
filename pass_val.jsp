<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PASSWORD VALIDATION</title>
</head>
<body>
<%
	String aid=(String)session.getAttribute("A_id");
	String pass=request.getParameter("pass");
	String cpass=request.getParameter("cpass");
	//if(pass.equals(cpass))
	//{
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Password");
			PreparedStatement st=con.prepareStatement("insert into voters values(?,?)");
			st.setString(1,aid);
			st.setString(2,pass);
			int i=st.executeUpdate();
			if(i!=0)
				out.println("INSERTED !!");
			else
				out.println("SOMETHING WENT WRONG IN TABLE 1");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	//}
	//else
		//out.println("PASSWORD MISMATCH");
%>

</body>
</html>