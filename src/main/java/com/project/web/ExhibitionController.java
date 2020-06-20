package com.project.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.exhibitionDAO;
import com.project.vo.ExhibitionList;
import com.project.vo.ExhibitionVO;

@Controller
public class ExhibitionController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private ExhibitionList exhibitionList;
	
	@Resource(name="uploadPath3")
	private String uploadPath3;
	
	@RequestMapping("/exhibitionInsert")
	public String exhibitionInsert() {
		return "exhibition/exhibitionInsert";
	}
	
	@RequestMapping("/exhibitionInsertOK")
	public String exhibitionInsertOK(HttpServletRequest request, ExhibitionVO vo, MultipartFile file) throws IllegalStateException, IOException {
		exhibitionDAO mapper = sqlSession.getMapper(exhibitionDAO.class);
		int idx = mapper.exhibitionIdx();
		System.out.println("exhibitionIdx is = " + idx);
		
		String saveFileName = " ";
		if(file.getOriginalFilename().equals("")) {
			saveFileName = "noimage.jpg";		//노이미지 명
			System.out.println("saveFileName is = " + saveFileName);
			File save = new File(uploadPath3,saveFileName);	// 저장할 폴더 이름, 저장할 파일 이름
			vo.setFileName(saveFileName);
			file.transferTo(save);	//해당 경로로 이미지를 저장한다.
			mapper.exhibitionInsert(vo);
			return "redirect:exhibitionList?category=1";
		} else {
			String originalName = file.getOriginalFilename();
			saveFileName = idx+originalName.substring(originalName.lastIndexOf("."));	//이미지 명 + 파일 형식
			System.out.println("saveFileName is = " + saveFileName);
			File save = new File(uploadPath3,saveFileName);	//저장할 폴더 이름, 저장할 파일 이름
			vo.setFileName(saveFileName);
			file.transferTo(save);	//해당 결로로 이미지를 저장
			mapper.exhibitionInsert(vo);
			return "redirect:exhibitionList?category=1";
		}
	}
	
	@RequestMapping("/exhibitionList")
	public String exhivitionList(HttpServletRequest request, Model model) {
		exhibitionDAO mapper = sqlSession.getMapper(exhibitionDAO.class);
		String category = request.getParameter("category");
//		현재 날짜를 가져온다.
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat yys = new SimpleDateFormat("yyyy");
		SimpleDateFormat MMs = new SimpleDateFormat("MM");
		SimpleDateFormat dds = new SimpleDateFormat("dd");
		Date dates = new Date();
		String date = format1.format(dates);
		int yy = Integer.parseInt(yys.format(dates));
		int MM = Integer.parseInt(MMs.format(dates));
		int dd = Integer.parseInt(dds.format(dates));
		System.out.println(date);
		
//		페이지 처리
		int pageSize = 8;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}catch (Exception e) {}
		
//		진행중 이벤트
		if(category.equals("1")) {
			int totalCount = mapper.exhibitionIngCount(date);
			System.out.println(totalCount);
			
			exhibitionList.initExhibitionList(pageSize, totalCount, currentPage);
			System.out.println("exhibitionList.initExhibitionList 실행 완료");
			
//			데이터 베이스에 값을 넘기고 가져온다.
			HashMap<String, Integer> hm = new HashMap<String, Integer>();
			hm.put("start", exhibitionList.getStartNo());
			hm.put("end", exhibitionList.getEndNo());
			hm.put("yy", yy);
			hm.put("MM", MM);
			hm.put("dd", dd);
			System.out.println(hm);
			
			exhibitionList.setExhibitionList(mapper.exhibitionIngList(hm));
			System.out.println("mapper.exhibitionList 실행완료");
			
			model.addAttribute("exhibitionList", exhibitionList);
			
			return "exhibition/exhibitionList";
//		종료 이벤트
		} else {
			int totalCount = mapper.exhibitionEndCount(date);
			System.out.println(totalCount);
			
			exhibitionList.initExhibitionList(pageSize, totalCount, currentPage);
			System.out.println("exhibitionList.initExhibitionList 실행 완료");
			
//			데이터 베이스에 값을 넘기고 가져온다.
			HashMap<String, Integer> hm = new HashMap<String, Integer>();
			hm.put("start", exhibitionList.getStartNo());
			hm.put("end", exhibitionList.getEndNo());
			hm.put("yy", yy);
			hm.put("MM", MM);
			hm.put("dd", dd);
			System.out.println(hm);
			
			exhibitionList.setExhibitionList(mapper.exhibitionEndList(hm));
			System.out.println("mapper.exhibitionList 실행완료");
			
			model.addAttribute("exhibitionList", exhibitionList);
			
			return "exhibition/exhibitionList";
		}
		
	}
	
	
}
