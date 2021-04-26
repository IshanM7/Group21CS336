<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>
	<%
		int role = (Integer)session.getAttribute("role");
		
	
	
		if(role == 2){%>
			
			<form method="post" action="customerRepQuestionPage.jsp">
			    <table>
			             
		                <tr>
		                    <td>Search Questions</td>
		                    
		                    <td>
		                    		
		                    	<select name="category" id="category" required>
								<option value="">Select category</option>
								<option value="auctionHelp">Auction Questions</option>
								<option value="accountHelp">Account Questions</option>
								<option value="generalHelp">General Questions</option>
								<option value="all">See All Questions</option>								
								</select>
					  		</td>
					  		
		                </tr>
		                <tr>
		                    <td><input type="submit" value="Submit" /></td>
		                </tr>
			                  
			            
		    	</table>
			</form>
			
		<%} else { %>
		
			<form method="post" action="endUserQuestionPage.jsp">
			    <table>
			             
		                <tr>
		                    <td>Search Questions</td>
		                    
		                    <td>
		                    		
		                    	<select name="category" id="category" required>
								<option value="">Select category</option>
								<option value="auctionHelp">Auction Questions</option>
								<option value="accountHelp">Account Questions</option>
								<option value="generalHelp">General Questions</option>
								<option value="all">See All Questions</option>								
								</select>
					  		</td>
					  		
		                </tr>
		                <tr>
		                    <td><input type="submit" value="Submit" /></td>
		                </tr>
			                  
			            
		    	</table>
			</form>
		
		<%} %>
		
	
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
	

</body>
</html>