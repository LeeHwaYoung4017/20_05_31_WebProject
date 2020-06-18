package com.project.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CommunityCommentVO {
	
	private int idx;
	private int ref;
	private String name;
	private String password;
	private String content;
	private Date writeDate;
	
}
