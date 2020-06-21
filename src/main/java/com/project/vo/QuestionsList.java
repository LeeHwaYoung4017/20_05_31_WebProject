package com.project.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Repository
@Getter
@Setter
public class QuestionsList {

	private ArrayList<QuestionsVO> questionsVO;
	private int pageSize = 10;
	private int totalCount = 0;
	private int totalPage = 0;
	private int currentPage = 1;
	private int startNo = 0;
	private int startPage = 0;
	private int endNo = 0;
	private int endPage = 0;
	
	public QuestionsList() { }
	
	public void initQuestionsList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
	
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}

}
