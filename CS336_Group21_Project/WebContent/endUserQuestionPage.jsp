<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
	<%
		
		int userid = (Integer)session.getAttribute("userid");
		
		
		String sql;
		int err = 0;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM Questions WHERE askID = ? ORDER BY answered ASC;");
		stmt.setInt(1,userid);	 		 
		
		
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()){%>
		
			 <h1> Your Questions </h1>
			 
		 		
		 		<%do{%>
		 		<table>
			 		<tr>
			 			<th>Question</th>
			 			
			 			<th>Answer</th>
			 		</tr>
		 			
		 			<tr>
		 				<td><%out.println("<a> "+rs.getString("qtext")+"</a>"); %></td>
		 				
		 				<%if(rs.getInt("answered") == 1){ %>
		 					<td><%out.println("<a> "+rs.getString("atext")+"</a>"); %> </td>
		 					
		 				<%}else{ %>
		 					<td> The question has not been answered yet</td>
		 				<% } %>
		 		</table>
		 		<br>
	 			<br>
		 		<%}while(rs.next());%>
		 		
		 		
			 
			
		<%} else { %>
			<h1>You have no questions</h1>
		<%} %>
		
		
		
	
	
</body>
</html>