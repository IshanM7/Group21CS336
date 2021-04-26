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
		
		String type = request.getParameter("apparelType");
		String gender = request.getParameter("gender");
		if(type.equals("shirt")){%>
							<h2>Shirt Color</h2>
						
		
			<form action = "alertValuesHandler.jsp?apparelType=<%=type%>&gender=<%=gender%>" method = "POST">
				Color					
				<select name="color" id="color" required>
				  <option value="" disabled selected hidden = "true">Select color</option>
				  <option value="blue">blue</option>
				  <option value="red">red</option>
				  <option value="green">green</option>
				  <option value="black">black</option>
				  <option value="white">white</option>
				  <option value="pink">pink</option>				
				</select>
				<br/>		
				<h2>Shirt type</h2>
				
				<select name="shirtType" id="shirtType" required>
					  <option value="" disabled selected hidden = "true">Select Shirt Type</option>
					  <option value="short">Short Sleeve</option>
					  <option value="long">Long Sleeve</option>
					  <option value="sweater">Sweater</option>
					  <option value="tank">Tank Top</option>					  			
				</select>
				<br/>		
				
				<h2>Shirt Size</h2>
				<select name="shirtSize" id="shirtSize" required>
					 <option value="" disabled selected hidden = "true">Select Shirt Size</option>
					  <option value="S">Small</option>
					  <option value="M">Medium</option>
					  <option value="L">Large</option>
					  <option value="XL">Extra Large</option>					  			
				</select>
				<br/>
				<input type="submit" value="Submit"/>
				
			</form>
			
		<% }
			else if(type.equals("pant")){%>
			<form action = "alertValuesHandler.jsp?apparelType=<%=type%>&gender=<%=gender%>" method = "POST">
					<h2>Pant Info</h2>
					Color					
					<select name="color" id="color">
					  <option value="" disabled selected hidden = "true">Select color</option>
					  <option value="blue">blue</option>
					  <option value="red">red</option>
					  <option value="green">green</option>
					  <option value="black">black</option>
					  <option value="white">white</option>
					  <option value="pink">pink</option>				
					</select>
					<br/>		
					Waist Size					
					<select name="waistSize" id="waist">
					  <option value="" disabled selected hidden = "true">Waist Size</option>
					  <option value="27">27</option>
					  <option value="28">28</option>
					  <option value="29">29</option>
					  <option value="30">30</option>
					  <option value="31">31</option>
					  <option value="32">32</option>
					  <option value="33">33</option>
					  <option value="34">34</option>
					  <option value="35">35</option>
					  <option value="36">36</option>
					  <option value="37">37</option>
					  <option value="38">38</option>
					  <option value="39">39</option>
					  <option value="40">40</option>
					
					</select>
					<br/>
					Pant Length
					<select name="pantLength" id="length">
					  <option value="" disabled selected hidden = "true">Select Pant Length</option>
					  <option value="29">29</option>
					  <option value="30">30</option>
					  <option value="31">31</option>
					  <option value="32">32</option>
					  <option value="33">33</option>
					</select>
					<input type="submit" value="Submit"/>
					
				</form>

			<% }else { %>
			<form action = "alertValuesHandler.jsp?apparelType=<%=type%>&gender=<%=gender%>" method = "POST">
						
					<h2>Shoes Info</h2>
			
					Color					
					<select name="color" id="color">
					  <option value="" disabled selected hidden = "true">Select color</option>
					  <option value="blue">blue</option>
					  <option value="red">red</option>
					  <option value="green">green</option>
					  <option value="black">black</option>
					  <option value="white">white</option>
					  <option value="pink">pink</option>				
					</select>
					<br/>		
			
					<%if(gender.equals("F")) {%>
					
						Female Size				
						<select name="shoeSize" id="shoeSize">
						  <option value="" disabled selected hidden = "true">Select Shoe Size</option> 
						  <option value="4">4</option>
						  <option value="4.5">4.5</option>
						  <option value="5">5</option>
						  <option value="5.5">5.5</option>
						  <option value="6">6</option>
						  <option value="6.5">6.5</option>
						  <option value="7">7</option>
						  <option value="7.5">7.5</option>
						  <option value="8">8</option>
						  <option value="8.5">8.5</option>
						  <option value="9">9</option>
						  <option value="9.5">9.5</option>
						  <option value="10">10</option>
						  <option value="10.5">10.5</option>
						  <option value="11">11</option>
						  <option value="11.5">11.5</option>
						  <option value="12">12</option>
						  <option value="12.5">12.5</option>
						  <option value="13">13</option>
						  
						
						</select>
						<br/>
					<%} else {%>
					
						Male Size				
						<select name="shoeSize" id="shoeSize">
						  <option value="" disabled selected hidden = "true">Select Shoe Size</option>
						  <option value="6">6</option>
						  <option value="6.5">6.5</option>
						  <option value="7">7</option>
						  <option value="7.5">7.5</option>
						  <option value="8">8</option>
						  <option value="8.5">8.5</option>
						  <option value="9">9</option>
						  <option value="9.5">9.5</option>
						  <option value="10">10</option>
						  <option value="10.5">10.5</option>
						  <option value="11">11</option>
						  <option value="11.5">11.5</option>
						  <option value="12">12</option>
						  <option value="12.5">12.5</option>
						  <option value="13">13</option>
						  <option value="14">14</option>
						  <option value="15">15</option>
						  <option value="16">16</option>				  				
						</select>
					
					<%}%>
					<input type="submit" value="Submit"/>
				
				</form>
					
				
				
		<% }		
		%>
	
</body>
</html>