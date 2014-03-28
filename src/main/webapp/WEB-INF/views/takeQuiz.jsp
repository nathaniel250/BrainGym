<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Brain Gym - Take Quiz</title>
    
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/ekko-lightbox.min.css"/>" rel="stylesheet"/>
    
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/ekko-lightbox.min.js"/>"></script>
	<script src="<c:url value="/resources/js/countdown.js"/>"></script>
</head>
 
<body>
<div class="container">	 
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
				<li class="active"><a href="searchQuiz">Take a Quiz</a></li>
				<li><a href="addQuiz">Create a Quiz</a></li>
				<li><a href="searchQuiz">Search a Quiz</a></li>
				<li><a href="quizList">Edit a Quiz</a></li>
			</ul>
		</div>
	</div>
	</div>
	<h1> Take a Quiz </h1>	
	<hr>
	<form name="input" action="resultQuiz" method="post">
		<input type="hidden" name="qzid" value=${quizid }>
		
		<div class="row" id="wrapper" style="position:relative;">
			
			<div class="col-md-7" id="left" style="position:relative; float:left;">
				<ol>
				<c:forEach var="q" items="${questions }">
					<h4><b><li>${q.question }</li></b></h4>
					
					<!-- IF STATEMENT NEEDED FOR PHOTO? -->
					
					<div class="row">
						<div class="col-md-5">
							<a href="" class="thumbnail" data-remote="<c:url value="${q.image }"/>" data-title="${q.question }" data-toggle="lightbox">
								<img src="<c:url value="${q.image }"/>" >
							</a>
						</div>
					</div>
					<div class="radio">
						<label>
							<input type="radio" name="Q${q.qid }" value="${q.choiceA }">${q.choiceA }
						</label>
					</div>
					<div class="radio">
						<label>
							<input type="radio" name="Q${q.qid }" value="${q.choiceB }">${q.choiceB }
						</label>
					</div>
					<div class="radio">
						<label>		
							<input type="radio" name="Q${q.qid }" value="${q.choiceC }">${q.choiceC }
						</label>
					</div>
					<div class="radio">
						<label>
							<input type="radio" name="Q${q.qid }" value="${q.choiceD }">${q.choiceD }
						</label>
					</div>
					<br>
				</c:forEach>
				</ol>
				
				<div style="padding-left:40px; padding-bottom:20px;">
					<input class="btn btn-success" type="submit" value="Submit Answer Sheet">
				</div>
			</div>
			
			<!-- TODO: After timer -->
			<div class="col-md-5" id="right" style="position:absolute; height:100%;right:0;">
				<div id="sidebar" style="padding-top:20px;">	
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
					<c:if test="${timer != 0 }">
						<script type="text/javascript">
						window.onload=function(){
							window.setTimeout('document.input.submit()', ${timerms});
						}
						</script>
					</c:if>
				</div>	
			</div>
		</div>
	</form>
</div> 
	<!-- SCRIPT FOR TIMER MOVEMENT -->
	<script>
	var length = $('#right').height() - $('#sidebar').height() + $('#right').offset().top;
    $(window).scroll(function () {
        var scroll = $(this).scrollTop();
        var height = $('#sidebar').height() + 'px';
        if (scroll < $('#right').offset().top) {
            $('#sidebar').css({
                'position': 'absolute',
                'top': '0'
            });
        } else if (scroll > length) {
            $('#sidebar').css({
                'position': 'absolute',
                'bottom': '0',
                'top': '20px'
            });
        } else {
            $('#sidebar').css({
                'position': 'fixed',
                'top': '0',
                'height': height
            });
        }
    });
	</script>
	<!-- SCRIPT FOR VIEWING IMAGES -->
	<script>
		$(document).ready(function ($) {
			$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event){ 
				event.preventDefault(); 
				$(this).ekkoLightbox(); 
			}); 
		});
	</script>
</body>
</html>