<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
	.contentPassword{
		height: 100%;
		width: 30%
	}
	.contentCategory{
		height: 100%;
		width: 40%;
		margin-left: 2%;
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
<c:if test="${sessionScope.vo.id eq null}">
<script type="text/javascript">
	alert('로그인 후 사용 가능합니다.'); 
	location.href=history.go(-1);
</script>
</c:if>
<jsp:include page="../moduleView/mainModule.jsp"/>
<form action="communityInsertOK" method="post" enctype="multipart/form-data">
	<div id="wrap">
		<div id="container">
			<div id="all">
				<div id="titles">
					<h1 align="center">Insert</h1>
				</div>
				<div id="contents">
					<span><input type="text" id="title" name="title" placeholder="제목을 입력하세요."></span>
				</div>
				<div id="subcontents">
					<span><input type="password" class="contentPassword" id="password" name="password" placeholder="비밀번호를 입력하세요."></span>
					<span>
						<select name="category" id="category" class="contentCategory">
							<option value="010" selected="selected">게시판을 선택해주세요</option>
							<option value="1">후기</option>
							<option value="2">언어</option>
							<option value="3">잡담</option>
						</select>
					</span>
					<span><input type="file" name="file" class="contentFile" /></span>
				</div>
				<div id="contentMain">
					<textarea name="content" id="content"></textarea>
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