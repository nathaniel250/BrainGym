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
	<h1>Forum Thread</h1>
    <p>${forumid}</p>
    <ul>
        <c:forEach var="fc" items="${forumComments}">
            <li>${fc.forumCommentid} - ${fc.forumComment} - ${fc.dateCreated }<br>
            	<form action="editForumComment">
            	<input type="hidden" name=forumid value=${forumid }> 
	            <input type="hidden" name="forumCommentid" value=${fc.forumCommentid }>
	            <input type="submit" value="Edit">
	            </form>
            	<form action="deleteForumComment">
	            <input type="hidden" name="forumCommentid" value=${fc.forumCommentid }>
	            <input type="submit" value="Delete">
	            </form>
            </li>
        </c:forEach>
    </ul>
    <form action="insertForumComment" method="post">
    	<input type="hidden" name="forumid" value=${forumid }><br>
    	Comment: <input type="text" name="forumComment">
	    <input type="submit" value="Comment">
	</form>
</body>
</html>