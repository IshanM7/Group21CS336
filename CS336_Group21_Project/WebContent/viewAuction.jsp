<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Auction</title>
</head>
<body>

	<% 
		String view = request.getParameter("aucId2");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");
	    String str = "SELECT a.ProductID as 'Product',a.CurrentBid as 'Current',a.Start_Date as 'Start Date',a.InitialPrice as 'InitPrice', a.End_Date as 'End Date', a.Increment as 'Minimum Increment' FROM Auction a WHERE a.AuctionID = " + view; 
	    Statement stmt = con.createStatement();
	    ResultSet result = stmt.executeQuery(str);
		
		
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Product:");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Current Bid:");
			out.print("</td>");
			out.print("<td>");
			out.print("Initial Price:");
			out.print("</td>");
			out.print("<td>");
			out.print("Minimum Increment:");
			out.print("</td>");
			//make a column
			
			out.print("<td>");
			out.print("End Date:");
			out.print("</td>");
			out.print("</tr>");
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("Product"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("Current"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("InitPrice"));
				out.print("</td>");
				out.print("<td style = 'text-align:center'>");
				
				//Print out current bar name:
				out.print(result.getString("Minimum Increment"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("End Date"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		
		
	
	%>
	
<form action = "bidhandler.jsp?aucId=<%=view%>" method = POST>
<h2>Confirm your bid</h2>
Bid:<input type="number" default = 0 name="bid"required/><br/>
<input type = "submit" value = "Place bid" />
</form>

<input type="button" value="Go Back to search auctions" onclick="window.location='searchAuctions.jsp'" />



</body>
</html>