<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tags</title>
</head>
<body>
<ul>
        <c:forEach var="t" items="${tags}">
            <li>${t.tagid} - ${t.tag}
            	<form action="editTag">
	            <input type="hidden" name="tagid" value=${t.tagid }>
	            <input type="submit" value="Edit">
	            </form>
            	<form action="deleteTag">
	            <input type="hidden" name="tagid" value=${t.tagid }>
	            <input type="submit" value="Delete">
	            </form>
            </li>
        </c:forEach>
    </ul>

</body>
</html>