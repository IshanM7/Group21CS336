<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>