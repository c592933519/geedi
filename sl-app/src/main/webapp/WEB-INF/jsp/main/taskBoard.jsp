<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Geedi --任务板</title>
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
<body onload="loadData();">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="content">

		<div class="container">

			<div class="row">
				<jsp:include page="../common/leftBar.jsp"></jsp:include>
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-info-sign icon-white"></i> 任务板列表
					</h1>
					<select onchange="getCurrPage();" class="selectpicker"
						data-style="btn-info" name="taskSetId" id="dropDiv">
					</select>
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
							<h4 class="modal-title" id="myModalLabel">创建任务板</h4>
						</div>
						<div class="modal-body">
							<h3 class="modal-title">
								标&nbsp;&nbsp;&nbsp;题:<input type="text" maxlength="30"
									name="title" id="title" />
							</h3>
							<h3 class="modal-title">
								任务集:<select name="taskSetId" id="taskSetId"></select>
							</h3>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" onclick="newTaskBoard();"
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
		$("#taskBoard").attr('class', 'active');
		function newTaskBoard() {
			var title = $("#title").val();
			var taskSetId = $("#taskSetId").val();
			if (title == "") {
				alert("标题不能为空");
			} else {
				var msg = $.ajax({
					url : "/geedi/main/newTaskBoard?title=" + title
							+ "&taskSetId=" + taskSetId,
					type : 'POST',
					async : false
				});
				var returnInfo = $.parseJSON(msg.responseText);
				alert(returnInfo.msg);
				if (returnInfo.code == 0) {
					$('#myModal').modal('hide');
					$("#title").val("");
					getTaskBoards(taskSetId);
					getCurrPageByModal();
				}
			}
		}

		function getTaskBoards(taskSetId) {
			var msg = $.ajax({
				url : "/geedi/main/getTaskBoards?taskSetId=" + taskSetId,
				type : 'POST',
				async : false
			});
			var returnInfo = $.parseJSON(msg.responseText);
			$("#mainDiv").empty();
			$
					.each(
							returnInfo,
							function(index, item) {
								var div = "<div class='stat-holder' onclick=\"toTask("
										+ item.id
										+ ",'"
										+ item.title
										+ "')\" ><div class='stat' id='childDiv"+index+"'><span style='color:white'>"
										+ item.title + "</span></div></div>"
								$("#mainDiv").prepend(div);
								$("#childDiv" + index).css("background",
										"#004b97");
							});
			$("#mainDiv")
					.append(
							"<div class='stat-holder' data-toggle='modal' data-target='#myModal'><div class='stat'><span>创建任务板</span></div></div>");
		}

		function getTaskSets() {
			var msg = $.ajax({
				url : "/geedi/main/getTaskSets",
				async : false
			});
			var returnInfo = $.parseJSON(msg.responseText);
			$("#dropDiv").empty();
			$("#taskSetId").empty();
			$("#dropDiv").append("<option value='0'>默认</option>");
			$("#taskSetId").append("<option value='0'>默认</option>");
			$.each(returnInfo, function(index, item) {
				var div = "<option value='"+item.id+"'>" + item.taskSetName
						+ "</option>"
				$("#dropDiv").append(div);
				$("#taskSetId").append(div);
			});
		}

		function loadData() {
			getTaskBoards(0);
			getTaskSets();
		}

		function getCurrPage() {
			var taskSetId = $("#dropDiv").val();
			getTaskBoards(taskSetId);
			$("#taskSetId").find("option[value='" + taskSetId + "']").attr(
					"selected", true);
		}
		function getCurrPageByModal() {
			var taskSetId = $("#taskSetId").val();
			getTaskBoards(taskSetId);
			$("#dropDiv").find("option[value='" + taskSetId + "']").attr(
					"selected", true);
		}
		function toTask(taskBoardId, title) {
			location.href = "/geedi/main/task?taskBoardId=" + taskBoardId
					+ "&title=" + title;
		}
	</script>
</body>
</html>