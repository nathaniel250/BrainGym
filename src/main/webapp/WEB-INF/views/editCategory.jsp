<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Tag</title>
</head>
<body>
<form action="updateCategory" method="post">
<table>  
     <tr>  
      <td>Category:</td>  
      <td><input type="text" name="category" value="${category }">
      <td><input type="hidden" name="categoryid" value="${categoryid }">
	  </td>  
     </tr>
     <tr><td><input type="submit" value="Done Editing"></td></tr>
</table>
</form>
</body>
</html>