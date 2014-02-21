<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Quiz</title>
</head>
<body>
<form action="updateQuiz" method="post">
<input type="hidden" name="qzid" value=${quiz.qzid }>
<table>  
     <tr>  
      <td>Category:</td>  
      <td>
	    <select id="categoryid" name="categoryid">
		  <c:forEach var="c" items="${categories}">
		  	<c:choose>
		  		<c:when test="${c.categoryid == quiz.catid }">
		  			<option value="${c.categoryid }" selected="selected">${c.category}</option>
		  		</c:when>
		  		<c:otherwise>
		  			<option value="${c.categoryid }">${c.category}</option>
		  		</c:otherwise>
		  		
		  	</c:choose>
		  </c:forEach>
		</select>
	  </td>  
     </tr>
     <tr>  
      <td>Tags:</td>  
      <td><input type="text" name="tags" value="<c:forEach var="tag" items="${tags }"> ${tag.tag } </c:forEach>" ></td>
      <td>*Separate the tags by using comma(",")</td>  
     </tr>
     <tr>  
     <tr>  
      <td>Title:</td>  
      <td><input type="text" name="title" value="${quiz.title }"></td>  
     </tr>
     <tr>  
      <td><input type="submit" value="Done Editing"></td>  
     </tr>
</table>
</form>

</body>
</html>