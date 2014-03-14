<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script>
	function loadXMLDoc()
	{
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
		/* TODO: */
		xmlhttp.open("GET","addQuestion.html",true);
		xmlhttp.send();
	}
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Search Quiz</title>
    
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
</head>


<body>
<div class="container">
	<img src = "<c:url value="/resources/img/Brain-Gym2.png"/>" alt ="">
	<!-- Static navbar -->
	<div class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" style="color:005b7f;">
			<ul class="nav navbar-nav" >
				<li><a href="#">Home</a></li>
				<li><a href="#">Take a Quiz</a></li>
				<li><a href="#">Create a Quiz</a></li>
				<li class="active"><a href="#">Search a Quiz</a></li>
				<li><a href="#">Edit a Quiz</a></li>
			</ul>
		</div>
	</div>
	</div>
	<h1> Search a Quiz </h1>	
	<hr>	
	
	<form action="quizList" method="post">
		Search by category:
		<select name="categoryid">
			<option value=0 selected="selected">*Please Select a Category*</option>
			<c:forEach var="c" items="${categories}">
				<option value="${c.categoryid }">${c.category}</option>
			</c:forEach>
		</select>
		<br>
		Search by tag: <input type="text" data-role="tagsinput" name="tag"> Separate tags with enter.
		<br> 
		<input type="submit" value="Search"> 
		<br> 
	</form>
		
	<form action="addQuiz">
		<input type="submit" value="Add Quiz">
	</form>
	
	<form action="tagList">
	    <input type="submit" value="See Tag List">
	</form>
	<form action="categoryList">
	    <input type="submit" value="See Category List">
	</form>
	
</div>	
</body>
</html>