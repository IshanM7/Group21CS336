<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>


<style>
		table,td, th{
		  border: 1px solid black;
		  width: 40%
		}
		
		table {
		  border-collapse: collapse;
		  
		}
		
		td {
		  text-align: center;
		}
	</style>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	
</head>
<body>



	<%
		
		int userid = (Integer)session.getAttribute("userid");
		
		
		String sql;
		int err = 0;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		
		String category = request.getParameter("category");
		if(category.equals("all")){
			
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM Questions WHERE askID = ? ORDER BY answered DESC;");
			stmt.setInt(1,userid);	 		 
			
			
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()){%>
			
				 <h1> Your Questions </h1>
				 
			 		
			 		<%do{%>
			 		<table>
				 		<tr>
				 			<th>Question</th>
				 			
				 			<th>Answer</th>
				 			<th>Category</th>
				 		</tr>
			 			
			 			<tr>
			 				<td><%out.println("<a> "+rs.getString("qtext")+"</a>"); %></td>
			 				
			 				<%if(rs.getInt("answered") == 1){ %>
			 					<td><%out.println("<a> "+rs.getString("atext")+"</a>"); %> </td>
			 					
			 				<%}else{ %>
			 					<td> The question has not been answered yet</td>
			 				<% } %>
			 				<td style="text-align:center"> <%out.println("<a> "+rs.getString("qtype")+"</a>"); %></td>
			 			</tr>
			 		</table>
			 		<br>
		 			<br>
			 		<%}while(rs.next());%>
			 		
			 		
				 
				
			<%} else { %>
				<h1>You have no questions</h1>
			<%} %>
		<%} else {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM Questions WHERE askID = ? AND qtype = ? ORDER BY answered DESC;");
			stmt.setInt(1,userid);
			stmt.setString(2,category);	 	
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()){%>
			
			 <h1> Your Questions </h1>
			 
		 		
		 		<%do{%>
		 		<table>
			 		<tr>
			 			<th>Question</th>
			 			
			 			<th>Answer</th>
			 			<th>Category</th>
			 		</tr>
		 			
		 			<tr>
		 				<td><%out.println("<a> "+rs.getString("qtext")+"</a>"); %></td>
		 				
		 				<%if(rs.getInt("answered") == 1){ %>
		 					<td><%out.println("<a> "+rs.getString("atext")+"</a>"); %> </td>
		 					
		 				<%}else{ %>
		 					<td> The question has not been answered yet</td>
		 				<% } %>
		 				<td style="text-align:center"> <%out.println("<a> "+rs.getString("qtype")+"</a>"); %></td>
		 			</tr>
		 		</table>
		 		<br>
	 			<br>
		 		<%}while(rs.next());%>
		 		
		 		
			 
			
		<%} else { %>
			<h1>You have no questions</h1>
		<%} %>
			
			
	<%} %>
		
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
		
</body>
</html>