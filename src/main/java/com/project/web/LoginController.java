package com.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.LoginDAO;
import com.project.vo.LoginList;
import com.project.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private LoginList loginList;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
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
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
        return "login/logout";
	}

	@RequestMapping(value="/join")
	public String join() {
		return "login/join";
	}
	
	@RequestMapping(value="/joinOK")
	public String joinOK(Model model, HttpServletRequest request, LoginVO vo) throws IOException {
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
	
//	회원 리스트
	@RequestMapping("/memberList")
	public String memberList(Model model) {
		logger.info("memberList start");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		int LoginCount = mapper.loginCount();	//전체 회원 정보 개수
		System.out.println(LoginCount);
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		int start = 0;	//첫 글
		hm.put("start", start);
		hm.put("end", LoginCount);
		
		loginList.setLoginList(mapper.LoginList(hm));	//전체 회원 정보
		System.out.println("loginList Clear");
		
		model.addAttribute("loginList", loginList);		//전체 회원 정보를 memberList.jsp 로 보낸다
		
		return "login/memberList";
	}
	
	@RequestMapping("/memberUpdate")
	public String memberUpdate(HttpSession request) {
		return "login/memberUpdate";
	}
	
	@RequestMapping("/memberUpdateOK")
	public String memberUpdateOK(HttpServletRequest request, LoginVO vo) {
		logger.info("memberUpdateOK 실행");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		vo.setAddress(request.getParameter("userAddr"));
		mapper.memberUpdate(vo);
		
		return "login/login";
	}
	
	@RequestMapping("/memberDelete")
	public String memberDelete(HttpServletRequest request) {
		logger.info("memberDelete 실행");
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		String id = request.getParameter("id");
		
		mapper.memberDelete(id);
		
		return "mainHome";
	}
	
	@RequestMapping("/memberManager")
	public String memberManager(HttpServletRequest request) {
		LoginDAO mapper = sqlSession.getMapper(LoginDAO.class);
		String id = request.getParameter("id");
		String chk = "";
		chk = mapper.managerchk(id);
		if(chk.equals("manager")) {
			mapper.removeManager(id);
		}else {
			mapper.addManager(id);
		}
		
		return "redirect:memberList";
	}
	
	@RequestMapping("/myPage")
	public String myPage(HttpServletRequest request) {
		
		return "login/myPage";
	}
	
}
