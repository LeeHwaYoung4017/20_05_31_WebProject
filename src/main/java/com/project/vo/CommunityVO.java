package com.project.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommunityVO {
	
	private int idx;
	private String title;
	private String password;
	private String category;
	private String content;
	private String fileName;
	private Date writeDate;
	private int hit;
	private int commentCount;
	
}
