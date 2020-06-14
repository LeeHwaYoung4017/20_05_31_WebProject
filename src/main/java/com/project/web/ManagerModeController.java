package com.project.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerModeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	
	@RequestMapping("/managerModeHome")
	public String managerModeHome(HttpServletRequest request, Model model) {
		logger.info("managerModeHome 실행");
		
		return "managerMode/managerModeHome";
	}
}
