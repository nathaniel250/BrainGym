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
<h1>List of All Forums</h1>
	<hr>
    <ul>
   		<c:forEach var="forum" items="${forums}">
        <li>
        	<a href="forumCommentList?forumid=${forum.forumid}">${forum.forumid} - ${forum.topic} - ${forum.subtopic } - ${forum.categoryid }</a>
			<form action="editForum">
	        	<input type="hidden" name="forumid" value=${forum.forumid }>
	           	<input type="submit" value="Edit">
	       	</form>
			
	      	<form action="deleteForum">
	           	<input type="hidden" name="forumid" value=${forum.forumid }>
	           	<input type="submit" value="Delete">
	      	</form>
			
     	</li>    
        </c:forEach>
    </ul>
    <form action="addForum">
		<input type="submit" value="Add Forum">
	</form>
</body>
</html>