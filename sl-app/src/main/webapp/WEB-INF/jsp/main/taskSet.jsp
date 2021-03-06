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
<body onload="getTaskSets();">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="content">

		<div class="container">

			<div class="row">
				<jsp:include page="../common/leftBar.jsp"></jsp:include>
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-info-sign icon-white"></i> 任务集列表
					</h1>
					<div class="stat-container" id="mainDiv">
						<!-- 	<div class="stat-holder" data-toggle="modal"
							data-target="#myModal">
							<div class="stat">
								<span>创建新任务</span>
							</div>
							/stat
						</div> -->
						<!-- /stat-holder -->
					</div>
					<!-- /stat-container -->

				</div>
				<!-- /span9 -->


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
							<h4 class="modal-title" id="myModalLabel">创建任务集</h4>
						</div>
						<div class="modal-body">
							<h3 class="modal-title">任务集名:</h3>
							<input type="text" maxlength="30" name="taskSetName"
								id="taskSetName" />
							<h3 class="modal-title">任务集描述:</h3>
							<textarea maxlength="255" rows="" cols="" name="summary"
								id="summary"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" onclick="newTaskSet();"
								class="btn btn-primary">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- /container -->

		</div>
	</div>
	<!-- /content -->

	<jsp:include page="../common/js.jsp"></jsp:include>

	<script type="text/javascript">
		$("#taskSet").attr('class', 'active');
		function newTaskSet() {
			var taskSetName = $("#taskSetName").val();
			var summary = $("#summary").val();
			if (taskSetName == "") {
				alert("任务集名不能为空");
			} else {
				var msg = $.ajax({
					url : "/geedi/main/newTaskSet?taskSetName=" + taskSetName
							+ "&summary=" + summary,
					type : 'POST',
					async : false
				});
				var returnInfo = $.parseJSON(msg.responseText);
				alert(returnInfo.msg);
				if (returnInfo.code == 0) {
					$('#myModal').modal('hide');
					$("#taskSetName").val("");
					$("#mainDiv").empty();
					getTaskSets();
				}
			}
		}

		function getTaskSets() {
			var msg = $.ajax({
				url : "/geedi/main/getTaskSets",
				async : false
			});
			var returnInfo = $.parseJSON(msg.responseText);
			$
					.each(
							returnInfo,
							function(index, item) {
								var div = "<div class='stat-holder' ><div class='stat' id='childDiv"+index+"'><span style='color:white'>"
										+ item.taskSetName
										+ "</span></div></div>"
								$("#mainDiv").prepend(div);
								$("#childDiv" + index).css("background",
										"#004b97");
							});
			$("#mainDiv")
					.append(
							"<div class='stat-holder' data-toggle='modal' data-target='#myModal'><div class='stat'><span>创建任务集</span></div></div>");
		}
	</script>
</body>
</html>