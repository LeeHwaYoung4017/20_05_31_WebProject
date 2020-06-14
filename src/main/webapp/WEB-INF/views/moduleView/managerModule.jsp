<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="top_fixed_bar">
			<div id="top_contents" style="background-color: #17181b">
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
					    <div class="logos"><a href="mainHome" style="text-decoration: none; color: #FFFFFF;">｜ Logout</a></div>
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
					<!-- 공지사항 멤버십 관리 고객센터 -->
					<div id="menu_lists">
						<ul type="square">
							<li class="sub_menu1" onclick="location.href='mainHome'"><a href="#">메인화면</a></li>
							<li class="sub_menu1" onclick="location.href='noticeList'"><a href="#">공지사항</a></li>
							<li class="sub_menu1"><a href="#">분양글관리</a></li>
							<li class="sub_menu1"><a href="#">회원관리</a></li>
							<li class="sub_menu1"><a href="#">문의사항</a></li>
						</ul>
					</div>
				</div>
				<hr style="background-color: #d4d4d4">
			</div>
		</div>
	</div>
</div>
</body>
</html>
