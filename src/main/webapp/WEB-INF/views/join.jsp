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

	function checkIdResponse(){
		var object = eval("(" + idRequest.responseText + ")");
		var result = object.result;
		var check = result[0].value;
		var div = document.getElementById("id_c");
		var id_check = document.getElementById("idcheck");
		if(check=="OK"){
			$("#id_c").css("color", "blue");
			id_check.value = "ok";
			div.innerHTML = "사용가능한 아이디 입니다.";
		}else{
			$("#id_c").css("color", "red");
			div.innerHTML = "이미 사용중인 아이디 입니다.";
		}
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
					<span>ID</span>
					<div id="id_c"></div>
					<input type="hidden" id="idcheck" value="not"/>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="password" name="password" id="password" class="form-control" autocomplete="off">
					<span>PASSWORD</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="password" name="repassword" id="repassword" class="form-control" autocomplete="off">
					<span>REPASSWORD</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="phone" class="form-control" autocomplete="off">
					<span>PHONE</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="email" class="form-control" autocomplete="off">
					<span>EMAIL</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="address" class="form-control" autocomplete="off">
					<span>ADDRESS</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="checkbox" value="chk" id="agree" autocomplete="off"">14세 이상입니다. (필수)
					<span class="border"></span>
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