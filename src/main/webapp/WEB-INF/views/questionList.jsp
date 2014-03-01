<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions</title>
</head>
<body>
    <h1>List of All Question</h1>
    <p>${quizid}</p>
    <ul>
        <c:forEach var="q" items="${questions}">
            <li>${q.qid} - ${q.question} - ${q.answer} - ${q.choiceA} - ${q.choiceB} - ${q.choiceC} - ${q.choiceD} - ${q.image} <br>
            <img src=${q.image }  width="170" height="150"/>
            	<form action="editQuestion">
            	<input type="hidden" name=qzid value=${quizid }> 
	            <input type="hidden" name="qid" value=${q.qid }>
	            <input type="submit" value="Edit">
	            </form>
            	<form action="deleteQuestion">
	            <input type="hidden" name="qid" value=${q.qid }>
	            <input type="submit" value="Delete">
	            </form>
            </li>
        </c:forEach>
    </ul>
    <form action="addQuestion">
    	<input type="hidden" name="quizid" value=${quizid }> 
	    <input type="submit" value="Add Question">
	</form>
	<form action="commentQuiz">
   		<input type="hidden" name="qzid" value=${quizid }>
        <input type="submit" value="Comment">
   	</form>
   	<br>COMMENTS
   	<c:forEach var="c" items="${comments}">
   		<p>${c.comment}</p>
   	</c:forEach>
</body>
</html>