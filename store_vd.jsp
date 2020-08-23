<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DISPLAY JSP</title>
</head>
<body>
<%	
	String aid=request.getParameter("aid");
	String name= request.getParameter("vname");
	String age= request.getParameter("vage");
	String DOB=request.getParameter("vdob");
	String gender= request.getParameter("vgender");
	String phone= request.getParameter("vphone");
	String f_name= request.getParameter("vfather");
	String m_name= request.getParameter("vmother");
	String email= request.getParameter("vemail");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl","system","Password");
		PreparedStatement st=con.prepareStatement("insert into voterdetails(voterid,name,age,dob,gender,phone,father,mother,email) values(?,?,?,?,?,?,?,?,?)");
		session.setAttribute("A_id",aid);
		st.setString(1,aid);
		st.setString(2,name);
		st.setString(3,age);
		st.setString(4,DOB);
		st.setString(5,gender);
		st.setString(6,phone);
		st.setString(7,f_name);
		st.setString(8,m_name);
		st.setString(9,email);
		int i=st.executeUpdate();
		if(i!=0)
		{
			out.println();%>
			<a href="Address.html">CLICK HERE TO ENTER YOUR RESIDENTIAL INFORMATION</a>
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