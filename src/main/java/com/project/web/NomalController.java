package com.project.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

import com.project.dao.exhibitionDAO;
import com.project.vo.ExhibitionList;

@Controller
public class NomalController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private ExhibitionList exhibitionList;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		exhibitionDAO mapper = sqlSession.getMapper(exhibitionDAO.class);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat yys = new SimpleDateFormat("yyyy");
		SimpleDateFormat MMs = new SimpleDateFormat("MM");
		SimpleDateFormat dds = new SimpleDateFormat("dd");
		Date dates = new Date();
		String date = format1.format(dates);
		int yy = Integer.parseInt(yys.format(dates));
		int MM = Integer.parseInt(MMs.format(dates));
		int dd = Integer.parseInt(dds.format(dates));
		int totalCount = mapper.exhibitionIngCount(date);
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("start", 1);
		hm.put("end", totalCount);
		hm.put("yy", yy);
		hm.put("MM", MM);
		hm.put("dd", dd);
		System.out.println(hm);
		
		exhibitionList.setExhibitionList(mapper.exhibitionIngList(hm));
		System.out.println("mapper.exhibitionList 실행완료");
		
		model.addAttribute("exhibitionList", exhibitionList);
		return "mainHome";
	}
	
	@RequestMapping(value="/mainHome")
	public String mainHome(Model model, HttpServletRequest request) {
		exhibitionDAO mapper = sqlSession.getMapper(exhibitionDAO.class);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat yys = new SimpleDateFormat("yyyy");
		SimpleDateFormat MMs = new SimpleDateFormat("MM");
		SimpleDateFormat dds = new SimpleDateFormat("dd");
		Date dates = new Date();
		String date = format1.format(dates);
		int yy = Integer.parseInt(yys.format(dates));
		int MM = Integer.parseInt(MMs.format(dates));
		int dd = Integer.parseInt(dds.format(dates));
		int totalCount = mapper.exhibitionIngCount(date);
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("start", 1);
		hm.put("end", totalCount);
		hm.put("yy", yy);
		hm.put("MM", MM);
		hm.put("dd", dd);
		System.out.println(hm);
		
		exhibitionList.setExhibitionList(mapper.exhibitionIngList(hm));
		System.out.println("mapper.exhibitionList 실행완료");
		
		model.addAttribute("exhibitionList", exhibitionList);
		
		
		return "mainHome";
	}
}
