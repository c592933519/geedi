<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Geedi --登录</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="css/font-awesome.css" rel="stylesheet" />
<link href="css/adminia.css" rel="stylesheet" />
<link href="css/adminia-responsive.css" rel="stylesheet" />
<link href="css/pages/login.css" rel="stylesheet" />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">Geedi</a>


			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->


	<div id="login-container">


		<div id="login-header">

			<h3>Login</h3>

		</div>
		<!-- /login-header -->
		<form action="submitLogin" method="POST">
			<div id="login-content" class="clearfix">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="username">用户名<span
							style="color: red">${msg }</span></label>
						<div class="controls">
							<input type="text" maxlength="20" class="" id="username"
								name="username" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls">
							<input type="password" maxlength="30" class="" id="password"
								name="password" />
						</div>
					</div>
				</fieldset>

				<div id="remember-me" class="pull-left">
					<input type="checkbox" name="remember" id="remember" /> <label
						id="remember-label" for="remember">Remember Me</label>
				</div>

				<div class="pull-right">
					<button type="button" onclick="check();"
						class="btn btn-warning btn-large">Login</button>
				</div>
			</div>
		</form>
		<!-- /login-content -->


		<div id="login-extra">

			<p>
				Don't have an account? <a href="signUp">Sign Up.</a>
			</p>

			<p>
				Remind Password? <a href="forgot_password.html">Retrieve.</a>
			</p>

		</div>
		<!-- /login-extra -->

	</div>
	<!-- /login-wrapper -->



	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
	function check(){
		var username=$("#username").val();
		if (username=="") {
			alert("用户名不能为空");
			$("#username").focus();
			return false;
		}
		var pwd=$("#password").val();
		if (pwd=="") {
			alert("密码不能为空");
			$("#password").focus();
			return false;
		}
		$("form").submit();
		}
	</script>

</body>
</html>
