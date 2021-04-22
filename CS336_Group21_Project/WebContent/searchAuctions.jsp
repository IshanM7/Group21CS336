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
	<form method="post" action="searchAuctionHandler.jsp">
	    <table>
	             
                <tr>
                    <td>Search Auctions</td>                    
                    <td>                    		
                    	<select name="category" id="category" required>
							<option value="">Select category</option>
							<option value="allAuctions">All Auctions</option>														
						</select>
			  		</td>
			  		
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
	                  
	            
    	</table>
	</form>

	<body>
			
		<section>
				<form action="searchAuctionHandler.jsp">
				<h3>Search Item</h3>
	
				<label for="sex">Sex:</label>

				<select name="sex" required>
				    <option disabled selected value> -- </option >
 					<option value="M">M</option>
  					<option value="F">F</option>
				</select>
							
				<label for="item">Items:</label>

				<select name="item" required>
				    <option disabled selected value> -- </option>
 					<option value="shirts">Shirts</option>
  					<option value="pants">Pants</option>
 					<option value="shoes">Shoes</option>
				</select>

				  <label for="username">Username:</label>
				  <input type="text" id = "pID" name = "pID" placeholder="Product ID.." required>
				  <input type="submit">
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
  					<option value="numerical">Numerical</option>
 					<option value="product">Product</option>
				</select>
				
				<label for="order">Order:</label>

				<select name="order" required>
				    <option disabled selected value> -- </option>
  					<option value="ascending">Ascending</option>
 					<option value="descending">Descending</option>
				</select>
				<button>Search</button>
				</form>
		</section>
		
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
				
</html>