<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/CSSlogin.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/CSSmainHome.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
		
	//비밀번호체크(아작스)
	function checkPW(){
		var div = document.getElementById("pw_c");
		var pw = document.getElementById("password").value;
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var pw_check = document.getElementById("pwcheck");
		if(!pw || pw.trim().length < 8 || pw.trim().length > 20 || pw.search(/\s/) != -1){
			$("#pw_c").css("color", "red");
			div.innerHTML = "비밀번호는 공백 없이 8자리 이상 20자리 이하로 작성해주세요.";
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$("#pw_c").css("color", "red");
			div.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요.";
		}else{
			$("#pw_c").css("color", "green");
			pw_check.value="ok";
			div.innerHTML = "사용 가능한 비밀번호 입니다.";
		}
	}

	//비밀번호 확인 체크(아작스)
	function checkPW2(){
		var div = document.getElementById("pw_ck");
		var pw = document.getElementById("password").value;
		var chkpw = document.getElementById("repassword").value;
		if(pw.length==chkpw.length){
			if(pw!=chkpw){
				$("#pw_ck").css("color", "red");
				div.innerHTML = "비밀번호가 일치하지 않습니다.";
			}else{
				$("#pw_ck").css("color", "blue");
				div.innerHTML = "비밀번호가 일치합니다.";
			}
		} else {
			$("#pw_ck").css("color", "blue");
			div.innerHTML = null;
		}
	}

</script>

</head>
<body>
<c:if test="${sessionScope.vo.manager eq none}">
<script type="text/javascript">
	alert('권한이 없습니다.'); 
	location.href=history.go(-1);
</script>
</c:if>
<jsp:include page="../moduleView/mainModule.jsp"/>
	<div class="login-Form">
		<div class="login-wd">
			<div class="wrapper">
			<br><br><br><br><br>
			<div class="inner">
			<h2 align="center">Update</h2>
			<p></p>
			<form action="memberUpdateOK" method="post">
				<input type="hidden" value="${vo.id}" name="id" id="id">
				<label class="form-group">
					<input type="password" name="password" id="password" class="form-control" autocomplete="off" onkeyup="checkPW()">
					<span>PASSWORD</span>
					<div id="pw_c"></div> 
					<input type="hidden" id="pwcheck" name="pwcheck" value="not"/>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="password" name="repassword" id="repassword" class="form-control" autocomplete="off" onkeyup="checkPW2()">
					<span>REPASSWORD</span>
					<div id="pw_ck"></div>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="phone" class="form-control" placeholder="${vo.phone}" autocomplete="off" maxlength="11">
					<span>&nbsp;PHONE</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="email" class="form-control" placeholder="${vo.email}" autocomplete="off">
					<span>&nbsp;EMAIL</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="userAddr" id="userAddr" class="form-control" placeholder="${vo.address}" autocomplete="off" onclick="goPopup()">
					<span style="transform: translateY(-22px) scale(0.8);">&nbsp;ADDRESS</span>
					<span class="border"></span>
				</label>
				<table style="margin:0 auto">
					<tr>
						<td>
							<button type="submit">UPDATE
								<i class="zmdi zmdi-arrow-right"></i>
							</button>
						</td>
						<td>
							<button type="button" onclick="history.back()">BACK
								<i class="zmdi zmdi-arrow-right"></i>
							</button>
						</td>
					</tr>
				</table>
			</form>
			</div>
			</div>
		</div>
	</div>
</body>
</html>