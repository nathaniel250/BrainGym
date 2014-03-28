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

	<h1> Search a Forum </h1>	
	<hr>	
	
	<form action="forumList" method="post">
		Search by category:
		<select name="categoryid">
			<option value=0 selected="selected">*Please Select a Category*</option>
			<c:forEach var="c" items="${categories}">
				<option value="${c.categoryid }">${c.category}</option>
			</c:forEach>
		</select>
		<br>
		 <input type="submit" value="Search"> 
		<br>
	</form>
		
	<form action="addForum">
		<input type="submit" value="Add Forum">
	</form>

</body>
</html>