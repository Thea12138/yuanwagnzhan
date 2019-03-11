<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>青岛智能产业技术研究院——研究院动态</title>

<link href="Resources/css/bootstrap-cerulean.min.css" rel="stylesheet" />
<link href="Resources/css/charisma-app.css" rel="stylesheet" />
<link href="Resources/css/fileinput.css" rel="stylesheet" />
<link href="Resources/css/mstyle.css" rel="stylesheet" />

<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/fileinput.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap.js"></script>
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
	$(document).ready(
			function() {
				$("#UserID").val(sessionStorage.getItem("AccountID"));
				UserID = sessionStorage.getItem("AccountID");

				$("#FileUrl").fileinput(
						{
							'showPreview' : false,
							'showUpload' : false,
							'allowedFileExtensions' : [ 'doc', 'docx', 'xls',
									'xlsx', 'ppt', 'pptx', 'pdf' ],
							'elErrorContainer' : '#errorlink'
						});

				$("#FileUrl").on('fileselect',
						function(event, numFiles, label) {
							parent.$("#editurl").hide();
						});
			});

	$(function() {
		LoadData();
		$("#btnClose").click(function() {
			Close();
		});
		$("#btnSave").click(function() {
			Save();
		});

		$("#btnAdd").click(function(e) {
			e.preventDefault();
			ClearUI();
		});
		$("#btnEdit").click(function() {
			if ($("#hiddenID").val().trim() == "") {
				alert("请选择操作对象。");
				return false;
			}

			if ($("#Status").val().trim() != "1") {
				alert("模版已使用，不能修改.");
				ClearNews();
				$("#hiddenID").val("");
				return false;
			}
			$("#btnEdit").attr("data-target", "#myModal");//添加时需要去掉该值，否则也能打开
			openDetail($("#hiddenID").val()); //打开编辑操作
		});

		$("#btnUse").click(function() {
			if ($("#hiddenID").val() == "") {
				alert("请选择操作对象。");
				return false;
			}
			if ($("#Status").val().trim() != "1") {
				alert("只能启用“未启用”状态的模板。");
				ClearNews();
				$("#hiddenID").val("");
				return false;
			}
			EnabledTemplate($("#hiddenID").val());//修改模板状态为“启用”

		});
		$("#btnInvalid").click(function() {
			if ($("#hiddenID").val() == "") {
				alert("请选择操作对象。");
				return false;
			}
			if ($("#Status").val().trim() != "2") {
				alert("只能作废“启用”状态的模板。");
				ClearNews();
				$("#hiddenID").val("");
				return false;
			}
			InvalidTemplate($("#hiddenID").val());//修改模板状态为“作废”

		});

		$("#btnmodalclose").click(function() {
			Close();
		});

	});

	function LoadData() {
		$
				.post(
						"LoadTemplateList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow
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
											+ "<tr  id='tr"
											+ i
											+ "' onclick='SelectNews(this.id,"
											+ list[i].TemplateID
											+ ","
											+ list[i].Status
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateDate == null ? ""
													: (ymdDate(
															list[i].CreateDate,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].TemplateTitle == null ? ""
													: list[i].TemplateTitle)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Memo == null ? ""
													: list[i].Memo)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Status == null ? ""
													: TemplateDownload_ChangetoText(list[i].Status))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateBy == null ? ""
													: list[i].CreateBy)
											+ "</td>" + "</tr>";
								}
								$("#datatb").append(ht);
								pages(data.rows, pagerow, pageno);
								parent.miFrameHeight();
							}
						});
	}
	function GetChangePageData(pageno) {
		$
				.post(
						"LoadTemplateList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow,
						},
						function(data) {
							if (data != null) {
								$("#datatb").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr  id='tr"
											+ i
											+ "' onclick='SelectNews(this.id,"
											+ list[i].TemplateID
											+ ","
											+ list[i].Status
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateDate == null ? ""
													: (ymdDate(
															list[i].CreateDate,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].TemplateTitle == null ? ""
													: list[i].TemplateTitle)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Memo == null ? ""
													: list[i].Memo)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Status == null ? ""
													: TemplateDownload_ChangetoText(list[i].Status))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateBy == null ? ""
													: list[i].CreateBy)
											+ "</td>" + "</tr>";
								}
								$("#datatb").append(ht);
								pages(data.rows, pagerow, pageno);
								parent.miFrameHeight();
							}
						});
	}

	function SelectNews(trid, objid, staid) {
		$("#datatb tr").each(function() {
			if ($(this).attr("id") == trid) {
				$("#" + trid).css("background-color", "#e7e8ec");
				$("#" + trid).css("color", "#4289f1");
			} else {
				$(this).css("background-color", "");
				$(this).css("color", "");
			}
		});
		$("#Status").val(staid);
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
		$("#CreateDate").val("");
		$("#TemplateTitle").val("");
		$("#Memo").val("");
		$("#CreateBy").val("");
		$("#editurl").val("");
		$("#FileUrl").fileinput('clear');
	}

	function CheckUI() {

		if (parent.$("#CreateDate").val().trim() == "") {
			alert("请填写创建日期。");
			parent.$("#CreateDate").focus();
			return false;
		}

		if (parent.$("#TemplateTitle").val().trim() == "") {
			alert("请填写名称。");
			parent.$("#TemplateTitle").focus();
			return false;
		}

		if (parent.$("#Memo").val().trim() == "") {
			alert("请填写描述。");
			parent.$("#Memo").focus();
			return false;
		}

		if (parent.$("#editurl").val().trim() == ""
				&& parent.$("#FileUrl").val().trim() == "") {
			alert("请上传模板文件。");
			parent.$("#FileUrl").focus();
			return false;
		}

		if (parent.$("#CreateBy").val().trim() == "") {
			alert("请填写创建人。");
			parent.$("CreateBy").focus();
			return false;
		}
		return true;
	}

	function Save() {
		if (!CheckUI())
			return;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddTemplate.do",
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
				url : "EditTemplate.do",
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
		if ($("#Status").val().trim() != "1") {
			alert("只能删除“未启用”状态的模板。");
			ClearNews();
			$("#hiddenID").val("");
			return false;
		}
		if (window.confirm("删除是不可恢复的，你确认要删除吗？")) {
			$.post("DelTemplate.do", {
				TemplateID : $("#hiddenID").val(),
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

	function EnabledTemplate(enableid) {
		if ($("#hiddenID").val() == "") {
			alert("请选择操作对象。");
			return false;
		}
		$.ajax({
			async : false,
			url : "EnabledTemplate.do",
			data : {
				TemplateID : $("#hiddenID").val(),
				userid : UserID
			},
			type : "post",
			success : function(data) {
				//alert(JSON.stringify(data));
				var flg = false;
				switch (data.fail_code) {
				case "M01U004E001":
					alert("用户登录失效，请重新登录。");
					parent.window.open("login.do", "_self");
					break;
				case "M01T001E003":
					alert("模板名称不能重复。");
					break;
				case -1:
					flg = true;
					break;
				}
				if (data.exec_code == 1 && flg) {
					alert("启用成功。");
					$("#hiddenID").val("");
					LoadData();
				}

				else {
					$("#hiddenID").val("");
					ClearNews();
				}
			}
		});
	}

	function InvalidTemplate(Invalidid) {
		if (window.confirm("作废是不可恢复的，你确认要作废吗？")) {
			$.post("InvalidTemplate.do", {
				TemplateID : $("#hiddenID").val(),
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
					alert("作废成功。");
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
		$.ajax({
			async : false,
			url : "GetTemplateByID.do",
			data : {
				TemplateID : $("#hiddenID").val()
			},
			type : "post",
			success : function(data) {
				if (data != null) {
					$("#hiddenID").val(data.TemplateID);
					$("#CreateDate").val(data.CreateDate);
					$("#TemplateTitle").val(data.TemplateTitle);
					$("#Memo").val(data.Memo);
					$("#CreateBy").val(data.CreateBy);

					$("#editurl").val(data.FileUrl);
					$("#editurl").show();
				}
			}
		});
	}

	function TemplateDownload_ChangetoText(tid) {
		switch (tid) {
		case "1":
			return "未启用";
			break;
		case "2":
			return "启用";
			break;
		case "3":
			return "作废";
			break;
		}
	}
</script>
</head>

<body>

	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">模板下载</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-forward"></i> 模板下载
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
							</a> <a id="btnUse" class="btn btn-success" data-toggle="modal"
								data-backdrop='static'> <i
								class="glyphicon glyphicon-edit icon-white"></i> 启用
							</a> <a id="btnInvalid" class="btn btn-warning" data-toggle="modal"
								data-backdrop='static'> <i
								class="glyphicon glyphicon-edit icon-white"></i> 作废
							</a> <a id="btnDel" class="btn btn-danger"
								href="javascript:void Del();" data-backdrop='static'> <i
								class="glyphicon glyphicon-remove icon-white"></i> 删除
							</a>
						</div>
						<table class="table table-bordered table-hover table-condensed" style="word-wrap:break-word; word-break:break-all;">
							<thead>
								<tr>
									<th style="width:110px;text-align:center;">创建日期</th>
									<th style="width:150px;text-align:center;">名称</th>
									<th style="width:200px;text-align:center;">描述</th>
									<th style="width:90px;text-align:center;">状态</th>
									<th style="width:90px;text-align:center;">创建人</th>
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
							<span id="spTitle">模板下载</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="Status" name="Status" /> <input
								type="hidden" id="hiddenID" name="TemplateID" /> <input
								type="hidden" id="UserID" name="UserID" />
							<table class="table">
								<tr>
									<td style="width:130px;">创建日期：</td>
									<td><input id="CreateDate" type="text"
										class="form-control" name="CreateDate" onclick="WdatePicker()" /></td>
								</tr>
								<tr>
									<td style="width:130px;">名称：</td>
									<td><input id="TemplateTitle" type="text"
										class="form-control" name="TemplateTitle" maxlength="200" /></td>
								</tr>

								<tr>
									<td style="width:130px;">描述：</td>
									<td><input id="Memo" type="text" class="form-control"
										name="Memo" maxlength="2000" /></td>
								</tr>
								<tr>
									<td>模板文件：</td>
									<td><input id="editurl"
										style="display: none;border: none; width: 100%;"
										readonly="readonly" /> <input id="FileUrl" type="file"
										name="FileUrl" />
										<div id="errorlink" class="help-block"></div></td>
								</tr>
								<tr>
									<td style="width:130px;">创建人：</td>
									<td><input id="CreateBy" type="text" class="form-control"
										name="CreateBy" maxlength="20" /></td>
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
