package com.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

@Controller
public class LoginController {
	
	@Autowired
	public SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
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
		return "login/login";
	}
	
	@RequestMapping("/loginOK")
	public String loginOK(HttpServletRequest request, HttpServletResponse response, Model model, LoginVO loginVO) throws IOException {
		System.out.println("컨트롤러의 LoginOK 실행");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		try {
//			login.jsp에서 넘어온 id의 정보를 vo에 담는다.
			LoginVO vo = mapper.selectById(id);
			try {
//				아이디 와 비밀번호가 데이터베이스와 일치한지 확인한다.
				if(vo.getId().equals(id) && vo.getPassword().equals(password)) {
//					아이디와 비밀번호가 일치하면 return값 쪽으로 id 세션을 날려준다.
					HttpSession session = request.getSession();
					session.setAttribute("vo", vo);
					return "redirect:mainHome";
				} else {
					response.setContentType("text/html; charset=UTF-8");
//					일치하지 않으면 틀렸다는 메시지를 출력해준다.
		            PrintWriter out = response.getWriter();
		            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
		            out.flush();
				}
			}catch (Exception e1) {
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	            out.flush();
			}
		}catch (Exception e) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
		}
		return "login/login";
	}
	
	@RequestMapping(value="/join")
	public String join(Model model, HttpServletRequest request) {
		return "login/join";
	}
	
	@RequestMapping(value="/joinOK")
	public String joinOK(Model model, HttpServletRequest request,  HttpServletResponse response, LoginVO vo) throws IOException {
		logger.info("joinOK 실행");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		vo.setAddress(request.getParameter("userAddr"));
		
		mapper.loginInsert(vo);
		
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
	
//	주소 API
	@RequestMapping("/jusoPopup")
	public String jusoPopup(HttpServletRequest request, Model model) {
		logger.info("jusoPopup start");
		return "login/jusoPopup";
	}
	

	
}
