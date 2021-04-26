<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>End User Dashboard</title>
</head>


<body>
	<h1>Browse and Search</h1>
</body>
	<form method="post" action="auctionListing.jsp">
		Account Lookup: <input required type="number" name = "lookup" placeholder = "Account ID.." oninvalid="this.setCustomValidity('Enter an Integer')" 
			onchange="this.setCustomValidity('')" />			                   					 								 																				                
         <input type="submit" value="Submit" />
	</form>
	<br>
	<form method="post" action="searchAuctionHandler.jsp">
          
         <input type="submit" value="View All Auctions" />
	</form>


	<body>
	<form method="post" action="alertValues.jsp">
          
         <input type="submit" value="Set Alert" />
	</form>
			
		<section>
				<h3>Search Item</h3>
				<form action="searchAuctionHandler.jsp">
	
				<label for="sex">Sex:</label>

				<select name="sex" required>
				    <option disabled selected value> -- </option >
 					<option value="M">M</option>
  					<option value="F">F</option>
				</select>
				<button>Search</button>
				</form>
				<form action="searchAuctionHandler.jsp">
							
				<label for="item">Items:</label>

				<select name="item" required>
				    <option disabled selected value> -- </option>
 					<option value="shirt">Shirts</option>
  					<option value="pant">Pants</option>
 					<option value="shoe">Shoes</option>
				</select>
				<button>Search</button>
				</form>
				<form action="searchAuctionHandler.jsp">
				<label for="color">Colors:</label>

				<select name="color" required>
				    <option disabled selected value> -- </option>
 					<option value="blue">Blue</option>
  					<option value="red">Red</option>
 					<option value="green">Green</option>
 					<option value="black">Black</option>
  					<option value="white">White</option>
 					<option value="pink">Pink</option>
				</select>
				<button>Search</button>

				</form>

		</section>
		
		<section>
			<form action="searchAuctionHandler.jsp">
			<h3>Sort All Items</h3>
							
				<label for="type">Sort by:</label>

				<select name="type" required>
				    <option disabled selected value> -- </option>
  					<option value="price">Price</option>
 					<option value="type">Type</option>
  					<option value="color">Color</option>
				</select>
				
				<button>Search</button>
				</form>
		</section>

	<a href='bidHandlerView.jsp'>View Bids</a>
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
				
</html>