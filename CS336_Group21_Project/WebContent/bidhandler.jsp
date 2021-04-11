<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "SamiraSamira12!");
String sql = "UPDATE Auction SET CurrentBid = ? WHERE AuctionID = ?;";
double bid = Double.parseDouble(request.getParameter("userBid"));
int auctionID = Integer.parseInt(request.getParameter("aucId2"));
String view = request.getParameter("aucId2");
String str = "SELECT a.CurrentBid as 'Current',a.InitialPrice as 'InitPrice', a.Increment as 'Increment' FROM Auction a WHERE a.AuctionID = " + view; 


Statement st = con.createStatement();
ResultSet result = st.executeQuery(str);
double current=0;
double initPrice=0;
int increment=0;
if(result.next()){
current = result.getDouble("Current");
initPrice = result.getDouble("InitPrice");
increment =  result.getInt("Increment");
}

if(current == 0){
	if(bid>=initPrice+increment){
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setDouble(1, bid);
		stmt.setInt(2, auctionID);
		int i = stmt.executeUpdate();
		if(i>0){

			%>  Bid Placed!
			  <li><a href="searchAuctions.jsp">View The Auction with ID = <%out.print(auctionID); %></a></li> 
		<%
		}
		else{
			out.print("Failed to place bid.");
		}
	}
}
else if(bid>=current+increment){
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setDouble(1, bid);
	stmt.setInt(2, auctionID);
	int i = stmt.executeUpdate();
	if(i>0){

		%>Bid Placed!
		  <li><a href="searchAuctions.jsp">View The Auction with ID = <%out.print(auctionID); %></a></li>	 
	<%
	}
	else{
		out.print("Failed to place bid.");
	}
}
else{
	%>Bid is not incremented enough from current bid or initial price
	  <li><a href="bidPlacement.jsp">Place the bid again with ID = <%out.print(auctionID); %></a></li> 
	 <% 
}


%>

</body>
</html>