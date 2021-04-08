<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="endUserQuestionHandler.jsp">
     <table>
              <thead>
                  <tr>
                      <th  colspan="2">Ask a Question</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                      <td>Question:(max 200 characters)</td>
                      <td><textarea name="Question" cols="40" rows="5" maxlength = "200"></textarea></td>
                  </tr>
                  <tr>
                      <td><input type="submit" value="Submit" /></td>
                  </tr>
                    
              </tbody>
          </table>
</form>


</body>
</html>