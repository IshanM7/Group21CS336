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
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001"); 
		
		
		Statement stmt = con.createStatement();
		String category = request.getParameter("category");
		String sql = "";
		int userid = (Integer)session.getAttribute("userid");
		
		
		if(category.equals("allAuctions"))	
			sql = "SELECT * FROM AUCTION WHERE sold = 0;";
			
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){%>
		
			<h1> All Auctions</h1>
			<%do{
				int PID = rs.getInt("ProductID");
				PreparedStatement st = con.prepareStatement("SELECT * FROM Apparel Where ProductID = ?");
			    st.setInt(1,PID);
			    ResultSet product = st.executeQuery();
			    product.next();				
			%>		 		
		 			<%if(product.getString("type").equals("shirt")){ %>		 					 		
				 		<form method = "post" action = "bidhandler.jsp?aucId=<%=rs.getInt("AuctionID")%>">		 					 			
					 		<table>
						 		<tr>
						 			<th>Auction ID</th>
						 			<th>Type</th>
						 			<th>End Date</th>
						 			<th>Initial Price</th>											 							 			
						 			<th>CurrentBid</th>
						 			<th>Category</th>
						 			<th>Size</th>
						 			<th>Color</th>
						 			<th></th>
						 		</tr>
					 			
					 			<tr>
					 				<td><%out.println(rs.getInt("AuctionID")); %> </td>
					 				<td><%out.println("<a> Shirt </a>"); %></td>
					 				<td style="text-align:center"><%out.println((rs.getString("End_Date")).substring(5,10)); %></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("InitialPrice"));%></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("CurrentBid"));%></td>
					 				<td><% out.println(product.getString("Shirt_Type"));%></td>
					 				<td><% out.println(product.getString("Shirt_size"));%></td>
					 				<td><% out.println(product.getString("Color"));%></td>				                   
					 			</tr>
				                
					 		</table>
				 			<%if((Integer)session.getAttribute("userid") != rs.getInt("AccountID") && (Integer)session.getAttribute("role") == 3) {%>					 									 								 									 									 									 			
						 			Place Bid: <input required type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />			                   					 								 																				                
				                    Setup Automatic Bidding	<input type="number" name = "automatic" min = <%=rs.getDouble("CurrentBid")+ rs.getInt("Increment")-1%> step = ".01" />
				                    
				                     <input type="submit" value="Submit"/>					 		
				 			<%}%>			                
					 	</form>
					 	<br/>
					 	<%if(((Integer)session.getAttribute("role")) < 3 || ((Integer)session.getAttribute("userid")) == rs.getInt("AccountID")){ %>
					 		<form method="post" action="deleteAuction.jsp?aid=<%=rs.getInt("AuctionID")%>&seller=<%=rs.getInt("AccountID")%>">	
					 			<input type = "submit" value = "Delete Auction"> 
					 			
					 		</form>	 
					 		<br/>
					 	<% }%>
					 	
			 		<%}else if(product.getString("type").equals("pant")){ %>
			 			<form method = "post" action = "bidhandler.jsp?aucId=<%=rs.getInt("AuctionID")%>">		 					 			
					 		<table>
						 		<tr>
						 			<th>Auction ID</th>
						 			<th>Type</th>
						 			<th>End Date</th>
						 			<th>Initial Price</th>											 							 			
						 			<th>CurrentBid</th>
						 			<th>Waist Size</th>
						 			<th>Length</th>
						 			<th>Color</th>
						 			<th></th>
						 		</tr>
					 			
					 			<tr>
					 				<td><%out.println(rs.getInt("AuctionID")); %> </td>
					 				<td><%out.println("<a> Pants </a>"); %></td>
					 				<td style="text-align:center"><%out.println((rs.getString("End_Date")).substring(5,10)); %></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("InitialPrice"));%></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("CurrentBid"));%></td>
					 				<td ><% out.println(product.getInt("Waist_Size"));%></td>
					 				<td><% out.println(product.getInt("Length"));%></td>
					 				<td><% out.println(product.getString("Color"));%></td>				                   
					 			</tr>
				                
					 		</table>
				 				<% 
				 			if((Integer)session.getAttribute("userid") != rs.getInt("AccountID") && (Integer)session.getAttribute("role") == 3) {%>					 									 								 									 									 									 			
						 			Place Bid: <input  required type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />			                   					 								 																				                
				                    Setup Automatic Bidding	<input type="number" name = "automatic" min = <%=rs.getDouble("CurrentBid")+ rs.getInt("Increment")-1%> step = ".01" />
				                     <input type="submit" value="Submit"/>
				 			<%}%>			                
					 	</form>
					 	<br/>
					 	<%if(((Integer)session.getAttribute("role")) < 3|| ((Integer)session.getAttribute("userid")) == rs.getInt("AccountID") ){ %>
					 		<form method="post" action="deleteAuction.jsp?aid=<%=rs.getInt("AuctionID")%>&seller=<%=rs.getInt("AccountID")%>">	
					 			<input type = "submit" value = "Delete Auction"> 
					 			
					 		</form>	 
					 		<br/>
					 	<% }%>
			 		
			 		
			 		
			 		<%}else{ %>
			 		
			 			<form method = "post" action = "bidhandler.jsp?aucId=<%=rs.getInt("AuctionID")%>">		 					 			
					 		<table>
						 		<tr>
						 			<th>Auction ID</th>
						 			<th>Type</th>
						 			<th>End Date</th>
						 			<th>Initial Price</th>											 							 			
						 			<th>CurrentBid</th>
						 			<th>Shoe Size</th>
						 			<th>Color</th>
						 			<th></th>
						 		</tr>
					 			
					 			<tr>
					 				<td><%out.println(rs.getInt("AuctionID")); %> </td>
					 				<td><%out.println("<a> Shoes </a>"); %></td>
					 				<td style="text-align:center"><%out.println((rs.getString("End_Date")).substring(5,10)); %></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("InitialPrice"));%></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("CurrentBid"));%></td>
					 				<td><% out.println(product.getDouble("Shoe_Size"));%></td>
					 				<td><% out.println(product.getString("Color"));%></td>				                   
					 			</tr>
				                
					 		</table>
				 			<%if((Integer)session.getAttribute("userid") != rs.getInt("AccountID") && (Integer)session.getAttribute("role") == 3) {%>					 									 								 									 									 									 			
						 			Place Bid: <input required type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />			                   					 								 																				                
				                    Setup Automatic Bidding	<input type="number" name = "automatic" min = <%=rs.getDouble("CurrentBid")+ rs.getInt("Increment")-1%> step = ".01" />
				                     
				                     <input type="submit" value="Submit"/>					 		
				 			<%}%>			                
					 	</form>
					 	<br/>
					 	<%if(((Integer)session.getAttribute("role")) < 3 || ((Integer)session.getAttribute("userid")) == rs.getInt("AccountID") ){ %>
					 		<form method="post" action="deleteAuction.jsp?aid=<%=rs.getInt("AuctionID")%>&seller=<%=rs.getInt("AccountID")%>">	
					 			<input type = "submit" value = "Delete Auction"> 
					 			
					 		</form>	 
					 		<br/>
					 	<% }%>
			 		<%} %>
			 		

		<%}while(rs.next()); 
		}
		%>
</body>
</html>