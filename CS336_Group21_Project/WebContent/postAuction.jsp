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
	<h1>Create an Auction</h1>
	<form action="postAuctionHandler.jsp" method="POST">
		
		Starting Price(Max 9999):<input type="number" step="0.01" min = "0.00" name="initialPrice"/><br/>
		Increment:<input type="number" step="0.01" min = "0.00" name="increment"/><br/>
		Start Date(YYYY-MM-DD):<input type="date" name="startDate"/><br/>
		End Date(YYYY-MM-DD):<input type="date" name="endDate"/><br/>
		
		
		<h2>Please choose the type of apparel</h2>
		<input type="radio" name="apparelType" value="shirt" /> Shirt <br />
		<input type="radio" name="apparelType" value="pant"/> Pants <br />
		<input type="radio" name="apparelType" value="shoe"/> Shoes <br />
		
		<input type="submit" value="Submit"/>
	
     </form>
</body>
</html>