<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/CSSlogin.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/CSSmainHome.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.login-form {
	position: relative;
	width: 100%;
    max-width: 100%;
    min-height: 700px;
	height: 300px;
	margin:auto;
}

.login-wd {
	margin-left:31%;
	max-width:40%;
	
}
</style>
</head>
<body>
<jsp:include page="../moduleView/mainModule.jsp"/>
	<div class="login-Form">
		<div class="login-wd">
			<div class="wrapper">
			<br><br><br><br><br>
			<div class="inner">
			<h2 align="center">Login</h2>
			<p><br></p>
			<form action="loginOK" method="post">
				<label class="form-group">
					<input type="text" name="id" class="form-control" autocomplete="off">
					<span>Your ID</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="password" class="form-control" autocomplete="off">
					<span for="">Your PASSWORD</span>
					<span class="border"></span>
				</label>
				<table style="margin:0 auto">
					<tr>
						<td>
							<button type="submit">Login
								<i class="zmdi zmdi-arrow-right"></i>
							</button>
						</td>
						<td>
							<button type="button" onclick="location.href='join'">Join
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