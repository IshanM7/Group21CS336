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
Statement st = con.createStatement();
ResultSet result = st.executeQuery(str);
out.print("Auc id: "+ view);
%>
We here 
</body>
</html>