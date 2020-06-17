<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> <!-- 영문폰트 Roboto Regular 400 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet"> <!-- 한글폰트 NotoSans -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/CSSmainHome.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
$(function(){
	$("li>a").click(function(e) {
		e.preventDefault();		// **
		$(this).next().slideToggle();
	});
})
</script>
<style type="text/css">
	#lines{
		background-color: #d4d4d4;
	    position: absolute;
	    width: 100%;
	    bottom: -6%;
	}
</style>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="top_fixed_bar">
			<div id="top_contents" style="background-color: #17181b;">
				<!-- LoginVO의 manager 값이 manager일 시 아래 메뉴를 추가한다. -->
				<c:if test="${vo.manager=='manager' }">
					<div class="contents_logo_bar2" style="left:3%; font-family: 'Roboto', sans-serif;">
					    <div class="logos"><a href="managerModeHome" style="text-decoration: none; color: #FFFFFF;">Manager Mode</a></div>
					</div>
				</c:if>
				
				<div class="contents_logo_bar2" style="left:73%; font-family: 'Roboto', sans-serif;">
				    <div class="logos"><a href="mainHome" style="text-decoration: none; color: #FFFFFF;">Home</a></div>
				</div>
				
				<!-- 로그아웃 상태일 때 표시되는 메뉴 -->
				<c:if test="${vo.id == null}">
					<div class="contents_logo_bar2" style="left:76%; font-family: 'Roboto', sans-serif;">
					    <div class="logos"><a href="login" style="text-decoration: none; color: #FFFFFF;">｜ Login</a></div>
					</div>
					<div class="contents_logo_bar2" style="left:80%; font-family: 'Roboto', sans-serif;">
					    <div class="logos"><a href="join" style="text-decoration: none; color: #FFFFFF;">｜ Join</a></div>
					</div>
				</c:if>
				
				<!-- 로그인 상태일 때 표시되는 메뉴 -->
				<c:if test="${vo.id != null }">
					<div class="contents_logo_bar2" style="left:76%; font-family: 'Roboto', sans-serif;">
					    <div class="logos"><a href="logout" style="text-decoration: none; color: #FFFFFF;">｜ Logout</a></div>
					</div>
					<div class="contents_logo_bar2" style="left:81%; font-family: 'Roboto', sans-serif;">
					    <div class="logos"><a href="#" style="text-decoration: none; color: #FFFFFF;">｜ MyPage</a></div>
					</div>
				</c:if>
			</div>
			<div id="menu_contents">
				<div id="menu_list"">
					<!-- 로고 -->
					<div>
						
					</div>
					<!-- 공지사항 멤버십 분양 이벤트 고객센터 -->
					<div id="menu_lists">
						<ul type="square">
							<li class="sub_menu1" onclick="location.href='noticeList'"><a href="#">공지사항</a></li>
							<li class="sub_menu1" ondblclick="location.href='communityInsert'"><a href="#">커뮤니티</a>
								<ul type="disc" class="sub_menu2">
									<li onclick="location.href='communitySubList?category=${1}'"><a href="#">IT행사</a></li>
									<li><a href="#">언어</a></li>
									<li><a href="#">잡담</a></li>
								</ul>
							</li>
							<li class="sub_menu1"><a href="#">전시회</a>
								<ul type="disc" class="sub_menu2">
									<li><a href="#">진행중</a></li>
									<li><a href="#">종료</a></li>
								</ul>
							</li>
							<li class="sub_menu1"><a href="#">고객센터</a>
								<ul type="disc" class="sub_menu2">
									<li><a href="#">회사소개</a></li>
									<li><a href="#">문의사항</a></li>
								</ul>
							</li>
							<c:if test="${vo.manager=='manager' }">
								<li class="sub_menu1"><a href="#">관리하기</a>
									<ul type="disc" class="sub_menu2">
										<li onclick="location.href='memberList'"><a href="#">회원관리</a></li>
										<li onclick="location.href='noticeInsert'"><a href="#">공지사항 작성</a></li>
										<li><a href="#">공지사항 관리하기</a></li>
										<li><a href="#">전시회 작성</a></li>
										<li><a href="#">전시회 관리하기</a></li>
										<li><a href="#">메인공지 작성</a></li>
									</ul>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
				<hr id="lines">
		</div>
	</div>
</div>
</body>
</html>