<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>
	<h1>Pick Item Preferences</h1>
	<form action="alertValuespt2.jsp" method="POST">
		
		
		Gender 
		<select name="gender" id="gender" required>
		 <option value="" disabled selected hidden = "true">Select Gender</option>
		  <option value="M">male</option>
		  <option value="F">female</option>
		</select>
		
		<h2>Please choose the type of apparel</h2>
		<select name="apparelType" id="apparelType" required>
		  <option value="" disabled selected hidden = "true">Select Type</option>
		  <option value="shirt">Shirts</option>
		  <option value="pant">Pants</option>
		  <option value="shoe">Shoes</option>
		
		</select>
		<input type="submit" value="Submit"/>
		
     </form>
</body>
</html>