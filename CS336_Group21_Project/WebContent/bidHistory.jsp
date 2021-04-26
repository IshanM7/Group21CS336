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
		String view = request.getParameter("AucID");
		
		
		Statement stmt = con.createStatement();
		int userid = (Integer)session.getAttribute("userid");
		
		String sql1 = "select A.bidid, A.upper_limit, A.bid_price, A.accountid, A.auctionid from Bid A where A.auctionid = "+view+" order by A.bidid;";
		ResultSet rs = stmt.executeQuery(sql1);
		int x = 0;
		if(rs.next()){%>
			<h1> All Bids</h1>
			<table>
						 		<tr>
						 			<th>Bid ID</th>
						 			<th>Auction ID</th>
						 			<th>Bid Price</th>
						 			<th>Account ID</th>
						 			<th></th>
						 		</tr>
					<%do{
					x++;%>
					 			<tr>
					 				<td><%out.println(rs.getInt("BidID")); %> </td>
					 				<td> <%out.println((rs.getInt("Auctionid"))); %></td>
					 				<td> <% out.println(rs.getDouble("Bid_Price"));%></td>
					 				<td><% out.println(rs.getInt("Accountid"));%></td>
					 				<td>
					 					<%if((Integer)session.getAttribute("role") < 3){ %>
						 					<form action = "deleteBid.jsp?bid=<%=(Integer)rs.getInt("BidID")%>&price=<%=(Integer)rs.getInt("Bid_Price")%>&aid=<%=rs.getInt("Auctionid") %>" method = "POST">
						 						<input type="submit" value="Delete bid" /></a>
						 					</form>	
						 				<%} %>
					 				</td>
					 			</tr>
					 			
				                
					
					<%
					}while(rs.next()); 
					}
		if(x == 0){%>			
		<h1> No Bids Yet</h1>
		
		<%
			}
					%>
	 		</table>
	 		
	 		<%
	 		int role = (Integer)session.getAttribute("role");
			if(role == 1){
				out.println("<a href='adminHome.jsp'>Go Home</a>");
			}
			if(role == 2){
				out.println("<a href='customerRepHome.jsp'>Go Home</a>");
			}
			if(role == 3){
				out.println("<a href='endUserHome.jsp'>Go Home</a>");
			}
	 		%>
	 	<a href='logout.jsp'>Log out</a>
	 		
</body>
</html>	