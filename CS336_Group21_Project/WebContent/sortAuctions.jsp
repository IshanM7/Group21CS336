<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<style>

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 60%;
}

td, th {
  text-align: right;
  padding: 8px;
}

</style>
</head>
<body>


	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "Gum50dad"); 
		
		
		Statement stmt = con.createStatement();
		String category = request.getParameter("type");
		String sex = request.getParameter("sex");
		String type = request.getParameter("item");
		String color = request.getParameter("color");
		String sql = "";
		String sql_sel = "";
		String sql_order = ";";
		String sql_where = "";

		sql_sel = "select A.accountid, B.sex, B.type, A.end_date, A.initialprice, A.currentbid, B.color from Auction A, Apparel B";
		sql_where = " where A.productid = b.productid";		
			
		int userid = (Integer)session.getAttribute("userid");
		
		if(category != null){
			if(category.equals("price"))	
				sql_order = " order by A.initialprice;";
			else if(category.equals("color"))
				sql_order = " order by B.color;";
			else if(category.equals("type"))
				sql_order = " order by B.type;";	
		}
		if(sex != null){
			sql_where+= " and B.sex = '"+sex+"' ";
		}
		else if(type != null){
			sql_where+= " and B.type = '"+type+"' ";
		}
		else if(color!= null){
			sql_where+= " and B.color = '"+color+"' ";
		}


			
		sql += sql_sel +sql_where + sql_order;
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){%>
		
			<h1> All Auctions</h1>
		 
						 		<form method = "post" action = "bidHandler.jsp">		 					 			

					 		<table>
						 		<tr>
						 			<th>Seller ID</th>
						 			<th>Sex</th>
						 			<th>Type</th>
						 			<th>End Date</th>
						 			<th>Initial Price</th>											 							 			
						 			<th>CurrentBid</th>
						 			<th>Color</th>
						 		</tr>
						 		</table>
					 	</form>
		<%
			do{
			%>		 		
				 		<form method = "post" action = "bidHandler.jsp">		 					 			
					 		<table>
					 			
					 			<tr>
					 				<td><%out.println(rs.getInt("AccountID")); %> </td>
					 				<td><%out.println(rs.getString("Sex")); %></td>
					 				<td><%out.println(rs.getString("type")); %></td>
					 				<td style="text-align:center"><%out.println(rs.getString("End_Date")); %></td>
					 				<td style="text-align:center"><% out.println(rs.getDouble("InitialPrice"));%></td>
					 				<td><% out.println(rs.getDouble("CurrentBid"));%></td>
					 				<td><% out.println(rs.getString("Color"));%></td>				                   
					 			</tr>
				                
					 		</table>
				 			<%if((Integer)session.getAttribute("userid") != rs.getInt("AccountID") && (Integer)session.getAttribute("userid") == 3) {%>					 									 								 									 									 									 			
						 			Place Bid: <input required type="number" name = "bid" min = <%=rs.getDouble("CurrentBid")%> step = ".01" />			                   					 								 																				                
				                     <input type="submit" value="Submit"/>					 		
				 			<%}%>			                
					 	</form>
					 	<br/>
					 	<%if(((Integer)session.getAttribute("role")) < 3){ %>
					 		<form method="post" action="deleteAuction.jsp?aid=<%=rs.getInt("AuctionID")%>&seller=<%=rs.getInt("AccountID")%>">	
					 			<input type = "submit" value = "Delete Auction"> 
					 			
					 		</form>	 
					 		<br/>
					 	<% }%>
					 	
		<%}while(rs.next()); 
		}
		%>
</body>
</html>