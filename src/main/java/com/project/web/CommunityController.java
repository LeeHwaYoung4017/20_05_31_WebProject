package com.project.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.project.dao.communityDAO;
import com.project.vo.CommunityCommentList;
import com.project.vo.CommunityCommentVO;
import com.project.vo.CommunityList;
import com.project.vo.CommunityVO;

@Controller
public class CommunityController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private CommunityList communityList;
	
	@Autowired
	private CommunityCommentList communityCommentList;
	
	@Resource(name="uploadPath2")
	private String uploadPath2;
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping("/communityInsert")
	public String communityInsert() {
		return "community/communityInsert";
	}
	
	@RequestMapping(value="/communityInsertOK", method = RequestMethod.GET)
	public void communityInsertOKGET() {}

	@RequestMapping(value="/communityInsertOK", method = RequestMethod.POST)
	public String communityInsertOKPOST(HttpServletRequest request, CommunityVO vo, MultipartFile file) throws IllegalStateException, IOException {
		communityDAO mapper = sqlSession.getMapper(communityDAO.class);
		int idx = mapper.communityIdx();	// 커뮤니티 시퀀스 값을 가져온다.
		
		logger.info("communityIdx is = " + idx);
		String saveFileName = " ";
		if(file.getOriginalFilename().equals("")) {
			saveFileName = "noimage.jpg";		//노이미지 명
			System.out.println("saveFileName is = " + saveFileName);
			File save = new File(uploadPath2,saveFileName);	// 저장할 폴더 이름, 저장할 파일 이름
			vo.setFileName(saveFileName);
			file.transferTo(save);	//해당 경로로 이미지를 저장한다.
			mapper.communityInsert(vo);
			return "redirect:communityInsert";
		} else {
			String originalName = file.getOriginalFilename();
			saveFileName = idx+originalName.substring(originalName.lastIndexOf("."));	//이미지 명 + 파일 형식
			System.out.println("saveFileName is = " + saveFileName);
			File save = new File(uploadPath2,saveFileName);	//저장할 폴더 이름, 저장할 파일 이름
			vo.setFileName(saveFileName);
			file.transferTo(save);	//해당 결로로 이미지를 저장
			mapper.communityInsert(vo);
			return "redirect:communityInsert";
		}
	}
	
	@RequestMapping("/communityList")
	public String communityList(HttpServletRequest request, Model model) {
		logger.info("communityList 실행");
		communityDAO mapper = sqlSession.getMapper(communityDAO.class);
		int pageSize = 20;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}catch (Exception e) {}
		int totalCount = mapper.communityCount();
		logger.info("totalCount is = " + totalCount);
		
		communityList.initCommunityList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("start", communityList.getStartNo());
		hm.put("end", communityList.getEndNo());
		System.out.println(hm);
		communityList.setCommunityList(mapper.communityList(hm));
		
		model.addAttribute("communityList", communityList);
		
		return "community/communityList";
	}
	
	@RequestMapping("/communitySubList")
	public String communityEventList(HttpServletRequest request, Model model) {
		logger.info("communitySubList 실행");
		communityDAO mapper = sqlSession.getMapper(communityDAO.class);
		
		String categoryNum = request.getParameter("category");
		int pageSize = 8;
		if(categoryNum.equals("3")) {
			pageSize = 20;	// 카테고리가 잡담이면 한 페이지에 글을 20개씩 뽑는다.
		}else {
			pageSize = 8;	// 그 외 카테고리는 8개씩 뽑는다.
		}
		
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}catch (Exception e) {}
		int totalCount = mapper.communityEventCount(categoryNum); //IT행사 글을 뽑아온다
		logger.info("currentPage is = " + currentPage);
		logger.info("totalCount is = " + totalCount);
		
		communityList.initCommunityList(pageSize, totalCount, currentPage);
		logger.info("communityList.initCommunityList 실행 완료");
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("start", communityList.getStartNo());
		hm.put("end", communityList.getEndNo());
		hm.put("categoryNum", Integer.parseInt(request.getParameter("category")));
		System.out.println(hm);
		
		communityList.setCommunityList(mapper.communitySubList(hm));
		
		model.addAttribute("communityList", communityList);
		model.addAttribute("category",categoryNum);
		
		return "community/communitySubList";
	}
	
	@RequestMapping("/communityView")
	public String communityView(HttpServletRequest request, Model model, CommunityVO vo, CommunityCommentVO vo2) {
		logger.info("communityView 실행");
		communityDAO mapper = sqlSession.getMapper(communityDAO.class);
//		게시물을 불러오는 곳
		int idx = Integer.parseInt(request.getParameter("idx"));
		logger.info("communityView is idx = " + idx);
		vo = mapper.communityData(idx);
		
//		댓글을 불러오는 곳
		int pageSize = 30;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}catch(Exception e) {}
		int totalCount = mapper.commentCount(idx);
		
		communityCommentList.initCommunityCommentList(pageSize, totalCount, currentPage);
		logger.info("communityCommentList.initCommunityCommentList 실행 완료");
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("start", communityCommentList.getStartNo());
		hm.put("end", communityCommentList.getEndNo());
		hm.put("ref", idx);
		
		communityCommentList.setCommunityCommentList(mapper.commentList(hm));
		
//		조회수 증가시키는 곳
		mapper.communityHitUp(idx);
		
//		해당 정보를 View단에 전달한다.
		model.addAttribute("vo", vo);
		model.addAttribute("currentPage", Integer.parseInt(request.getParameter("currentPage")));
		model.addAttribute("communityCommentList", communityCommentList);
		
		return "community/communityView";
	}
	
	@RequestMapping(value="/communityCommentOK", method = RequestMethod.GET)
	public void communityCommentOKGET() {}
	
	@RequestMapping(value = "/communityCommentOK", method = RequestMethod.POST)
	public String communityCommentOKPOST(HttpServletRequest request, Model model, CommunityCommentVO vo) {
		logger.info("communityCommentOK 실행");
		communityDAO mapper = sqlSession.getMapper(communityDAO.class);
		int idx = Integer.parseInt(request.getParameter("ref"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String category = request.getParameter("category");
		
		mapper.commentInsert(vo);	//댓글을 추가한다.
		mapper.commentCountUpdate(idx);	//해당 글의 댓글 갯수를 올려준다.
		
		return "redirect:communityView?idx="+idx+"&currentPage="+currentPage+"&category="+category;
	}
	
	
	
}
