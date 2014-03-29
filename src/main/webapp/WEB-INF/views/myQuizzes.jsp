<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Quizzes</title>
</head>
<body>
	<h1>My Quizzes</h1>
	<c:forEach var="qz" items="${quizzes }">
		<a href="questionList?quizid=${qz.qzid }">${qz.title } - <c:forEach var="c" items="${categories }"><c:if test="${qz.catid == c.categoryid}">${ c.category}</c:if></c:forEach></a><br>
	</c:forEach>
</body>
</html>