package com.project.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Repository
@Getter
@Setter
public class LoginList {
	
	private ArrayList<LoginVO> loginList = new ArrayList<LoginVO>();
	
	public LoginList() {}
	
	
}
