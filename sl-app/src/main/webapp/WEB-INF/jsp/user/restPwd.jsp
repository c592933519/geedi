<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Geedi --重置密码</title>
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
				</a> <a class="brand" href="login">Geedi</a>


			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->


	<div id="login-container">


		<div id="login-header">

			<h3>重置密码</h3>

		</div>
		<!-- /login-header -->
		<form action="submitRestPwd" method="POST">
			<div id="login-content" class="clearfix">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="password">新密码<span
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
					<input type="hidden" name="username" value="${username}" /> <input
						type="hidden" name="token" value="${token}" />
				</fieldset>

				<div class="pull-right">
					<button type="button" onclick="check();"
						class="btn btn-warning btn-large">提交</button>
				</div>
			</div>
		</form>
		<!-- /login-content -->


	</div>
	<!-- /login-wrapper -->



	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function check() {
			if (checkPwd1() && checkPwd2()) {
				$("form").submit();
			}
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
			} else {
				$("#pas2Tip").html("");
				$("#password2").css("color", "green");
				b = true;
			}
			return b;
		}

		$(function() {
			$("#password1").blur(function() {
				checkPwd1();
				if ($("#password2").val() != "") {
					checkPwd2();
				}
			});
			$("#password2").blur(function() {
				checkPwd2();
			});

		})
	</script>

</body>
</html>
