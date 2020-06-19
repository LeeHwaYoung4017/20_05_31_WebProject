<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	    position: absolute;
	    top: 5%;
	    width: 55%;
	    left: 23%;
	    height: 90%;
	    border: 1px solid #d4d4d4;
	    background-color: white;
	    box-sizing: border-box;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	#title{
		position: relative;
		top: 1%;
		width: 40%;
		left: 30%;
		height: 8%;
	}
	h1{
		color: #17181b;
	}
	titleFont{
	    font-family: 'Noto Sans KR',sans-serif;
	    letter-spacing: 3px;
	    color: #eb0045;
	}
	#title2{
		position: relative;
		top: 8%;
		width: 78%;
		left: 11%;
		height: 77%;
	}
	
	textarea{
		width: 100%; 
		height: 380px;
		margin-top: 40px;
		resize: none;
		overflow: hidden;
		border-color: #d4d4d4;
	}
</style>
</head>
<body>
<c:if test="${vo.manager!='manager' }">
<script type="text/javascript">
	alert('권한이 없습니다.'); 
	location.href=history.go(-1);
</script>
</c:if>
<jsp:include page="../moduleView/mainModule.jsp"/>
<c:if test="${vo.manager=='manager' }">
<div id="wrap">
	<div id="container">
		<div class="all">
			<div class="delLine">
				<div id="title">
					<h1 align="center">Insert</h1>
				</div>
					<div id="title2">
					<form action="uploadForm1" method="post" enctype="multipart/form-data">
						<table style="width: 100%; height: 100%">
							<tr>
								<td align="center" width="5%">제목</td>
								<td><input type="text" id="title" name="title" style="height: 25px; width: 93%; padding-right: 0; left: 20px; border: none; border-bottom: 2px solid #d4d4d4;"></td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea style="width: 100%; height: 380px; margin-top: 40px;" name="content" id="content"></textarea>
								</td>
							</tr>
							<tr>
								<td><input type="file" name="file" /></td>
								<td align="right">
									<input type="submit" value="게시하기">
									<input type="button" value="뒤로가기">
								</td>
							</tr>
						</table>
					</form>
					</div>
			</div>
		</div>
	</div>
</div>
</c:if>
</body>
</html>