package com.project.dao;

import com.project.vo.LoginVO;

public interface LoginDAO {

	void loginInsert(LoginVO vo);		//회원가입 완료
	String checkID(String id);		//id 중복 아작스 처리


	

}
