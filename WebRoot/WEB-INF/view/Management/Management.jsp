<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>青岛智能产业技术研究院</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="Resources/css/bootstrap-cerulean.min.css" rel="stylesheet" />
<link href="Resources/css/charisma-app.css" rel="stylesheet" />
<link href="Resources/css/fileinput.css" rel="stylesheet" />

<script src="Resources/js/jQuery-1.11.0.js" type="text/javascript"></script>
<script src="Resources/js/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="Resources/js/fileinput.js" type="text/javascript"></script>
<script src="Resources/js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript" src="Resources/js/jquery.form.js"></script>
<script src="Resources/js/login.js" type="text/javascript"></script>
<script src="Resources/js/WdatePicker.js" type="text/javascript"></script>
<script src="Resources/js/common.js" type="text/javascript"></script>
<script src="Resources/js/md5.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$("#userid").val(sessionStorage.getItem("AccountNo"));
		loadParam();

		$("#btnClose1").click(function() {
			Close();
		});

		$("#btnSave").click(function() {
			Save();
		});

		$("#btnmodalclose1").click(function() {
			parent.$("#NewPassword").val("");
			parent.$("#OldPassword").val("");
			parent.$("#ConfirmPassword").val("");

		});
	});
	function TrunPage(pageName) {
		var ifm = document.getElementById("miframe");
		ifm.src = pageName + ".do";
		$("#navul li").each(function(index) {
			$("#navul li").removeClass("active");
		});
		$("#" + pageName).addClass("active");
		window.scrollTo(0, 0);
	}

	function loadParam() {
		var pageName = getQueryString("pagename");
		if (pageName != "undefined" && pageName != "") {
			TrunPage(pageName);
		}
	}

	function Close() {
		parent.$("#btnmodalclose1").click();

	}

	function Save() {
		if (!CheckUI())
			return;
		$.ajax({
			async : false,
			url : "changePassword.do",
			type : "post",
			data : {
				AccountNo : sessionStorage.getItem("AccountNo"),
				OldPassword : $("#OldPassword").val().trim(),
				NewPassword : $("#NewPassword").val().trim()
			},
			success : function(data) {
				if (data != null) {
					// alert(JSON.stringify(data));
					var flg = false;
					switch (data.FailCode) {
					case "M01C001E001":
						alert("数据库连接失败。");
						break;
					case "M01C004E009":
						alert("旧密码错误。");
						parent.$("#OldPassword").val("");
						break;
					default:
						flg = true;
						break;
					}
					if (data.State == "1" && flg) {
						alert("密码修改成功。");
						ClearUI();
						parent.$("#btnmodalclose1").click();
					}
				}
			}
		});

	}

	function ClearUI() {
		$("#OldPassword").val("");
		$("#NewPassword").val("");
		$("#ConfirmPassword").val("");
	}

	function CheckUI() {
		if (parent.$("#OldPassword").val().trim() == "") {
			alert("请填写旧密码。");
			parent.$("#OldPassword").focus();
			return false;
		}

		if (parent.$("#NewPassword").val().trim() == "") {
			alert("请填写新密码。");
			parent.$("#NewPassword").focus();
			return false;
		}
		if (parent.$("#NewPassword").val().length < 6) {
			alert("密码不能小于6位！");
			parent.$("#NewPassword").val("");
			parent.$("#ConfirmPassword").val("");
			parent.$("#NewPassword").focus();
			return false;
		}
		if (parent.$("#NewPassword").val().length > 20) {
			alert("密码必须小于20位！");
			parent.$("#NewPassword").val("");
			parent.$("#ConfirmPassword").val("");
			parent.$("#NewPassword").focus();
			return false;
		}

		if (parent.$("#NewPassword").val() != parent.$("#ConfirmPassword")
				.val()) {
			alert("两次密码输入不一致!");
			parent.$("#NewPassword").val("");
			parent.$("#ConfirmPassword").val("");
			parent.$("#NewPassword").focus();
			return false;
		}

		return true;
	}
</script>
<style type="text/css">
a:focus {
	outline: none;
}
</style>


</head>

<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<a class="navbar-brand" href="javascript:void(0)"><span>青岛智能产业技术研究院后台管理</span></a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i><span
						class="hidden-sm hidden-xs"> <input type="text" id="userid"
						style="width:120px;text-align:center;border:0;" name="userid" /></span>
				</button>
				<ul class="dropdown-menu">
					<li><a id="Modifypassbtn" href="#" data-toggle="modal"
						data-target="#ModifyPassModal" data-backdrop='static'>修改密码</a></li>
					<li class="divider"></li>
					<li><a href="javascript:logout();">登出</a></li>
				</ul>
			</div>
			<!-- user dropdown ends -->
		</div>
	</div>
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">
					<div class="nav-canvas">
						<div class="nav-sm nav nav-stacked"></div>
						<ul id="navul" class="nav nav-pills nav-stacked main-menu">
							<li class="nav-header hidden-md">首页</li>
							<li id="LunBoDaTu" class="active"><a class="ajax-link"
								href="javascript:TrunPage('LunBoDaTu');"> <i
									class="glyphicon glyphicon-home"> </i> <span> 轮播大图 </span>
							</a></li>
							<li class="nav-header" >基本概况</li>
							<li id="YuanWuXinWen"><a class="ajax-link"
								href="javascript:TrunPage('YuanWuXinWen');"> <i
									class="glyphicon glyphicon-bell"> </i> <span>
										院务新闻 </span>
							</a></li>
							<li id="MoBanXiaZai"><a class="ajax-link"
								href="javascript:TrunPage('MoBanXiaZai');"> <i
									class="glyphicon glyphicon-download-alt"> </i> <span>
										模板下载 </span>
							</a></li>
							
							<li class="nav-header hidden-md">新闻动态</li>
							<li id="TongZhiTongGao"><a class="ajax-link"
								href="javascript:TrunPage('TongZhiTongGao');"> <i
									class="glyphicon glyphicon-transfer"> </i> <span> 通知通告 </span>
							</a></li>
							<li id="LingDaoShiCha"><a class="ajax-link"
								href="javascript:TrunPage('LingDaoShiCha');"> <i
									class="glyphicon glyphicon-forward"> </i> <span> 领导视察 </span>
							</a></li>
							<li id="ZhengQiDuiJie"><a class="ajax-link"
								href="javascript:TrunPage('ZhengQiDuiJie');"> <i
									class="glyphicon glyphicon-film"> </i> <span> 政企对接 </span>
							</a></li>
							<li id="YuanGongFengCai"><a class="ajax-link"
								href="javascript:TrunPage('YuanGongFengCai');"> <i
									class="glyphicon glyphicon-leaf"> </i> <span> 员工风采 </span>
							</a></li>
							<li id="ZhongYaoRongYu"><a class="ajax-link"
								href="javascript:TrunPage('ZhongYaoRongYu');"> <i
									class="glyphicon glyphicon-tower"> </i> <span> 重要荣誉 </span>
							</a></li>
							<li id="HangYeQingBaoJianBao"><a class="ajax-link"
								href="javascript:TrunPage('HangYeQingBaoJianBao');"> <i
									class="glyphicon glyphicon-list-alt"> </i> <span> 行业情报简报 </span>
							</a></li>
							
							<li class="nav-header">科研活动</li>
							<li id="XueShuShengYan"><a class="ajax-link"
								href="javascript:TrunPage('XueShuShengYan');"> <i
									class="glyphicon glyphicon-map-marker"> </i> <span>
										学术盛宴 </span>
							</a></li>
							<li id="ZhongDianXiangMu"><a class="ajax-link"
								href="javascript:TrunPage('ZhongDianXiangMu');"> <i
									class="glyphicon glyphicon-exclamation-sign"> </i> <span>
										重点项目 </span>
							</a></li>
							<li class="accordion"><a href="#"> <i
									class="glyphicon glyphicon-plus"> </i> <span> 科研成果 </span>
							</a>
								<ul class="nav nav-pills nav-stacked" style="display: block;">
									<li id="KeYanJiangLi"><a class="ajax-link"
										href="javascript:TrunPage('KeYanJiangLi');"> <i
											class="glyphicon glyphicon-gift"> </i> <span> 科研奖励 </span>
									</a></li>
									<li id="XueShuZhuZuo"><a class="ajax-link"
										href="javascript:TrunPage('XueShuZhuZuo');"> <i
											class="glyphicon glyphicon-book"> </i> <span> 学术著作 </span>
									</a></li>
									<li id="RuanJianZhuZuo"><a class="ajax-link"
										href="javascript:TrunPage('RuanJianZhuZuo');"> <i
											class="glyphicon glyphicon-inbox"> </i> <span> 软件著作 </span>
									</a></li>
									<li id="ZhuanLiChengGuo"><a class="ajax-link"
										href="javascript:TrunPage('ZhuanLiChengGuo');"> <i
											class="glyphicon glyphicon-briefcase"> </i> <span>
												专利成果 </span>
									</a></li>
								</ul></li>
							<li id="ZhuanJiaFangTan"><a class="ajax-link"
								href="javascript:TrunPage('ZhuanJiaFangTan');"> <i
									class="glyphicon glyphicon-road"> </i> <span>
										专家访谈 </span>
							</a></li>
							<li class="nav-header hidden-md">产品方案</li>
							<li id="ChanPinFangAn"><a class="ajax-link"
								href="javascript:TrunPage('ChanPinFangAn');"> <i
									class="glyphicon glyphicon-wrench"> </i> <span> 产品方案 </span>
							</a></li>
							
							<li class="nav-header hidden-md">招贤纳士</li>
							<li id="ZhaoXianNaShi"><a class="ajax-link"
								href="javascript:TrunPage('ZhaoXianNaShi');"> <i
									class="glyphicon glyphicon-flag"> </i> <span> 招贤纳士 </span>
							</a></li>
							<li id="YingPinJianLi"><a class="ajax-link"
								href="javascript:TrunPage('YingPinJianLi');"> <i
									class="glyphicon glyphicon-file"> </i> <span> 应聘简历 </span>
							</a></li>
							<li class="nav-header hidden-md">登出</li>
							<li><a href="javascript:logout();"> <i
									class="glyphicon glyphicon-lock"> </i> <span> 登出 </span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!--/span-->
			<!-- left menu ends -->

			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<iframe id="miframe" style="margin: 0 auto; width: 100%;"
					scrolling="no" frameborder="0" src="LunBoDaTu.do"
					onload="miFrameHeight();"></iframe>
				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->

		<hr />
		<footer class="row">
		<p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy;
			青岛智能产业技术研究院 2014</p>
		<p class="col-md-3 col-sm-3 col-xs-12 powered-by">
			官网地址：<a href="http://www.qaii.cn">www.qaii.cn</a>
		</p>
		</footer>
	</div>
	<!--/.fluid-container-->
	<!-- content ends -->

	<div id="modalarea">
		<div class="modal fade" id="ModifyPassModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button id="btnmodalclose1" type="button" class="close"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<span id="spTitle">修改密码</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="ModifyPassform" name="MPSeditform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="myhiddenID" name="NewsID" />
							<table class="table">
								<tr>
									<td style="width:130px;">旧密码：</td>
									<td><input id="OldPassword" type="password"
										class="form-control" name="OldPassword" maxlength="25"/></td>
								</tr>
								<tr>
									<td style="width:130px;">新密码：</td>
									<td> <input type="password" style="display:none" />
									<input id="NewPassword"  type="password"
										class="form-control" name="NewPassword" maxlength="25" /></td>
								</tr>
								<tr>
									<td style="width:130px;">确认密码：</td>
									<td><input id="ConfirmPassword" type="password"
										class="form-control" name="ConfirmPassword" maxlength="25" /></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button id="btnClose1" type="button" class="btn btn-default">取&nbsp;&nbsp;消</button>
						<button id="btnSave" type="button" class="btn btn-primary">确&nbsp;认</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" language="javascript">
		function miFrameHeight() {
			var ifm = document.getElementById("miframe");

			var subWeb = document.frames ? document.frames["miframe"].document
					: ifm.contentDocument;

			if (ifm != null && subWeb != null) {

				var Sys = {};
				var ua = navigator.userAgent.toLowerCase();
				var s;
				(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1]
						: (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1]
								: (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1]
										: (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1]
												: (s = ua
														.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1]
														: 0;

				if (Sys.chrome) {
					ifm.height = subWeb.body.offsetHeight + 50;
				} else {
					ifm.height = (subWeb.body.offsetHeight > subWeb.body.scrollHeight ? subWeb.body.offsetHeight
							: subWeb.body.scrollHeight) + 50;
				}
			}
		}
	</script>
</body>
</html>
