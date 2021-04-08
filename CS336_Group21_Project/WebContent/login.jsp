<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Login Form</title>	
</head>
   
   <body>
   
	<form action="checkLoginDetails.jsp" method="POST">
	   <table>
	   		<tr>
	   		
		       <td>Username: <input type="text" name="username"/></td>
	   		</tr>
	   		<tr>
	   			<td>Password:<input type="password" name="password"/></td>
	   		</tr>
	   		<tr>
	   			<td><input type="submit" value="Submit"/></td>	   			
	   		</tr>
	   		<tr>
	   			<td><input type="button" value="Register" onclick="window.location = 'createAccount.jsp'" /></td>
	   		</tr>
	
		       
		       
		     
	    </table>
     </form>
   </body>
</html>
