<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1> Edit Forum </h1>	
		<hr>
		<form action="updateForum" method="post">
		<input type="hidden" name="forumid" value=${forum.forumid }>
		Edit category:
		<select id="categoryid" name="categoryid">
			<c:forEach var="c" items="${categories}">
			<c:choose>
				<c:when test="${c.categoryid == forum.categoryid }">
					<option value="${c.categoryid }" selected="selected">${c.category}</option>
				</c:when>
				<c:otherwise>
					<option value="${c.categoryid }">${c.category}</option>
				</c:otherwise>  		
			</c:choose>
			</c:forEach>
		</select>
		<br>
		Edit topic: <input type="text" name="topic" value="${forum.topic}">
		<br> 
		Edit subtopic: <input type="text" name="subtopic" value="${forum.subtopic}">
		<br>
		<input type="submit" value="Done Editing">
		<br> 
		</form>
</body>
</html>