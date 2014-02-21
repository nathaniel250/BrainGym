package com.patateam.braingym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.patateam.braingym.dao.TagDAO;
import com.patateam.braingym.model.Tag;


@Controller
public class TagController {
	@Autowired private TagDAO tagDAO;
	
	@RequestMapping(value = "/tagList", method = RequestMethod.GET)
	public String list(Model model) {
		List<Tag> tags = tagDAO.findAll();
	    model.addAttribute("tags", tags);
		return "tagList";
	}
	
	@RequestMapping(value = "/editTag", method = RequestMethod.GET)
	public String editTag(@RequestParam long tagid, Model model){
		String tag = tagDAO.find(tagid).getTag();
		model.addAttribute("tag", tag);
		model.addAttribute("tagid", tagid);
		return "editTag";
	}
	
	@RequestMapping(value = "/updateTag", method = RequestMethod.POST)
	public String updateTag(@RequestParam long tagid, @RequestParam String tag){
		Tag updateTag = new Tag();
		updateTag.setTagid(tagid);
		updateTag.setTag(tag);
		tagDAO.editTag(updateTag);
		return "redirect:/tagList";
	}
	
	
	@RequestMapping(value = "/deleteTag", method = RequestMethod.GET)
	public String deleteTag(Model model, @RequestParam long tagid){
		tagDAO.deleteTag(tagid);
		return "redirect:/tagList";
	}
	
}
