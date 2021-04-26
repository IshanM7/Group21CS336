<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customer Rep Dashboard</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>
	
	<% String x = session.getAttribute("user").toString();
		out.println("<h1>Welcome Customer Rep"+x+"</h1>");
	%>
	
	
	<ul>
		<li><a href="questionSearch.jsp">QNA Page</a></li>
		<li><a href="customerRepEditAccount.jsp">Edit an Account</a>	</li>		
		<li><a href='searchAuctions.jsp'>Search Auctions(Remove bids and delete Auctions here)</a></li>
	</ul>
	<a href='logout.jsp'>Log out</a>
</body>
</html>