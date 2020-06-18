package com.project.vo;

import lombok.Setter;
import lombok.ToString;

import java.util.Date;

import lombok.Getter;

@Getter
@Setter
@ToString
public class QuestionsVO {

	private int idx;
	private String title;
	private String writer;
	private String content;
	private String secret;
	private String answer;
	private String status;
	private Date reg_date;
	
}
