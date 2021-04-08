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
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		
	
		int accountID;
		String username,password,email,name,address;
		int check = 0;
		
		accountID = (Integer.parseInt(request.getParameter("accountID")));
		username = request.getParameter("username");
		password = request.getParameter("password");
		email = request.getParameter("email");
		name = request.getParameter("name");
		address = request.getParameter("address");
		
		
		Statement st = con.createStatement();
		String checkID = "Select * FROM Account WHERE accountID = "+accountID+";";
		ResultSet set = st.executeQuery(checkID);
		
		if(set.next()){
			int admin = set.getInt("isAdmin_Staff");
			int csr = set.getInt("isCustomer_Rep");
			if(admin == 1 || csr == 1){
				out.println("Can't update admin or other customer rep accounts <a href='customerRepHome.jsp'>Go home</a>");
				check++;
			}
		}
		
		if(username.length() == 0 && password.length() == 0 && email.length() == 0 && name.length() == 0 && address.length() == 0 && check == 0){
			out.println("Please provide input to update <a href='customerRepHome.jsp'>Go home</a> ");
			check++;
			
		}
		
		if(check == 0){
			
			int prev = 0;
			
			String start = "UPDATE Account SET ";
			String end = " WHERE accountID = "+accountID+";";
			
			String buildUser = " username = '"+username+"'";
			String buildPass = " password = '"+password+"'";
			String buildEmail = " email = '"+email+"'";
			String buildName = " name = '"+name+"'";
			String buildAddress = " address = '"+address+"'";
	
			StringBuilder str = new StringBuilder();
			
			str.append(start);
			if(username.length() != 0){
				str.append(buildUser);
				prev++;
			}
			if(password.length() != 0){
				if(prev >= 1) str.append(",");
				str.append(buildPass);
				prev++;
			}
			if(email.length() != 0){
				if(prev >= 1) str.append(",");
				str.append(buildEmail);
				prev++;
			}
			if(name.length() != 0){
				if(prev >= 1) str.append(",");
				str.append(buildName);
				prev++;
			}
			if(address.length() != 0){
				if(prev >= 1) str.append(",");
				str.append(buildAddress);
				prev++;
		
			}
			
						
			str.append(end);
			
			String sql = str + " ";
			
			
			   
			Statement stmt = con.createStatement();
			int err;
			err = stmt.executeUpdate(sql);
			if(err > 0){
				out.println("Account Changed  <a href='customerRepHome.jsp'>Go Home</a>");
			}else{
				out.println("Question failed to submit <a href='customerRepHome.jsp'>Go Home</a>");
			}
		}
		
		//ResultSet rs = stmt.executeQuery(sql);
	%>
</body>
</html>