package com.project.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginList {
	
	private ArrayList<LoginVO> loginList = new ArrayList<LoginVO>();
	
	public LoginList() {}
	
	
}
