<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Geedi --任务集</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="/geedi/css/bootstrap.min.css" rel="stylesheet" />
<link href="/geedi/css/bootstrap-responsive.min.css" rel="stylesheet" />


<link href="/geedi/css/font-awesome.css" rel="stylesheet" />

<link href="/geedi/css/adminia.css" rel="stylesheet" />
<link href="/geedi/css/adminia-responsive.css" rel="stylesheet" />

<link href="/geedi/css/pages/dashboard.css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="index">Geedi</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">
						<li><a href="#"><span class="badge badge-warning">7</span></a>
						</li>

						<li class="divider-vertical"></li>

						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle " href="#"> ${user.username}<b
								class="caret"></b>
						</a>

							<ul class="dropdown-menu">
								<li><a href="account.html"><i class="icon-user"></i>
										Account Setting </a></li>

								<li><a href="change_password.html"><i class="icon-lock"></i>
										修改密码</a></li>

								<li class="divider"></li>

								<li><a href="logout"><i class="icon-off"></i> 登出</a></li>
							</ul></li>
					</ul>

				</div>
				<!-- /nav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->


	<div class="copyrights">
		Collect from <a href="index">Geedi</a>
	</div>

	<div id="content">

		<div class="container">

			<div class="row">

				<div class="span3">

					<ul id="main-nav" class="nav nav-tabs nav-stacked">

						<li class="active"><a href="../index"> <i class="icon-info-sign icon-white"></i>
								任务
						</a></li>
						
						<li><a href="main/taskSet"> <i class="icon-th-large"></i>
								任务集
						</a></li>

						<li><a href="faq.html"> <i class="icon-pushpin"></i> FAQ
						</a></li>

						<li><a href="plans.html"> <i class="icon-th-list"></i>
								Pricing Plans
						</a></li>


						<li><a href="charts.html"> <i class="icon-signal"></i>
								Charts
						</a></li>

						<li><a href="account.html"> <i class="icon-user"></i>
								User Account
						</a></li>

						<li><a href="login.html"> <i class="icon-lock"></i> Login
						</a></li>

					</ul>

					<hr />
				</div>
				<!-- /span3 -->
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-info-sign icon-white"></i> 任务集列表
					</h1>

					<div class="stat-container">

						<div class="stat-holder">
							<div class="stat">
								<span>创建任务集</span>
							</div>
							<!-- /stat -->
						</div>
						<!-- /stat-holder -->
					</div>
					<!-- /stat-container -->

				</div>
				<!-- /span9 -->


			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /content -->




	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/geedi/js/jquery-1.7.2.min.js"></script>
	<script src="/geedi/js/excanvas.min.js"></script>
	<script src="/geedi/js/jquery.flot.js"></script>
	<script src="/geedi/js/jquery.flot.pie.js"></script>
	<script src="/geedi/js/jquery.flot.orderBars.js"></script>
	<script src="/geedi/js/jquery.flot.resize.js"></script>
	<script src="/geedi/js/bootstrap.js"></script>
	<script src="/geedi/js/charts/bar.js"></script>

</body>
</html>