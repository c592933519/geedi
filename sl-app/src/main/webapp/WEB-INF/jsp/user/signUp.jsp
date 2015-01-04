<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Geedi --注册</title>
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

			<h3>欢迎注册Geedi账号</h3>

		</div>
		<!-- /login-header -->
		<form action="submitSignUp" method="POST" id="form1">
			<div id="login-content" class="clearfix">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="username">用户名 <span
							id="nameTip" style="color: red"></span></label>
						<div class="controls">
							<input type="text" maxlength="20" id="username" name="username" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码<span
							id="pas1Tip" style="color: red"></span></label>
						<div class="controls">
							<input type="password" maxlength="30" class="" id="password1" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="password">再次输入密码<span
							id="pas2Tip" style="color: red"></span></label>
						<div class="controls">
							<input type="password" maxlength="30" class="" id="password2"
								name="password" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="email">邮箱(<span style="color:blue">找回密码用</span>)<span
							id="emailTip" style="color: red"></span></label>
						<div class="controls">
							<input type="text" maxlength="30" id="email" name="email" />
						</div>
					</div>

				</fieldset>

				<div class="pull-right">
					<button type="button" onclick="checkUser();"
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
				忘记密码? <a href="/geedi/fpwd">找回密码</a>
			</p>

		</div>
	</div>

	<script src="js/jquery-1.7.2.min.js"></script>


	<script src="js/bootstrap.js"></script>

	<script type="text/javascript">
		function checkUser() {
			if (checkUsername() && checkEmail() && checkPwd1() && checkPwd2()) {
				$("#form1").submit();
				return true;
			} else {
				return false;
			}
		}
		function checkUsername() {
			var b = false;
			$("#username").css("border", "solid 1px");
			var username = $("#username").val();
			if (username.length < 6) {
				$("#nameTip").html("长度需大于6");
				$("#username").css("color", "red");
				$("#username").focus();
			} else {
				if (!/^[A-Za-z0-9_-]+$/.test(username)) {
					$("#nameTip").html("只能为英文或者数字");
					$("#username").css("color", "red");
					$("#username").focus();
				} else {

					var msg = $.ajax({
						url : "checkUsername?username=" + username,
						async : false
					});
					var returnInfo = $.parseJSON(msg.responseText);
					if (returnInfo.code == 0) {
						$("#nameTip").html("");
						$("#username").css("color", "green");
						b = true;
					} else {
						$("#nameTip").html(returnInfo.msg);
						$("#username").css("color", "red");
					}
				}
			}
			return b;
		}

		function checkPwd1() {
			var b = false;
			$("#password1").css("border", "solid 1px");
			var pwd1 = $("#password1").val();
			if (pwd1.length < 6) {
				$("#pas1Tip").html("长度需大于6");
				$("#password1").css("color", "red");
				$("#password1").focus();
			} else {
				if (!/^[A-Za-z0-9_-]+$/.test(pwd1)) {
					$("#pas1Tip").html("只能为英文或者数字");
					$("#password1").css("color", "red");
					$("#password1").focus();
				} else {
					$("#pas1Tip").html("");
					$("#password1").css("color", "green");
					b = true;
				}
			}
			return b;
		}
		function checkPwd2() {
			var b = false;
			$("#password2").css("border", "solid 1px");
			var pwd1 = $("#password1").val();
			var pwd2 = $("#password2").val();
			if (pwd1 != pwd2) {
				$("#pas2Tip").html("密码不一致");
				$("#password2").css("color", "red");
				$("#password2").focus();
			} else {
				$("#pas2Tip").html("");
				$("#password2").css("color", "green");
				b = true;
			}
			return b;
		}
		function checkEmail() {
			var b = false;
			$("#email").css("border", "solid 1px");
			var email = $("#email").val();
			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			if (!reg.test(email)) {
				$("#emailTip").html("格式错误");
				$("#email").css("color", "red");
				$("#email").focus();
			} else {
				var msg = $.ajax({
					url : "checkEmail?email=" + email,
					async : false
				});
				var returnInfo = $.parseJSON(msg.responseText);
				if (returnInfo.code == 0) {
					$("#emailTip").html("");
					$("#email").css("color", "green");
					b = true;
				} else {
					$("#emailTip").html(returnInfo.msg);
					$("#email").css("color", "red");
				}
			}
			return b;
		}
		$(function() {
			$("#username").blur(function() {
				checkUsername();
			});

			$("#password1").blur(function() {
				checkPwd1();
				if ($("#password2").val() != "") {
					checkPwd2();
				}
			});
			$("#password2").blur(function() {
				checkPwd2();
			});

			$("#email").blur(function() {
				checkEmail();
			});
		})
	</script>

</body>
</html>
