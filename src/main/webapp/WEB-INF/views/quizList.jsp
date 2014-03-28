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
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Brain Gym - Quiz List</title>
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
	
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
</head>

<body>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
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
							<li class="active"><a href="quizList">Take a Quiz</a></li>
							<li><a href="addQuiz">Create a Quiz</a></li>
							<li><a href="searchQuiz">Search a Quiz</a></li>
							<li><a href="quizList">Edit a Quiz</a></li>
							<li><a href="tagList">Tag List</a></li>
							<li><a href="categoryList">Category List</a></li>
						</ul>
					</div>
				</div>
			</div>
	
	<div class="alert alert-dismissable alert-info">
	  <button type="button" class="close" data-dismiss="alert"><span class="glyphicon glyphicon-remove"></span></button>
	  Click on the quiz title to edit the questions.
	</div>		

	<h1>Quiz List</h1>
	<hr>
   		<c:forEach var="qz" items="${quizzes}">
		<div class="panel panel-default">
			<div class="panel-heading">
        			<h3 class="panel-title"><a href="questionList?quizid=${qz.qzid}">${qz.qzid} - ${qz.title} - ${qz.catid}</a></h3>
			</div>
			<div class = "panel-body">
				<ul class = "list-inline">
					<li>	
					<form action="takeQuiz">
						<ul class = "list-inline">
						<li>	
							<select class="form-control" id="select" name="timer">
								<option value="0">Unlimited</option>
								<option value="300">5 mins</option>
								<option value="600">10 mins</option>
								<option value="1800">30 mins</option>
								<option value="3600">1 hour</option>
								<option value="5400">1 hour 30 mins</option>
								<option value="7200">2 hours</option>
							</select>
						</li>
						<li>
							<input type="hidden" name="qzid" value=${qz.qzid }>
							<button type="submit" class="btn btn-primary">Take Quiz</button>
						</li>
						</ul>
					</form>
					</li>

					<li>
						<form action="editQuiz">
							<input type="hidden" name="qzid" value=${qz.qzid }>
							<button type="submit" class="btn btn-default">Edit</button>
						</form>
					</li>
					<li>	
						<form action="deleteQuiz">
							<input type="hidden" name="qzid" value=${qz.qzid }>
							<button type="submit" class="btn btn-danger">Delete</button>
						</form>
					</li>
				</ul>
			</div>
			</div>
        </c:forEach>
	
    <form action="addQuiz">
		<button type="submit" class="btn btn-default">..or Add Quiz</button>
	</form>
	<br><br>
</div>	
</body>
</html>