<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Geedi --找回密码</title>
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

			<h3>找回密码</h3>

		</div>
		<!-- /login-header -->
		<form action="submitFpwd" method="POST">
			<div id="login-content" class="clearfix">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="username">用户名(<span style="color:blue">密码将会发送至注册时邮箱</span>)<span
							style="color: red">${msg }</span></label>
						<div class="controls">
							<input type="text" maxlength="20" class="" id="username"
								name="username" />
						</div>
					</div>
					
				</fieldset>
				<div class="pull-right">
					<button type="button" onclick="check();"
						class="btn btn-warning btn-large">提交</button>
				</div>
			</div>
		</form>
		<!-- /login-content -->


		<div id="login-extra">

			<p>
				已有Geedi账号? <a href="/geedi/login">登录</a>
			</p>

			<p>
				没有Geedi账号? <a href="/geedi/signUp">注册</a>
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
		$("form").submit();
		}
	</script>

</body>
</html>
