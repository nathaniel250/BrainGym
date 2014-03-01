<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brain Gym - Take Quiz</title>
    
	<link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/countdown.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
</head>
<!-- 
<body>
<div class="container">	 
	<img src = "<c:url value="/resources/img/Brain-Gym2.png"/>" alt ="">  
	-->
	<!-- Static Navbar -->
	<!-- 
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
        	<li><a href="#">Home</a></li>
			<li class="active"><a href="#">Take a Quiz</a></li>
        	<li><a href="#">Something</a></li>
    	</ul>
     	-->
	<!-- </div> --><!--/.nav-collapse -->
	<!-- </div> --><!--/.container-fluid -->
	<!-- 
	</div>
	<h1> Take a Quiz </h1>	
	<hr>
	 -->
	<!-- Main component for a primary marketing message or call to action -->
	<!--
	<div class="span4">
		<form class="form-search">
			<div class="input-append" style="margin-left: 30%;margin-right:10%">
				<input type="text" class="span2" style="width: 50%;">
				<button type="submit" class="btn">Search for topic</button>
			</div>
		</form>
	</div>
	<br><br>
	<div class="col-md-3" style="margin-left:35%;margin-right:35%">
		<a href="#" class="btn btn-primary btn-lg btn-block btn-huge">or create Own Quiz!</a>
	</div>
</div> 
-->

<!-- NATHAN -->
<body>
<c:if test="${timer != 0 }">
<script type="application/javascript">
var myCountdown1 = new Countdown({
								 	time: ${timer }, // 86400 seconds = 1 day
									width:200, 
									height:60,  
									rangeHi:"hour"
									//style:"flip"	// <- no comma on last item!
									});

</script>
</c:if>
<form name="input" action="resultQuiz" method="post">
	<input type="hidden" name="qzid" value=${quizid }>
	lalalala
	<c:if test="${timer != 0 }">
	<script type="text/javascript">
	window.onload=function(){
		window.setTimeout('document.input.submit()', ${timerms });
	}
	</script>
	</c:if>
	laalala
	<c:forEach var="q" items="${questions }">
		<li>
		<p><b>${q.question }</b></p>
		<img src=${q.image }  width="170" height="150"/><br>
		<input type="radio" name="Q${q.qid }" value="${q.choiceA }">${q.choiceA }<br>
		<input type="radio" name="Q${q.qid }" value="${q.choiceB }">${q.choiceB }<br>
		<input type="radio" name="Q${q.qid }" value="${q.choiceC }">${q.choiceC }<br>
		<input type="radio" name="Q${q.qid }" value="${q.choiceD }">${q.choiceD }<br><br>
		</li>
	</c:forEach>
	<input type="submit" value="Submit Answer Sheet">
	
</form>

</body>
</html>