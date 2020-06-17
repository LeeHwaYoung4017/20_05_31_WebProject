package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.vo.NoticeVO;

public interface noticeDAO {
	
//	현재 시퀸스 값
	int noticeIdx();
	
//	공지를 추가한다.
	void noticeInsert(NoticeVO vo);

//	공지 전체 글 갯수
	int noticeCount();

//	공지 전체 글 리스트
	ArrayList<NoticeVO> noticeList(HashMap<String, Integer> hm);

//	공지 idx를 넘겨 그 데이터를 controller의 vo에 저장한다
	NoticeVO noticeData(int idx);





	

}
