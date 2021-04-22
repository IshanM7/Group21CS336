<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% 
		Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		
    	int aid = Integer.parseInt(request.getParameter("aid"));
    	
    	PreparedStatement st = con.prepareStatement("DELETE FROM Auction WHERE AuctionID = ?");
    	st.setInt(1,aid);
    	int err = st.executeUpdate();
    	if(((Integer)session.getAttribute("role")) < 3){
	    	if(err  > 0){
	    		out.println("Auction deleted successfully <a href='customerRepHome.jsp'>Go Home</a>");
	    	}else{
	    		out.println("Auction failed to delete  <a href='customerRepHome.jsp'>Go Home</a>");
	    	}
	    }
    	else{
    		if(err  > 0){
	    		out.println("Auction deleted successfully <a href='endUserHome.jsp'>Go Home</a>");
	    	}else{
	    		out.println("Auction failed to delete  <a href='endUserHome.jsp'>Go Home</a>");
	    	}
    	}
    	
	%>
 	
</body>
</html>