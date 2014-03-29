package com.patateam.braingym.controller;

import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.bind.annotation.CookieValue;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.patateam.braingym.dao.CategoryDAO;
import com.patateam.braingym.dao.CommentDAO;
import com.patateam.braingym.dao.QuestionDAO;
import com.patateam.braingym.dao.QuizDAO;
import com.patateam.braingym.dao.QuizTagDAO;
import com.patateam.braingym.dao.TagDAO;
import com.patateam.braingym.model.Category;
import com.patateam.braingym.model.Comment;
import com.patateam.braingym.model.Quiz;
import com.patateam.braingym.model.Tag;



@Controller
public class QuizController {
	@Autowired private QuizDAO quizDAO;
	@Autowired private CategoryDAO categoryDAO;
	@Autowired private TagDAO tagDAO;
	@Autowired private QuizTagDAO quizTagDAO;
	@Autowired private CommentDAO commentDAO;
	
	
	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	  /**
	   * This handler method is invoked when
	   * http://localhost:8080/pizzashop is requested.
	   * The method returns view name "index"
	   * which will be resolved into /WEB-INF/index.jsp.
	   *  See src/main/webapp/WEB-INF/servlet-context.xml
	   */
	
	  @RequestMapping(value="/searchQuiz")
	  public String searchQuiz(Model model){
		  List<Category> categories = categoryDAO.findAll();
		  model.addAttribute("categories", categories);
		  return "searchQuiz";
	  }
	  
	  @RequestMapping(value = "/quizList", method = RequestMethod.POST)
	  public String list(@RequestParam(required=false) long categoryid, @RequestParam(required=false) String tag, Model model) {
		//long catid = category.getCatid();
		if(categoryid!=0 && !tag.isEmpty()){
			//logger.info("ETO NA ANG TAG: {}",tag);
			List<Quiz> quizzes = quizDAO.findAll(categoryid, tag);
		    model.addAttribute("quizzes", quizzes);
		}
		else if(categoryid!=0){
			List<Quiz> quizzes = quizDAO.findAll(categoryid);
		    model.addAttribute("quizzes", quizzes);
		}
		else if(!tag.isEmpty()){
			//logger.info("ETO NA ANG TAG: {}",tag);
			List<Quiz> quizzes = quizDAO.findAll(tag);
		    model.addAttribute("quizzes", quizzes);
		}
		else if(categoryid==0){
			List<Quiz> quizzes = quizDAO.findAll();
		    model.addAttribute("quizzes", quizzes);
		}
		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);
		
	    return "quizList";
	  }
	  
	  @RequestMapping(value = "/addQuiz", method = RequestMethod.GET)
	  public String addQuiz(Model model){
		  List<Category> categories = categoryDAO.findAll();
		  model.addAttribute("categories", categories);
		  model.addAttribute("warning", "Title is required.");
		  return "addQuiz";
	  }
	  
	  @RequestMapping(value = "/quizList", method = RequestMethod.GET)
	  public String quizList(Model model){
			List<Quiz> quizzes = quizDAO.findAll();
			model.addAttribute("quizzes", quizzes);
			List<Category> categories = categoryDAO.findAll();
			model.addAttribute("categories", categories);
		  return "quizList";
	  }
	  
	  @RequestMapping(value = "/insertQuiz", method = RequestMethod.POST)
	  public String insertQuiz(@ModelAttribute(value="quiz") Quiz quiz, @RequestParam long categoryid, @RequestParam String tags, BindingResult result){
		  //long catid = category.getCatid();
		  quiz.setTitle(quiz.getTitle().trim());
		  if(!quiz.getTitle().isEmpty()){
			  String tagvalues[] = tags.split(",");
			  Tag tag = new Tag();
			  int i=0;
			  quiz.setCatid(categoryid);
			  quizDAO.addQuiz(quiz); 
			  for(i=0;i<tagvalues.length;i++){
				  Tag tagOld = tagDAO.find(tagvalues[i].trim());
				  //logger.info("Welcome {}.", tagOld);
				  if(tagOld == null){
					  tag.setTag(tagvalues[i].trim());
					  tagDAO.addTag(tag);
					  quizTagDAO.addQuizTag(quiz.getQzid(), tag.getTagid());
				  }
				  else{
					  
					  
					  quizTagDAO.addQuizTag(quiz.getQzid(), tagOld.getTagid());
				  }
			  }
			  return "redirect:/questionList?quizid="+quiz.getQzid();
		  }
		  return "redirect:/addQuiz";
		  
		  
	  }
	  
	  @RequestMapping(value = "/editQuiz", method = RequestMethod.GET)
	  public String editQuiz(Model model, @RequestParam long qzid){
		  Quiz quiz = quizDAO.find(qzid);
		  List<Category> categories = categoryDAO.findAll();
		  List<Long> tagids = quizTagDAO.findTagId(qzid);
		  List<Tag> tags = new ArrayList<Tag>();
		  for(long tagid: tagids){
			  Tag tag = tagDAO.find(tagid);
			  tags.add(tag);
			  //logger.info("Welcome home! The client tag is {}.", tag);
		  }
		  model.addAttribute("tags", tags);
		  model.addAttribute("categories", categories);
		  model.addAttribute("quiz", quiz);
		  model.addAttribute("warning", "Title is required.");
		  return "editQuiz";
	  }
	  
	  @RequestMapping(value = "/updateQuiz", method = RequestMethod.POST)
	  public String updateQuiz(@ModelAttribute(value="quiz") Quiz quiz, @RequestParam long qzid, @RequestParam long categoryid, @RequestParam String tags, BindingResult result){
			quiz.setTitle(quiz.getTitle().trim());
		  	if(!quiz.getTitle().isEmpty()){
			  String tagvalues[] = tags.split(",");
			  Tag tag = new Tag();
			  int i=0;
			  List<Long> tagids = quizTagDAO.findTagId(qzid);
			  List<String> oldTags = new ArrayList<String>();
			  for(long tagid: tagids){
				  Tag temp = tagDAO.find(tagid);
				  //logger.info("tag old: {}",temp.getTag());
				  oldTags.add(temp.getTag());
			  }
			  
			  for(i=0;i<tagvalues.length;i++){
				  //logger.info("potek tag old: 1{}2",oldTags.get(0));
				  //logger.info("potek tag old: 1{}2",tagvalues[i]);
				  if(oldTags.contains(tagvalues[i].trim())){
					  oldTags.remove(tagvalues[i].trim());
					  //logger.info("potek tag old: {}",oldTags.remove(tagvalues[i]));
					  tagvalues[i] = "";
				  }
			  }
			  for(String oldtag: oldTags){
				  quizTagDAO.deleteQuizTag(qzid, tagDAO.find(oldtag).getTagid());
			  }
			  
			  quiz.setCatid(categoryid);
			  quiz.setQzid(qzid);
			  quizDAO.updateQuiz(quiz); 
			  for(i=0;i<tagvalues.length;i++){
				  if(!tagvalues[i].equals("")){
					  //logger.info("tag tag tag: {}",tagvalues[i]);
					  Tag temp = tagDAO.find(tagvalues[i].trim());
					  if(temp==null){
						  tag.setTag(tagvalues[i].trim());
						  tagDAO.addTag(tag);
						  quizTagDAO.addQuizTag(qzid, tag.getTagid());
					  }
					  else{
						  quizTagDAO.addQuizTag(qzid, temp.getTagid());
					  }
					  
				  }
			  }
			  return "redirect:/questionList?quizid="+quiz.getQzid();
	  	}
		  return "redirect:/editQuiz?quizid="+quiz.getQzid();
	  }
	  
	  
	  @RequestMapping(value = "/deleteQuiz", method = RequestMethod.GET)
	  public String deleteQuiz(Model model, @RequestParam long qzid){
		  quizDAO.deleteQuiz(qzid);
		  return "redirect:/searchQuiz";
	  }
	  
	  @RequestMapping(value = "/updateCommentQuiz", method = RequestMethod.POST)
	  public String updateCommentQuiz(Model model,  @ModelAttribute(value="quiz") Quiz quiz, @ModelAttribute(value="comment") Comment comment, @RequestParam(required=false) long qzid){
		  comment.setComment(comment.getComment().trim());
		  if(!comment.getComment().isEmpty()){
			  comment.setQzid(qzid);
			  commentDAO.addComment(comment);
			  return "redirect:/questionList?quizid="+qzid;
		  }
		  return "redirect:/commentQuiz?qzid="+qzid;
		  
	  }
	  
	  @RequestMapping(value = "/commentQuiz", method = RequestMethod.GET)
	  public String commentQuiz(Model model, @RequestParam long qzid){
		  model.addAttribute("qzid",qzid);
		  return "commentQuiz";
	  }

}
