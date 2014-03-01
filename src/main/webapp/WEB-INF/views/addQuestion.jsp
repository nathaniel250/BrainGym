<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Brain Gym - Add Question</title>
</head>
<body>
	<form action="insertQuestion" method="post" enctype='multipart/form-data'>
	<input type="hidden" name="qzid" value=${quizid }>
	<table>  
   	<tr>  
   		<td>Question:</td>  
      	<td><input type="text" name="question"></td>  
   	</tr>  
  	<tr>  
      	<td>Answer:</td>  
      	<td><input type="text" name="answer"></td>  
   	</tr>
  	<tr>  
   		<td>Choice A:</td>  
   		<td><input type="text" name="choiceA"></td>  
    </tr>
  	<tr>  
      	<td>Choice B:</td>  
      	<td><input type="text" name="choiceB"></td>  
   	</tr>
   	<tr>  
      	<td>Choice C:</td>  
      	<td><input type="text" name="choiceC"></td>  
   	</tr>
   	<tr>  
      	<td>Choice D:</td>  
      	<td><input type="text" name="choiceD"></td>  
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