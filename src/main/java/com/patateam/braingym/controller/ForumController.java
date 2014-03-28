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
import com.patateam.braingym.dao.ForumDAO;
import com.patateam.braingym.model.Category;
import com.patateam.braingym.model.Forum;

@Controller
public class ForumController {
	@Autowired private ForumDAO forumDAO;
	@Autowired private CategoryDAO categoryDAO;
	
	
	@RequestMapping(value="/searchForum")
	  public String searchForum(Model model){
		  List<Category> categories = categoryDAO.findAll();
		  model.addAttribute("categories", categories);
		  return "searchForum";
	  }
	  
	  @RequestMapping(value = "/forumList", method = RequestMethod.POST)
	  public String list(@RequestParam(required=false) long categoryid, Model model) {
		if(categoryid!=0){
			List<Forum> forums = forumDAO.findAll(categoryid);
		    model.addAttribute("forums", forums);
		}
		else if(categoryid==0){
			List<Forum> forums = forumDAO.findAll();
		    model.addAttribute("forums", forums);
		}
	    
	    return "forumList";
	  }
	  
	  @RequestMapping(value = "/addForum", method = RequestMethod.GET)
	  public String addForum(Model model){
		  List<Category> categories = categoryDAO.findAll();
		  model.addAttribute("categories", categories);
		  return "addForum";
	  }
	  
	  @RequestMapping(value = "/insertForum", method = RequestMethod.POST)
	  public String insertForum(@ModelAttribute(value="forum") Forum forum, @RequestParam long categoryid, BindingResult result){
		  forum.setCategoryid(categoryid);
		  forumDAO.addForum(forum); 
		  return "redirect:/forumCommentList?forumid="+forum.getForumid();
	  }
	  
	  @RequestMapping(value = "/editForum", method = RequestMethod.GET)
	  public String editForum(Model model, @RequestParam long forumid){
		  Forum forum = forumDAO.find(forumid);
		  List<Category> categories = categoryDAO.findAll();
		  model.addAttribute("categories", categories);
		  model.addAttribute("forum", forum);
		  
		  return "editForum";
	  }
	  
	  @RequestMapping(value = "/updateForum", method = RequestMethod.POST)
	  public String updateForum(@ModelAttribute(value="forum") Forum forum, @RequestParam long forumid, @RequestParam long categoryid, BindingResult result){
		  forum.setCategoryid(categoryid);
		  forum.setForumid(forumid);
		  forumDAO.updateForum(forum); 
		  return "redirect:/forumCommentList?forumid="+forum.getForumid();
	  }
	  
	  @RequestMapping(value = "/deleteForum", method = RequestMethod.GET)
	  public String deleteForum(Model model, @RequestParam long forumid){
		  forumDAO.deleteForum(forumid);
		  return "redirect:/searchForum";
	  }
}
