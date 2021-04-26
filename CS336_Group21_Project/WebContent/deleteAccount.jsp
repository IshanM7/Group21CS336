<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account</title>
</head>
<body>
	<%
	 	Class.forName("com.mysql.jdbc.Driver").newInstance();
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		int aid = (Integer.parseInt(request.getParameter("accountID")));
		int check = 0;
		Statement st = con.createStatement();
		String checkID = "Select * FROM Account WHERE accountID = "+aid+";";
		ResultSet set = st.executeQuery(checkID);
		
		if(set.next()){
			int admin = set.getInt("isAdmin_Staff");
			int csr = set.getInt("isCustomer_Rep");
			if(admin == 1 || csr == 1){
				out.println("Can't Delete an admin or other customer rep account <a href='customerRepHome.jsp'>Go home</a>");
				check++;
			}
		}
		if(check == 0){
			Statement st2 = con.createStatement();
			String delete = "Delete FROM Account WHERE AccountID = "+aid+";";
			int i  = st2.executeUpdate(delete);
			if(i > 0){
				out.println("Account deleted <a href='customerRepHome.jsp'>Go Home</a>");
			}else{
				out.println("Failed to delete account <a href='customerRepHome.jsp'>Go Home</a>");
			}
		}
		
	%>
</body>
</html>