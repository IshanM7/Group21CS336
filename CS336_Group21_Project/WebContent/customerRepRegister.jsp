<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="customerRepNewAccount.jsp" method="POST">
		<table>
			<tr>
				<td>Email:<input type="email" name="email" required/></td>
			</tr>
			<tr>
				<td>Username: <input type="text" name="username" required/></td>
			</tr>
			<tr>
				<td>Password:<input type="password" name="password" required/></td>
			</tr>
			<tr>
				<td>Address:<input type="text" name="address"/></td>
			</tr>
			<tr>					
				<td><input type="submit" value="Submit" required/></td>
			</tr>
		</table>
	
     </form>
</body>
</html>