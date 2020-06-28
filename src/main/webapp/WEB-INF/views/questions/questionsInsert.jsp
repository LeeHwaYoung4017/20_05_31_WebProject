<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.tableDIV {
		width: 90%;
		text-align: center;
		margin: 0 auto;
		margin-top: 2%;
	}
	.secret{
		font-size: 18px;
		width: 15%;
		margin: 5%;
		text-align: center;
	}
	.checkbox {
		width: 18px;
		height: 18px;
	}
</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
	<%-- <form action="questionsInsertOK" name="insertForm">
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
	</form> --%>
	<div align="center">
	<div class="container">
		<div class="row" align="center">
		<div class="tableDIV">
			<form action="questionsInsertOK" name="insertForm">
			<input type="hidden" name="writer" value="${sessionScope.vo.id }">
				<table class="table"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" id="title" name="title" maxlength="50"/></td>
							<td class="secret"><label style="margin: 8px;"><input type="checkbox" name="secret" value="secret" class="checkbox">비밀글</label></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="content" id="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<div style="float: right;">
				<input type="reset" class="btn btn-primary" value="초기화">
				<input type="button" class="btn btn-primary pull-right" value="글쓰기" onclick="insert()" />
				</div>
			</form>
			</div>

		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
	var title = insertForm.title
	var content = insertForm.content
	function insert() {
		if(title.value.trim() == ""){
			swal({
				text: "제목을 입력해주세요.",
			});
		}else if(content.value.trim() == ""){
			swal({
				text: "내용을 입력해주세요.",
			});
		}else{
			swal({
				text: "글쓰기를 완료하셨습니다.",
			});
			setTimeout(function() {
				insertForm.submit()
				}, 1000);
		}
	}
</script>
</html>