package com.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.LoginDAO;
import com.project.vo.LoginVO;



/**
 * Handles requests for the application home page.
 */



@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "mainHome";
	}
	
	@RequestMapping(value="/mainHome")
	public String mainHome(Model model, HttpServletRequest request) {
		
		return "mainHome";
	}
	
	@RequestMapping(value="/login")
	public String login(Model model, HttpServletRequest request) {
		
		return "login";
	}
	
	@RequestMapping(value="/join")
	public String join(Model model, HttpServletRequest request) {
		return "join";
	}
	
	@RequestMapping(value="/joinOK")
	public String joinOK(Model model, HttpServletRequest request,  HttpServletResponse response, LoginVO vo) throws IOException {
		logger.info("joinOK 실행");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		
		mapper.loginInsert(vo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('회원가입이 완료되었습니다.'); history.go(-1);</script>");
        out.flush();
		
		return "redirect:mainHome";
	}
	
//	아이디 중복체크(아작스)
	@RequestMapping(value="/checkID")
	public void checkID(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		String result_id = mapper.checkID(id);
		String str;
		StringBuffer result = new StringBuffer();
		if(result_id == null) {
			str = "OK";
		}else {
			str = "NOT";
		}
		result.append("{\"result\":");
		result.append("[{\"value\":\"" + str + "\"}],");
		result.append("}");
		System.out.println(result);
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
}
