package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.vo.CommunityVO;

public interface communityDAO {

//	커뮤니티 글의 시퀀스 값을 가져온다.
	int communityIdx();
	
//	커뮤니티 게시글을 추가한다.
	void communityInsert(CommunityVO vo);
	
//	전체 글 갯수를 가져온다.
	int communityCount();

//	전체 글 리스트를 불러온다.
	ArrayList<CommunityVO> communityList(HashMap<String, Integer> hm);

	






	

}
