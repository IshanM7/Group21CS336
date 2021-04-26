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
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");
String view = request.getParameter("AucID");
String str = "SELECT * FROM Auction WHERE AuctionID = " + view; 
out.print("Auc id: "+ view+"\n");
int auctionID = Integer.parseInt(view);
session.setAttribute("auctionId", auctionID);
int userid = (Integer)session.getAttribute("userid");
out.print("Account id: "+ userid);
String accountId ;
userid = (Integer)session.getAttribute("userid");
  %> 

<form method="get" action="automaticBidHandler.jsp">
<tr>
	      <td>Set an automatic bid increment: <input type="number" name="bidIncrement" required/></td>
	     
		</tr>
<tr>
   		
	      <td>Set a upper limit: <input type="number" name="upperLimit" required/></td>
	      <td>Set a Bid Price: <input type="number" name="bidPrice" required/></td>
   		</tr>
		<input type="submit" value="Set your Bid">
	</form>


<a href='searchAuctions.jsp'>go Back</a>

</body>
</html>