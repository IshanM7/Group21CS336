<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Rep Dashboard</title>
</head>
<body>
	
	<% String x = session.getAttribute("user").toString();
		out.println("<h1>Welcome Customer Rep"+x+"</h1>");
	%>
	
	
	<ul>
		<li><a href="customerRepQuestionPage.jsp">QNA Page</a></li>
		<li><a href="deleteAccount.jsp">Delete an Account</a>	</li>
		<li><a href="removeBid.jsp">Remove Bid</a></li>
		<li><a href='removeAuction.jsp'>Remove Auction</a></li>
	</ul>
	<a href='logout.jsp'>Log out</a>
</body>
</html>