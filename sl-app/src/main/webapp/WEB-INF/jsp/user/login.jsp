<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="css/user/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
	<div class="main">
		<form action="checkUser" method="POST">
			<h1>
				<lable>A Good System</lable>
			</h1>
			<h2 align="center">
				<font style="color: red"> ${msg} </font>
			</h2>
			<div class="inset">
				<p>
					<label for="username">用户名</label> <input type="text"
						name="username" placeholder="username" required />
				</p>
				<p>
					<label for="password">密码</label> <input type="password"
						name="password" placeholder="password" required />
				</p>
			</div>

			<p class="p-container">
				<span><a href="#">忘记密码 ?</a></span> <input type="submit"
					value="Login">
			</p>
		</form>
	</div>
	<!-----start-copyright---->
	<div class="copy-right">
		<p>
			<a href="#">及第</a>
		</p>
	</div>
	<!-----//end-copyright---->
</body>
</html>