package com.project.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginVO {
	
	private int idx;			//번호
	private String id;			//아이디
	private String password;	//비밀번호
	private String phone;		//핸드폰번호
	private String email;		//이메일
	private String address;		//주소
	private String manager;		//관리자 권한
	
}
