<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>青岛智能产业技术研究院</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="Resources/css/bootstrap-cerulean.min.css" rel="stylesheet" />
<link href="Resources/css/charisma-app.css" rel="stylesheet" />
<script src="Resources/js/jQuery-1.11.0.js" type="text/javascript"></script>
<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style>
html,body {
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#btnlogin").click(
				function() {
					if ($("#txtusername").val().trim() == "") {
						alert("请输入用户名");
						return;
					}
					if ($("#txtpwd").val().trim() == "") {
						alert("请输入密码");
						return;
					}

					$.post("CheckAccount.do", {
						AccountNo : $("#txtusername").val().trim(),
						Password : $("#txtpwd").val().trim()
					},
							function(data) {
								//alert(JSON.stringify(data));
								if (data.AccountID == "0") {
									alert("用户名或密码不正确，请重新输入");
									return;
								} else {
									alert("登陆成功。");
									$("#loginfrom").submit();
									sessionStorage.setItem("AccountID",
											data.AccountID);
									sessionStorage.setItem("AccountNo", $(
											"#txtusername").val().trim());


								}
							});

				});
	});
</script>
</head>

<body>
	<div class="ch-container">
		<div class="row">

			<div class="row">
				<div class="col-md-12 center login-header">
					<h2>登录</h2>
				</div>
				<!--/span-->
			</div>
			<!--/row-->

			<div class="row">
				<div class="well col-md-5 center login-box">
					<div class="alert alert-info">请输入您的用户名和密码。</div>
					<form id="loginfrom" class="form-horizontal"
						action="AccountLogin.do" method="post">
						<fieldset>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user red"></i></span> <input
									id="txtusername" type="text" class="form-control"
									placeholder="用户名" name="AccountNo"
									value="${cookie.AccountNo.value}" maxlength="40" />
							</div>
							<div class="clearfix"></div>
							<br />

							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock red"></i></span> <input id="txtpwd"
									type="password" class="form-control" placeholder="密码"
									name="Password" value="${cookie.Password.value}"  maxlength="40"/>
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend">
								<label class="remember" for="remember"><input
									type="checkbox" id="remember" name="Rememb" /> 记住密码</label>
							</div>
							<div class="clearfix"></div>

							<p class="center col-md-5">
								<button id="btnlogin" type="button" class="btn btn-primary">登录</button>
							</p>
						</fieldset>
					</form>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
		<!--/fluid-row-->

	</div>
	<!--/.fluid-container-->
</body>
</html>
