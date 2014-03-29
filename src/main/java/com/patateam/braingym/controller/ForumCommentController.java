package com.patateam.braingym.controller;

import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.bind.annotation.CookieValue;

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

import com.patateam.braingym.dao.ForumCommentDAO;
import com.patateam.braingym.dao.ForumDAO;
import com.patateam.braingym.model.ForumComment;


@Controller
public class ForumCommentController {
	@Autowired private ForumCommentDAO forumCommentDAO;
	@Autowired private ForumDAO forumDAO;
	
	@RequestMapping(value = "/forumCommentList", params = "forumid", method = RequestMethod.GET)
	  public String list(@RequestParam(value="forumid") long forumid, Model model) {
		  	List<ForumComment> forumComments = forumCommentDAO.findAll(forumid);
		    model.addAttribute("forumComments", forumComments);
		    model.addAttribute("forumid", forumid);
		    model.addAttribute("forumtopic", forumDAO.find(forumid).getTopic());
		    model.addAttribute("forumsubtopic", forumDAO.find(forumid).getSubtopic());
		    
		    return "forumCommentList";
	  }
	  
	  @RequestMapping(value = "/addForumComment", params = "forumid", method = RequestMethod.GET)
	  public String addForumComment(@RequestParam(value="forumid", required=false) long forumid, Model model){
		  model.addAttribute("forumid", forumid);
		  return "redirect:/forumCommentList?forumid="+forumid;
	  }
	  @RequestMapping(value = "/insertForumComment", method = RequestMethod.POST)
	  public String insertForumComment(@RequestParam(value="forumid") long forumid, HttpServletResponse httpServletResponse, @ModelAttribute(value="forumComment") ForumComment forumComment, BindingResult result){
		  forumComment.setForumComment(forumComment.getForumComment().trim());
		  if(!forumComment.getForumComment().isEmpty()){
			  forumComment.setForumid(forumid);
			  forumCommentDAO.addForumComment(forumComment);  
		  }
		  return "redirect:/forumCommentList?forumid="+forumid;
	  }
	  
	  @RequestMapping(value = "/editForumComment", method = RequestMethod.GET)
	  public String editForumComment(Model model, @RequestParam long forumCommentid){
		  ForumComment forumComment = forumCommentDAO.find(forumCommentid);
		  model.addAttribute("forumComment", forumComment);
		  return "editForumComment";
	  }
	  
	  @RequestMapping(value = "/updateForumComment", method = RequestMethod.POST)
	  public String updateForumComment(@ModelAttribute(value="forumComment") ForumComment forumComment, @RequestParam long forumCommentid, @RequestParam long forumid, BindingResult result){
		  forumComment.setForumComment(forumComment.getForumComment().trim());
		  if(!forumComment.getForumComment().isEmpty()){
			  forumComment.setForumCommentid(forumCommentid);
			  forumComment.setForumid(forumid);
			  forumCommentDAO.updateForumComment(forumComment);
			  return "redirect:/forumCommentList?forumid="+forumid;
		  }
		  return "redirect:/editForumComment?forumid"+forumid+"&forumCommentid="+forumCommentid;
	  }
	  
	  @RequestMapping(value = "/deleteForumComment", method = RequestMethod.GET)
	  public String deleteForumComment(Model model, @RequestParam long forumCommentid){
		  ForumComment forumComment = forumCommentDAO.find(forumCommentid);
		  long forumid = forumComment.getForumid();
		  forumCommentDAO.deleteForumComment(forumCommentid);
		  return "redirect:/forumCommentList?forumid="+forumid;
	  }
	  
}
