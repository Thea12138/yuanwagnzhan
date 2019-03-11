<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>青岛智能产业技术研究院——学术著作</title>
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
	//登陆用户的ID
	var UserID = "";

	$(function() {
		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");
		LoadData();
		$("#btnClose").click(function() {
			Close();
		});
		$("#btnSave").click(function() {
			Save();
		});

		$("#btnEdit").click(function() {
			if ($("#hiddenID").val().trim() == "") {
				alert("请选择操作对象。");
				return;
			}
			$("#btnEdit").attr("data-target", "#myModal");//添加时需要去掉该值，否则也能打开
			openDetail($("#hiddenID").val()); //打开编辑操作
		});
	});

	/******根据函数名字将参数改一下******/
	function LoadData() {
		$
				.post(
						"LoadAcademicWorksList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow,// 每页显示记录数
							AcademicWorksTitle : "",//名称
							AcademicWorksType : "",//类型
							Author : "",//作者
							PublishDate : "",//发表（出版）时间
							PublishPlace : "" //刊物/出版社/会议名称
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
											+ list[i].AcademicWorksID
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].AcademicWorksTitle == null ? ""
													: data.list[i].AcademicWorksTitle)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].AcademicWorksType == null ? ""
													: AcademicWorks_ChangetoText(data.list[i].AcademicWorksType))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].Author == null ? ""
													: data.list[i].Author)
											+ "</td>"

											+ "<td style='text-align:center;'>"
											+ (data.list[i].PublishDate == null ? ""
													: (ymdDate(
															data.list[i].PublishDate,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].PublishPlace == null ? ""
													: data.list[i].PublishPlace)
											+ "</td>" + "<tr>";
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
						"LoadAcademicWorksList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow,// 每页显示记录数
							AcademicWorksTitle : "",//名称
							AcademicWorksType : "",//类型
							Author : "",//作者
							PublishDate : "",//发表（出版）时间
							PublishPlace : ""//刊物/出版社/会议名称
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
											+ list[i].AcademicWorksID
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].AcademicWorksTitle == null ? ""
													: data.list[i].AcademicWorksTitle)
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].AcademicWorksType == null ? ""
													: AcademicWorks_ChangetoText(data.list[i].AcademicWorksType))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].Author == null ? ""
													: data.list[i].Author)
											+ "</td>"

											+ "<td style='text-align:center;'>"
											+ (data.list[i].PublishDate == null ? ""
													: (ymdDate(
															data.list[i].PublishDate,
															'yyyy-MM-dd')))
											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].PublishPlace == null ? ""
													: data.list[i].PublishPlace)
											+ "</td>" + "<tr>";
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

	function ClearUI() {
		$("#hiddenID").val("");
		$("#AcademicWorksTitle").val("");
		$("#AcademicWorksType").val("0");
		$("#Author").val("");
		$("#PublishDate").val("");
		$("#PublishPlace ").val("");
	}

	function CheckUI() {

		if (parent.$("#AcademicWorksTitle").val().trim() == "") {
			alert("请填写名称。");
			parent.$("#AcademicWorksTitle").focus();
			return false;
		}

		if (parent.$("#AcademicWorksType").val().trim() == "0") {
			alert("请选择类型。");
			parent.$("#AcademicWorksType").focus();
			return false;
		}
		if (parent.$("#Author").val().trim() == "") {
			alert("请填写作者。");
			parent.$("#Author").focus();
			return false;
		}
		if (parent.$("#PublishDate").val().trim() == "") {
			alert("请填写发表（出版）时间。");
			parent.$("#PublishDate").focus();
			return false;
		}
		if (parent.$("#PublishPlace").val().trim() == "") {
			alert("请填写刊物/出版社/会议名称。");
			parent.$("#PublishPlace").focus();
			return false;
		}
		return true;
	}

	function Save() {
		if (!CheckUI())
			return;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddAcademicWorks.do",
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
				url : "EditAcademicWorks.do",
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
	}

	function Del() {
		if ($("#hiddenID").val() == "") {
			alert("请选择操作对象。");
			return false;
		}
		if (window.confirm("删除是不可恢复的，你确认要删除吗？")) {
			$.post("DelAcademicWorks.do", {
				AcademicWorksID : $("#hiddenID").val(),
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
			document.getElementById("spTitle").innerText = "新增学术著作";
		} else {//Edit
			document.getElementById("spTitle").innerText = "修改学术著作";
			$.ajax({
				async : false,
				url : "GetAcademicWorksByID.do",
				data : {
					AcademicWorksID : $("#hiddenID").val()
				},
				type : "post",
				success : function(data) {
					if (data != null) {
						$("#hiddenID").val(data.AcademicWorksID);
						$("#AcademicWorksTitle").val(data.AcademicWorksTitle);
						$("#AcademicWorksType").val(data.AcademicWorksType);
						$("#Author").val(data.Author);
						$("#PublishDate").val(data.PublishDate);
						$("#PublishPlace").val(data.PublishPlace);
					}
				}
			});
		}
		//新页面中加载
	}

	function AcademicWorks_ChangeHandler() {
		if ($("#AcademicWorksType").find("option:selected").text() == '-请选择-') {
			AcademicWorksType = "";
		} else {
			AcademicWorksType = $("#AcademicWorksType").find("option:selected").val();
		}

	}

	function AcademicWorks_ChangetoText(tid) {
		switch (tid) {
		case "1":
			return $("#AcademicWorksType option[value='1']").text();
			break;
		case "2":
			return $("#AcademicWorksType option[value='2']").text();
			break;
		case "3":
			return $("#AcademicWorksType option[value='3']").text();
			break;
		case "4":
			return $("#AcademicWorksType option[value='4']").text();
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
			<li><a href="javascript:void(0);">学术著作</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-book"></i> 学术著作
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
									<th style="width: 110px;text-align:center;">名称</th>
									<th style="width: 100px;text-align:center;">类型</th>
									<th style="width: 100px;text-align:center;">作者</th>
									<th style="width: 130px;text-align:center;">发表（出版）时间</th>
									<th style="width: 130px;text-align:center;">刊物/出版社/会议名称</th>
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
							<span id="spTitle">学术著作</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="AcademicWorksID" /> <input
								type="hidden" id="UserID" name="UserID" />
							<table class="table">
								<tr>
									<td style="width:130px;">名称：</td>
									<td><input id="AcademicWorksTitle" type="text"
										class="form-control" name="AcademicWorksTitle" maxlength="200" /></td>
								</tr>
								<tr>
									<td style="width:130px;">类型：</td>
									<td style="width:210px;height:40px;"><select class="form-control"
										id="AcademicWorksType" name="AcademicWorksType"
										onchange="AcademicWorks_ChangeHandler()" style="width:415px;">
											<option value="0">-请选择-</option>
											<option value="1">会议论文</option>
											<option value="2">期刊论文</option>
											<option value="3">专著</option>
											<option value="4">译著</option>
									</select></td>
								</tr>
								<tr>
									<td style="width:130px;">作者：</td>
									<td><input id="Author" type="text" class="form-control"
										name="Author" maxlength="100" /></td>
								</tr>
								<tr>
									<td style="width:130px;">发表（出版）时间：</td>
									<td><input id="PublishDate" type="text"
										class="form-control" name="PublishDate"
										onclick="WdatePicker()" /></td>
								</tr>
								<tr>
									<td style="width:130px;">刊物/出版社/会议名称：</td>
									<td><input id="PublishPlace" type="text"
										class="form-control" name="PublishPlace" maxlength="200" /></td>
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
