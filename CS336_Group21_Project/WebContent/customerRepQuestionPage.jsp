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
		  width: 80%
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
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001"); 
			
			
			Statement stmt = con.createStatement();
			String category = request.getParameter("category");
			String sql;
			if(category.equals("all"))	
				sql = "SELECT * FROM Questions WHERE answered = 0;";
			else
				sql = "SELECT * FROM Questions WHERE answered = 0 AND qtype = '"+category+"';";
			
			
			ResultSet rs = stmt.executeQuery(sql);
			
			
			if(rs.next()){%>
			
			 <h1> All Unanswered Questions </h1>
			 
		 		
		 		<%do{%>
		 		
		 		<form method="post" action="customerRepAnswerQuestion.jsp?qid=<%=rs.getInt("qid")%>">
		 		
			 		<table>
				 		<tr>
				 			<th>Question</th>
				 			
				 			<th>Answer(Max 200 characters)</th>
				 			<th>Category</th>
				 		</tr>
			 			
			 			<tr>
			 				<td><%out.println("<a> "+rs.getString("qtext")+"</a>"); %></td>
			 				
		                    <td><textarea name="Answer" cols="70" rows="5" maxlength = "200"></textarea></td>
		                    <td style="text-align:center"><%out.println("<a> "+rs.getString("qtype")+"</a>"); %></td>
			 			</tr>
			 			
	
		                <tr>
		                     <td><input type="submit" value="Submit" /></td>
		                </tr>
		                
			 		</table>
			 		
			 		
			 	</form>
		 		<br>
		 		<br>
		 		<%}while(rs.next());%>
		 		
		 		
			 
			
			<%}else {
				out.println("No questions related to "+category+"<a href='customerRepHome.jsp'>Go Home</a>");
			}%>
		
		<a href='customerRepHome.jsp'>Return Home</a>
		 		 
	


</body>
</html>