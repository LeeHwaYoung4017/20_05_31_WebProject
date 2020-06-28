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
	.all{
		position: relative;
		width:100%;
		left: 0;
		top: 0;
		height: 700px;
		overflow: hidden;
	}
	.delLine{
	    position: relative;
	    width: 70%;
	    left: 15%;
	    height: 100%;
	    border: 1px solid #d4d4d4;
	    float: left;
	}
	.listLine{
		position: relative;
		width: 100%;
		height: 93%;
		margin-top: 20px;
		float: left;
		clear: both;
	}
	.bottomLine{
		position: relative;
		width: 100%;
		height: 10%;
		left: 38%;
		bottom: 10%;
		padding-bottom: 2%;
		float: left;
		clear: both;
	}
	.search{
		position: relative;
		width: 100%;
		padding: 1%;
		right: 38%;
		bottom:0px;
	}
	.insertOK{
		position: relative;
		width: 100px;
		float: right;
		margin: 0px 1% 1% 0px;;
	}
	
	th, td{
		text-align: center;
	}
	
	img {
		align-items: center;
	}
	
	select { 
		width: 100px; /* 원하는 너비설정 */ 
		padding: .3em .6em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		border: 1px solid #999; 
		border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; }

	</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
<c:set var="list" value="${questionsList.questionsVO}"/>
<input type="hidden" id="writer" name="writer" value="${sessionScope.vo.id }">
	<div id="wrap">
		<div id="container">
			<div class="all">
				<div class="delLine">
					<div class="listLine">
						<h1 align="center" style="margin-top: 2%;">문의사항</h1>
						<button class="btn btn-success insertOK" type="button" onclick="insert()">글쓰기</button>
						<table class="table table-hover">
						    <thead class="thead-dark">
						      <tr>
						        <th>번호</th>
						        <th>제목</th>
						        <th>작성자</th>
						        <th>게시일</th>
						        <th>처리상태</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:if test="${list.size() == 0}">
						        <td colspan="6" align="center">게시글이 없습니다.</td>
						    </c:if>
							  <c:if test="${list.size() > 0}">
							  <c:forEach var="item" items="${list}" varStatus="status">
						      <tr>
						        <td>
						        ${questionsList.totalCount - ((questionsList.currentPage - 1) * questionsList.pageSize + status.index) }
						        </td>
						        <c:choose>
						        	<c:when test="${item.secret != null}">
						        		<c:if test="${item.writer != sessionScope.vo.id && sessionScope.vo.manager ne ('manager')}">
						        		<td><img alt="잠긴자물쇠" src="resources/image/secret.png" width="20px"> 비밀글입니다.</td>
						        		</c:if>
						        		<c:if test="${item.writer == sessionScope.vo.id || sessionScope.vo.manager eq ('manager')}">
						        		<td><a href="questionsDetail?idx=${item.idx }">
						        		<img alt="열린자물쇠" src="resources/image/openSecret.png" width="20px">${item.title }
						        		</a></td>
						        		</c:if>
						        	</c:when>
								<c:otherwise>
						        	<td align="left" style="padding-left: 30px;">
					        		<a href="questionsDetail?idx=${item.idx }"> ${item.title }</a>
					        		</td>
								</c:otherwise>
						        </c:choose>
						        <td>${item.writer }</td>
						        <td><fmt:formatDate value="${item.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						        <td>${item.status }</td>
						      </tr>
							  </c:forEach>
						      </c:if>
						    </tbody>
						  </table>
					</div>
					<div style="clear: both;"></div>
					<div class="bottomLine">
						<!-- 이전 페이지 -->
						<c:if test="${questionsList.startPage > 1}">
							<input type="button" value="시작" onclick="location.href='?page=1'" title="첫 페이지"/>
							<input type="button" value="이전" onclick="location.href='?page=${questionsList.startPage -1}'">
						</c:if>
						<!-- 이전 페이지가 존재하지 않을경우 -->
						<c:if test="${questionsList.startPage <= 1}">
							<input type="button" value="시작" disabled="disabled" title="첫페이지 입니다."/>
							<input type="button" value="이전" disabled="disabled" title="이전 10페이지가 없습니다.">
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${questionsList.startPage}" end="${questionsList.endPage }" step="1">
							<!-- 이미 선택된 페이지 -->
							<c:if test="${i == questionsList.currentPage }">
								<input type="button" value="${i}" disabled="disabled">
							</c:if>
							<!-- 선택이 되지 않은 나머지 페이지 -->
							<c:if test="${i != questionsList.currentPage}">
								<input type="button" value="${i}" onclick="location.href='?page=${i}'">				
							</c:if>
						</c:forEach>
						
						<!-- 다음 페이지 -->
						<c:if test="${questionsList.endPage < questionsList.totalPage}">
							<input type="button" value="다음" onclick="location.href='?page=${questionsList.endPage + 1}'">
							<input type="button" value="마지막" onclick="location.href='?page=${questionsList.totalPage}'">
						</c:if>
						<!-- 다음 페이지가 존재하지 않을경우 -->
						<c:if test="${questionsList.endPage >= questionsList.totalPage}">
							<input type="button" value="다음" disabled="disabled" title="마지막 페이지 입니다.">
							<input type="button" value="마지막" disabled="disabled" title="다음 10페이지가 없습니다.">
						</c:if>
						<form action="questionsList">
						<input type="hidden" name="page" value="1">
					  	<div class="container">
					  	<div align="center">
							<div class="row">
							<div class="search">
								<div class="col-md-6">
									<div class="input-prepend input-group">
										<div class="input-group-prepend">
											<select name="field">
												<option value="title">제목</option>
												<option value="writer">작성자</option>
											</select>
										</div>
										<input class="form-control" id="prependedInput" size="16" type="text"
											name="search" placeholder="검색할 글자를 적으세요">
										<span class="input-group-append">
											<button class="btn btn-primary" type="submit">검색</button>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					</form>
					</div>	
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var vo = document.getElementById('writer').value
	function insert() {
		if(vo == ""){
			swal({
				text: "로그인을 하셔야 글쓰기가 가능합니다.",
			});
		}else{
			swal({
				text: "글쓰기 페이지로 이동합니다.",
			});
			setTimeout(function() {
				location.href="questionsInsert"
				}, 1000);
			
		}
	}
</script>
</html>