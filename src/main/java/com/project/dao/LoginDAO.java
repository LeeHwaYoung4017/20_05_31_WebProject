package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.vo.LoginVO;

public interface LoginDAO {

	void loginInsert(LoginVO vo);		//회원가입 완료
	String checkID(String id);		//id 중복 아작스 처리
	LoginVO selectById(String id);
	int loginCount();		//전체 회원 갯수
	ArrayList<LoginVO> LoginList(HashMap<String, Integer> hm);	//전체 회원 정보
	void memberUpdate(LoginVO vo);	//회원정보 변경


	

}
