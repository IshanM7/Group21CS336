
<%
    if ((session.getAttribute("user") == null)) {
%>
	You are not logged in<br/>
	<a href="login.jsp">Please Login</a>
	<%} else {
	%>
	Welcome 
	<%
		String x = session.getAttribute("role").toString();
		if(x.equals("1")){
			response.sendRedirect("adminHome.jsp");
		}
		if(x.equals("2")){
			response.sendRedirect("customerRepHome.jsp");
		}
		if(x.equals("3")){
			response.sendRedirect("endUserHome.jsp");
		}
		//out.println(session.getAttribute("user"));
		%> 
	<a href='logout.jsp'>Log out</a>
	<%
	    }
	%>