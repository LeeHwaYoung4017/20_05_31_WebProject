<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	#all{
		position: relative;
		width: 60%;
		left: 20%;
		height: 700px;
		border: 1px solid #d4d4d4;
		box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	
	#allTitle{
		position: relative;
		top: 5%;
		width: 100%;
		height: 4%;
	}
	.allTitleUL{
		float: left;
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
		background-color: #d4d4d4;
		border: 2px solid #d4d4d4;
		font-family: 'Noto Sans JP', sans-serif;
		font-size: 14px;
		text-align: center;
	}
	.allMenuUL{
		float: left;
	    width: 100%;
	    height: 24px;
	    margin: 0;
	    padding: 0;
	    border: 1px solid #d4d4d4;
	    font-family: 'Noto Sans JP', sans-serif;
	    font-size: 15px;
	    text-align: center;
	}
	.allMenuUL:hover{
		background-color: #e9e9e9;
		cursor: pointer;
	}
	#allLine{
		position: relative;
		top: 5%;
		margin: 0;
		padding: 0;
		width: 100%;
		height: 3%;
	}
	#allBottomLine{
		position: relative;
	    top: 9%;
	    float: left;
	    width: 100%;
	    height: 10%;
	    text-align: center;
	}
	h1{
		position:relative;
		top: 3%;
		margin: 0px;
	}
	
	.listLine{
		position: relative;
		width: 100%;
		height: 100%;
	}
	
	allLine allTitleUL li{
		font-family: 'Noto Sans JP', sans-serif;
		font-size: 20px;
	}
	
	
</style>

</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
		<div id="wrap">
			<div id="container">
				<div id="all">
					<h1 align="center">커뮤니티</h1>
					<div id="allTitle">
						<ul class="allTitleUL">
							<li style="width: 5%; height: 100%;"></li>
							<li style="width: 5%; height: 100%;">번호</li>
							<li style="width: 50%; height: 100%">제목</li>
							<li style="width: 15%; height: 100%">구분</li>
							<li style="width: 10%; height: 100%">등록일</li>
							<li style="width: 5%; height: 100%">조회</li>
							<li style="width: 5%; height: 100%">댓글</li>
						</ul>
					</div>
					<c:set value="${communityList.communityList}" var="list"/>
					<div id="allLine">
					<c:forEach items="${list}" var="vo">
						<ul class="allMenuUL" onclick="location.href='communityView?idx=${vo.idx}&currentPage=${communityList.currentPage}'">
							<li style="width: 5%; height: 100%;"></li>
							<li style="width: 5%; height: 100%;">${vo.idx}</li>
							<li style="width: 50%; height: 100%">${vo.title}</li>
							<li style="width: 15%; height: 100%">
							<c:choose>
	    						<c:when test="${vo.category eq 1}">
	    							후기
	    						</c:when>
	    						<c:when test="${vo.category eq 2}">
	    							언어
	    						</c:when>
	    						<c:when test="${vo.category eq 3}">
	    							잡담
	    						</c:when>
	    					</c:choose>
							</li>
							<li style="width: 10%; height: 100%"><fmt:formatDate value="${vo.writeDate }" pattern="yy-MM-dd"/></li>
							<li style="width: 5%; height: 100%">${vo.hit}</li>
							<li style="width: 5%; height: 100%">${vo.commentCount}</li>
						</ul>
					</c:forEach>
					</div>
					<div id="allBottomLine">
						<!-- 이전 페이지 -->
						<c:if test="${communityList.startPage > 1}">
							<input type="button" value="시작" onclick="location.href='?currentPage=1'" title="첫 페이지"/>
							<input type="button" value="이전" onclick="location.href='?currentPage=${noticeList.startPage -1}'">
						</c:if>
						<!-- 이전 페이지가 존재하지 않을경우 -->
						<c:if test="${communityList.startPage <= 1}">
							<input type="button" value="시작" disabled="disabled" title="첫페이지 입니다."/>
							<input type="button" value="이전" disabled="disabled" title="이전 10페이지가 없습니다.">
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${communityList.startPage}" end="${communityList.endPage }" step="1">
							<!-- 이미 선택된 페이지 -->
							<c:if test="${i == communityList.currentPage }">
								<input type="button" value="${i}" disabled="disabled">
							</c:if>
							<!-- 선택이 되지 않은 나머지 페이지 -->
							<c:if test="${i != communityList.currentPage}">
								<input type="button" value="${i}" onclick="location.href='?currentPage=${i}'">				
							</c:if>
						</c:forEach>
						
						<!-- 다음 페이지 -->
						<c:if test="${communityList.endPage < communityList.totalPage}">
							<input type="button" value="다음" onclick="location.href='?currentPage=${noticeList.endPage + 1}'">
							<input type="button" value="마지막" onclick="location.href='?currentPage=${noticeList.totalPage}'">
						</c:if>
						<!-- 다음 페이지가 존재하지 않을경우 -->
						<c:if test="${communityList.endPage >= communityList.totalPage}">
							<input type="button" value="다음" disabled="disabled" title="마지막 페이지 입니다.">
							<input type="button" value="마지막" disabled="disabled" title="다음 10페이지가 없습니다.">
						</c:if>
						
						<input type="button" value="작성하기" style="float: right;" onclick="location.href='communityInsert'">
					</div>
				</div>
			</div>
		</div>
</body>
</html>