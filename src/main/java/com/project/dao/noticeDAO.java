package com.project.dao;

import com.project.vo.NoticeVO;

public interface noticeDAO {
	
//	공지 리스트
//	int noticeList();
	
//	현재 시퀸스 값
	int noticeIdx();
	
//	공지를 추가한다.
	void noticeInsert(NoticeVO vo);




	

}
