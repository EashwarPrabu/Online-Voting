<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		String pno=null;
		String vid=(String)session.getAttribute("V_id");
		String cid=request.getParameter("c_id");
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl","system","Password");
		String sql="select partyno from candidates where candidate_id='"+cid+"'";
		Statement stmt = con.createStatement();
		//Statement st=con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next())
		{
			pno=rs.getString(1);
		}
		PreparedStatement ps=con.prepareStatement("insert into election values(?,?,?)");
		ps.setString(1,vid);
		ps.setString(2,pno);
		ps.setString(3,cid);
		int i=ps.executeUpdate();
		if(i!=0)
		{
			/*st.execute("CREATE TRIGGER t after insert on election " //
			        + "FOR EACH ROW "//
			        + "BEGIN "//
			        + "dbms_output.put_line('VOTE RECORDED SUCCESSFULLY') "//
			        + "END;");*/
			//out.println(st);
			
			
			
			//out.println("YOUR VOTE HAS BEEN SUCCESSFULLY RECORDED!");
		}
		else
		{
			out.println("OOPS! SOMETHING WENT WRONG");
		}
	}
catch(Exception e)
{
	out.println(e);
}
%>		
</body>
</html>