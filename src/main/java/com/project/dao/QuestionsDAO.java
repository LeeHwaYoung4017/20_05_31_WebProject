package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.vo.QuestionsVO;

public interface QuestionsDAO {

//	전체 글수
	int countSelect(HashMap<String, Object> hmap);

//	페이지당 글 수에 맞게 리스트
	ArrayList<QuestionsVO> selectList(HashMap<String, Object> hmap);

//	문의사항 입력
	void questionsInsert(QuestionsVO questionsVO);

//	문의사항 상세 글 보기
	QuestionsVO questionsDetail(int idx);

//	글 삭제
	void questionDelete(int idx);

//	답변 등록
	void questionAnswer(QuestionsVO questionsVO);

}
