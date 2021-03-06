﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>青岛智能产业技术研究院——科研奖励</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="Resources/css/bootstrap-cerulean.min.css" rel="stylesheet" />
<link href="Resources/css/charisma-app.css" rel="stylesheet" />

<script src="Resources/js/jQuery-1.11.0.js" type="text/javascript"></script>
<script src="Resources/js/bootstrap.js" type="text/javascript"></script>

<link href="Resources/css/fileinput.css" rel="stylesheet" />
<link href="Resources/css/mstyle.css" rel="stylesheet" />

<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/fileinput.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap.js"></script>
<script type="text/javascript" src="Resources/js/jquery.form.js"></script>
<script type="text/javascript" src="Resources/js/pages.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>
<script type="text/javascript" src="Resources/js/WdatePicker.js"></script>

<script type="text/javascript">
	//当前页数
	var pageno = 1;

	//每页加载记录数量
	var pagerow = 20;

	//数据记录数
	var rowcount;
	var UserID = "";
	$(function() {

		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");
		LoadData();
		$("#btnClose").click(function() {
			Close();
		});
		$("#btnmodalclose").click(function() {
			Close();
		});
		$("#btnSave").click(function() {
			Save();
		});

		$("#btnEdit").click(function() {
			if ($("#hiddenID").val().trim() == "") {

				alert("请选择操作对象。");
				return false;
			}
			$("#btnEdit").attr("data-target", "#myModal");//添加时需要去掉该值，否则也能打开
			openDetail($("#hiddenID").val()); //打开编辑操作
		});
	});

	/******根据函数名字将参数改一下******/
	function LoadData() {
		$.post("LoadAwardList.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerow,
			AwardTitle : "",//奖励名称
			GrantUnit : "",//授予单位
			GetTime : "",//获得时间
			Winners : ""//获得人员
		// 每页显示记录数
		},
				function(data) {
					//alert(JSON.stringify(data));
					if (data != null) {
						$("#datatb").html("");
						rowcount = data.rows;
						var list = data.list;
						var ht = "";
						for (var i = 0; i < list.length; i++) {
							ht = ht
									+ "<tr id='tr"
									+ i
									+ "'onclick='SelectNews(this.id,"
									+ list[i].AwardID
									+ ")'>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].AwardTitle == null ? ""
											: data.list[i].AwardTitle)

									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].GrantUnit == null ? ""
											: data.list[i].GrantUnit)
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].GetTime == null ? ""
											: (ymdDate(data.list[i].GetTime,
													'yyyy-MM-dd')))
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].Winners == null ? ""
											: data.list[i].Winners) + "</td>"
									+ "<tr>";
						}
						$("#datatb").append(ht);
						pages(data.rows, pagerow, pageno);
						parent.miFrameHeight();
					}
				});
	}
	function GetChangePageData(pageno) {
		$.post("LoadAwardList.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerow,
			AwardTitle : "",//奖励名称
			GrantUnit : "",//授予单位
			GetTime : "",//活得时间
			Winners : ""//获得人员
		},
				function(data) {
					if (data != null) {
						$("#datatb").html('');
						rowcount = data.rows;
						var list = data.list;
						var ht = "";
						for (var i = 0; i < list.length; i++) {
							ht = ht
									+ "<tr id='tr"
									+ i
									+ "'onclick='SelectNews(this.id,"
									+ list[i].AwardID
									+ ")'>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].AwardTitle == null ? ""
											: data.list[i].AwardTitle)

									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].GrantUnit == null ? ""
											: data.list[i].GrantUnit)
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].GetTime == null ? ""
											: (ymdDate(data.list[i].GetTime,
													'yyyy-MM-dd')))
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].Winners == null ? ""
											: data.list[i].Winners) + "</td>"
									+ "<tr>";
						}
						$("#datatb").append(ht);
						pages(data.rows, pagerow, pageno);
						parent.miFrameHeight();
					}
				});
	}

	function SelectNews(trid, objid) {
		$("#datatb tr").each(function() {
			if ($(this).attr("id") == trid) {
				$("#" + trid).css("background-color", "#e7e8ec");
				$("#" + trid).css("color", "#4289f1");
			} else {
				$(this).css("background-color", "");
				$(this).css("color", "");
			}
		});
		$("#hiddenID").val(objid);
	}

	function ClearNews() {
		$("#datatb tr").each(function() {
			$(this).css("background-color", "");
			$(this).css("color", "");
		});
	}

	function ClearUI() {
		$("#hiddenID").val("");
		$("#AwardTitle").val("");
		$("#GrantUnit").val("");
		$("#GetTime").val("");
		$("#Winners").val("");

	}

	function CheckUI() {
		if (parent.$("#AwardTitle").val().trim() == "") {
			alert("请填写奖励名称。");
			parent.$("#AwardTitle").focus();
			return false;
		}
		if (parent.$("#GrantUnit").val().trim() == "") {
			alert("请填写授予单位。");
			parent.$("#GrantUnit").focus();
			return false;
		}
		if (parent.$("#GetTime").val().trim() == "") {
			alert("请填写获得时间。");
			parent.$("#GetTime").focus();
			return false;
		}
		if (parent.$("#Winners").val().trim() == "") {
			alert("请填写获奖人员。");
			parent.$("#Winners").focus();
			return false;
		}

		return true;
	}
	function Save() {
		if (!CheckUI())
			return;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddAward.do",
				success : function(data) {
					//alert(JSON.stringify(data));
					var flg = false;
					switch (data.fail_code) {
					case "M01U004E001":
						alert("用户登录失效，请重新登录。");
						parent.window.open("login.do", "_self");
						break;
					case -1:
						flg = true;
						break;
					}
					if (data.exec_code == 1 && flg) {
						alert("保存成功。");
						parent.$("#btnmodalclose").click();
						ClearUI();
						LoadData();
					}
				}
			};
			parent.$("#editform").ajaxSubmit(ajax_option);
		} else {
			//修改
			var ajax_option = {
				url : "EditAward.do",
				success : function(data) {
					//alert(JSON.stringify(data));
					var flg = false;
					switch (data.fail_code) {
					case "M01U004E001":
						alert("用户登录失效，请重新登录。");
						parent.window.open("login.do", "_self");
						break;
					case -1:
						flg = true;
						break;
					}
					if (data.exec_code == 1 && flg) {
						alert("保存成功。");
						parent.$("#btnmodalclose").click();
						ClearUI();
						LoadData();
					}
				}
			};
			parent.$("#editform").ajaxSubmit(ajax_option);

			$("#btnEdit").attr("data-target", "");
		}
	}
	function Close() {
		parent.$("#btnmodalclose").click();
		ClearUI();
		ClearNews();
		$("#hiddenID").val("");
	}

	function Del() {
		if ($("#hiddenID").val() == "") {
			alert("请选择操作对象。");
			return false;
		}
		if (window.confirm("删除是不可恢复的，你确认要删除吗？")) {
			$.post("DelAward.do", {
				AwardID : $("#hiddenID").val(),
				userid : UserID
			}, function(data) {
				//alert(JSON.stringify(data));
				var flg = false;
					switch (data.fail_code) {
					case "M01U004E001":
						alert("用户登录失效，请重新登录。");
						parent.window.open("login.do", "_self");
						break;
					case -1:
						flg = true;
						break;
					}
				if (data.exec_code == 1 && flg) {
						alert("删除成功。");
						$("#hiddenID").val("");
						LoadData();
					}
			});
		} else {
			$("#hiddenID").val("");
			ClearNews();
		}
	}

	function openDetail(objid) {
		if (objid == null) {//Add
			document.getElementById("spTitle").innerText = "新增科研奖励";
		} else {//Edit
			document.getElementById("spTitle").innerText = "修改科研奖励";
			$.ajax({
				async : false,
				url : "GetAwardByID.do",
				data : {
					AwardID : $("#hiddenID").val()
				},
				type : "post",
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data != null) {
						$("#hiddenID").val(data.AwardID);
						$("#AwardTitle").val(data.AwardTitle);
						$("#GrantUnit").val(data.GrantUnit);
						$("#GetTime").val(data.GetTime);
						$("#Winners").val(data.Winners);

					}
				}
			});
		}
		//编辑内容

	}
</script>
</head>

<body>
	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">科研奖励</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-gift"></i> 科研奖励
					</h2>
				</div>
				<div class="box-content row">
					<div class="col-lg-7 col-md-12">

						<div class="alert alert-info">
							<a id="btnAdd" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal" data-backdrop='static'> <i
								class="glyphicon glyphicon-plus icon-white"></i> 增加
							</a> <a id="btnEdit" class="btn btn-info" data-toggle="modal"
								data-backdrop='static'> <i
								class="glyphicon glyphicon-edit icon-white"></i> 修改
							</a> <a id="btnDel" class="btn btn-danger"
								href="javascript:void Del();" data-backdrop='static'> <i
								class="glyphicon glyphicon-remove icon-white"></i> 删除
							</a>
						</div>
						<table class="table table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th style="width: 300px;text-align:center;">奖励名称</th>
									<th style="width: 230px;text-align:center;">授予单位</th>
									<th style="width: 150px;text-align:center;">获得时间</th>
									<th style="width: 200px;text-align:center;">获奖人员</th>
								</tr>
							</thead>
							<tbody id="datatb">

							</tbody>
						</table>
						<div id="pages"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content ends -->
	<div id="modalarea">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button id="btnmodalclose" type="button" class="close"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<span id="spTitle">科研奖励</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="AwardID" value="" /> <input
								type="hidden" id="UserID" name="UserID" />

							<table class="table">
								<tr>
									<td style="width:130px;">奖励名称：</td>
									<td><input id="AwardTitle" type="text"
										class="form-control" name="AwardTitle" maxlength="200" /></td>
								</tr>
								<tr>
									<td style="width:130px;">授予单位：</td>
									<td><input id="GrantUnit" type="text" class="form-control"
										name="GrantUnit" maxlength="200" /></td>
								</tr>
								<tr>
									<td style="width:130px;">获得时间：</td>
									<td><input id="GetTime" type="text" class="form-control"
										name="GetTime" onclick="WdatePicker()"></input></td>

								</tr>
								<tr>
									<td style="width:130px;">获奖人员：</td>
									<td><input id="Winners" type="text" class="form-control"
										name="Winners" maxlength="200" /></td>
								</tr>

							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button id="btnClose" type="button" class="btn btn-default">关&nbsp;&nbsp;闭</button>
						<button id="btnSave" type="button" class="btn btn-primary">保&nbsp;存</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
