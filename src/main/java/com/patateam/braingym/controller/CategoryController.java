package com.patateam.braingym.controller;

import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.bind.annotation.CookieValue;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.patateam.braingym.dao.CategoryDAO;
import com.patateam.braingym.model.Category;
import com.patateam.braingym.model.Quiz;

@Controller
public class CategoryController {
	@Autowired private CategoryDAO categoryDAO;
	
	@RequestMapping(value = "/categoryList", method = RequestMethod.GET)
	public String list(Model model) {
		List<Category> categories = categoryDAO.findAll();
	    model.addAttribute("categories", categories);
		return "categoryList";
	}
	
	@RequestMapping(value = "/editCategory", method = RequestMethod.GET)
	public String editCategory(@RequestParam long categoryid, Model model){
		String category = categoryDAO.find(categoryid).getCategory();
		model.addAttribute("category", category);
		model.addAttribute("categoryid", categoryid);
		return "editCategory";
	}
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute(value="category") Category category, Model model){
		categoryDAO.addCategory(category);
		return "redirect:/categoryList";
	}
	
	@RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
	public String updateCategory(@RequestParam long categoryid, @RequestParam String category){
		Category updateCategory = new Category();
		updateCategory.setCategoryid(categoryid);
		updateCategory.setCategory(category);
		categoryDAO.editCategory(updateCategory);
		return "redirect:/categoryList";
	}
	
	@RequestMapping(value = "/deleteCategory", method = RequestMethod.GET)
	public String deleteCategory(Model model, @RequestParam long categoryid){
		categoryDAO.deleteCategory(categoryid);
		return "redirect:/categoryList";
	}
}
