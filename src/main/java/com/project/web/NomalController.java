package com.project.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NomalController {
	
	@Autowired
	public SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "mainHome";
	}
	
	@RequestMapping(value="/mainHome")
	public String mainHome(Model model, HttpServletRequest request) {
		return "mainHome";
	}
	
	@RequestMapping("/managerModeHome")
	public String managerModeHome(HttpServletRequest request, Model model) {
		logger.info("managerModeHome 실행");
		
		return "managerMode/managerModeHome";
	}
}
