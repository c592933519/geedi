<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Geedi --任务</title>
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
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="content">

		<div class="container">

			<div class="row">
				<jsp:include page="../common/leftBar.jsp"></jsp:include>
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-info-sign icon-white"></i> ${title}
					</h1>

				</div>
				<!-- /span9 -->
				<div class="span3">

					<div class="widget">
						<div class="widget-content">
							<h3 style="color: #7d7dff">待处理任务列表</h3>
							<div class="well">
								<span data-toggle="modal" data-target="#myModal">点击创建待处理任务</span>
								<a href="javascript:;" style="float: right"
									class="btn btn-small btn-success"> <i
									class="icon-arrow-right"></i>
								</a>
							</div>
						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->

				</div>
				<!-- /span3 -->


				<div class="span3">

					<div class="widget">


						<div class="widget-content">

							<h3 style="color: #ff5151">正在做任务列表</h3>

							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore eu fugiat nulla pariatur.</p>
						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->

				</div>
				<!-- /span3 -->


				<div class="span3">

					<div class="widget">

						<div class="widget-content">

							<h3 style="color: #009100">已完成任务列表</h3>

							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore eu fugiat nulla pariatur.</p>
						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->

				</div>
				<!-- /span3 -->

			</div>
			<!-- /row -->
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">待处理任务</h4>
						</div>
						<div class="modal-body">
							<h3 class="modal-title">标题:</h3>
							<input type="text" maxlength="30" name="title" id="title" />
							<h3 class="modal-title">描述:</h3>
							<textarea rows="" cols=""></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" onclick="newTaskDetail();"
								class="btn btn-primary">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- /.modal -->
		</div>
		<!-- /container -->

	</div>
	<!-- /content -->


	<jsp:include page="../common/js.jsp"></jsp:include>
	<script type="text/javascript">
		$("#taskBoard").attr('class', 'active');
	</script>

</body>
</html>