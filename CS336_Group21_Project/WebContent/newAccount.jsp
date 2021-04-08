<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import ="java.sql.*" %><head>

<% 
	String email = request.getParameter("email");
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root","ishan2001");
	Statement st = con.createStatement();
	String sql;
	PreparedStatement check = con.prepareStatement("SELECT * FROM Account Where Username = ? or email = ?");
	check.setString(1,userName);
	check.setString(2, email);
	ResultSet rs = check.executeQuery();
	
	int l = 0;
	if(rs.next()){
		out.println("Account is already created, email or username is a duplicate. <a href='createAccount.jsp'>try again</a>");
		l=-1;
	}
	
	 
	if(l==0){
		sql =" INSERT INTO Account (Username,Password,Email,isEnd_User) VALUES ('" + userName + "','" + password + "','" + email + "',true)";
	 
	
	 
		PreparedStatement stmt = con.prepareStatement(sql);
		 
		 
		int i = stmt.executeUpdate();
		 
		if (i>0) {
			out.println("Account created <a href='login.jsp'>Login</a>"); 
		  
		} else {
			out.println("Could not create account <a href='login.jsp'>try again</a>");
		}
	}

%>


