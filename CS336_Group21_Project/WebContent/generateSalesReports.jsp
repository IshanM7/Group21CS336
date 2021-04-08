<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
	
	<div class = "content">
	
		<div class="dropdown">
		  <button class="dropbtn">Generate Reports</button>
			<div class="dropdown-content">
			   	<a href="salesReportHandler.jsp?type=totalEarnings">Total Earnings</a>
			   	<a href="salesReportHandler.jsp?type=earningsPerItem">Earnings Per Item(single items)</a>
			   	<a href="salesReportHandler.jsp?type=earningsPerType">Earnings Per Type(categories)</a>
			   	<a href="salesReportHandler.jsp?type=earningsPerEndUser">Earnings Per End-User</a>
			   	<a href="salesReportHandler.jsp?type=bestSelling">Best Selling</a>
			   	<a href="salesReportHandler.jsp?type=bestBuyers">Best Buyers</a>
			   	
			</div>
		</div>
	</div>
</body>
</html>