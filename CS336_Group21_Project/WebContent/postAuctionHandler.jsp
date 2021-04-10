<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		double startPrice = Double.parseDouble(request.getParameter("initialPrice"));
		
		double increment =  Double.parseDouble(request.getParameter("increment"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
	%>

</body>
</html>