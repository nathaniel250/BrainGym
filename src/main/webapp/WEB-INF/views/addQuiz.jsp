<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script>
	function loadXMLDoc() {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			document.getElementById("Selector").insertAdjacentHTML("beforeend", xmlhttp.responseText);
		}
		}
		xmlhttp.open("GET","addQuestion2.html",true);
		xmlhttp.send();
	}
	</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Create Quiz</title>

    <!-- Bootstrap core CSS -->
	<script src="jquery.min.js"></script> 
	<script src="bootstrap-tagsinput.js"></script>
	<link rel="stylesheet" href="bootstrap-tagsinput.css">
    <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.min.css">
	<script type="text/javascript" src="jquery.min.js"></script>
	<script src="bootstrap.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">
</head>
<body>
	<form action="insertQuiz" method="post">
	<table>  
    <tr>  
   		<td>Category:</td>  
      	<td>
	    	<select id="categoryid" name="categoryid">
		  	<c:forEach var="c" items="${categories}">
		  		<option value="${c.categoryid }">${c.category}</option>
		  	</c:forEach>
			</select>
	  	</td>  
 	</tr>
   	<tr>  
    	<td>Tags:</td>  
      	<td><input type="text" name="tags"></td>
      	<td>*Separate the tags by using comma(",")</td>  
 	</tr>
   	<tr>  
 	<tr>  
  		<td>Title:</td>  
  		<td><input type="text" name="title"></td>  
   	</tr>
    <tr>  
      	<td><input type="submit" value="Create"></td>  
  	</tr>
	</table>
	</form>
</body>
</html>