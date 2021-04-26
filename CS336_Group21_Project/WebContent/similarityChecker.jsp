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
		int userid = (Integer)session.getAttribute("userid");
		
		Statement stmt1 = con.createStatement();
		String type = request.getParameter("typeid");
		String sex = request.getParameter("sexid");
		String color = request.getParameter("color");
		String aucID = request.getParameter("aucid");
		
		String sql = "select A.accountid, B.sex, B.type, A.end_date, A.initialprice, A.currentbid, A.ProductID, A.AuctionID, B.color from Auction A, Apparel B where A.productid = b.productid and b.type = '"+type+"' and b.color = '"+color+"' and b.sex = '"+sex+"'and a.auctionID != "+aucID;
		
		ResultSet rs = stmt.executeQuery(sql);
		int x = 0;		
		if(rs.next()){%>
		
			<h1> All Auctions</h1>
			<%do{x++;
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
					 	</form>
					 	<br/>
					 	
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
				 				<% %>			                
					 	</form>
					 	<br/>			 		
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
				 						                
					 	</form>
					 	<br/>
			 		<%} %>
			 		

		<%}while(rs.next()); 
		}if(x == 0){
			%>			
			<h1>There are No Similarities</h1>
			
			<%
		}
		%>
		
		
</body>
</html>