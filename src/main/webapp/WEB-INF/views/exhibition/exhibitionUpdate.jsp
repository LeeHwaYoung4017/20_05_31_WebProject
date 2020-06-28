<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//form의 submit 버튼이 클릭되면 실행된다.
	$("#event").submit(function(){
		var startDate = $('#start_Date').val();
		var endDate = $('#end_Date').val();
	         
		//-을 구분자로 연,월,일로 잘라내어 배열로 반환
		var startArray = startDate.split('-');
		var endArray = endDate.split('-');
	         
		//배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
		var start_date = new Date(startArray[0], startArray[1], startArray[2]);
		var end_date = new Date(endArray[0], endArray[1], endArray[2]);
	         
		//날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
		if(start_date.getTime() > end_date.getTime()) {
			alert("종료날짜보다 시작날짜가 작아야합니다.");
			return false;
		}
	});
});

</script>
<style type="text/css">
	
	#all {
		position: relative;
	    left: 25%;
	    margin-top: 1%;
	    width: 50%;
	    height: 685px;
	}
	#titles {
		position: relative;
	    width: 70%;
	    top: 2%;
	    height: 12%;
	    left: 15%;
	}
	#contents{
		position: relative;
		width: 100%;
		height: 5%;
	}
	#title{
		height: 100%;
		width: 100%;
	}
	#subcontents{
		position: relative;
		width: 100%;
		height: 5%;
		top: 3%;
	}
	
	.contentFile{
		height: 100%;
		width: 24%;
		margin-left: 1%;
	}
	#contentMain{
		position: relative;
	    height: 66%;
	    top: 6%;
	    width: 100%;
	}
	textarea{
		width: 100%; 
		height: 100%;
		resize: none;
		overflow: hidden;
	}
	#contentBtn{
		position: relative;
	    width: 100%;
	    height: 5%;
	    top: 7%;
	}
	.contentBtns{
		margin-top: 1%;
		height: 100%;
		float: right;
	}
	
</style>

</head>
<body>
<c:if test="${sessionScope.vo.manager eq none}">
<script type="text/javascript">
	alert('권한이 없습니다.'); 
	location.href=history.go(-1);
</script>
</c:if>
<jsp:include page="../moduleView/mainModule.jsp"/>
<form action="exhibitionUpdateOK" method="post" enctype="multipart/form-data" id="event">
<input type="hidden" value="${vo.idx}" name="idx">
	<div id="wrap">
		<div id="container">
			<div id="all">
				<div id="titles">
					<h1 align="center">Update</h1>
				</div>
				<div id="contents">
					<span><input type="text" id="title" name="title" value="${vo.title}"></span>
				</div>
				<div id="subcontents">
					<span><input type="date" name="start_Date" id="start_Date" value="${vo.start_Date}"></span>
					<span><input type="date" name="end_Date" id="end_Date" value="${vo.end_Date}"></span>
				</div>
				<div id="contentMain">
					<textarea name="content" id="content">${vo.content}</textarea>
				</div>
				<div id="contentBtn">
					<span class="contentBtns">
						<input type="button" value="취소">
						<input type="submit" value="등록">
					</span>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>