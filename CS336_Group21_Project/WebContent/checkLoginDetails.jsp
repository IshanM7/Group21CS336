
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	<%
		
			
		    Class.forName("com.mysql.jdbc.Driver").newInstance();
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		    String userid = request.getParameter("username");   
		    String pwd = request.getParameter("password");
		    PreparedStatement st = con.prepareStatement("SELECT * FROM Account Where Username = ? AND Password = ? ");
		    st.setString(1,userid);
		    st.setString(2,pwd);
		    
		    int admin,rep,user,uid;
		    
		    boolean pass = false;
		    ResultSet rs = st.executeQuery();
		    
		    
		    if(rs.next()){
			    
		    	String checkPass = rs.getString("Password");
			    
			    if(checkPass.equals(pwd)){
			    	pass = true;
			    }
			    if(pass){
			    	
			    	admin = rs.getInt("isAdmin_Staff");
			    	rep = rs.getInt("isCustomer_Rep");
			    	user = rs.getInt("isEnd_User");
			    	uid = rs.getInt("AccountID");
			    	
			    	session.setAttribute("user", userid); // the username will be stored in the session
			    	session.setAttribute("userid",uid);
			    	if(admin == 1){
			    		session.setAttribute("role",1);
			    	}
			    	if(rep == 1){
			    		session.setAttribute("role",2);
			    	}
			    	if(user == 1){
			    		session.setAttribute("role",3);
			    	}
			        out.println("<a href='logout.jsp'>Log out</a>");
			        response.sendRedirect("success.jsp");
			    }else{
			    	out.println("Invalid password or Username <a href='login.jsp'>try again</a>");			    	
			    }
			    

		    }else{
		    	out.println("Invalid password or Username<a href='login.jsp'>try again</a>");
		    }
		    

	%>
