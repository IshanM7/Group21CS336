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

	<form method="post" action="endUserQuestionHandler.jsp">
     <table>
              
                 <tr>
                     <th  colspan="2">Ask a Question</th>
                     <th >Question Category</th>
                 </tr>
               
               
                  <tr>
                      <td>Question:(max 200 characters)</td>
                      <td><textarea name="Question" cols="70" rows="5" maxlength = "200"></textarea></td>
                      <td>
                      		
                      		<select name="category" id="category">
								<option value="">Select category</option>
								<option value="auctionHelp">Auction Help</option>
								<option value="accountHelp">Account Help</option>
								<option value="generalHelp">General Help</option>								
							</select>
					  </td>
                  </tr>
                  <tr>
                      <td><input type="submit" value="Submit" /></td>
                  </tr>
                    
              
          </table>
</form>

<a href='endUserHome.jsp'>Return to Home</a>
<a href='logout.jsp'>Log out</a>
</body>
</html>