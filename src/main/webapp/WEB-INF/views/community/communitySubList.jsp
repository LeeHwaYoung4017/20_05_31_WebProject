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
	.all{
		position: relative;
		width:100%;
		left: 0;
		top: 0;
		height: 700px;
	}
	.delLine{
	    position: relative;
	    width: 70%;
	    left: 15%;
	    height: 97%;
	    border: 1px solid #d4d4d4;
	}
	.listLine{
		position: relative;
		width: 100%;
		height: 93%;
	}
	.bottomLine{
		position: relative;
		width: 100%;
		height: 5%;
		float: left;
		left: 38%;
		bottom: 2%;
	}
	
	ul.communityMenu {
 	   height: 100%;
 	   margin-bottom: 0;
	}
	
	.communityMenu li {
	    float: left;
	    margin-right: 1%;
	    margin-bottom: 3%;
	    width: 23%;
	    height: 45%;
	    padding: 5px;
	    border: 1px solid #d3d3d3;
	    box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	
	.imgs {
		position: relative;
		width: 100%;
		height: 80%;
		background-color: black;
	}
	.titles {
		position: relative;
		width: 100%;
		height: 20%;
	}
	
	.aSize{
		padding-top: 0px;
		width: 100%;
		height: 100%;
	}
	
	li div a img {
		width: 100%;
		height: 100%;
	}
	
	.aSize h5{
		margin-top: 8%;
		float: left;
		font-family: 'Noto Sans JP', sans-serif;
		font-size: 12px;
	}
		
	</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<c:set var="list" value="${communityList.communityList}"/>
	<div id="wrap">
		<div id="container">
			<div class="all">
				<div class="delLine">
					<div class="listLine">
						<ul class="communityMenu">
							<!-- 데이터 만큼 반복한다. -->
							<c:forEach var="vo" items="${list}">
								<li>
									<!-- 이미지 -->
									<div class="imgs">
										<a class="aSize" href="#">
											<img src="${pageContext.request.contextPath}/resources/communityImage/${vo.fileName}">
										</a>
									</div>
									<!-- 제목 -->
									<div class="titles">
										<a class="aSize" href="#">
											<h5>${vo.title }</h5>
										</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="bottomLine">
						<!-- 이전 페이지 -->
						<c:if test="${communityList.startPage > 1}">
							<input type="button" value="시작" onclick="location.href='?currentPage=1'" title="첫 페이지"/>
							<input type="button" value="이전" onclick="location.href='?currentPage=${communityList.startPage -1}'">
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
							<input type="button" value="다음" onclick="location.href='?currentPage=${communityList.endPage + 1}'">
							<input type="button" value="마지막" onclick="location.href='?currentPage=${communityList.totalPage}'">
						</c:if>
						<!-- 다음 페이지가 존재하지 않을경우 -->
						<c:if test="${communityList.endPage >= communityList.totalPage}">
							<input type="button" value="다음" disabled="disabled" title="마지막 페이지 입니다.">
							<input type="button" value="마지막" disabled="disabled" title="다음 10페이지가 없습니다.">
						</c:if>
						
						<input type="button" value="작성하기" onclick="location.href='communityInsert'" style="float: right;">
					</div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>