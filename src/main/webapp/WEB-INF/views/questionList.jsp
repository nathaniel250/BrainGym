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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Add Questions</title>
    
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
</head>

<body>
<div class = "container">
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

					<div class="navbar-collapse collapse navbar-responsive-collapse">
    					<ul class="nav navbar-nav">
							<li><a href="home" class="link1">Home</a></li>
							<li><a href="quizList">Take a Quiz</a></li>
							<li><a href="addQuiz">Create a Quiz</a></li>
							<li><a href="searchQuiz">Search a Quiz</a></li>
							<li class="active"><a href="quizList">Edit a Quiz</a></li>
							<li><a href="tagList">Tag List</a></li>
							<li><a href="categoryList">Category List</a></li>
						</url>	
					</div>
				</div>
			</div>
			
    
	<ul class="breadcrumb">
		<li><a href="quizList">Quiz List</a></li>
		<li class="active">questions of ${quiz.title}</li>
	</ul>
			
	<hr>

    <h3>Quiz title: ${quiz.title} </h3>
	<h4>Quiz ID: ${quizid}</h4>
    <c:forEach var="q" items="${questions}">
	<div class="panel panel-default">
	  <div class="panel-heading">
		<h3 class="panel-title"> ${q.qid} - ${q.question} </h3>
	  </div>
        <div class="panel-body">
            Answer: ${q.answer} <br> 
			Choice A: ${q.choiceA} <br> 
			Choice B: ${q.choiceB} <br> 
			Choice C: ${q.choiceC} <br> 
			Choice D: ${q.choiceD} <br> 
			Image file name: ${q.image} 
			<br>
            <img src=${q.image }  width="170" height="150"/>
			<br>
			<ul class = "list-inline">
			<li> 	
            	<form action="editQuestion">
            	<input type="hidden" name=qzid value=${quizid }> 
	            <input type="hidden" name="qid" value=${q.qid }>
	            <button type="submit" class="btn btn-default btn-xs">Edit</button>
	            </form>
			</li>
			<li>	
            	<form action="deleteQuestion">
	            <input type="hidden" name="qid" value=${q.qid }>
	            <button type="submit" class="btn btn-danger btn-xs">Delete</button>
	            </form>
			</li>
			</ul>
		</div>
		</div>	
        </c:forEach>
    <form action="addQuestion">
    	<input type="hidden" name="quizid" value=${quizid }> 
	    <button type="submit" class="btn btn-default">Add Question</button>
	</form>
	<br>
	<form action="commentQuiz">
   		<input type="hidden" name="qzid" value=${quizid }>
        <button type="submit" class="btn btn-default">Add Comment</button>
   	</form>
   	<br>
	<div class="panel panel-default">
	  <div class="panel-heading"> Comments </div>
		<ul class="list-group">
			<c:forEach var="c" items="${comments}">
			<li class="list-group-item">
				<p>${c.comment}</p>
			</li>
			</c:forEach>	
		</ul>
	</div>
</div>	
</body>
</html>