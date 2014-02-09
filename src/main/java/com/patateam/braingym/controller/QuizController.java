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

import com.patateam.braingym.dao.CategoryDAO;
import com.patateam.braingym.dao.QuizDAO;
import com.patateam.braingym.dao.TagDAO;
import com.patateam.braingym.model.Category;
import com.patateam.braingym.model.Quiz;
import com.patateam.braingym.model.Tag;



@Controller
public class QuizController {
	@Autowired private QuizDAO quizDAO;
	@Autowired private CategoryDAO categoryDAO;
	@Autowired private TagDAO tagDAO;   
	  /**
	   * This handler method is invoked when
	   * http://localhost:8080/pizzashop is requested.
	   * The method returns view name "index"
	   * which will be resolved into /WEB-INF/index.jsp.
	   *  See src/main/webapp/WEB-INF/servlet-context.xml
	   */
	  @RequestMapping(value = "/quizList", method = RequestMethod.POST)
	  public String list(@RequestParam(required=false) long categoryid, @RequestParam(required=false) String tag, Model model) {
		//long catid = category.getCatid();
		if(categoryid!=0 && !tag.isEmpty()){
			
			List<Quiz> quizzes = quizDAO.findAll(categoryid, tag);
		    model.addAttribute("quizzes", quizzes);
		}
		else if(categoryid!=0){
			List<Quiz> quizzes = quizDAO.findAll(categoryid);
		    model.addAttribute("quizzes", quizzes);
		}
		else if(!tag.isEmpty()){
			List<Quiz> quizzes = quizDAO.findAll(tag);
		    model.addAttribute("quizzes", quizzes);
		}
		else if(categoryid==0){
			List<Quiz> quizzes = quizDAO.findAll();
		    model.addAttribute("quizzes", quizzes);
		}
	    
	    return "quizList";
	  }
	  @RequestMapping(value = "/addQuiz", method = RequestMethod.GET)
	  public String addQuiz(Model model){
		  List<Category> categories = categoryDAO.findAll();
		  model.addAttribute("categories", categories);
		  return "addQuiz";
	  }
	  @RequestMapping(value = "/insertQuiz", method = RequestMethod.POST)
	  public String insertQuiz(@ModelAttribute(value="quiz") Quiz quiz, @RequestParam long categoryid, @RequestParam String tags, BindingResult result){
		  //long catid = category.getCatid();
		  String tagvalues[] = tags.split(",");
		  Tag tag = new Tag();
		  int i=0;
		  quiz.setCatid(categoryid);
		  quizDAO.addQuiz(quiz); 
		  for(i=0;i<tagvalues.length;i++){
			  tag.setTag(tagvalues[i]);
			  tag.setQzid(quiz.getQzid());
			  tagDAO.addTag(tag);
		  }
		  return "redirect:/";
	  }

}
