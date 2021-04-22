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
	    int userid = (Integer)session.getAttribute("userid");
		
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");	
		String sql = "Select a.Alert as 'Alerts', a.AuctionID as 'Auction' from Alert a where a.AccountID = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1,userid);	 		 
		
		
		
		ResultSet rs = stmt.executeQuery();%>
		 <h1> Your Alerts </h1>
		
	 		
	 		<%while(rs.next()){%>
	 		 <table>
		 	
	 			
	 			<tr>
	 				<td><%out.println("<a> "+rs.getString("Alerts")+"</a>"); %></td>
	 				<td><%out.print("for AuctionID: " + rs.getInt("Auction")); 
	 						String del = "Delete from Alert where AccountID = " + session.getAttribute("userid");
	 						PreparedStatement st = con.prepareStatement(del);
	 						int i = st.executeUpdate();
	 						if(i<0){
	 							System.out.println("Couldn't delete");
	 						}
	 				
	 				
	 				%></td>
	 				<td style="text-align:center"></td>
	 			</tr>
	 		</table>
	 		<br>
			<br>
	 		<%}%>
	 		

<input type="button" value="Go Back to home" onclick="window.location='endUserHome.jsp'" />

</body>
</html>