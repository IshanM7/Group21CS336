
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		table,td, th{
		  border: 1px solid black;
		  width: 25%
		}
		
		table {
		  border-collapse: collapse;
		  
		}
		
		td {
		  text-align: center;
		}
	</style>
	<meta charset="UTF-8">
	<title>Sales Reports</title>
</head>
<body>

		

	
    	<div>

    		<% 
			    Class.forName("com.mysql.jdbc.Driver").newInstance();
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
    			String type = request.getParameter("type"); 
    			
    			
    			
    			if(type.equals("totalEarnings")){
    				
    				PreparedStatement st = con.prepareStatement("SELECT SUM(WinningBid) as 'WinningBid' FROM Auction");
    				ResultSet rs = st.executeQuery();
    				out.println("<h1> Total Earnings </h1>");	
    				if(rs.next()){
    					double totalEarnings = rs.getDouble("WinningBid");
    					out.println("<a> Total earnings from all Auctions is  "+totalEarnings+"</a>");
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				out.println("<a href='adminHome.jsp'>Return to Home</a>");
    			}
    			
    			if(type.equals("earningsPerItem")){
    				PreparedStatement st = con.prepareStatement("SELECT AuctionID, WinningBid From Auction WHERE WinningBid > 0 Group by AuctionID;");
    				ResultSet rs = st.executeQuery();
    				out.println("<h1> Earnings Per Item </h1>");
    				
    				if(rs.next()){
    					do{%>
    						<table>
    							<tr>
    								<th>Auction ID</th>
    								<th>Earnings From Auction</th>
    							</tr>
    							<tr>
    								<td><%out.println(rs.getInt("AuctionID"));%></td>
    								<td><%out.println("$"+rs.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs.next());
    					
    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				
    				out.println("<a href='adminHome.jsp'>Return to Home</a>");
    			}
    			
    			if(type.equals("earningsPerType")){
    				PreparedStatement st = con.prepareStatement("SELECT ap.Type, sum(a.WinningBid) as 'WinningBid' From Auction a, Apparel ap Where Sold = 1 AND CurrentBuyer > 0 AND ap.ProductID = a.ProductID Group By ap.Type;");
    				ResultSet rs1 = st.executeQuery();    				
    				out.println("<h2> Earnings Per Type </h2>");	
    				if(rs1.next()){
    					do{
    						String x = rs1.getString("Type");%>
    						<table>
    							<tr>
    								<th>Apparel Category</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>
    								<td>
    								<%	if(x.equals("shirt"))
    										out.println("Shirts");
    									if(x.equals("shoe"))
											out.println("Shoes");
    									if(x.equals("pant"))
											out.println("Pants");
    								%></td>
    								<td><%out.println("$"+rs1.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs1.next());
    					    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				out.println("</br>");
    				out.println("<h2> Earnings Per Shirt Type </h2>");	
    				PreparedStatement st2 = con.prepareStatement("Select ap.Shirt_Type, SUM(a.WinningBid) as 'WinningBid' FROM Auction a, Apparel ap WHERE a.ProductID = ap.ProductID AND a.sold = 1 AND ap.Type = 'shirt' GROUP BY Shirt_Type;");
    				ResultSet rs2 = st2.executeQuery(); 
    				if(rs2.next()){
    					do{
    						String x = rs2.getString("Shirt_Type");	%>
    						<table>
    							<tr>
    								<th>Shirt Type</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>
    								<td>
    								<%	if(x.equals("tank")) 
    										out.println("Tank Top");
    									if(x.equals("short")) 
											out.println("Short Sleeve");
    									if(x.equals("long")) 
											out.println("Long Sleeve");
    									if(x.equals("sweater")) 
											out.println("Sweater");
    								%></td>
    								<td><%out.println("$"+rs2.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs2.next());
    					    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				out.println("</br>");
    				out.println("<h2> Earnings Per Shoe Size </h2>");
    				PreparedStatement st3 = con.prepareStatement("Select ap.Shoe_Size, SUM(a.WinningBid) as 'WinningBid' FROM Auction a, Apparel ap WHERE a.ProductID = ap.ProductID AND a.sold = 1 AND ap.Type = 'shoe' AND a.WinningBid > 0 GROUP BY Shoe_Size;");
    				ResultSet rs3 = st3.executeQuery(); 
    				if(rs3.next()){
    					do{%>
    						<table>
    							<tr>
    								<th>Shoe Size</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>
    								<td><%out.println(rs3.getString("Shoe_Size"));%></td>
    								<td><%out.println("$"+rs3.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs3.next());
    					    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				
    				out.println("</br>");
    				out.println("<h2> Earnings Per Pants Sizes </h2>");
    				PreparedStatement st4 = con.prepareStatement("Select ap.Waist_Size,ap.Length, SUM(a.WinningBid) as 'WinningBid' FROM 336Project.Auction a, 336Project.Apparel ap WHERE a.ProductID = ap.ProductID AND a.sold = 1 AND ap.Type = 'pant' AND a.WinningBid > 0 GROUP BY ap.Waist_Size, ap.Length;");
    				ResultSet rs4 = st4.executeQuery(); 
    				if(rs4.next()){
    					do{%>
    						<table>
    							<tr>
    								<th>Waist Size</th>
    								<th>Length</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>
    								<td><%out.println(rs4.getString("Waist_Size"));%></td>
    								<td><%out.println(rs4.getString("Length"));%></td>
    								<td><%out.println("$"+rs4.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs4.next());
    					    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				
    				out.println("</br>");
    				out.println("<h2> Earnings By Color </h2>");
    				PreparedStatement st5 = con.prepareStatement("Select ap.Color, SUM(a.WinningBid) as 'WinningBid' FROM 336Project.Auction a, 336Project.Apparel ap WHERE a.ProductID = ap.ProductID AND a.sold = 1 GROUP BY ap.Color ORDER BY WinningBid DESC;");
    				ResultSet rs5 = st5.executeQuery(); 
    				if(rs5.next()){
    					do{%>
    						<table>
    							<tr>
    								<th>Color</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>    								
    								<td><%out.println(rs5.getString("Color"));%></td>
    								<td><%out.println("$"+rs5.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs5.next());
    					    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				
    				out.println("<a href='adminHome.jsp'>Return to Home</a>");
    			}
    			
    			if(type.equals("earningsPerEndUser")){
    				PreparedStatement st = con.prepareStatement("SELECT AccountID, sum(WinningBid) as 'WinningBid' FROM Auction GROUP BY AccountID;");
    				ResultSet rs = st.executeQuery();
    				
    				out.println("<h1>Earnings Per User</h1>");
    				if(rs.next()){
    					do{%>
    						<table>
    							<tr>
    								<th>Account ID</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>
    								<td><%out.println(rs.getInt("AccountID"));%></td>
    								<td><%out.println("$"+rs.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs.next());
    					
    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				
    				out.println("<a href='adminHome.jsp'>Return to Home</a>");
    			}
    			
    			if(type.equals("bestSelling")){
    				PreparedStatement st = con.prepareStatement("SELECT ap.Type, sum(a.WinningBid) as 'WinningBid' From Auction a, Apparel ap Where Sold = 1 AND CurrentBuyer > 0 AND ap.ProductID = a.ProductID Group By ap.Type ORDER BY WinningBid DESC;");
    				ResultSet rs = st.executeQuery();
    				out.println("<h1>Best Selling Items</h1>");
    				if(rs.next()){
    					do{%>
    						<table>
    							<tr>
    								<th>Item Category</th>
    								<th>Total Earnings</th>
    							</tr>
    							<tr>
    								<td><%out.println(rs.getString("ap.Type"));%></td>
    								<td><%out.println("$"+rs.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs.next());
    					
    					
    				}else{
    					out.println("<a> There was an error </a>");
    				}    				
    				out.println("<a href='adminHome.jsp'>Return to Home</a>");
    			}
    			
    			if(type.equals("bestBuyers")){
    				
    				PreparedStatement st = con.prepareStatement("SELECT CurrentBuyer, sum(WinningBid) as 'WinningBid' From Auction Where Sold = 1 AND CurrentBuyer > 0 Group By CurrentBuyer ORDER BY WinningBid DESC;");
    				ResultSet rs = st.executeQuery();
    				
    				out.println("<h1>Best Buyers</h1>");
    				if(rs.next()){
    					do{%>
    						
    						<table>
    							<tr>
    								<th>Account id</th>
    								<th>Total Spent</th>
    							</tr>
    							<tr>
    								<td><%out.println(rs.getInt("CurrentBuyer"));%></td>
    								<td><%out.println("$"+rs.getDouble("WinningBid"));%></td>
    							</tr>
    						
    						</table>
    					<%}while(rs.next());    					    				
    				}else{
    					out.println("<a> There was an error </a>");
    				}
    				out.println("<a href='adminHome.jsp'>Return to Home</a>");
    			}
    			
    		%>
    	</div>
</body>
</html>