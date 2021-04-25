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
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "Gum50dad"); 
		
		
		Statement stmt = con.createStatement();
		int userid = (Integer)session.getAttribute("userid");
		
		Statement stmt1 = con.createStatement();
		String category = request.getParameter("type");
		String sex = request.getParameter("sex");
		String type = request.getParameter("item");
		String color = request.getParameter("color");
		String sql1 = "";
		String sql_sel = "";
		String sql_order = ";";
		String sql_where = "";
		sql_sel = "select A.accountid, B.sex, B.type, A.end_date, A.initialprice, A.currentbid, A.ProductID, A.AuctionID, B.color from Auction A, Apparel B";
		sql_where = " where A.productid = b.productid and a.sold = 0";		
		
		
		if(category != null){
			if(category.equals("price"))	
				sql_order = " order by A.initialprice;";
			else if(category.equals("color"))
				sql_order = " order by B.color;";
			else if(category.equals("type"))
				sql_order = " order by B.type;";	
		}
		if(sex != null){
			sql_where+= " and B.sex = '"+sex+"' ";
		}
		else if(type != null){
			sql_where+= " and B.type = '"+type+"' ";
		}
		else if(color!= null){
			sql_where+= " and B.color = '"+color+"' ";
		}
			
		sql1 += sql_sel +sql_where + sql_order;
		
			
		ResultSet rs = stmt.executeQuery(sql1);
		
		if(rs.next()){%>
		
			<h1> All Auctions</h1>
			<%do{
				int PID = rs.getInt("ProductID");
				PreparedStatement st = con.prepareStatement("SELECT * FROM Apparel Where ProductID = ?");
			    st.setInt(1,PID);
			    ResultSet product = st.executeQuery();
			    product.next();				
%>
			
		 			<%if(product.getString("type").equals("shirt")){ 	%>		 					 		
				 		<form method = "post" action = "bidhandler.jsp?aucId=<%=rs.getInt("AuctionID")%>">		 					 			
					 		<table>
						 		<tr>
						 			<th>Auction ID</th>
						 			<th>Type</th>
						 			<th>Sex</th>
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
					 				<td style="text-align:center"><%out.println((rs.getString("Sex"))); %></td>
					 				<td style="text-align:center"><%out.println((rs.getString("End_Date")).substring(5,10)); %></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("InitialPrice"));%></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("CurrentBid"));%></td>
					 				<td><% out.println(product.getString("Shirt_Type"));%></td>
					 				<td><% out.println(product.getString("Shirt_size"));%></td>
					 				<td><% out.println(product.getString("Color"));%></td>				                   
					 			</tr>
				                
					 		</table>
				 			<%if((Integer)session.getAttribute("userid") != rs.getInt("AccountID") && (Integer)session.getAttribute("role") == 3) {%>					 									 								 									 									 									 			
						 			Place Bid: <input type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />	
						 			           <input type="Button" value="Set up Automatic Bidding" onclick="window.location.replace('automaticBidding.jsp?AucID=<%=rs.getInt("AuctionID")%>')"/>
						 			           <input type="Button" value="Bid History" onclick="window.location.replace('bidHistory.jsp?AucID=<%=rs.getInt("AuctionID")%>')"/>
						 			           <input type="Button" value="Look For Similar Items" onclick="window.location.replace('similarityChecker.jsp?typeid=<%=rs.getString("type")%>&sexid=<%=rs.getString("sex")%>&color=<%=rs.getString("color")%>&aucid=<%=rs.getString("auctionID")%>')"/>				                     
				             
				                    
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
						 			<th>Sex</th>
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
					 				<td style="text-align:center"><%out.println((rs.getString("Sex"))); %></td>
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
						 			Place Bid: <input type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />		
						 				                   					 								 																				                
				                    <input type="Button" value="Set up Automatic Bidding" onclick="window.location.replace('automaticBidding.jsp?AucID=<%=rs.getInt("AuctionID")%>')"/>
			 			           <input type="Button" value="Bid History" onclick="window.location.replace('bidHistory.jsp?AucID=<%=rs.getInt("AuctionID")%>')"/>
						 			           <input type="Button" value="Look For Similar Items" onclick="window.location.replace('similarityChecker.jsp?typeid=<%=rs.getString("type")%>&sexid=<%=rs.getString("sex")%>&color=<%=rs.getString("color")%>&aucid=<%=rs.getString("auctionID")%>')"/>				                     
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
						 			<th>Sex</th>
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
					 				<td style="text-align:center"><%out.println((rs.getString("Sex"))); %></td>
					 				<td style="text-align:center"><%out.println((rs.getString("End_Date")).substring(5,10)); %></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("InitialPrice"));%></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("CurrentBid"));%></td>
					 				<td><% out.println(product.getDouble("Shoe_Size"));%></td>
					 				<td><% out.println(product.getString("Color"));%></td>				                   
					 			</tr>
				                
					 		</table>
				 			<%if((Integer)session.getAttribute("userid") != rs.getInt("AccountID") && (Integer)session.getAttribute("role") == 3) {%>					 									 								 									 									 									 			
						 			Place Bid: <input required type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />			                   					 								 																				                
				                    <input type="Button" value="Set up Automatic Bidding" onclick="window.location.replace('automaticBidding.jsp?AucID=<%=rs.getInt("AuctionID")%>')"/>
			 			           <input type="Button" value="Bid History" onclick="window.location.replace('bidHistory.jsp?AucID=<%=rs.getInt("AuctionID")%>')"/>
						 			           <input type="Button" value="Look For Similar Items" onclick="window.location.replace('similarityChecker.jsp?typeid=<%=rs.getString("type")%>&sexid=<%=rs.getString("sex")%>&color=<%=rs.getString("color")%>&aucid=<%=rs.getString("auctionID")%>')"/>				                     
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
			
				<a href='bidHandlerView.jsp'>View Bids</a>
		<a href='endUserHome.jsp'>Return to Home</a>
		<a href='logout.jsp'>Log out</a>
	
</body>
</html>