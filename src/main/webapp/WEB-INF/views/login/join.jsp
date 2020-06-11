<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	function idcheck() {
		var id = document.getElementById("id").value;
		var url = "./idCheck";
		var title = "idCheck";
		var option = "top=200, left=300, width=450px, height=150px, scrollbar=no, resizable=no";
		window.open(url,title,option);
	}
	
	//아이디체크(아작스)
	var idRequest = new XMLHttpRequest();
	function checkID(){
		var div = document.getElementById("id_c");
		var id = document.getElementById("id").value;

		if(!id || id.trim().length < 6 || id.trim().length > 15 || id.search(/\s/) != -1){
			$("#id_c").css("color", "balck");
			div.innerHTML = "아이디는 6~15자리 영문자, 숫자로만 작성해주세요.";
		}else{
			var url = "./checkID?id="+ encodeURIComponent(id);
			idRequest.open("POST",url ,true);
			idRequest.send(null);
			idRequest.onreadystatechange = checkIdResponse;
		}
	}
	//아이디를 체크해서 가져온다(아작스)
	function checkIdResponse(){
		var object = eval("(" + idRequest.responseText + ")");
		var result = object.result;
		var check = result[0].value;
		var div = document.getElementById("id_c");
		var id_check = document.getElementById("idcheck");
		if(check=="OK"){
			$("#id_c").css("color", "green");
			id_check.value = "ok";
			div.innerHTML = "사용가능한 아이디 입니다.";
		}else{
			$("#id_c").css("color", "red");
			div.innerHTML = "이미 사용중인 아이디 입니다.";
		}
	}	
	
	
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
	
	//주소 검색 API 팝업
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var url = "./jusoPopup";
		//사용할 제목
		var title = "pop";
		//사이즈 및 옵션
		var option = "width=570,height=420, scrollbars=yes, resizable=yes";
		//창을 띄운다.
		window.open(url,title,option);
	}

</script>

</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
	<div class="login-Form">
		<div class="login-wd">
			<div class="wrapper">
			<br><br><br><br><br>
			<div class="inner">
			<h2 align="center">Join</h2>
			<p></p>
			<form action="joinOK" method="post">
				<label class="form-group">
					<input type="text" name="id" id="id" class="form-control" autocomplete="off" onkeyup="checkID()">
					<span>&nbsp;&nbsp;ID</span>
					<div id="id_c"></div>
					<input type="hidden" id="idcheck" value="not"/>
					<span class="border"></span>
				</label>
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
					<input type="text" name="phone" class="form-control" autocomplete="off" maxlength="11">
					<span>&nbsp;PHONE</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="email" class="form-control" autocomplete="off">
					<span>&nbsp;EMAIL</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="userAddr" id="userAddr" class="form-control" autocomplete="off" onclick="goPopup()">
					<span style="transform: translateY(-22px) scale(0.8);">&nbsp;ADDRESS</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="checkbox" value="chk" id="agree" autocomplete="off"">14세 이상입니다. (필수)
				</label>
				<table style="margin:0 auto">
					<tr>
						<td>
							<button type="submit">OK
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