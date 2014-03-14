<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Categories</title>
</head>
<body>
<ul>
        <c:forEach var="c" items="${categories}">
            <li>${c.categoryid} - ${c.category}
            	<form action="editCategory">
	            <input type="hidden" name="categoryid" value=${c.categoryid }>
	            <input type="submit" value="Edit">
	            </form>
            	<form action="deleteCategory">
	            <input type="hidden" name="categoryid" value=${c.categoryid }>
	            <input type="submit" value="Delete">
	            </form>
            </li>
        </c:forEach>
    </ul>
    <form action="addCategory" method="post">
    <input type="text" name="category">
    <input type="submit" value="Add Category">
    </form>

</body>
</html>