<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>青岛智能产业技术研究院——招贤纳士</title>
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

	$(document).ready(function() {
		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");
	});

	$(function() {
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
		$("#btnAdd").click(function() {
			ClearUI();
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
		$
				.post(
						"GetCareers.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow
						},
						function(data) {
							if (data != null) {
								//alert(JSON.stringify(data));
								$("#datatb").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									var isrecommend = data.list[i].Recommend == true ? "推荐"
											: "";
									ht = ht
											+ "<tr id='tr"
											+ i
											+ "'onclick='SelectNews(this.id,"
											+ list[i].RecruitmentID
											+ ")'><td>"
											+ data.list[i].JobTitle
											+ "</td><td>"
											+ (data.list[i].PublicDate == null ? ""
													: data.list[i].PublicDate)//代表发布时间字段
											+ "</td><td>"
											+ data.list[i].Vacancies
											+ "</td><td title='"+data.list[i].Description+"'>"
											+ SubStrFun(
													data.list[i].Description,
													20)
											+ "</td><td title='"+data.list[i].Qualifications+"'>"
											+ SubStrFun(
													data.list[i].Qualifications,
													20) + "</td><td>"
											+ isrecommend + "</td></tr>";
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
						"GetCareers.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#datatb").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									var isrecommend = data.list[i].Recommend == true ? "推荐"
											: "";
									ht = ht
											+ "<tr id='tr"
											+ i
											+ "'onclick='SelectNews(this.id,"
											+ list[i].RecruitmentID
											+ ")'><td>"
											+ data.list[i].JobTitle
											+ "</td><td>"
											+ (data.list[i].PublicDate == null ? ""
													: data.list[i].PublicDate)//代表发布时间字段
											+ "</td><td>"
											+ data.list[i].Vacancies
											+ "</td><td title='"+data.list[i].Description+"'>"
											+ SubStrFun(
													data.list[i].Description,
													20)
											+ "</td><td title='"+data.list[i].Qualifications+"'>"
											+ SubStrFun(
													data.list[i].Qualifications,
													20) + "</td><td>"
											+ isrecommend + "</td></tr>";
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
		parent.$("#hiddenID").val("");
		parent.$("#txtJobTitle").val("");
		parent.$("#txtVacancies").val("");
		parent.$("#txtDate").val("");
		parent.$("#txtDescription").val("");
		parent.$("#txtQualifications").val("");
		parent.$("#Recommend").attr("checked", false);
	}

	function CheckUI() {
		if (parent.$("#txtJobTitle").val().trim() == "") {
			alert("请填写招聘职位名称。");
			parent.$("#txtJobTitle").focus();
			return;
		}

		if (parent.$("#txtVacancies").val().trim() == "") {
			alert("请填写招聘人数。");
			parent.$("#txtVacancies").focus();
			return;
		}

		if (parent.$("#txtDate").val().trim() == "") {
			alert("请填写发布日期。");
			parent.$("#txtDate").focus();
			return;
		}
		if (parent.$("#txtDescription").val().trim() == "") {
			alert("请填写职务描述。");
			parent.$("#txtDescription").focus();
			return;
		}

		if (parent.$("#txtQualifications").val().trim() == "") {
			alert("请填写任职要求。");
			parent.$("#txtQualifications").focus();
			return;
		}
		return true;
	}
	function Save() {
		if (!CheckUI())
			return;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddCareers.do",
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
				url : "EditCareers.do",
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
			$.ajax({
				async : false,
				url : "DelCareers.do",
				type : "post",
				data : {
					RecruitmentID : $("#hiddenID").val(),
					userid : UserID
				},
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data != null) {
						if (data.exec_code == "1") {
							alert("删除成功。");
							$("#hiddenID").val("");
							LoadData();
						}
					}
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
			url : "GetCareersByID.do",
			data : {
				RecruitmentID : $("#hiddenID").val()
			},
			type : "post",
			success : function(data) {
				//alert(JSON.stringify(data));
				if (data != null) {
					$("#hiddenID").val(data.RecruitmentID);
					$("#txtJobTitle").val(data.JobTitle);
					$("#txtVacancies").val(data.Vacancies);
					$("#txtDate").val(data.PublicDate);
					$("#txtDescription").val(data.Description);
					$("#txtQualifications").val(data.Qualifications);

					if (data.Recommend == 1) {
						$("input[name=Recommend]").prop("checked", true);
					} else if (data.Recommend == 0) {
						$("input[name=Recommend]").prop("checked", false);
					}
				}
			}
		});
	}
</script>
</head>

<body>

	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">招贤纳士</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-flag"></i> 招贤纳士
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
									<th>招聘职位</th>
									<th style="width:100px;">发布时间</th>
									<th style="width:100px;">人数</th>
									<th style="width:200px;">职位描述</th>
									<th style="width:200px;">任职要求</th>
									<th style="width:60px;">推荐</th>
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
							<span id="spTitle">招贤纳士</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="RecruitmentID" /> <input
								type="hidden" id="UserID" name="UserID" />
							<table class="table">
								<tr>
									<td style="width:90px;">招聘职位：</td>
									<td><input id="txtJobTitle" type="text"
										class="form-control" name="JobTitle" maxlength="100" /></td>
								</tr>
								<tr>
									<td>招聘人数：</td>
									<td><input id="txtVacancies" type="text"
										class="form-control" name="Vacancies"
										onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="3" /></td>
								</tr>
								<tr>
									<td>发布日期：</td>
									<td><input id="txtDate" type="text" class="form-control"
										name="PublicDate" onclick="WdatePicker()" /></td>
								</tr>
								<tr>
									<td>职位描述：</td>
									<td><textarea name="Description" id="txtDescription"
											rows="1" style="resize: none;" class="form-control"
											maxlength="3000"></textarea></td>
								</tr>
								<tr>
									<td>任职要求：</td>
									<td><textarea name="Qualifications" id="txtQualifications"
											rows="1" style="resize: none;" class="form-control"
											maxlength="3000"></textarea></td>
								</tr>
								<tr>
									<td>是否推荐：</td>
									<td><input type="checkbox" id="Recommend" name="Recommend" /></td>
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
