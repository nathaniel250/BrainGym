<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<form action="quizList" method="post">
<table>  
     <tr>  
      <td>Category:</td>  
      <td>
	    <select name="categoryid">
	      <option value=0 selected="selected">*Please Select a Category*</option>
		  <c:forEach var="c" items="${categories}">
		  	<option value="${c.categoryid }">${c.category}</option>
		  </c:forEach>
		</select>
	  </td>  
     </tr>
     <tr>  
      <td>Tag:</td>
      <td><input type="text" name="tag"></td>
      </tr>
     
     <tr>  
      <td><input type="submit" value="Search"></td>  
     </tr>
</table>
</form>
<form action="addQuiz">
	    <input type="submit" value="Add Quiz">
</form>
</body>
</html>