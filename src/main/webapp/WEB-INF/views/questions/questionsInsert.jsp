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
	<form action="questionsInsertOK" name="insertForm">
	<input type="hidden" name="writer" value="${sessionScope.vo.id }">
	<div align="center">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" id="title" name="title"></td>
			<td><label><input type="checkbox" name="secret" value="secret">비밀글</label></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2"><textarea rows="10" cols="50" name="content" id="content"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="입력" onclick="insert()">
			<input type="reset" value="초기화">
			</td>
		</tr>
	</table>
	</div>
	</form>
</body>
<script type="text/javascript">
	var title = insertForm.title
	var content = insertForm.content
	function insert() {
		if(title.value.trim() == ""){
			alert("제목을 입력해주세요")
		}else if(content.value.trim() == ""){
			alert("본문을 입력해주세요.")
		}else{
			alert("글쓰기를 완료하셨습니다.")
			insertForm.submit()
		}
	}
</script>
</html>