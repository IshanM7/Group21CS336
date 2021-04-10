<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>End User Dashboard</title>
</head>
<body>
	<% String x = session.getAttribute("user").toString();
		out.println("<h1>Welcome User "+x+"</h1>");
	%>
	
	<ul>
		<li><a href="postAuction.jsp">Post an Auction</a></li>
		<li><a href="searchAuctions.jsp">Search for an Auction</a></li>
		<li><a href="endUserAskQuestionPage.jsp">Ask a question</a></li>
		<li><a href="questionSearch.jsp">View Your Questions</a></li>
	</ul>
	
	<a href='logout.jsp'>Log out</a>
</body>
</html>