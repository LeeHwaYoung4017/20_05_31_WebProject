package com.project.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Repository
@Getter
@Setter
public class NoticeList {
	private ArrayList<NoticeVO> noticeList = new ArrayList<NoticeVO>();
	private int pageSize = 0;	//한 페이지에 표시할 글의 개수
	private int totalCount = 0; //테이블에 저장된 전체 글의 개수
	private int totalPage = 0;	//전체 페이지 개수
	private int currentPage = 1;//브라우저에 표시할 페이지 번호
	private int startNo = 0;	//브라우저에 표시되는 글의 시작 인덱스
	private int startPage = 0;	//페이지 이동 하이퍼링크나 버튼에 표시될 시작 페이지 번호
	private int endNo = 0;		//브라우저에 표시되는 글의 끝 인덱스
	private int endPage = 0;	//페이지 이동 하이퍼링크나 버튼에 표시될 끝 페이지 번호
	
	public NoticeList() {}

	public void initNoticeList(int pageSize, int totalCount, int currentPage) {
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
