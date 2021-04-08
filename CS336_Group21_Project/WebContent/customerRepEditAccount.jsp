<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Account</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>

	<form action="customerRepEditAccountHandler.jsp" method="POST">
	   <table>
	   		<tr>
	   			
		       <td>Account ID: <input type="number" name="accountID" required/></td>
	   		</tr>
	   		<tr>
	   			
		       <td>Change Username: <input type="text" name="username"/></td>
	   		</tr>
	   		<tr>
	   			<td>Change Password:<input type="password" name="password"/></td>
	   		</tr>
	   		<tr>
	   			<td>Change Email:<input type="email" name="email"/></td>
	   		</tr>
	   		<tr>
	   			<td>Change Name:<input type="text" name="name"/></td>
	   		</tr>
	   		<tr>
	   			<td>Change Address:<input type="text" name="address"/></td>
	   		</tr>
	   		<tr>
	   			<td><input type="submit" value="Submit"/></td>	   			
	   		</tr>
	
		       
		       
		     
	    </table>
     </form>

</body>
</html>