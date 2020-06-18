<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<div align="center">
<form action="questionAnswer" name="answerForm">
<input type="hidden" name="idx" value="${questionsVO.idx }">
<table>
	<tr>
		<th>제목</th>
		<td><input type="text" value="${questionsVO.title }" name="title" readonly> </td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" value="${questionsVO.writer }" name="writer" readonly> </td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="50" readonly>${questionsVO.content }</textarea> </td>
	</tr>
	<!-- 답변이 없고 관리자 계정이라면  -->
	<c:if test="${questionsVO.answer == null && sessionScope.vo.manager eq ('manager')}">
	<tr>
		<th>답변</th>
		<td><textarea rows="10" cols="50" name="answer"></textarea> </td>
	</tr>
	<tr>
		<td><input type="button" value="답변입력완료" onclick="questionsAnswer()"> </td>
	</tr>
	</c:if>
	<!-- 답변이 들어있다면 -->
	<c:if test="${questionsVO.answer != null}">
	<tr>
		<th>답변</th>
		<td><textarea rows="10" cols="50" readonly>${questionsVO.answer }</textarea> </td>
	</tr>
	</c:if>
	<!-- 답변이 들어있지 않으며(들어있으면 삭제 불가) -->
	<c:if test="${questionsVO.answer == null}">
	<!-- 작성자이거나 관리자 계정일때만 삭제가능 -->
	<c:if test="${(sessionScope.vo.id) eq (questionsVO.writer) || (sessionScope.vo.manager) eq ('manager')}">
	<tr>
		<td><input type="button" value="삭제" onclick="location.href='questionsDelete?idx=${questionsVO.idx}'"> </td>
	</tr>
	</c:if>
	</c:if>
</table>
</form>
</div>
</body>
<script type="text/javascript">
	function questionsAnswer() {
		if(confirm("답변은 한번 입력하면 수정 불가합니다. 그래도 입력 하시겠습니까?"))
			{
				answerForm.submit();
			}else{
				return;
			}
	}
</script>
</html>