package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.vo.ExhibitionVO;

public interface exhibitionDAO {

// 	전시회 글의 시퀀스 값을 가져온다.
	int exhibitionIdx();
	
//	커뮤니티 게시글을 추가한다.
	void exhibitionInsert(ExhibitionVO vo);
	
//	진행중 이벤트 글 갯수를 가져온다.
	int exhibitionIngCount(String date);

//	진행중 이벤트 글 리스트를 불러온다.
	ArrayList<ExhibitionVO> exhibitionIngList(HashMap<String, Integer> hm);

//	종료 이벤트 글 갯수를 가져온다.
	int exhibitionEndCount(String date);
	
//	종료 이벤트 글 리스트를 불러온다.
	ArrayList<ExhibitionVO> exhibitionEndList(HashMap<String, Integer> hm);
	
//	모든 이벤트 글 갯수를 가져온다.
	int exhibitionCount();
	
//	모든 이벤트 글 리스트를 불러온다.
	ArrayList<ExhibitionVO> exhibitionList(HashMap<String, Integer> hm);
	
//	해당 이벤트 글을 지운다.
	void exhibitionDelete(int idx);
	
//	해당 이벤트 글의 데이터를 가져온다.
	ExhibitionVO selectData(int idx);
	
//	해당 이벤트 글을 수정한다.
	void exhibitionUpdate(ExhibitionVO vo);

	

	
	



	

}
