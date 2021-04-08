
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sales Reports</title>
	<link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>

		

	
    	<div>

    		<% 
			    Class.forName("com.mysql.jdbc.Driver").newInstance();
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
    			String type = request.getParameter("type"); 
    			
    			
    			
    			if(type.equals("totalEarnings")){
    				PreparedStatement st = con.prepareStatement("");
    				out.println("<a> TOTAL EARNINGS </a>");	
    			}
    			if(type.equals("earningsPerItem")){
    				PreparedStatement st = con.prepareStatement("");
    				out.println("<a> earningsPerItem </a>");	
    			}
    			if(type.equals("earningsPerType")){
    				PreparedStatement st = con.prepareStatement("");
    				out.println("<a> earningsPerType </a>");	
    			}
    			if(type.equals("earningsPerEndUser")){
    				PreparedStatement st = con.prepareStatement("");
    				out.println("<a> earningsPerEndUser </a>");	
    			}
    			
    			if(type.equals("bestSelling")){
    				PreparedStatement st = con.prepareStatement("");
    				out.println("<a> best selling </a>");	
    			}
    			if(type.equals("bestBuyers")){
    				PreparedStatement st = con.prepareStatement("");
    				out.println("<a> best buyers </a>");	
    			}
    			
    		%>
    	</div>
</body>
</html>