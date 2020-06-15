package com.project.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.communityDAO;
import com.project.vo.CommunityVO;

@Controller
public class CommunityController {
	
	@Autowired
	public SqlSession sqlSession;
	
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
	
	
	
}
