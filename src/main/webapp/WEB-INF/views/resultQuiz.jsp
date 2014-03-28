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

        <title>Brain Gym - Results</title>
        
        <link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
        <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
        <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
        <script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
    </head>
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
            
        <h1> Quiz Results </h1>    
        <hr>
        <div class="alert alert-dismissable alert-success">
	  		<button type="button" class="close" data-dismiss="alert"><span class="glyphicon glyphicon-ok"></span></button>
	  		You got <b>${result}</b> correct answer(s) <b>out of ${total} questions</b>! <b>(${percentage }%)</b>
		</div>	
			
	        <br>
	        <c:forEach var="q" items="${questions }">
		        <div class="panel panel-default">
					<div class="panel-heading">
		        		<h3 class="panel-title"><a href="questionList?quizid=${qz.qzid}">Question: ${q.question }</a></h3>
					</div>
					<c:forEach var="answer" items="${answers}">    
					<div class = "panel-body">
					<img src=${q.image }  width="170" height="150"/>
					<c:choose>
					    <c:when test="${q.choiceA == q.answer}">
					    	<h4 style="background-color: #5cb85c;">${q.choiceA }</h4>
					    </c:when>
					    <c:when test="${q.choiceA == answer && q.choiceA != q.answer}">
					    	<h4 style="background-color: #d9534f;">${q.choiceA }</h4>
					    </c:when>
					    <c:otherwise>
			    			<p>${q.choiceA }</p>
					    </c:otherwise>
					</c:choose>
					<c:choose>
					    <c:when test="${q.choiceB == q.answer}">
					       <h4 style="background-color: #5cb85c;">${q.choiceB }</h4>
					    </c:when>
					     <c:when test="${q.choiceB == answer && q.choiceB != q.answer}">
					    	<h4 style="background-color: #d9534f;">${q.choiceB }</h4>
					    </c:when>
					    <c:otherwise>
					        <p>${q.choiceB }</p>
					    </c:otherwise>
					</c:choose>
					<c:choose>
					    <c:when test="${q.choiceC == q.answer}">
					       <h4 style="background-color: #5cb85c;">${q.choiceC }</h4>
					    </c:when>
					    <c:when test="${q.choiceC == answer && q.choiceC != q.answer}">
					    	<h4 style="background-color: #d9534f;">${q.choiceC }</h4>
					    </c:when>
					    <c:otherwise>
					        <p>${q.choiceC }</p>
					    </c:otherwise>
					</c:choose>
					<c:choose>
					    <c:when test="${q.choiceD == q.answer}">
					       	<h4 style="background-color: #5cb85c;">${q.choiceD }</h4>
					    </c:when>
					    <c:when test="${q.choiceD == answer && q.choiceD != q.answer}">
						    <h4 style="background-color: #d9534f;">${q.choiceD }</h4>
					    </c:when>
					    <c:otherwise>
					        <p>${q.choiceD }</p>
					    </c:otherwise>
					</c:choose>
					</div>
					</c:forEach>
				</div>	
			</c:forEach>

			
			
	</div>	
</body>
</html>