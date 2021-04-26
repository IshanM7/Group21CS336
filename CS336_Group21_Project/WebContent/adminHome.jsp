<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Dashboard</title>
	<link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
	<% String x = session.getAttribute("user").toString();
		out.println("<h1>Welcome "+x+"</h1>");
	%>

	<ul>
		<li><a href="generateSalesReports.jsp">Generate sales reports</a></li>
		<li><a href="customerRepRegister.jsp">Create a customer rep account</a>	</li>
		<li><a href='searchAuctions.jsp'>Search Auctions</a></li>
		<li><a href='logout.jsp'>Log out</a></li>
	</ul>
</body>
</html>