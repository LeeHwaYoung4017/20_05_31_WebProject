package com.project.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	
	private int idx;
	private String title;
	private String content;
	private String fileName;
	private Date writeDate;
	private int hit;
	
}
