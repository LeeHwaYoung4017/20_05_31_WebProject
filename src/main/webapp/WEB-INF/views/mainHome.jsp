<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">	<!-- Swiper slice -->
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/CSSSwiper_slide.css" rel="stylesheet" />


<script>
// 메인 홈 슬라이드
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

</head>
<body>
<c:set var="list" value="${exhibitionList.exhibitionList}"/>
<jsp:include page="./moduleView/mainModule.jsp"/>
	<div class="swiper-container">
	    <div class="swiper-wrapper">
	    	<c:forEach var="vo" items="${list}">
	    	<div class="swiper-slide">
	          <img src="${pageContext.request.contextPath}/resources/exhibitionImage/${vo.fileName}">
	     	</div>
	     	</c:forEach>
	    </div>
	      <!-- If we need pagination -->
	      <div class="swiper-pagination"></div>
	
	      <!-- If we need navigation buttons -->
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-button-next"></div>
	      
	      <div class="swiper-scrollbar"></div>
	 </div>
	 
		

	
</body>
</html>