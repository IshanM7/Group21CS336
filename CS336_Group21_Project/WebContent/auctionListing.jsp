<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction Listing</title>


</head>

<body>
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001"); 
		
		
		Statement stmt = con.createStatement();
		int userid = (Integer)session.getAttribute("userid");
		String lookup = request.getParameter("lookup");
		
		String sql1 = "select Distinct A.accountid, A.auctionid from Bid A where A.accountid = "+lookup+" order by A.auctionid;";
		ResultSet rs = stmt.executeQuery(sql1);
		int x = 0;
		if(rs.next()){%>
			<h1> Auctions for Account <%out.println(rs.getInt("accountid")); %> </h1>
			<table>
						 		<tr>
						 			<th>Auction ID</th>
						 			<th>Account ID</th>
						 			<th></th>
						 		</tr>
					<%do{x++;%>
					 			<tr>
					 				<td> <%out.println((rs.getInt("Auctionid"))); %></td>
					 				<td><% out.println(rs.getInt("Accountid"));%></td>
					 			</tr>
<%
					}while(rs.next()); 
					}
		if(x == 0){%>			
		<h1>Invalid Account ID</h1>
		
		<%
			}
					%>
					 		</table>
					<a href='searchAuctions.jsp'>Return to Browse</a>
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
				</body>
				</html>		