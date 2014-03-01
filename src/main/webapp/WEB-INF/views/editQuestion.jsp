<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Question</title>
</head>
<body>
<form action="updateQuestion" method="post" enctype='multipart/form-data'>
	<input type="hidden" name="qid" value=${question.qid }>
	<input type="hidden" name="qzid" value=${question.qzid }>
	<table>  
   	<tr>  
   		<td>Question:</td>  
      	<td><input type="text" name="question" value="${question.question }"></td>  
   	</tr>  
  	<tr>  
      	<td>Answer:</td>  
      	<td><input type="text" name="answer" value="${question.answer }"></td>  
   	</tr>
  	<tr>  
   		<td>Choice A:</td>  
   		<td><input type="text" name="choiceA" value="${question.choiceA }"></td>  
    </tr>
  	<tr>  
      	<td>Choice B:</td>  
      	<td><input type="text" name="choiceB" value="${question.choiceB }"></td>  
   	</tr>
   	<tr>  
      	<td>Choice C:</td>  
      	<td><input type="text" name="choiceC" value="${question.choiceC }"></td>  
   	</tr>
   	<tr>  
      	<td>Choice D:</td>  
      	<td><input type="text" name="choiceD" value="${question.choiceD }"></td>  
   	</tr>
   	<tr>
	   	<td>Upload Image (Optional): </td>
	    <td><input type="file" name="file" id="file"></td>
	</tr>
   	<tr>  
      	<td><input type="submit" value="Add"></td>  
   	</tr>
    </table>
    </form>
</body>
</html>