<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brain Gym - Edit Forum Comment</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
</head>

<body>

<div class="container" style="margin-bottom: 20px;">	 
	<img src = "<c:url value="/resources/img/Brain-Gym2.png"/>" class="displayed" alt ="">
	<div class="navbar navbar-default">
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
				<li><a href="searchQuiz">Take a Quiz</a></li>
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
	
	<h1>Forum Thread</h1>	
	<hr>
	<h4>${forumid}</h4>
	
	<!-- <form action="updateForumComment" method="post">
		<input type="hidden" name="forumCommentid" value=${forumComment.forumCommentid }>
		<input type="hidden" name="forumid" value=${forumComment.forumid }>
    	Comment: <input type="text" name="forumComment" value="${forumComment.forumComment }">
	</form> --> 
	
	
 	<form action="updateForumComment" method="post">
    	<input type="hidden" name="forumCommentid" value=${forumComment.forumCommentid }>
    	<input type="hidden" name="forumid" value=${forumComment.forumid }>
		<div class="form-group">
            <label class="control-label" for="inputDefault">Comment</label>
            <input class="form-control" type="text" name="forumComment" value="${forumComment.forumComment }">
      	</div> 
      	<button class="btn btn-default btn-sm" type="submit">Comment</button>
	</form>
</div> 

<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>