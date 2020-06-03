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
					<input type="text" name="id" class="form-control" autocomplete="off">
					<span>ID</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="password" name="password" class="form-control" autocomplete="off">
					<span for="">PASSWORD</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="password" name="repassword" class="form-control" autocomplete="off">
					<span for="">REPASSWORD</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="phone" class="form-control" autocomplete="off">
					<span for="">PHONE</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="email" class="form-control" autocomplete="off">
					<span for="">EMAIL</span>
					<span class="border"></span>
				</label>
				<label class="form-group">
					<input type="text" name="addr" class="form-control" autocomplete="off">
					<span for="">ADDRESS</span>
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