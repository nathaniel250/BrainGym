<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brain Gym - Comment on Quiz</title>
</head>
	
<body>
Comment on a Quiz
<form action="updateCommentQuiz" method="post" enctype='multipart/form-data'>
<input type="hidden" name="qzid" value="${qzid }">
<input type="text" name="comment"><br>
<input type="submit" value="Send">
</form>

</body>
</html>