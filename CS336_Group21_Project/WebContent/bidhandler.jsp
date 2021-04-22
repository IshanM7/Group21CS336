<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bidding</title>
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");
String sql = "UPDATE Auction SET CurrentBid = ?, CurrentBuyer = ? WHERE AuctionID = ?;";
double bid = Double.parseDouble(request.getParameter("bid"));
int auctionID = Integer.parseInt(request.getParameter("aucId"));
String view = request.getParameter("aucId");
String str = "SELECT a.CurrentBid as 'Current',a.InitialPrice as 'InitPrice', a.Increment as 'Increment', a.CurrentBuyer as 'CurrBuy' FROM Auction a WHERE a.AuctionID = " + view; 
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
}
if(current == 0){	
	if(bid>=initPrice+increment){
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setDouble(1, bid);
		stmt.setInt(2, (Integer)session.getAttribute("userid"));
		stmt.setInt(3, auctionID);
		int i = stmt.executeUpdate();
		
		if(i>0){
			if(currentbuyer != (Integer)session.getAttribute("userid")){
				String alert = "Insert into Alert(AccountID, AuctionID, Alert) values ("+currentbuyer+", "+auctionID+", 'You have been outbid!')";
				PreparedStatement stmt1 = con.prepareStatement(alert);
			}
			%>  Bid Placed!
			  <li><a href="searchAuctions.jsp">View The Auction with ID = <% out.print(auctionID); %></a></li> 
		<%
	}
		else{
			
			out.print("Failed to place bid.");
			%><li>
		  <form action = "viewAuction.jsp?aucId2=<%=view%>" method = POST>
		  <input type="submit" value="Place a bid again" /></a>
		  </form>
		  </li>  <% 
		}
		
	}else{
		%>Bid is not incremented enough from current bid or initial price
		  <li>
		  <form action = "viewAuction.jsp?aucId2=<%=view%>" method = POST>
		  <input type="submit" value="Place a bid again" /></a>
		  </form>
		  </li> 
		 <% 
	}
}
else if(bid>=current+increment){
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setDouble(1, bid);
	stmt.setInt(2, (Integer)session.getAttribute("userid"));
	stmt.setInt(3, auctionID);
	int i = stmt.executeUpdate();
	if(i>0){
		if(currentbuyer != (Integer)session.getAttribute("userid")){
			String alert = "Insert into Alert(AccountID, AuctionID, Alert) values ("+currentbuyer+", "+auctionID+", 'You have been outbid!')";
			PreparedStatement stmt1 = con.prepareStatement(alert);
			int i1 = stmt1.executeUpdate();
			if(i1>0){
				System.out.println("Worked");
			}
			else{
				System.out.println(alert);
			}
		}
		%>Bid Placed!
		  <li><a href="searchAuctions.jsp">View The Auction with ID = <%out.print(auctionID); %></a></li>	 
	<%
	}
	else{
		out.print("Failed to place bid.");
		%><li>
		  <form action = "viewAuction.jsp?aucId2=<%=view%>" method = POST>
		  <input type="submit" value="Place a bid again" /></a>
		  </form>
		  </li>  <% 
	}
}
else{
	%>Bid is not incremented enough from current bid or initial price
	  <li>
	  <form action = "viewAuction.jsp?aucId2=<%=view%>" method = POST>
	  <input type="submit" value="Place a bid again" /></a>
	  </form>
	  </li> 
	 <% 
	}
%>

</body>
</html>