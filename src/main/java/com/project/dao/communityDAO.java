package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.vo.CommunityCommentVO;
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

//	커뮤니티 서브메뉴의 글 갯수를 뽑아온다.
	int communityEventCount(String categoryNum);
	
//	커뮤니티 서브메뉴의 글 리스트를 뽑아온다.
	ArrayList<CommunityVO> communitySubList(HashMap<String, Integer> hm);

//	해당 idx의 글 데이터를 불러온다.
	CommunityVO communityData(int idx);
	
//	해당 글의 조회수를 올려준다.
	void communityHitUp(int idx);
	
//	댓글을 추가한다.
	void commentInsert(CommunityCommentVO vo);
	
//	해당 글의 댓글 갯수를 불러온다..
	int commentCount(int idx);
	
//	해당 글의 댓글 리스트를 불러온다.
	ArrayList<CommunityCommentVO> commentList(HashMap<String, Integer> hm);
	
//	해당 글의 댓글 갯수를 올려준다.
	void commentCountUpdate(int idx);




	






	

}
