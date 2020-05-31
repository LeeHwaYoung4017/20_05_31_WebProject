<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> <!-- 영문폰트 Roboto Regular 400 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet"> <!-- 한글폰트 NotoSans -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">	<!-- Swiper slice -->
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>


<script>
$(function(){
	var mySwiper = new Swiper('.swiper-container', {
	// 슬라이드를 버튼으로 움직일 수 있습니다.
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	    
	// 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
	  pagination: {
	    el: '.swiper-pagination',
	    type: 'bullets',
	  },

	// 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
	  scrollbar: {
	    el: '.swiper-scrollbar',
	    draggable: true,
	  },
	    
	// 3초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
	  autoplay: {
	    delay: 3000,
	  },
	});
})
</script>

<style type="text/css">
*{ 
   margin: 0; 
   padding: 0; 
}
body {
    font-family: 'Noto Sans KR',sans-serif;
    letter-spacing: 1px;
}
#wrap {
    position: relative;
    width: 100%;
    margin: 0 auto;
    padding: 0;
    border: 0px solid #eee;
    border-top: 0;
    border-bottom: 0;
}
#container {
    position: relative;
    float: left;
    width: 100%;
    height: 100%;
    margin: 0 auto;
    *zoom: 1;
    overflow: hidden;
    border-left: 0px solid #eee;
}
#top_contents {
	position:fixed;
    width: 100%;
    max-width: 100%;
    min-height: 50px;
    z-index: 99999;
}
#menu_contents {
	position: relative;
    width: 100%;
    max-width: 100%;
    min-height: 150px;
}
.contents_logo_bar {
	z-index:9999;
	cursor:pointer;
	position:fixed;
	top:0.9%;
	width:35px;
	height:35px;
	border-radius:50%;
	overflow:hidden;
	background:#eb0045"
}
.contents_logo_bar2 {
	z-index:9999;
	cursor:pointer;
	position:fixed;
	top:2%;
	overflow:hidden;
	background:#eb0045;
}
.contents_logo {
	position: fixed; 
	top:5px;
	left:0px;
	width:35px;
	height:35px;
	color: black;
}

.swiper-container {
	width: 100%;
    max-width: 100%;
    min-height: 700px;
	height: 300px;
	margin:auto;
}
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
.swiper-slide img{
position: absolute; top:0; left: 0;
width: 100%;
height: 100%;
}

</style>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="top_contents" style="background-color: #eb0045;">
			<div class="contents_logo_bar" onclick="window.open('https://pf.kakao.com/','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')" style="left:60%;">
			    <div class="content_logo"><img src="http://centumcode2.cafe24.com/image/kakao-4.png" width="100%"></div>
			</div>
			<div class="contents_logo_bar" onclick="window.open('https://www.youtube.com/','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')" style="left:63%; border:1px solid #fd0000;">
			    <div class="content_logo"><img src="http://centumcode2.cafe24.com/image/youtube-4.png" width="100%"></div>
			</div>
			<div class="contents_logo_bar" onclick="window.open('https://blog.naver.com/','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')" style="left:66%;">
			    <div class="content_logo"><img src="http://centumcode2.cafe24.com/image/naver-3.png" width="100%"></div>
			</div>
			<div class="contents_logo_bar" onclick="window.open('https://www.instagram.com/?hl=ko','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')" style="left:69%;">
			    <div class="content_logo"><img src="http://centumcode2.cafe24.com/image/instagram.png" width="100%"></div>
			</div>
			<div class="contents_logo_bar2" style="left:73%; font-family: 'Roboto', sans-serif;">
			    <div><a href="*" style="text-decoration: none; color: #FFFFFF;">Home</a></div>
			</div>
			<div class="contents_logo_bar2" style="left:76%; font-family: 'Roboto', sans-serif;">
			    <div><a href="*" style="text-decoration: none; color: #FFFFFF;">｜ Login</a></div>
			</div>
			<div class="contents_logo_bar2" style="left:80%; font-family: 'Roboto', sans-serif;">
			    <div><a href="*" style="text-decoration: none; color: #FFFFFF;">｜ Join</a></div>
			</div>
		</div>
		<div id="menu_contents">
			
		</div>
		<hr style="background-color: #9b9a9a">
		<div class="swiper-container">
		    <div class="swiper-wrapper">
		    	<div class="swiper-slide">
		          <img src="${pageContext.request.contextPath }/resources/image/banner1.jpg">
		     	</div>
		     	<div class="swiper-slide">
		          <img src="${pageContext.request.contextPath }/resources/image/banner2.jpg">
		     	</div>
		     	<div class="swiper-slide">
		          <img src="${pageContext.request.contextPath }/resources/image/banner3.jpg">
		    	</div>
		    </div>
		      <!-- If we need pagination -->
		      <div class="swiper-pagination"></div>
		
		      <!-- If we need navigation buttons -->
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-button-next"></div>
		      
		      <div class="swiper-scrollbar"></div>
		 </div>
	</div>
</div>
	
</body>
</html>