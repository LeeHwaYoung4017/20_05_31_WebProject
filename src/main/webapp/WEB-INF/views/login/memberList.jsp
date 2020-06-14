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
	.allLine{
		position: relative;
		width: 100%;
		height: 670px;
	}
	.subjectLine{
		position: relative;
	    width: 66%;
	    left: 17%;
	    border: 1px solid #d4d4d4;
	    box-shadow: 6px 3px 3px #d4d4d4;
	}
</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
	<div id="wrap">
		<div id="container">
			<div class="allLine">
				<div class="subjectLine">
					<table border="1" cellspacing="0" style="width: 100%; border: 1px solid #d4d4d4;">
						<tr height="10px">
							<td width="5%" align="center">번호</td>
							<td width="10%" align="center">아이디</td>
							<td width="10%" align="center">핸드폰</td>
							<td width="20%" align="center">이메일</td>
							<td width="35%" align="center">주소</td>
							<td width="20%" align="center">기타</td>
						</tr>
						<c:set value="${loginList.loginList}" var="list"/>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td align="center">${vo.idx}</td>
								<td>${vo.id }</td>
								<td>${vo.phone }</td>
								<td>${vo.email }</td>
								<td>${vo.address }</td>
								<td>
									<input type="button" value="수정하기" onclick="location.href='memberUpdate?id=${vo.id}&phone=${vo.phone}&email=${vo.email}&address=${vo.address}'">
									<input type="button" value="삭제하기" onclick="location.href='memberDelete?id=${vo.id}'">
									<input type="button" value="권한추가">
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>