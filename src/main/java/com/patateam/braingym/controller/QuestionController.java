package com.patateam.braingym.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

import com.patateam.braingym.dao.QuestionDAO;
import com.patateam.braingym.model.Question;

@Controller
//@RequestMapping("/")
public class QuestionController {
	@Autowired private QuestionDAO questionDAO;
	   
	  /**
	   * This handler method is invoked when
	   * http://localhost:8080/pizzashop is requested.
	   * The method returns view name "index"
	   * which will be resolved into /WEB-INF/index.jsp.
	   *  See src/main/webapp/WEB-INF/servlet-context.xml
	   */
	  @RequestMapping(value = "/questionList", params = "quizid", method = RequestMethod.GET)
	  public String list(@RequestParam(value="quizid") long qzid, Model model) {
	    List<Question> questions = questionDAO.findAll(qzid);
	    model.addAttribute("questions", questions);
	    model.addAttribute("quizid", qzid);
	    return "questionList";
	  }
	  @RequestMapping(value = "/addQuestion", params = "quizid", method = RequestMethod.GET)
	  public String addQuestion(@RequestParam(value="quizid", required=false) long qzid, Model model){
		  model.addAttribute("quizid", qzid);
		  
		  return "addQuestion";
	  }
	  @RequestMapping(value = "/insertQuestion", params = "quizid", method = RequestMethod.POST)
	  public String insertQuestion(@RequestParam(value="quizid") long qzid, @RequestParam("file") MultipartFile file, HttpServletResponse httpServletResponse, @ModelAttribute(value="question") Question question, BindingResult result) throws IOException{
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
	  
	  @RequestMapping(value = "/deleteQuestion", method = RequestMethod.GET)
	  public String deleteQuiz(Model model, @RequestParam long qid){
		  Question question = questionDAO.find(qid);
		  questionDAO.deleteQuestion(qid);
		  long qzid = question.getQzid();
		  return "redirect:/questionList?quizid="+qzid;
	  }
	  
	  
}
