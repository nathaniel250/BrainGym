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

      <title>Brain Gym - Edit Question</title>
        
      <link href="<c:url value="/resources/css/bootstrap-tagsinput.css"/>" rel="stylesheet"/>
      <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>
      <link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet"/>
      <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
      <script src="<c:url value="/resources/js/jquery.min.js"/>"></script> 
      <script src="<c:url value="/resources/js/bootstrap-tagsinput.js"/>"></script>
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
            <li><a href="quizList">Take a Quiz</a></li>
            <li><a href="addQuiz">Create a Quiz</a></li>
            <li><a href="searchQuiz">Search a Quiz</a></li>
            <li class="active"><a href="quizList">Edit a Quiz</a></li>
            <li><a href="tagList">Tag List</a></li>
            <li><a href="categoryList">Category List</a></li>
          </ul>
        </div>
      </div>
      </div>


    <h1>Edit Question for ${quiz.title}</h1>  
    <hr>
    
    <form action="updateQuestion" method="post" enctype='multipart/form-data'>
    	<input type="hidden" name="qid" value=${question.qid }>
    	<input type="hidden" name="qzid" value=${question.qzid }>
        	<div class="form-group">
            <label class="control-label" for="inputDefault">Question</label>
            <input type="text" name="question" value="${question.question }" class="form-control" id="inputDefault">
          </div> 
          <div class="form-group">
            <label class="control-label" for="inputDefault">Answer</label>
            <input type="text" name="answer" value="${question.answer }" class="form-control" id="inputDefault">
          </div> 
          <div class="form-group">
            <label class="control-label" for="inputSmall">Choice A</label>
            <input class="form-control input-sm" name="choiceA" value="${question.choiceA }" type="text" id="inputSmall">
          </div> 
          <div class="form-group">
            <label class="control-label" for="inputSmall">Choice B</label>
            <input class="form-control input-sm" name="choiceB" value="${question.choiceB }" type="text" id="inputSmall">
          </div> 
          <div class="form-group">
            <label class="control-label" for="inputSmall">Choice C</label>
            <input class="form-control input-sm" name="choiceC" value="${question.choiceC }" type="text" id="inputSmall">
          </div> 
          <div class="form-group">
            <label class="control-label" for="inputSmall">Choice D</label>
            <input class="form-control input-sm" name="choiceD" value="${question.choiceD }" type="text" id="inputSmall">
          </div> 	

    	   	<h6> Upload image (optional) </h6>   
          <input type="file" name="file" id="file">
          <br>
          <button type="submit" class="btn btn-success">Done Editing</button> 
          <br><br>
      </form>
  </div>    
</body>
</html>