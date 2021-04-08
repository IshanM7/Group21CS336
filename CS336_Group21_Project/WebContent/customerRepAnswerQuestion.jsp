<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Rep Answer</title>
</head>
<body>

	<%
		System.out.println(session.getAttribute("userid"));
		int userid = (Integer)session.getAttribute("userid");
		int qid = (Integer.parseInt(request.getParameter("qid")));
		String answerText = request.getParameter("Answer");
		String sql;
		int err = 0;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/336Project","root", "ishan2001");		   
		
		
		Statement stmt = con.createStatement();
		sql =" UPDATE Questions SET answerID = "+userid+", atext = '"+answerText+"', answered = 1 WHERE qid = "+qid+";";	 		 
		err = stmt.executeUpdate(sql);
		if(err > 0){
			out.println("Question submitted successfully <a href='customerRepHome.jsp'>Go Home</a>");
		}else{
			out.println("Question failed to submit <a href='customerRepHome.jsp'>Go Home</a>");
		}
		
		
		
		
	%>

</body>
</html>