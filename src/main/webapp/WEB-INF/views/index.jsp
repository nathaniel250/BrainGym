<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Brain Gym - Exercise your brain.</title>
	<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet"/>
	<link href="<c:url value="/resources/css/homepage.css"/>" rel="stylesheet"/>
</head>
<body>
	<div class="site-wrapper">
	<div class="site-wrapper-inner">
	<div class="cover-container">
	
    		<div class="inner cover">
          			<img src = "<c:url value="/resources/img/Brain-Gym.png"/>" alt ="">
            		<p class="lead" style="color:#ebebeb;">Exercise your brain.</p>
            
            		<p class="lead">
            			<form action="quizList">
              				<!-- <button class="btn btn-lg btn-primary">Take A Quiz!</button> -->
              				<button class="btn btn-lg btn-default">Take A Quiz!</button>
              		</form>
            		</p>
            
            		<p class="lead">
            			<form action="addQuiz">
            				<button class="btn btn-lg btn-default">Create A Quiz!</button>	
            			</form>
            		</p>
            		
            		<p class="lead">
            			<form action="searchForum">
            				<button class="btn btn-lg btn-default">Forum!</button>	
            			</form>
            		</p>
			</div>

       		<div class="mastfoot">
            		<div class="inner">
              			<p>Created by <a href="#">PataTeam</a>.</p>
            		</div>
       		</div>
       		
	</div>
	</div>
	</div>
</body>
</html>
