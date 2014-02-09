package com.patateam.braingym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	  public String insertQuestion(@RequestParam(value="quizid") long qzid, @ModelAttribute(value="question") Question question, BindingResult result){
		  question.setQzid(qzid);
		  questionDAO.addQuestion(question); 
		  return "redirect:/questionList?quizid="+qzid;
	  }
	  
	  
	  
	  
}
