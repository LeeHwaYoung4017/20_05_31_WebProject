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
		height: 7%;
	}
	
	ul.noticeMenu {
 	   height: 100%;
	}
	
	.noticeMenu li {
	    float: left;
	    margin-right: 1%;
	    margin-bottom: 3%;
	    width: 23%;
	    height: 45%;
	    padding: 5px;
	    box-sizing: border-box;
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
		margin-top: 12%;
		float: left;
		font-family: 'Noto Sans JP', sans-serif; 
	}
		
	</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<c:set var="list" value="${noticeList.noticeList}"/>
	<div id="wrap">
		<div id="container">
			<div class="all">
				<div class="delLine">
					<div class="listLine">
						<ul class="noticeMenu">
							<c:forEach var="vo" items="${list}">
								<li>
									<div class="imgs">
										<a class="aSize" href="#">
											<img src="${pageContext.request.contextPath}/resources/noticeImege/${vo.fileName}">
										</a>
									</div>
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
						
					</div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>