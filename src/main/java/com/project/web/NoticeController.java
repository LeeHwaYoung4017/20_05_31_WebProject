package com.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.LoginDAO;
import com.project.dao.noticeDAO;
import com.project.utill.FileUtills;
import com.project.vo.LoginVO;
import com.project.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */



@Controller
public class NoticeController {
	
	@Autowired
	public SqlSession sqlSession1;
	
	@Resource(name= "uploadPath1")
	private String uploadPath1;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	
	@RequestMapping("/noticeList")
	public String noticeList(HttpServletRequest request, Model model) {
		logger.info("noticeList 실행");
		/*
		 * noticeDAO mapper = sqlSession1.getMapper(noticeDAO.class); int pageSize = 8;
		 * int currentPage = 1; currentPage =
		 * Integer.parseInt(request.getParameter("currentPage"));
		 * 
		 * int totalCount = mapper.noticeList(); //전체 글의 개수 logger.info("공지의 전체 글 갯수 : "
		 * + totalCount);
		 * 
		 * AbstractApplicationContext ctx = new
		 * GenericXmlApplicationContext("classpath:applicationCTX.xml");
		 */
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeInsert")
	public String noticeInsert(HttpServletRequest request, Model model) {
		logger.info("noticeInsert 실행");
		
		return "notice/noticeInsert";
	}
	
	@RequestMapping(value = "/uploadForm1", method = RequestMethod.GET)
	public void uploadForm1GET(Model model){}
	
	@RequestMapping(value = "/uploadForm1", method = RequestMethod.POST)
	public String uploadForm1POST(HttpServletRequest request, Model model, NoticeVO vo, MultipartFile file) throws IOException {
		logger.info("noticeOK 실행");
		
		noticeDAO mapper = sqlSession1.getMapper(noticeDAO.class);
		int idx = mapper.noticeIdx();	//현재 notice 시퀸스 값을 알아온다.
		System.out.println("idx is : " + idx);
		
		vo.setContent(request.getParameter("content"));
		System.out.println("content is : " + request.getParameter("content"));
		String saveFileName = " ";
//		사진이 없을 경우
		if(file.getOriginalFilename().equals("")) {
			saveFileName = " ";
			System.out.println(saveFileName);
		} else {
			saveFileName = FileUtills.uploadFile(file, uploadPath1, idx);
			System.out.println(saveFileName);
		}
		System.out.println("saveFile Name is : " + saveFileName);
		
		vo.setFileName(saveFileName);
		mapper.noticeInsert(vo);
		
		return "notice/noticeList";
	}
	
	

	
}
