<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
</head>
<body>
	First Name: ${user.firstName }<br>
	Last Name: ${user.lastName }<br>
	Grade: ${user.grade }<br>
	
	<form action="quizHistory">
		<input type="hidden" name="userid" value="0">
		<input type="submit" value="History">
	</form>
	<form action="myQuizzes">
		<input type="hidden" name="userid" value="0">
		<input type="submit" value="My Quizzes">
	</form>
	
</body>
</html>