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
		System.out.println(session.getAttribute("userid"));
		int userid = (Integer)session.getAttribute("userid");
		
		String questionText = request.getParameter("Question");
		
		String sql;
		
		String category = request.getParameter("category");
		System.out.println(category);		
		int err = 0;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		
		
		Statement stmt = con.createStatement();
		sql =" INSERT INTO Questions (askID,qtype,qtext,answered) VALUES ('" + userid + "','" + category+"','"+ questionText + "',0)";	 		 
		err = stmt.executeUpdate(sql);
		if(err > 0){
			out.println("Question submitted successfully <a href='endUserHome.jsp'>Go Home</a>");
		}else{
			out.println("Question failed to submit <a href='endUserHome.jsp'>Go Home</a>");
		}
		
		
		
		
	%>

</body>
</html>