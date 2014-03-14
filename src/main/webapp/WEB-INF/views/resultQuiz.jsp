<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
</head>
<body>
	<p><b>RESULTS</b></p>
	<p>${percentage }%: ${result } out of ${total }</p>
		<c:forEach var="answer" items="${answers}">
            <p>Your Answer: ${answer }</p>
        </c:forEach>
        <br>
        <c:forEach var="q" items="${questions }">
		<li>
		<p><b>${q.question }</b></p>
		<img src=${q.image }  width="170" height="150"/>
		<c:choose>
		    <c:when test="${q.choiceA == q.answer}">
		       <p><b>${q.choiceA }</b></p>
		    </c:when>
		    <c:otherwise>
		        <p>${q.choiceA }</p>
		    </c:otherwise>
		</c:choose>
		<c:choose>
		    <c:when test="${q.choiceB == q.answer}">
		       <p><b>${q.choiceB }</b></p>
		    </c:when>
		    <c:otherwise>
		        <p>${q.choiceB }</p>
		    </c:otherwise>
		</c:choose>
		<c:choose>
		    <c:when test="${q.choiceC == q.answer}">
		       <p><b>${q.choiceC }</b></p>
		    </c:when>
		    <c:otherwise>
		        <p>${q.choiceC }</p>
		    </c:otherwise>
		</c:choose>
		<c:choose>
		    <c:when test="${q.choiceD == q.answer}">
		       <p><b>${q.choiceD }</b></p>
		    </c:when>
		    <c:otherwise>
		        <p>${q.choiceD }</p>
		    </c:otherwise>
		</c:choose>
		</li>
		</c:forEach>
</body>
</html>