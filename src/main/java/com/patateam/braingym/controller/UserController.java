package com.patateam.braingym.controller;

import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.bind.annotation.CookieValue;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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
import com.patateam.braingym.dao.QuizDAO;
import com.patateam.braingym.dao.QuizHistoryDAO;
import com.patateam.braingym.dao.UserDAO;
import com.patateam.braingym.model.Category;
import com.patateam.braingym.model.Quiz;
import com.patateam.braingym.model.QuizHistory;
import com.patateam.braingym.model.User;

@Controller
public class UserController {
	@Autowired private UserDAO userDAO;
	@Autowired private QuizDAO quizDAO;
	@Autowired private QuizHistoryDAO quizHistoryDAO;
	@Autowired private CategoryDAO categoryDAO;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model){
		User user =  userDAO.find(0);
		model.addAttribute("user", user);
		return "profile";
	}
	
	@RequestMapping(value = "/quizHistory", method = RequestMethod.GET)
	public String quizHistory(Model model, @RequestParam long userid){
		List<QuizHistory> quizzes = quizHistoryDAO.findAll(userid);
		Collections.reverse(quizzes);
		model.addAttribute("quizzes", quizzes);
		return "quizHistory";
	}
	
	@RequestMapping(value = "/myQuizzes", method = RequestMethod.GET)
	public String myQuizzes(Model model, @RequestParam long userid){
		List<Quiz> quizzes = quizDAO.findAllMyQuiz(userid);
		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("quizzes", quizzes);
		return "myQuizzes";
	}
	
	
}
