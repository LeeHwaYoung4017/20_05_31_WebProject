package com.project.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.QuestionsDAO;
import com.project.vo.QuestionsList;
import com.project.vo.QuestionsVO;

@Controller
public class QuestionsController {

	private static final Logger logger = LoggerFactory.getLogger(QuestionsController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	QuestionsList questionsList;
	
//	문의사항 리스트
	@RequestMapping(value="questionsList")
	public String questionsList(HttpServletRequest req, Model model) {
		logger.info("questionsList 들어옴");
		
//		page, field, search 파라미터를 받음.
		int page = Integer.parseInt(req.getParameter("page"));
		String field = req.getParameter("field");
		String search = req.getParameter("search");
		System.out.println("page, field, search에 값은 : " + page + ", " + field + ", " + search);
		
//		hashMap에 field, search 값을 넣어줌.
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("field", field);
		hmap.put("search", search);
		
//		페이징을 하기위해 전체 글수를 가져옴.
		QuestionsDAO mapper = sqlSession.getMapper(QuestionsDAO.class);
		questionsList.setTotalCount(mapper.countSelect(hmap));
//		페이징을 하기위해 조건에 따라 값들을 초기화해줌.
		questionsList.initQuestionsList(questionsList.getPageSize(), questionsList.getTotalCount(), page);
		hmap.put("startNo", questionsList.getStartNo());
		hmap.put("endNo", questionsList.getEndNo());
//		계산한 1페이지당 나오는 글 수를 리스트 형태로 가져옴
		questionsList.setQuestionsVO(mapper.selectList(hmap));
		
//		가져온 값들을 model 객체에 넣어줌
		model.addAttribute("questionsList", questionsList);
		
		return "questions/questionsList";
	}
	
//	문의사항 입력 페이지 이동
	@RequestMapping(value="questionsInsert")
	public String questionsInsert() {
		
		return "questions/questionsInsert";
	}
	
//	문의사항 입력
	@RequestMapping(value="questionsInsertOK")
	public String questionsInsertOK(HttpServletRequest req, QuestionsVO questionsVO) {
		logger.info("들어옴");
		
		System.out.println("컨트롤러에서 questionsVO의 값은 : " + questionsVO.toString());
		
		String secret = req.getParameter("secret");
		System.out.println("컨트롤러에서 secret의 값은 : " + secret);
		
		QuestionsDAO mapper = sqlSession.getMapper(QuestionsDAO.class);
		mapper.questionsInsert(questionsVO);
		System.out.println("questionsVO의 값은 : " + questionsVO.toString());
		
		return "redirect:questionsList?page=1";
	}
	
	@RequestMapping(value="questionsDetail")
	public String questionsDetail(HttpServletRequest req, Model model, QuestionsVO questionsVO) {
		logger.info("questionsDetail에 들어옴.");
		
//		idx 파라미터 받음
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
		QuestionsDAO mapper = sqlSession.getMapper(QuestionsDAO.class);
		questionsVO = mapper.questionsDetail(idx);
		
		model.addAttribute("questionsVO", questionsVO);
		
		return "questions/questionsDetail";
	}
	
//	글 삭제
	@RequestMapping(value="questionsDelete")
	public String questionsDelete(HttpServletRequest req) {
		logger.info("컨트롤러에서 questionsDelete에 들어옴.");
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		QuestionsDAO mapper = sqlSession.getMapper(QuestionsDAO.class);
		mapper.questionDelete(idx);
		
		return "redirect:questionsList?page=1";
	}
}
