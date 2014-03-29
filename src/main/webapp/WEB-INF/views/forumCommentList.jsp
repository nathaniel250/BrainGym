<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brain Gym - Forum Thread</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
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
	<h4>${forumtopic}</h4>
	<h5>${forumsubtopic}</h5>
	
	<c:forEach var="fc" items="${forumComments}">
        	<div class="panel panel-default">
				<div class="panel-body">
					${fc.forumComment} - ${fc.dateCreated }
					<ul class="list-inline" style="margin-bottom:0px; margin-top:10px;">
					<li>
					<form action="editForumComment">
            			<input type="hidden" name=forumid value=${forumid }> 
	            		<input type="hidden" name="forumCommentid" value=${fc.forumCommentid }>
	            		<button type="submit" class="btn btn-info btn-xs">Edit</button> 
	            		<!-- <input type="submit" value="Edit"> -->
	            	</form>
	            	</li>
	            	<li>
	            	<form action="deleteForumComment">
	            		<input type="hidden" name="forumCommentid" value=${fc.forumCommentid }>
	            		<button type="submit" class="btn btn-danger btn-xs">Delete</button>
	            		<!-- <input type="submit" value="Delete"> -->
	            	</form>
	            	</li>
	            	</ul>
				</div>
			</div>
		</c:forEach>
		<form action="insertForumComment" method="post">
    		<input type="hidden" name="forumid" value=${forumid }>
    		<!-- Comment: <input type="text" name="forumComment">
	    	<input type="submit" value="Comment"> -->
		<div class="form-group">
            <label class="control-label" for="inputDefault">Comment</label>
            <input type="text" name="forumComment" class="form-control">
      	</div> 
      	<button class="btn btn-default btn-sm" type="submit">Comment</button>
      	</form>
</div>

	<!-- <h1>Forum Thread</h1>
    <p>${forumid}</p>
    <ul>
        <c:forEach var="fc" items="${forumComments}">
            <li>${fc.forumCommentid} - ${fc.forumComment} - ${fc.dateCreated }<br>
            	<form action="editForumComment">
            	<input type="hidden" name=forumid value=${forumid }> 
	            <input type="hidden" name="forumCommentid" value=${fc.forumCommentid }>
	            <input type="submit" value="Edit">
	            </form>
            	<form action="deleteForumComment">
	            <input type="hidden" name="forumCommentid" value=${fc.forumCommentid }>
	            <input type="submit" value="Delete">
	            </form>
            </li>
        </c:forEach>
    </ul>
    <form action="insertForumComment" method="post">
    	<input type="hidden" name="forumid" value=${forumid }><br>
    	Comment: <input type="text" name="forumComment">
	    <input type="submit" value="Comment">
	</form>-->
</body>
</html>