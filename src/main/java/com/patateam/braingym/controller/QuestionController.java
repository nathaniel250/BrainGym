package com.patateam.braingym.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.patateam.braingym.dao.CommentDAO;
import com.patateam.braingym.dao.QuestionDAO;
import com.patateam.braingym.model.Comment;
import com.patateam.braingym.model.Question;

@Controller
public class QuestionController {
	@Autowired private QuestionDAO questionDAO;
	@Autowired private CommentDAO commentDAO;
	   
	  /**
	   * This handler method is invoked when
	   * http://localhost:8080/pizzashop is requested.
	   * The method returns view name "index"
	   * which will be resolved into /WEB-INF/index.jsp.
	   *  See src/main/webapp/WEB-INF/servlet-context.xml
	   */
	
	  @RequestMapping(value="/takeQuiz")
	  public String takeQuiz(@RequestParam(value="qzid") long qzid, @RequestParam(value="timer") long timer, Model model){
		  List<Question> questions = questionDAO.findAll(qzid);
		  model.addAttribute("timer", timer);
		  model.addAttribute("timerms", timer*1000);
		  model.addAttribute("questions", questions);
		  model.addAttribute("quizid", qzid);
		  return "takeQuiz";
	  }
	  
	  @SuppressWarnings("unchecked")
	  @RequestMapping(value="/resultQuiz", method = RequestMethod.POST)
	  public String resultQuiz(Model model, @RequestParam long qzid, HttpServletRequest req){
		  //cant handle radiobuttons with no answer
		  List<String> values = new ArrayList<String>();
		  Enumeration<String> enumeration = req.getParameterNames();
		  while (enumeration.hasMoreElements()) {
			  String parameterName = (String) enumeration.nextElement();
			  if(parameterName.startsWith("Q")) {
				  //logger.info("{}",req.getParameter(parameterName));
				  if(req.getParameter(parameterName).isEmpty()){
					  values.add("-- No Answer --");
				  }
				  else{
					  values.add(req.getParameter(parameterName));
				  }
			  }
		  }
		  List<Question> questions = questionDAO.findAll(qzid);
		  model.addAttribute("questions", questions);
		  model.addAttribute("answers", values);
		  //model.addAttribute("qzid", qzid);
		  int result = 0;
		  for(Question question: questions){
			  if(question.getAnswer().equals(values.get(questions.indexOf(question)))){
				  result++;
			  }
		  }
		  Double percentage = ((double)result/(double)questions.size())*100;
		  DecimalFormat df = new DecimalFormat("#.##");
		  model.addAttribute("result",result);
		  model.addAttribute("total",questions.size());
		  model.addAttribute("percentage",df.format(percentage));
		  return "resultQuiz";
	  }
	  
	  @RequestMapping(value = "/questionList", params = "quizid", method = RequestMethod.GET)
	  public String list(@RequestParam(value="quizid") long qzid, Model model) {
		  	List<Question> questions = questionDAO.findAll(qzid);
		    List<Comment> comments = commentDAO.findAll(qzid);
		    model.addAttribute("questions", questions);
		    model.addAttribute("comments", comments);
		    model.addAttribute("quizid", qzid);
		    return "questionList";
	  }
	  
	  @RequestMapping(value = "/addQuestion", params = "quizid", method = RequestMethod.GET)
	  public String addQuestion(@RequestParam(value="quizid", required=false) long qzid, Model model){
		  model.addAttribute("quizid", qzid);
		  return "addQuestion";
	  }
	  @RequestMapping(value = "/insertQuestion", method = RequestMethod.POST)
	  public String insertQuestion(@RequestParam(value="qzid") long qzid, @RequestParam("file") MultipartFile file, HttpServletResponse httpServletResponse, @ModelAttribute(value="question") Question question, BindingResult result) throws IOException{
		  if (!file.isEmpty()) {
			  String path="C:/BrainGym/Quizzes/"+qzid;
			  new File(path).mkdirs();
			  File dest = new File(path+"/"+file.getOriginalFilename());
			  file.transferTo(dest);
			  question.setImage(path+"/"+file.getOriginalFilename()); 
		  }
		  question.setQzid(qzid);
		  questionDAO.addQuestion(question); 
		  return "redirect:/questionList?quizid="+qzid;
	  }
	  
	  @RequestMapping(value = "/editQuestion", method = RequestMethod.GET)
	  public String editQuestion(Model model, @RequestParam long qid){
		  Question question = questionDAO.find(qid);
		  model.addAttribute("question", question);
		  return "editQuestion";
	  }
	  
	  @RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
	  public String updateQuestion(@ModelAttribute(value="question") Question question, @RequestParam long qid, @RequestParam long qzid, @RequestParam("file") MultipartFile file, BindingResult result) throws IOException{
		  if (!file.isEmpty()) {
			  String path="C:/BrainGym/Quizzes/"+qzid;
			  new File(path).mkdirs();
			  File dest = new File(path+"/"+file.getOriginalFilename());
			  file.transferTo(dest);
			  question.setImage(path+"/"+file.getOriginalFilename()); 
		  }
		  question.setQid(qid);
		  question.setQzid(qzid);
		  questionDAO.updateQuestion(question);
		  return "redirect:/questionList?quizid="+qzid;
	  }
	  
	  @RequestMapping(value = "/deleteQuestion", method = RequestMethod.GET)
	  public String deleteQestion(Model model, @RequestParam long qid){
		  Question question = questionDAO.find(qid);
		  long qzid = question.getQzid();
		  questionDAO.deleteQuestion(qid);
		  return "redirect:/questionList?quizid="+qzid;
	  }
	  
	  
}
