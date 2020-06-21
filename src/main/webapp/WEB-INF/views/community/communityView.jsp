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
		min-height: 610px;
		height: auto;
		left: 20%;
		border: 1px solid #d4d4d4;
		box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	#commentAll{
		position: relative;
		margin-top: 1%;
		width: 60%;
		min-height: 60px;
		height: auto;
		left: 20%;
		border: 1px solid #d4d4d4;
		box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	#titleLine{
		position: absolute;
	    top: 2%;
	    width: 70%;
	    height: 5%;
	    right: 30%;
	    border: 1px solid #d4d4d4;
	    box-sizing: border-box;
	    box-shadow: 0px 2px 2px #d4d4d4;
	    text-align: center;
	}
	#dayLine{
		position: absolute;
	    top: 2%;
	    width: 30%;
	    height: 5%;
	    left:70%;
	    z-index: 10;
	    border: 1px solid #d4d4d4;
	    box-sizing: border-box;
	    box-shadow: 4px 2px 2px #d4d4d4;
	    text-align: center;
	}
	#imgLine{
		position: relative;
		padding-top: 7%;
		width: 100%;
		min-height: 30px;
		height: 10%;
		text-align: center;
		box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	#contentLine{
		position: relative;
		padding-top: 3%;
		width: 96%;
    	left: 2%;
		min-height: 30px;
		height: auto;
	}
	
	img{
		border: 1px solid #d4d4d4;
		box-sizing: border-box;
	    box-shadow: 4px 2px 2px #d4d4d4;
	    width: auto; 
	    height: auto;
	    min-width: 40%;
	    min-height: 30%;
	    max-width: 100%;
	    max-height: 100%;
	}
	
	#commentDataIn{
		position: relative;
		width: 100%;
		min-height: 40px;
		height: auto;
	}
	#commentName{
		height: 100%;
		width: 10%;
		padding-left: 2%;
	}
	#commentPass{
		height: 100%;
		width: 10%;
		padding-left: 1%;
	}
	#commentRef{
		height: 100%;
		width: 10%;
		padding-left: 2%;
		padding-right: 2%;
		border: 1px solid #d4d4d4;
	}
	#btn{
		margin-top: 1%;
		border: 1px solid #d4d4d4;
		float: right;
		margin-right: 1%;
		background-color: white;
	}
	#commentDataIn2{
		height: 100%;
		width: 100%;
	}
	textarea{
		width: 99%; 
		height: 50px;
		resize: none;
		border: 1px solid #d4d4d4;
	}
	
	#commentList{
		position: relative;
		margin-top: 1%;
		width: 60%;
		min-height: 30px;
		height: auto;
		left: 20%;
		border: 1px solid #d4d4d4;
		box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	#comments{
		float: left;
	    width: 100%;
	    min-height: 15px;
	    height: auto;
	    margin: 0;
	    padding: 0;
	    border: 1px solid #d4d4d4;
	    font-family: 'Noto Sans JP', sans-serif;
	    font-size: 15px;
	}
</style>

</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<div id="wrap">
	<div id="container">
		<!-- 메인 글 영역 -->
		<form action="communityUpdate" method="post">
		<input type="hidden" value="${vo.idx}" name="idx" id="idx">
		<input type="hidden" value="${vo.title}" name="title" id="title">
		<input type="hidden" value="${vo.content}" name="content" id="content">
		<input type="hidden" value="${currentPage}" name="currentPage" id="currentPage">
		<input type="hidden" value="${vo.category}" name="category" id="category">
		<div id="all">
			<span id="titleLine">
				${vo.title}
			</span>
			<span id="dayLine">
				<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/>
				<span id="btn"><input type="submit" value="글 수정"></span>
				<span id="btn"><input type="button" value="글 삭제" onclick="location.href='communityDelete?idx=${vo.idx}'"></span>
			</span>
			<c:choose>
				<c:when test="${vo.fileName != 'noimage.jpg' }">
					<div id="imgLine">
						<img align="center" src="${pageContext.request.contextPath}/resources/communityImage/${vo.fileName}">
					</div>
				</c:when>
				<c:when test="${vo.fileName == 'noimage.jpg' }">
					<div id="imgLine"></div>
				</c:when>
			</c:choose>
			<div id="contentLine">
				${vo.content}
			</div>
		</div>
		</form>
		
		<!-- 댓글 추가 영역 -->
		<form action="communityCommentOK" method="post">
		<div id="commentAll">
			<div id="commentDataIn">
				<span id="commentName">
				<c:if test="${sessionScope.vo.id != null}">
					<input type="text" id="name" name="name" value="${sessionScope.vo.id}" readonly="readonly" style="margin-top: 10px;">
				</c:if>
				<c:if test="${sessionScope.vo.id == null}">
					<input type="text" id="name" name="name" placeholder="비회원" readonly="readonly" style="margin-top: 10px;">
				</c:if>
				</span>
				<span id="commentPass"><input type="password" id="password" name="password" placeholder="패스워드" maxlength="12"></span>
				<span id="commentRef">글번호 : <label>${vo.idx}</label><input type="hidden" value="${vo.idx}" name="ref" id="ref"></span>
				<c:if test="${sessionScope.vo.id != null}">
					<span id="btn"><input type="submit" value="작성하기"></span>
				</c:if>
				<input type="hidden" value="${currentPage}" name="currentPage" id="currentPage">
				<input type="hidden" value="${vo.category}" name="category" id="category">
			</div>
			<c:if test="${sessionScope.vo.id == null}">
				<div id="commentDataIn2">
					<textarea id="content" name="content" disabled="disabled">로그인 후 사용 가능합니다.</textarea>
				</div>
			</c:if>
			<c:if test="${sessionScope.vo.id != null}">
				<div id="commentDataIn2">
					<textarea id="content" name="content"></textarea>
				</div>
			</c:if>
		</div>
		
		<!-- 댓글 리스트 영역 -->
		<div id="commentList">
			<c:if test="${communityCommentList.communityCommentList.size() == 0}">
				<marguee>댓글이 존재하지 않습니다.</marguee>
			</c:if>
			<c:if test="${communityCommentList.communityCommentList.size() != 0}">
				<ul id="comments">
					<c:forEach var="commentVO" items="${communityCommentList.communityCommentList}">
						<li style="width: 15%; margin-left: 2%; border: 1px solid #d4d4d4; text-align: center;">${commentVO.name}</li>
						<li style="width: 15%; border: 1px solid #d4d4d4; text-align: center;"><fmt:formatDate value="${commentVO.writeDate}" pattern="yyyy-MM-dd"/></li>
						<li style="width: 50%; border: 1px solid #d4d4d4;">${commentVO.content}</li>
						<li style="width: 15%; text-align: center; float: right;">
							<input type="button" value="삭제하기">
							<input type="button" value="수정하기">
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
		</form>
	</div>
</div>
</body>
</html>