<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#all{
		position: relative;
		margin-top: 2%;
		width: 50%;
		left: 25%;
		height: 700px;
	}
	#infoLine{
		position: absolute;
		width: 48%;
		left:0;
		height: 100%;
	}
	#comLine{
		position: absolute;
		width: 50%;
		left: 50%;
		height: 100%;
	}
	
	#infoLine ul{
		border: 1px solid #d4d4d4;
		border: 1px solid #d4d4d4;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
	
	#infoLine ul li {
		float: none;
		padding: 2% 0 2%;
	}
</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
	<div id="wrap">
		<div id="container">
			<div id="all">
				<div id="infoLine">
					<ul>
						<li>아 이 디 : ${vo.id}</li>
						<li>전화번호 : ${vo.phone}</li>
						<li>이 메 일 : ${vo.email}</li>
						<li>주&nbsp;&nbsp;&nbsp;&nbsp;소 : ${vo.address}</li>
					</ul>
					<ul>
						<li>
							<input type="button" value="정보수정" onclick="location.href='memberUpdate?id=${vo.id}&phone=${vo.phone}&email=${vo.email}&address=${vo.address}'">
							<input type="button" value="회원탈퇴" onclick="location.href='memberDelete?id=${vo.id}'">
						</li>
					</ul>
				</div>
				<div id="comLine">
				
				</div>		
			</div>
		</div>
	</div>
</body>
</html>