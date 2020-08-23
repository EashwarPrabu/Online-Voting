<%@page import="java.sql.*"%>
		<%
					
		%>
		<!DOCTYPE html>
		<html>
		<body>
		<center><h1><b>NO. OF VOTES SECURED BY THE WINNING PARTY<u></u></b></h1>
		<table border="1">
		<tr>
		<td>PARTY NO</td>
		<td>MAXIMUM NO. OF VOTES</td>
		</tr>
		<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl","system","Password");
			String sql1="select * from(select partyno,count(voterid) from election group by partyno order by count(voterid) desc)where rownum=1";
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql1);
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getInt(2) %></td>
		</tr>
		<%
		}%>
		</table><br><br><br><br><br><br>
		<h1><b><u>DETAILS OF THE WINNING PARTY</u></b></h1>
		<table border="1">
		<tr>
		<td>PARTYNO</td>
		<td>PARTY NAME</td>
		</tr>
		<%String sql2="select * from parties where partyno=(select partyno from (select count(voterid),partyno from election group by partyno order by count(voterid) desc)where rownum=1)";
		Statement stmt = conn.createStatement();
		ResultSet rs1 = stmt.executeQuery(sql2);
	while(rs1.next()){
	%>
	<tr>
	<td><%=rs1.getInt(1) %></td>
	<td><%=rs1.getString(2) %></td>
	</tr>
	<%
	}
		conn.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
		</center>
		</body>
		</html>		