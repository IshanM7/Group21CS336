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
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
				</body>
				</html>		

		
