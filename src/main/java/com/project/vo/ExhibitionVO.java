package com.project.vo;

import java.util.Date;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Repository
@Getter
@Setter
public class ExhibitionVO {
	
	private int idx;
	private String title;
	private String content;
	private String fileName;
	private String start_Date;
	private String end_Date;
	private Date writeDate;
	private int hit;
	
}
