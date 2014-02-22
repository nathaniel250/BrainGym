<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Take Quiz</title>
</head>
<body>
<form action="result" method="post">
	<input type="hidden" name="qzid" value=${q.qzid }>
	<c:forEach var="q" items="${questions }">
		<li>
		<br>
		<input type="radio" name="${q.qid }" value="${q.choiceA }">${q.choice }<br>
		<input type="radio" name="${q.qid }" value="${q.choiceB }">${q.choice }<br>
		<input type="radio" name="${q.qid }" value="${q.choiceC }">${q.choice }<br>
		<input type="radio" name="${q.qid }" value="${q.choiceD }">${q.choice }<br>
		</li>
	</c:forEach>
</form>

</body>
</html>