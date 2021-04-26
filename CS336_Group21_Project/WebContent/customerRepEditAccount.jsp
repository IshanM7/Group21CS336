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

	<h2>Edit Account</h2>
	<form action="customerRepEditAccountHandler.jsp" method="POST">
	   <table>
	   		<tr>
	   			
		       <td>Account ID: <input type="number" name="accountID" min = 0 required/></td>
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
	</br>
	<h2>Delete Account</h2>
	<form action="deleteAccount.jsp" method="POST">
	   <table>
	   		<tr>
	   			
		       <td>Account ID: <input type="number" name="accountID" min = 0 required/></td>
	   		</tr>	   		
	   		<tr>
	   			<td><input type="submit" value="Submit"/></td>	   			
	   		</tr>		      		     
	    </table>
     </form>
     </br>
	<a href='customerRepHome.jsp'>Return Home</a>
</body>
</html>