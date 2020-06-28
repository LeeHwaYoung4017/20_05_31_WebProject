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
	th {
		background: #000040;
		color: white;
		text-align: center;
	}
	.button {
		float: right;
		margin: 1%;
	}
</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<div align="center">
<form action="questionAnswer" name="answerForm">
<input type="hidden" name="idx" value="${questionsVO.idx }">

<div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    <h2 class="text-center" style="margin: 2%;">게시글 보기</h2>
    <div class="table table-responsive">
        <table class="table">
        <tr>
            <th>작성자</th>
            <td>${questionsVO.writer }</td>
            <th>작성일</th>
            <td><fmt:formatDate value="${questionsVO.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${questionsVO.title }</td>
        </tr>
         
        <tr>
            <th>글 내용</th>
            <td colspan="3" style="height: 300px;">${questionsVO.content }</td>
        </tr>
        
        <!-- 답변부분 -->
        <!-- 답변이 없고 관리자 계정이라면  -->
		<c:if test="${questionsVO.answer == null && sessionScope.vo.manager eq ('manager')}">
		<tr>
			<th>답변</th>
			<td colspan="3"><textarea rows="10" cols="100" name="answer" style="border: none;"></textarea> </td>
		</tr>
		</c:if>
		<!-- 답변이 들어있다면 -->
		<c:if test="${questionsVO.answer != null}">
		<tr>
			<th>답변</th>
			<td colspan="3">${questionsVO.answer }</td>
		</tr>
		</c:if>
		
		<!-- 버튼부분 -->
		<tr>
			<td colspan="4" class="text-center">
			<!-- 답변이 없고 관리자 계정이라면  -->
			<c:if test="${questionsVO.answer == null && sessionScope.vo.manager eq ('manager')}">
				<input type="button" class="btn btn-primary button" value="답변입력완료" onclick="questionsAnswer()">
			</c:if>
		<!-- 답변이 들어있지 않으며(들어있으면 삭제 불가) -->
			<c:if test="${questionsVO.answer == null}">
			<!-- 작성자이거나 관리자 계정일때만 삭제가능 -->
			<c:if test="${(sessionScope.vo.id) eq (questionsVO.writer) || (sessionScope.vo.manager) eq ('manager')}">
				<input type="button" class="btn btn-primary button" value="삭제" onclick="location.href='questionsDelete?idx=${questionsVO.idx}'"> 
			</c:if>
			</c:if>
			</td>
		</tr>
        </table>
    </div>
     
    </div>
</div>
</form>
</div>
</body>
<script type="text/javascript">
	function questionsAnswer() {
		swal({
			  title: "답변은 한번 입력하면 수정 불가합니다. 그래도 입력 하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("답변을 입력하였습니다.", {
		      icon: "success",
		    });
		    setTimeout(function() {
		    	answerForm.submit()
				}, 1000);
		  } else {
		    swal("답변 입력이 취소되었습니다.");
		  }
		});
	}
</script>
</html>