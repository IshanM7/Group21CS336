<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Bid</title>
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001"); 
	
		Statement st = con.createStatement();
		int bid = (Integer.parseInt(request.getParameter("bid")));
		int price = (Integer.parseInt(request.getParameter("price")));
		int aid = (Integer.parseInt(request.getParameter("aid")));
		
		
		
		String delete = "Delete FROM Bid WHERE BidID = "+bid+";";
		int i  = st.executeUpdate(delete);
		if(i > 0){
			out.println("Bid deleted");
		}else{
			out.println("Failed to delete bid<br/>");
		}
		//Update Current Bid incase you deleted the current bid
		
		Statement st2 = con.createStatement();
		String update = " SELECT MAX(b.bid_price) as 'curr' FROM Bid b, Auction a  WHERE b.AuctionID = a.AuctionID AND a.AuctionID = "+aid+";";
		ResultSet rs = st2.executeQuery(update);
		if(rs.next()){
			double curr = (Double)rs.getDouble("curr");
			Statement st3 = con.createStatement();
			String updateAuction = "UPDATE Auction SET CurrentBid = "+curr+"WHERE AuctionID = "+aid+";";
			int x = st3.executeUpdate(updateAuction);
			if(x > 0){
				out.println("Current price updated");
			}else{
				out.println("Failed to update current price");
			}
		}
	
	%>
	<a href='customerRepHome.jsp'>Go Home</a>
</body>
</html>