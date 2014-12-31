<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Geedi --首页</title>
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
						<i class="icon-info-sign icon-white"></i> 任务列表
					</h1>
					<div class="stat-container">
						<div class="stat-holder" onclick="newTask();">
							<div class="stat">
								<span>创建新任务</span>
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

	<jsp:include page="../common/js.jsp"></jsp:include>

	<script type="text/javascript">
		$("#task").attr('class', 'active');
		function newTask() {

		}
	</script>

</body>
</html>