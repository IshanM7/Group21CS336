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
		String addBid = "Insert into Bid(Bid_Price, AccountID, AuctionID) values (" + Double.toString(bid) +", " + session.getAttribute("userid") + ", " + request.getParameter("aucId") +" );";
		PreparedStatement stmt2 = con.prepareStatement(addBid);
		int i2 = stmt2.executeUpdate();
		if(i2>0){
			System.out.println("Gucci");
			
		}
		else{
			System.out.println("Nope");
		}
		
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
	String addBid = "Insert into Bid(Bid_Price, AccountID, AuctionID) values (" + Double.toString(bid) +", " + session.getAttribute("userid") + ", " + request.getParameter("aucId") +" );";
	PreparedStatement stmt2 = con.prepareStatement(addBid);
	int i2 = stmt2.executeUpdate();
	if(i2>0){
		System.out.println("Gucci");
		
	}
	else{
		System.out.println("Nope");
	}
	int i = stmt.executeUpdate();
	if(i>0){
		if(currentbuyer != (Integer)session.getAttribute("userid")){
			Statement c = con.createStatement();			
			String check = "Select * FROM Alert WHERE AuctionId = "+auctionID+" AND AccountID = "+currentbuyer+";";
			ResultSet rs = c.executeQuery(check);
			if(rs.next()){
				String update = "UPDATE Alert SET Alert = 'You have been outbid again' WHERE AccountId = "+currentbuyer+" AND AuctionID = "+auctionID+";";
				Statement up = con.createStatement();
				int err = up.executeUpdate(update);
				if(err > 0){
					System.out.println("Worked");
				}
				else{
					System.out.println("Failed");				
				}
			}else{
				
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

</body>
</html>