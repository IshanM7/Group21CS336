<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
 <%@ page import ="java.sql.Timestamp" %> 
 <%@ page import ="java.time.LocalDateTime" %> 
 <%@ page import ="java.time.format.DateTimeFormatter" %> 
<%@ page import="java.util.Date"%>

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
		double startPrice = Double.parseDouble(request.getParameter("initialPrice"));		
		double increment =  Double.parseDouble(request.getParameter("increment"));
		double reserve = 0;
		if(request.getParameter("reserve") != ""){
			reserve  = Double.parseDouble(request.getParameter("reserve"));
		}
		
		Date date = new Date();
		Timestamp timestamp1 = new Timestamp(date.getTime());
		String sd = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(timestamp1);		
		String endTime = request.getParameter("endTime");
		String startDate = sd;
		String endDate = "2021/"+request.getParameter("endDate")+" "+endTime;
		
		String type = request.getParameter("apparelType");
		String color = request.getParameter("color");
		String gender = request.getParameter("gender");
		int c = 0;
		
		Date sDate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(startDate);  
		Date eDate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(endDate);  
		
		
		
		if(eDate.compareTo(sDate) <= 0){
			out.println("Please choose a date after the starting date, it cannot be the same date <a href='endUserHome.jsp'>Go Home</a>");
			c++;
		}
		if(c == 0){
			
			if(type.equals("shirt")){
				String shirtType = request.getParameter("shirtType");
				String shirtSize = request.getParameter("shirtSize");
				String sql =" INSERT INTO Apparel (Sex,Type,Color,Shirt_Type,Shirt_size) VALUES ('" + gender + "','" +type+"','"+color + "','" + shirtType + "','"+shirtSize+"');";
				
				PreparedStatement stmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				 	 
				int i = stmt.executeUpdate();
				 
				if (i>0) {
					ResultSet key = stmt.getGeneratedKeys();
					key.next();
					int PID = key.getInt(1);
					int userid = (Integer)session.getAttribute("userid");
					String inputAuction = "INSERT INTO Auction (ProductID, AccountID, Start_Date,End_Date,Reserve,Increment,InitialPrice) VALUES (" + PID + "," +userid+",'"+startDate + "','" + endDate + "',"+reserve+","+increment+","+startPrice+");";
					
					PreparedStatement inAuction = con.prepareStatement(inputAuction, Statement.RETURN_GENERATED_KEYS);			 	 
					int err = inAuction.executeUpdate();
					if(err > 0){	
						ResultSet key2 = inAuction.getGeneratedKeys();
						key2.next();
						int AuctionID = key2.getInt(1);
						String sql1 = "select * from Alert_Request;";
						Statement stmt2 = con.createStatement();
						ResultSet rs = stmt2.executeQuery(sql1);
						if(rs.next()){
							do{
								if(shirtType.equals(rs.getString("Shirt_Type")) && shirtSize.equals(rs.getString("Shirt_size")) && color.equals(rs.getString("Color")) && gender.equals(rs.getString("Sex"))){
									String sql2 = "INSERT INTO ALERT (AccountID, AuctionID, Alert) VALUES ("+rs.getInt("AccountID")+","+AuctionID+","+"'Shirt Found')";
									PreparedStatement state = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);			
									int x = state.executeUpdate();
			 						String del = "Delete from Alert_Request where AccountID = " + rs.getInt("AccountID");
			 						PreparedStatement st = con.prepareStatement(del);
			 						int y = st.executeUpdate();
									
								}
							}
							while(rs.next());
						}
						
						
						out.println("Auction Added"); 
					}else{
						out.println("Could not add Auction<a href='endUserHome.jsp'>Go Home</a>");	
					}
				  
				} else {
					out.println("Could not add Apparel<a href='endUserHome.jsp'>Go Home</a>");
				}
									
				
			}else if(type.equals("pant")){
				String waistSize = request.getParameter("waistSize");
				String length = request.getParameter("pantLength");
				String sql =" INSERT INTO Apparel (Sex,Type,Color,Waist_Size,Length) VALUES ('" + gender + "','" +type+"','"+color + "','" + waistSize + "','"+length+"');";
				
				
				PreparedStatement stmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				 	 
				int i = stmt.executeUpdate();
				 
				if (i>0) {
					ResultSet key = stmt.getGeneratedKeys();
					key.next();
					int PID = key.getInt(1);
					
					int userid = (Integer)session.getAttribute("userid");
					String inputAuction = "INSERT INTO Auction (ProductID, AccountID, Start_Date,End_Date,Reserve,Increment,InitialPrice) VALUES (" + PID + "," +userid+",'"+startDate + "','" + endDate + "',"+reserve+","+increment+","+startPrice+");";
					
					PreparedStatement inAuction = con.prepareStatement(inputAuction, Statement.RETURN_GENERATED_KEYS);			 	 
					int err = inAuction.executeUpdate();
					if(err > 0){	
						ResultSet key2 = inAuction.getGeneratedKeys();
						key2.next();
						int AuctionID = key2.getInt(1);
						String sql1 = "select * from Alert_Request;";
						Statement stmt2 = con.createStatement();
						ResultSet rs = stmt2.executeQuery(sql1);
						if(rs.next()){
							do{
								if(waistSize.equals(rs.getString("Waist_Size")) && length.equals(rs.getString("Length")) && color.equals(rs.getString("Color")) && gender.equals(rs.getString("Sex"))){
									String sql2 = "INSERT INTO ALERT (AccountID, AuctionID, Alert) VALUES ("+rs.getInt("AccountID")+","+AuctionID+","+"'Pant Found')";
									PreparedStatement state = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);			
									int x = state.executeUpdate();
									
								}
							}
							while(rs.next());
						}
						
						out.println("Auction Added"); 
					}else{
						out.println("Could not add Auction<a href='endUserHome.jsp'>Go Home</a>");	
					}
				  
				} else {
					out.println("Could not add Apparel<a href='endUserHome.jsp'>Go Home</a>");
				}
			
			}else{
				String size = request.getParameter("shoeSize");
				
				String sql = " INSERT INTO Apparel (Sex,Type,Color,Shoe_Size) VALUES ('" + gender + "','" +type+"','"+color + "','"+size+"');";
				
				PreparedStatement stmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				 	 
				int i = stmt.executeUpdate();
				 
				if (i>0) {
					ResultSet key = stmt.getGeneratedKeys();
					key.next();
					int PID = key.getInt(1);
					int userid = (Integer)session.getAttribute("userid");
					String inputAuction = "INSERT INTO Auction (ProductID, AccountID, Start_Date,End_Date,Reserve,Increment,InitialPrice) VALUES (" + PID + "," +userid+",'"+startDate + "','" + endDate + "',"+reserve+","+increment+","+startPrice+");";
					
					PreparedStatement inAuction = con.prepareStatement(inputAuction, Statement.RETURN_GENERATED_KEYS);			 	 
					int err = inAuction.executeUpdate();
					if(err > 0){	
						ResultSet key2 = inAuction.getGeneratedKeys();
						key2.next();
						int AuctionID = key2.getInt(1);
						String sql1 = "select * from Alert_Request;";
						Statement stmt2 = con.createStatement();
						ResultSet rs = stmt2.executeQuery(sql1);
						if(rs.next()){
							do{
								if(size.equals(rs.getString("Shoe_Size")) && color.equals(rs.getString("Color")) && gender.equals(rs.getString("Sex"))){
									String sql2 = "INSERT INTO ALERT (AccountID, AuctionID, Alert) VALUES ("+rs.getInt("AccountID")+","+AuctionID+","+"'Shoe Found')";
									PreparedStatement state = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);			
									int x = state.executeUpdate();
									
								}
							}
							while(rs.next());
						}
						
						out.println("Auction Added"); 
					}else{
						out.println("Could not add Auction<a href='endUserHome.jsp'>Go Home</a>");	
					}
				  
				} else {
					out.println("Could not add Apparel<a href='endUserHome.jsp'>Go Home</a>");
				}
			}
		}
		
	%>
		
			<a href='bidHandlerView.jsp'>View Bids</a>
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
	
</body>
</html>