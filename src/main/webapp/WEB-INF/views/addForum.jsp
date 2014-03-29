<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brain Gym - Create Forum</title>
	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
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
							<li><a href="searchQuiz">Search a Quiz</a></li>
							<li><a href="quizList">Edit a Quiz</a></li>
							<li><a href="tagList">Tag List</a></li>
							<li><a href="categoryList">Category List</a></li>
							<li class="active"><a href="addForum">Create a Forum</a></li>
							<li><a href="searchForum">Search a Forum</a></li>
						</ul>
					</div>
				</div>
			</div>
		
		<h1> Create a Forum </h1>
		<hr>	
		<b>${warning}</b>
		<form action="insertForum" method="post">
			<!-- <div class="form-group">
			  <label class="control-label" for="inputSmall">Title:</label>
			  <input class="form-control input-sm" name="title" type="text" id="inputSmall">
			</div> -->

			Category: 
				<select class="form-control" id="categoryid" name="categoryid">
					<c:forEach var="c" items="${categories}">
					<option value="${c.categoryid }">${c.category}</option>
					</c:forEach>
				</select>
				<br>
				
			<div class="form-group">
			  <label class="control-label" for="inputSmall">Topic:</label>
			  <input class="form-control input-sm" name="topic" type="text" id="inputSmall">
			</div>
			
			<div class="form-group">
			  <label class="control-label" for="inputSmall">Subtopic:</label>
			  <input class="form-control input-sm" name="subtopic" type="text" id="inputSmall">
			</div>
				   
			<!-- Tags:
				<input type="text" data-role="tagsinput" name="tags" placeholder="Separate the tags by enter">
				<br><br> --> 	

			<button type="submit" class="btn btn-primary">Create</button>		 
		</form>
	</div>

	<!-- <h1> Post a Form </h1>
		<hr>	
		<form action="insertForum" method="post">
			Category: 
				<select id="categoryid" name="categoryid">
					<c:forEach var="c" items="${categories}">
					<option value="${c.categoryid }">${c.category}</option>
					</c:forEach>
				</select><br><br>
			Topic: 
				<input type="text" name="topic">
			Subtopic: 
				<input type="text" name="subtopic">
				<input type="submit" value="Create">  			 
		</form> -->
</body>
</html>