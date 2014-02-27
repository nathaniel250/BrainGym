<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Edit Quiz</title>
    
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="screen"/>
    <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script>
		function loadXMLDoc() {
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
			xmlhttp.open("GET","addQuestion.html",true);
			xmlhttp.send();
		}
	</script>
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
					<li><a href="#">Search a Quiz</a></li>
					<li class="active"><a href="#">Edit a Quiz</a></li>
				</ul>
			</div>
		</div>
		</div>
		<h1> Edit a Quiz </h1>	
		<hr>
		<!-- Quiz Editing -->
		<form action="updateQuiz" method="post">
		<input type="hidden" name="qzid" value=${quiz.qzid }>
		Edit category:
		<select id="categoryid" name="categoryid">
			<c:forEach var="c" items="${categories}">
			<c:choose>
				<c:when test="${c.categoryid == quiz.catid }">
					<option value="${c.categoryid }" selected="selected">${c.category}</option>
				</c:when>
				<c:otherwise>
					<option value="${c.categoryid }">${c.category}</option>
				</c:otherwise>  		
			</c:choose>
			</c:forEach>
		</select>
		<br>
		Edit tags: <input type="text" data-role="tagsinput" name="tag"> Separate tags with enter.
		<br>
		Edit title: <input type="text" name="title" value="${quiz.title}">
		<br> 
		<input type="submit" value="Done Editing">
		<br> 
		</form>
		<!-- Image -->
		<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><img src="<c:url value="/resources/img/Brain-Gym2.png"/>"></button>
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="purchaseLabel" aria-hidden="true">
	   	<div class="modal-dialog">
	    	<div class="modal-content">
	        	<img src = "<c:url value="/resources/img/Troll-face.png"/>" alt ="">
	      	</div>
	  	</div>
	   	</div>
</div>
<!-- NATHAN -->
<!-- <form action="updateQuiz" method="post">
<input type="hidden" name="qzid" value=${quiz.qzid }>
<table>  
     <tr>  
      <td>Category:</td>  
      <td>
	    <select id="categoryid" name="categoryid">
		  <c:forEach var="c" items="${categories}">
		  	<c:choose>
		  		<c:when test="${c.categoryid == quiz.catid }">
		  			<option value="${c.categoryid }" selected="selected">${c.category}</option>
		  		</c:when>
		  		<c:otherwise>
		  			<option value="${c.categoryid }">${c.category}</option>
		  		</c:otherwise>
		  		
		  	</c:choose>
		  </c:forEach>
		</select>
	  </td>  
     </tr>
     <tr>  
      <td>Tags:</td>  
      <td><input type="text" name="tags" value="<c:forEach var="tag" items="${tags }"> ${tag.tag } </c:forEach>" ></td>
      <td>*Separate the tags by using comma(",")</td>  
     </tr>
     <tr>  
     <tr>  
      <td>Title:</td>  
      <td><input type="text" name="title" value="${quiz.title }"></td>  
     </tr>
     <tr>  
      <td><input type="submit" value="Done Editing"></td>  
     </tr>
</table>
</form> -->

</body>
</html>