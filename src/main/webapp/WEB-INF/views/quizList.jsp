<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quizzes</title>
</head>
<body>
    <h1>List of All Quizzes</h1>
    <ul>
        <c:forEach var="qz" items="${quizzes}">
           <li><a href="questionList?quizid=${qz.qzid}">${qz.qzid} - ${qz.title} - ${qz.catid }</a></li>
            
        </c:forEach>
    </ul>
    <form action="addQuiz">
	    <input type="submit" value="Add Quiz">
	</form>
</body>
</html>