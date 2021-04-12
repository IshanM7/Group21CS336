<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>

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
		double reserve  = Double.parseDouble(request.getParameter("reserve"));
		String startDate = "2021/"+request.getParameter("startDate")+" 00:00:00";
		String endDate = "2021/"+request.getParameter("endDate")+" 00:00:00";
		String type = request.getParameter("apparelType");
		String color = request.getParameter("color");
		String gender = request.getParameter("gender");
		String startDate1 = "2021/"+request.getParameter("startDate");
		String endDate1 = "2021/"+request.getParameter("endDate");
		int c = 0;
		
		Date sDate =new SimpleDateFormat("yyyy/MM/dd").parse(startDate1);  
		Date eDate =new SimpleDateFormat("yyyy/MM/dd").parse(endDate1);  
		
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
					System.out.println(PID);
					int userid = (Integer)session.getAttribute("userid");
					String inputAuction = "INSERT INTO Auction (ProductID, AccountID, Start_Date,End_Date,Reserve,Increment,InitialPrice) VALUES (" + PID + "," +userid+",'"+startDate + "','" + endDate + "',"+reserve+","+increment+","+startPrice+");";
					
					PreparedStatement inAuction = con.prepareStatement(inputAuction);			 	 
					int err = inAuction.executeUpdate();
					if(err > 0){	
						out.println("Auction Added <a href='endUserHome.jsp'>Go Home</a>"); 
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
					
					PreparedStatement inAuction = con.prepareStatement(inputAuction);			 	 
					int err = inAuction.executeUpdate();
					if(err > 0){	
						out.println("Auction Added <a href='endUserHome.jsp'>Go Home</a>"); 
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
					System.out.println(PID);
					int userid = (Integer)session.getAttribute("userid");
					String inputAuction = "INSERT INTO Auction (ProductID, AccountID, Start_Date,End_Date,Reserve,Increment,InitialPrice) VALUES (" + PID + "," +userid+",'"+startDate + "','" + endDate + "',"+reserve+","+increment+","+startPrice+");";
					
					PreparedStatement inAuction = con.prepareStatement(inputAuction);			 	 
					int err = inAuction.executeUpdate();
					if(err > 0){	
						out.println("Auction Added <a href='endUserHome.jsp'>Go Home</a>"); 
					}else{
						out.println("Could not add Auction<a href='endUserHome.jsp'>Go Home</a>");	
					} 
				  
				} else {
					out.println("Could not add Apparel<a href='endUserHome.jsp'>Go Home</a>");
				}
			}
		}
		
	%>

</body>
</html>