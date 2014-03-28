<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<style>
		p.creator {text-align:center}
	</style>	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Home</title>
    
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
</head>


<body>
<div class="container">
	<img src = "<c:url value="/resources/img/Brain-Gym2.png"/>" class="displayed" alt ="">

	<h1> About the Site </h1>	
	<hr>	
	<div class="jumbotron">
	  <h1>Take a Quiz</h1>
	  <p>With quizzes from different categories. You can set a timer before you take the quiz. Questions are editable.</p>
	  <p><a href="quizList" class="btn btn-primary btn-lg">Take a Quiz</a></p>
	</div>
	<br>
	<div class="jumbotron">
	  <h1>Search a Quiz</h1>
	  <p>Search quizzes by categories and tags.</p>
	  <p><a href="searchQuiz" class="btn btn-primary btn-lg">Search a Quiz</a></p>
	</div>
	<br>
	<div class="jumbotron">
	  <h1>Add a Quiz</h1>
	  <p>Add questions, tags and a category to your quiz.</p>
	  <p><a href="addQuiz" class="btn btn-primary btn-lg">Add a Quiz</a></p>
	</div>
	<br>
	<div class="well well-sm">
		<p class="creator">Site made by Ryan Gozum, Arah Jamandra, Denise Leviste, Nathaniel Martinez, Trishia Tubojan and JJ Yacapin.</p>
	</div>
</div>	
</body>
</html>