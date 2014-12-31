<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="/geedi/index">Geedi</a>
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