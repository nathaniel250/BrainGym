<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<script>
	$(document).ready(function() {
    $(".link1").click(function(event){
       event.preventDefault();
       var url =$(this).attr("href");
       $('#right-pane').load(url);
		});
	});
	</script>	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Search Quiz</title>
    
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <!--<link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>-->
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
</head>


<body>
<div class="container">
	<img src = "<c:url value="/resources/img/Brain-Gym2.png"/>" class="displayed" alt ="">
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
				<li><a href="home" class="link1">Home</a></li>
				<li><a href="profile">Profile</a></li>
				<li><a href="quizList">Take a Quiz</a></li>
				<li><a href="addQuiz">Create a Quiz</a></li>
				<li class="active"><a href="searchQuiz">Search a Quiz</a></li>
				<li><a href="quizList">Edit a Quiz</a></li>
				<li><a href="tagList">Tag List</a></li>
				<li><a href="categoryList">Category List</a></li>
				<li><a href="addForum">Create a Forum</a></li>
				<li><a href="searchForum">Search a Forum</a></li>
			</ul>
		</div>
	</div>
	</div>

	<h1> Search a Quiz </h1>	
	<hr>	
	<form action="quizList" method="post">
		Search by category:
		<select class="form-control" id="select" name="categoryid">
			<option value=0 selected="selected">*Please Select a Category*</option>
			<c:forEach var="c" items="${categories}">
				<option value="${c.categoryid }">${c.category}</option>
			</c:forEach>
		</select>
		<br>
		Search by tag: <input type="text" data-role="tagsinput" name="tag" placeholder="Separate tags with enter."> 
		<br><br> 
		<button type="submit" class="btn btn-primary">Search</button>
		<br> 
	</form>
	<br>
		
</div>	
</body>
</html>