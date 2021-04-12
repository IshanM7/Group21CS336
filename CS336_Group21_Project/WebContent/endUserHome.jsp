<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.Timestamp" %> 
 <%@ page import ="java.time.LocalDateTime" %> 
 <%@ page import ="java.time.format.DateTimeFormatter" %> 
<%@ page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>End User Dashboard</title>
</head>
<body>
	<% String x = session.getAttribute("user").toString();
		out.println("<h1>Welcome User "+x+"</h1>");
	%>
	
	<ul>
		<li><a href="postAuction.jsp">Post an Auction</a></li>
		<li><a href="searchAuctions.jsp">Search for an Auction</a></li>
		<li><a href="endUserAskQuestionPage.jsp">Ask a question</a></li>
		<li><a href="questionSearch.jsp">View Your Questions</a></li>
		<li><a href="alertSearch.jsp">View Your Notifications</a></li>
	</ul>
	<%                                                            
	int userid = (Integer)session.getAttribute("userid");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");  
	  Date date = new Date();
	  Timestamp timestamp1 = new Timestamp(date.getTime());
	  String sql = "Select * from Auction where CurrentBuyer = " + userid + " and sold = 0";
	  PreparedStatement stmt = con.prepareStatement(sql);
	 
	  ResultSet result = stmt.executeQuery(sql);
	  
	  
	  int count = 0;
		while(result.next()){
			Date temp = new Date();
			temp.setTime(timestamp1.getTime());
			String startDate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(temp);
			String endDate1 = (result.getString("End_Date")).substring(0,19);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime AuctionEnd = LocalDateTime.parse(endDate1, formatter);
			LocalDateTime current = LocalDateTime.parse(startDate1, formatter);
			if(current.isBefore(AuctionEnd)){
				continue;
				
			}
			else{
				if(count == 0){
				%> You won an Auction(s)! Check Notifications.  <% 
				count++;
					
				}
				int reserve = result.getInt("Reserve");
				double currentB = result.getDouble("CurrentBid");
				if(reserve != 0){
					if(currentB>=reserve){
						String sql1 = "UPDATE Auction SET Sold = 1, WinningBid = CurrentBid WHERE CurrentBuyer = ?;";
						PreparedStatement stmt1 = con.prepareStatement(sql1);
						stmt1.setInt(1, (Integer)session.getAttribute("userid"));
						int l = stmt1.executeUpdate();
						if(l<0){
							System.out.println("Nope");
							break;
						}
					
					
					
					
					
					
					
					String str = "insert into Alert(AccountID, AuctionID, Alert) values (" + userid + ", " +result.getString("AuctionID") + ", 'You won!')";
					PreparedStatement st = con.prepareStatement(str);
					int i = st.executeUpdate();
					if(i>0){
						continue; // alert successfully added, continue to next auction dub
					}
					else{
						break;
					}
					
					}
					else{
						continue; //if reserve is higher than last bid continue because no one is winner
					}
				}
				else{ // if there is no reserve 
				
				String sql1 = "UPDATE Auction SET Sold = 1, WinningBid = CurrentBid WHERE CurrentBuyer = ?;";
				PreparedStatement stmt1 = con.prepareStatement(sql1);
				stmt1.setInt(1, (Integer)session.getAttribute("userid"));
				int l = stmt1.executeUpdate();
				if(l<0){
					System.out.println("Nope");
					break;
				}
			
			
			
			
			
			
			
			String str = "insert into Alert(AccountID, AuctionID, Alert) values (" + userid + ", " +result.getString("AuctionID") + ", 'You won!')";
			PreparedStatement st = con.prepareStatement(str);
			int i = st.executeUpdate();
			if(i>0){
				continue;
			}
			else{
				break;
			}
				}
		}
	}
		count = 0;
	%>
	
	
	
	<a href='logout.jsp'>Log out</a>
</body>
</html>