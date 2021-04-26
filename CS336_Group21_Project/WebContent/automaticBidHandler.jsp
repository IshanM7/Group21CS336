<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%  // dans les THML <a href= 'EndUserHome.jsp' > backtoEndUserHome<a/> %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String accountId ;
	
	int userid = (Integer)session.getAttribute("userid");
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");	
		
		    // get accountID
		String username = session.getAttribute("user").toString();
		String str5 = " SELECT AccountId FROM Account WHERE Username ='"+username+"' ";
		PreparedStatement st6 = con.prepareStatement(str5);
		 ResultSet rsUserName = st6.executeQuery();
		 
		 rsUserName.next();
		  accountId = rsUserName.getString("AccountID");
		  int auctionP = (Integer)session.getAttribute("auctionId");
		   
		 // int auctionId = (Integer)session.getAttribute("auctionId");
		  
		  
		  String bidIncrementP = request.getParameter("bidIncrement");
		  int bidIncrement = Integer.parseInt(bidIncrementP);
		  
		   String limitP = request.getParameter("upperLimit");
		   double limit = Double.parseDouble(limitP);
		   
		   String bidPriceP = request.getParameter("bidPrice");
		   double bidPrice = Double.parseDouble(bidPriceP);
		   
		   
		   String sql = "UPDATE Auction SET CurrentBid = ?, CurrentBuyer = ? WHERE AuctionID = ?;";
		   String str = "SELECT a.CurrentBid as 'Current',a.InitialPrice as 'InitPrice', a.Increment as 'Increment', a.CurrentBuyer as 'CurrBuy' FROM Auction a WHERE a.AuctionID = '"+auctionP+"'"; 
		   Statement st = con.createStatement();
		   
		   ResultSet result = st.executeQuery(str);
		  
		   double current=-1;
		   double initPrice=0;
		   int increment=0;
		   int currentbuyer = 0;
		   if(result.next()){
		   currentbuyer = result.getInt("CurrBuy");
		   current = result.getDouble("Current");
		   initPrice = result.getDouble("InitPrice");
		   increment =  result.getInt("Increment");
		   
		   
		   
		   if ( bidIncrement < increment){
			   
			   out.println("Could not set bid. Increment lower than auction increment");
		   } 
		   
		   else if (current == 0 && bidPrice < initPrice){
			   out.println(" Bid lower than item's initial price.");
		   }
		   
		   else if (bidPrice < current+increment){
			   out.println("Could not set bid. bid value lower than current bid.");
		   }
		   else if (limit < bidPrice){
			   out.println("Could not set bid. Upper limit can not be lower than bid price.");}
		   
		  else {
		   
		   
		   		String str1 = "SELECT * FROM Bid WHERE AuctionID = '"+auctionP+"' ";
		   		 PreparedStatement st1 = con.prepareStatement(str1);
		    		ResultSet auctionRs = st1.executeQuery();
		    
		    		String str7 = "SELECT * FROM Bid WHERE AccountID ='"+accountId+"'AND AuctionID = '"+auctionP+"'";
    				PreparedStatement st7 = con.prepareStatement(str7);
    	    		ResultSet UserRs = st7.executeQuery();
    	    
    	    
		   		 	double maxBidPrice;
		    		int accountID = Integer.parseInt(accountId);
		    
		    
		    			if (!auctionRs.next()){ // no bid on the auction yet
		    	
		    			String str2 = "INSERT INTO Bid(Upper_Limit, Bid_Price, AccountID, AuctionID,bidIncrement) VALUES ('"+limit+"','"+bidPrice+"','"+accountId+"','"+auctionP+"','"+bidIncrement+"')";
						out.println();
		    			PreparedStatement st5 = con.prepareStatement(str2);
		    			st5.executeUpdate();
		    			out.println("new automatic bid set");
		    			
		    	 		PreparedStatement stmt = con.prepareStatement(sql);
				   		stmt.setDouble(1, bidPrice);
						stmt.setInt(2, userid);
						stmt.setInt(3, auctionP);
						stmt.executeUpdate();
		    	
		    			} else if (UserRs.next()) {  // There is at least a bid on the auction and the user is among the bidders
		    	
		    			String str8 = "SELECT MAX(Bid_Price)Bid_price from Bid WHERE AuctionID = "+auctionP+"";
	    	    		PreparedStatement st8 = con.prepareStatement(str8);
	    	    		ResultSet UserRs2 = st8.executeQuery();
	    	    		UserRs2.next();
	    	    		maxBidPrice = UserRs2.getDouble("Bid_price");
	    	    
	    	    
	    	    		int userIncrement = UserRs.getInt("bidIncrement");
	    	    		double userBid = UserRs.getDouble("Bid_Price");
	    	    		double userUpperLimit = UserRs.getDouble("Upper_Limit");
	    	    
	    	    
	    	    				
	    	    
	    	    		if (userBid < maxBidPrice && maxBidPrice <= userUpperLimit ){
	    	    			double newBid = maxBidPrice + userIncrement;
	    	    			String str9 = "UPDATE Bid SET Bid_Price ='"+newBid+"' WHERE AuctionID ='"+auctionP+"'AND AccountID ='"+accountId+"' ";
				    	    PreparedStatement st9 = con.prepareStatement(str9);
				    	    if(st9.executeUpdate()>0)
				    	    out.println("Bid updated on auction  "+auctionP);
				    	    PreparedStatement stmt = con.prepareStatement(sql);
							   stmt.setDouble(1, bidPrice);
								stmt.setInt(2, userid);
								stmt.setInt(3, auctionP);
								stmt.executeUpdate();
	    	    			
	    	    		}
	    	    		
	    	    			if (bidPrice > maxBidPrice && maxBidPrice < limit ){
	    	    			double newBid = bidPrice;
	    	    			String str9 = "UPDATE Bid SET Bid_Price ='"+newBid+"',Upper_Limit='"+limit+"' WHERE AuctionID ='"+auctionP+"'AND AccountID ='"+accountId+"' ";
				    	    PreparedStatement st9 = con.prepareStatement(str9);
				    	    if(st9.executeUpdate()>0)
				    	    out.println("Bid updated on auction  "+auctionP);
				    	    PreparedStatement stmt = con.prepareStatement(sql);
							   stmt.setDouble(1, newBid);
								stmt.setInt(2, userid);
								stmt.setInt(3, auctionP);
								stmt.executeUpdate();
	    	    			
	    	    			}   		
	  			
		    	
		   				 } else  { 
		    	
		    			String str8 = "SELECT MAX(Bid_Price)Bid_price from Bid WHERE AuctionID = "+auctionP+"";
	    	   			 PreparedStatement st8 = con.prepareStatement(str8);
	    	    		ResultSet UserRs2 = st8.executeQuery();
	    	    		UserRs2.next();
	    	    		maxBidPrice = UserRs2.getDouble("Bid_price");
	    	    
	    	  			if (bidPrice < maxBidPrice && maxBidPrice < limit ){
    					double newBid = maxBidPrice + bidIncrement;
    					String str2 = "INSERT INTO Bid(Upper_Limit, Bid_Price, AccountID, AuctionID,bidIncrement) VALUES ('"+limit+"','"+newBid+"','"+accountId+"','"+auctionP+"','"+bidIncrement+"')";		    	    
    					PreparedStatement st9 = con.prepareStatement(str2);
	    	    		
    						if(st9.executeUpdate()>0){
	    	    			out.println("new Bid inserted");}
	    	    		
    					PreparedStatement stmt = con.prepareStatement(sql);
				  		 stmt.setDouble(1, newBid);
						stmt.setInt(2, userid);
						stmt.setInt(3, auctionP);
						stmt.executeUpdate();
    	       			 }
	    	    
	    	 	 		 if (bidPrice > maxBidPrice && maxBidPrice < limit ){
	    				double newBid = bidPrice + bidIncrement;
	    				String str2 = "INSERT INTO Bid(Upper_Limit, Bid_Price, AccountID, AuctionID,bidIncrement) VALUES ('"+limit+"','"+newBid+"','"+accountId+"','"+auctionP+"','"+bidIncrement+"')";		    	    
	    				PreparedStatement st9 = con.prepareStatement(str2);
		    	    	
	    					if(st9.executeUpdate()>0){
		    	    		out.println("new Bid inserted");}
		    	    	
		    	    	PreparedStatement stmt = con.prepareStatement(sql);
					    stmt.setDouble(1, newBid);
						stmt.setInt(2, userid);
						stmt.setInt(3, auctionP);
						stmt.executeUpdate();
	    	    		} 		
		   				 }
			
	    	  			
	    	  			
		    }
		    
		    
		   } 
		   
	
	%>
	
	<a href='searchAuctions.jsp'>go Back</a>
</body>
</html>