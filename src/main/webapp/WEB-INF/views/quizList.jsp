<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Brain Gym - Search Results</title>
</head>
<body>
	<h1>List of All Quizzes</h1>
    <ul>
   		<c:forEach var="qz" items="${quizzes}">
        <li>
        	<a href="questionList?quizid=${qz.qzid}">${qz.qzid} - ${qz.title} - ${qz.catid }</a>
           	<form action="takeQuiz">
           		<select name="timer">
           		<option value="0">Unlimited</option>
           		<option value="300">5 mins</option>
           		<option value="600">10 mins</option>
           		<option value="1800">30 mins</option>
           		<option value="3600">1 hour</option>
           		<option value="5400">1 hour 30 mins</option>
           		<option value="7200">2 hours</option>
           		</select>
	        	<input type="hidden" name="qzid" value=${qz.qzid }>
	           	<input type="submit" value="Take Quiz">
	       	</form>
           	<form action="editQuiz">
	        	<input type="hidden" name="qzid" value=${qz.qzid }>
	           	<input type="submit" value="Edit">
	       	</form>
	      	<form action="deleteQuiz">
	           	<input type="hidden" name="qzid" value=${qz.qzid }>
	           	<input type="submit" value="Delete">
	      	</form>
     	</li>    
        </c:forEach>
    </ul>
    <form action="addQuiz">
		<input type="submit" value="Add Quiz">
	</form>
</body>
</html>