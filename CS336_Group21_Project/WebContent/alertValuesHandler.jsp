<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001"); 
Statement stmt = con.createStatement();
int accountID = (Integer)session.getAttribute("userid");
Statement stmt1 = con.createStatement();
String type = request.getParameter("apparelType");
String sex = request.getParameter("gender");
String shirtType = request.getParameter("shirtType");
String shirtSize = request.getParameter("shirtSize");
String waistSize = request.getParameter("waistSize");
String pantLength = request.getParameter("pantLength");
String shoeSize = request.getParameter("shoeSize");
String color = request.getParameter("color");
if(shirtType!=null){
	shirtType += "'";
	String temp = "'";
	temp += shirtType;
	shirtType = temp;	
}
if(shirtSize!=null){
	shirtSize += "'";
	String temp = "'";
	temp += shirtSize;
	shirtSize = temp;	
}
String sql2 = "INSERT INTO Alert_Request (Type, Sex, AccountID, Shirt_Type, Shirt_Size,Waist_Size, Length, Shoe_Size, Color) VALUES ('"+type+"','"+sex+"',"+accountID+","+shirtType+","+shirtSize+","+waistSize+","+pantLength+","+shoeSize+",'"+color+"');";
PreparedStatement inAuction = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);			
int i = inAuction.executeUpdate();
String sql = "select * from Alert_Request;";
ResultSet rs = stmt.executeQuery(sql);		
%>
	<h1>Your Alert Has Been Sent</h1>	
	<a href='endUserHome.jsp'>Return to Home</a>
	<a href='logout.jsp'>Log out</a>
	
</body>
</html>