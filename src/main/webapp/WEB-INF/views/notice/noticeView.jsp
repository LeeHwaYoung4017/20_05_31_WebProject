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
		background-color: black;
		box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	#titleLine{
		position: absolute;
	    top: 2%;
	    width: 85%;
	    height: 5%;
	    right: 15%;
	    border: 1px solid #d4d4d4;
	    box-sizing: border-box;
	    box-shadow: 0px 2px 2px #d4d4d4;
	    text-align: center;
	}
	#dayLine{
		position: absolute;
	    top: 2%;
	    width: 15%;
	    height: 5%;
	    left:85%;
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

</style>

</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<div id="wrap">
	<div id="container">
		<div id="all">
			<span id="titleLine">
				${vo.title}
			</span>
			<span id="dayLine">
				<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/>
			</span>
			<!-- 이미지가 noimage면 사진을 안나오게한다. -->
			<c:choose>
				<c:when test="${vo.fileName != 'noimage.jpg' }">
					<div id="imgLine">
						<img align="center" src="${pageContext.request.contextPath}/resources/noticeImege/${vo.fileName}">
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
		<div id="commentAll">
			여기다가 다음글 이전글 이동 만들자!! 화이팅
		</div>
	</div>
</div>
</body>
</html>