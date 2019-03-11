<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<title>青岛智能产业技术研究院——研究院动态</title>
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
	//新闻类型
	var UserID = "";
	$(document).ready(function() {
		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");

		$("#PicUrl").fileinput({
			'showPreview' : false,
			'showUpload' : false,
			'allowedFileExtensions' : [ 'jpg', 'jpeg',  'png','gif' ],
			'elErrorContainer' : '#errorimg'
		});

		$("#PicUrl").on('fileselect', function(event, numFiles, label) {
			parent.$("#editpic").hide();
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
			$("#btnEdit").attr("data-target", "#myModal");//添加时需要去掉该值，否则也能打开
			openDetail($("#hiddenID").val()); //打开编辑操作
		});

		$("#btnmodalclose").click(function() {
			Close();
		});

	});

	function LoadData() {
		$
				.post(
						"LoadHomePicsList.do",
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
											+ list[i].HomePicsID
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateDate == null ? ""
													: (ymdDate(
															list[i].CreateDate,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].EndShowTime == null ? ""
													: (ymdDate(
															list[i].EndShowTime,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].DisplayType == null ? ""
													: LunBoDaTu_ChangetoText(list[i].DisplayType))
											+ "</td>"

											+ "<td style='text-align:center;'>"
											+ (list[i].Title == null ? ""
													: list[i].Title)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Memo == null ? ""
													: SubStrFun(list[i].Memo,
															30))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ "<img style='width:200px;height:100px;' src= \'"
										    +  list[i].PicUrl
										    + " \' />"
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateBy == null ? ""
													: list[i].CreateBy)
											+ "</td>" + "</tr>";
								}
								$("#datatb").append(ht);
								pages(data.rows, pagerow, pageno);
								parent.miFrameHeight();
								parent.NavJump("LunBoDaTu");
							}
						});
	}
	function GetChangePageData(pageno) {
		$
				.post(
						"LoadHomePicsList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow
						// 每页显示记录数
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
											+ list[i].HomePicsID
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateDate == null ? ""
													: (ymdDate(
															list[i].CreateDate,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].EndShowTime == null ? ""
													: (ymdDate(
															list[i].EndShowTime,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].DisplayType == null ? ""
													: LunBoDaTu_ChangetoText(list[i].DisplayType))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Title == null ? ""
													: list[i].Title)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].Memo == null ? ""
													: SubStrFun(list[i].Memo,
															30))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ "<img style='width:200px;height:100px;' src= \'"
										    +  list[i].PicUrl
										    + " \' />"
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (list[i].CreateBy == null ? ""
													: list[i].CreateBy)
											+ "</td>" + "</tr>";
								}
								$("#datatb").append(ht);
								pages(data.rows, pagerow, pageno);
								parent.miFrameHeight();
								parent.NavJump("LunBoDaTu");
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
		$("#CreateDate").val("");
		$("#EndShowTime").val("");
		$("#DisplayType").val("");
		$("#Title").val("");
		$("#Memo").val("");
		$("#CreateBy").val("");
		$("#editpic").val("");
		$("#PicUrl").fileinput('clear');
	}

	function CheckUI() {
		if (parent.$("#CreateDate").val().trim() == "") {
			alert("请填写创建日期。");
			parent.$("#CreateDate").focus();
			return false;
		}
		if (parent.$("#EndShowTime").val().trim() == "") {
			alert("请填写截止日期。");
			parent.$("#EndShowTime").focus();
			return false;
		}
		if (parent.$("#DisplayType").val().trim() == "") {
			alert("请选择分类。");
			parent.$("#DisplayType").focus();
			return false;
		}
		if (parent.$("#Title").val().trim() == "") {
			alert("请填写标题。");
			parent.$("#Title").focus();
			return false;
		}

		if (parent.$("#Memo").val().trim() == "") {
			alert("请填写描述。");
			parent.$("#Memo").focus();
			return false;
		}
		if (parent.$("#editpic").val().trim() == ""
				&& parent.$("#PicUrl").val().trim() == "") {
			alert("请上传图片。");
			parent.$("#PicUrl").focus();
			return false;
		}

		if (parent.$("#CreateBy").val().trim() == "") {
			alert("请填写创建人。");
			parent.$("CreateBy").focus();
			return false;
		}
		if (parent.$("#EndShowTime").val() <= parent.$("#CreateDate").val()) {
			alert("截止日期必须大于创建日期！");
			parent.$("#EndShowTime").focus();
			return false;
		}
		return true;
	}

	function Save() {
		if (!CheckUI())
			return false;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddHomePics.do",
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
				url : "EditHomePics.do",
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
			$.post("DelHomePics.do", {
				HomePicsID : $("#hiddenID").val(),
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
		$.ajax({
			async : false,
			url : "GetHomePicsByID.do",
			data : {
				HomePicsID : $("#hiddenID").val()
			},
			type : "post",
			success : function(data) {
				//alert(JSON.stringify(data));
				if (data != null) {
					$("#hiddenID").val(data.HomePicsID);
					$("#CreateDate").val(data.CreateDate);
					$("#EndShowTime").val(data.EndShowTime);
					$("#DisplayType").val(data.DisplayType);
					$("#Title").val(data.Title);
					$("#Memo").val(data.Memo);
					$("#CreateBy").val(data.CreateBy);

					$("#editpic").val(data.PicUrl);
					$("#editpic").show();
					//$("#PicUrl").val(data.PicUrl);

				}
			}
		});
	}

	function LunBoDaTu_ChangeHandler() {

		if ($("#DisplayType").find("option:selected").text() == "-请选择-") {
			DisplayType = "";
		} else {
			DisplayType = $("#DisplayType").find("option:selected").val();
		}

	}

	function LunBoDaTu_ChangetoText(tid) {
		switch (tid) {
		case "1":
			return $("#DisplayType option[value='1']").text();
			break;
		case "2":
			return $("#DisplayType option[value='2']").text();
			break;
		case "3":
			return $("#DisplayType option[value='3']").text();
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
			<li><a href="javascript:void(0);">轮播大图</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-forward"></i> 轮播大图
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
						<table class="table table-bordered table-hover table-condensed" style="word-wrap:break-word; word-break:break-all;">
							<thead>
								<tr>
									<th style="width:90px;text-align:center;">创建日期</th>
									<th style="width:90px;text-align:center;">截至日期</th>
									<th style="width:90px;text-align:center;">分类</th>
									<th style="width:170px;text-align:center;">标题</th>
									<th style="width:200px;text-align:center;">描述</th>
									<th style="width:90px;text-align:center;">首页图</th>
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
							<span id="spTitle">轮播大图</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="HomePicsID" /> <input
								type="hidden" id="UserID" name="UserID" />
							<table class="table">
								<tr>
									<td style="width:130px;">创建日期：</td>
									<td><input id="CreateDate" type="text"
										class="form-control" name="CreateDate" onclick="WdatePicker()" /></td>
								</tr>
								<tr>
									<td style="width:130px;">截止日期：</td>
									<td><input id="EndShowTime" type="text"
										class="form-control" name="EndShowTime"
										onclick="WdatePicker()" /></td>
								</tr>
								<tr>
									<td style="width:130px;">分类：</td>
									<td style="width:210px;height:40px;"><select
										class="form-control" id="DisplayType" name="DisplayType"
										onchange="LunBoDaTu_ChangeHandler();" style="width:415px;">
											<option value="">-请选择-</option>
											<option value="1">领导视察</option>
											<option value="2">重点项目</option>
											<option value="3">产品方案</option>
									</select></td>
								</tr>
								<tr>
									<td style="width:130px;">标题：</td>
									<td><input id="Title" type="text" class="form-control"
										name="Title" maxlength="100" /></td>
								</tr>
								<tr>
									<td style="width:130px;">描述：</td>
									<td><input id="Memo" type="text" class="form-control"
										name="Memo" maxlength="1000" /></td>
								</tr>

								<tr>
									<td>图片：</td>
									<td><input id="editpic"
										style="display: none;border: none; width: 100%;"
										readonly="readonly" /> <input id="PicUrl" type="file"
										name="PicUrl" />
										<div id="errorimg" class="help-block"></div></td>
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
