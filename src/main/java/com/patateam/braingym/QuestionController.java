package com.patateam.braingym;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.patateam.braingym.Question;
import com.patateam.braingym.QuestionDAO;

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
	  @RequestMapping(value = "/", method = RequestMethod.GET)
	  public String list(Model model) {
	    List<Question> questions = questionDAO.findAll();
	    model.addAttribute("questions", questions);
	    return "index";
	  }
	  @RequestMapping(value = "/addQuestion", method = RequestMethod.GET)
	  public String addQuestion(Model model){
		  return "addQuestion";
	  }
	  @RequestMapping(value = "/insertQuestion", method = RequestMethod.POST)
	  public String insertQuestion(@ModelAttribute(value="question") Question question, BindingResult result){
		  questionDAO.addQuestion(question); 
		  return "redirect:/";
	  }
	  
	  
	  
	  
}
