<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brain  Gym - Edit Forum</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</head>
<body>
	<div class="container">
	<img src = "<c:url value="/resources/img/Brain-Gym2.png"/>" class="displayed" alt ="">
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
					<li><a href="home" class="link1">Home</a></li>
					<li><a href="profile">Profile</a></li>
		            <li><a href="quizList">Take a Quiz</a></li>
		            <li><a href="addQuiz">Create a Quiz</a></li>
		            <li><a href="searchQuiz">Search a Quiz</a></li>
		            <li><a href="quizList">Edit a Quiz</a></li>
		            <li><a href="tagList">Tag List</a></li>
		            <li><a href="categoryList">Category List</a></li>
		            <li><a href="addForum">Create a Forum</a></li>
					<li class="active"><a href="searchForum">Search a Forum</a></li>
				</ul>
			</div>
		</div>
		</div>
		
		<h1> Edit Forum </h1>	
		<hr>
		<b>${warning}</b>
		<!-- Quiz Editing -->
		<form action="updateForum" method="post">
			<input type="hidden" name="forumid" value=${forum.forumid }>
			Edit category:
			<select class="form-control" id="categoryid" name="categoryid">
				<c:forEach var="c" items="${categories}">
				<c:choose>
					<c:when test="${c.categoryid == forum.categoryid }">
					<option value="${c.categoryid }" selected="selected">${c.category}</option>
				</c:when>
				<c:otherwise>
					<option value="${c.categoryid }">${c.category}</option>
				</c:otherwise> 		
				</c:choose>
				</c:forEach>
			</select> <br>
			
			<div class="form-group">
			  <label class="control-label" for="inputSmall">Edit Topic:</label>
			  <input class="form-control input-sm" name="topic" value="${forum.topic}" type="text" id="inputSmall">
			</div> 	
			<div class="form-group">
			  <label class="control-label" for="inputSmall">Edit Subtopic:</label>
			  <input class="form-control input-sm" name="subtopic" value="${forum.subtopic}" type="text" id="inputSmall">
			</div>
			<br>
			
			<button type="submit" class="btn btn-success">Done Editing</button> 
		</form> 
	</div>

	<!-- <h1> Edit Forum </h1>	
		<hr>
		<form action="updateForum" method="post">
		<input type="hidden" name="forumid" value=${forum.forumid }>
		Edit category:
		<select id="categoryid" name="categoryid">
			<c:forEach var="c" items="${categories}">
			<c:choose>
				<c:when test="${c.categoryid == forum.categoryid }">
					<option value="${c.categoryid }" selected="selected">${c.category}</option>
				</c:when>
				<c:otherwise>
					<option value="${c.categoryid }">${c.category}</option>
				</c:otherwise>  		
			</c:choose>
			</c:forEach>
		</select>
		<br>
		Edit topic: <input type="text" name="topic" value="${forum.topic}">
		<br> 
		Edit subtopic: <input type="text" name="subtopic" value="${forum.subtopic}">
		<br>
		<input type="submit" value="Done Editing">
		<br> 
		</form> -->
</body>
</html>