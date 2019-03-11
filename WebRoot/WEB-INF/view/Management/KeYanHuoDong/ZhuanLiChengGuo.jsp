<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>青岛智能产业技术研究院——专利成果</title>
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
	});

	/******根据函数名字将参数改一下******/
	function LoadData() {
		$.post("LoadPatentList.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerow,
			PatentType : "",
			PatentTitle : "",
			PatentRight : "",
			PatentNo : ""
		},
				function(data) {
					if (data != null) {
						//alert(JSON.stringify(data));
						$("#datatb").html("");
						rowcount = data.rows;
						var list = data.list;
						var ht = "";
						for (var i = 0; i < list.length; i++) {
							ht = ht
									+ "<tr id='tr"
									+ i
									+ "'onclick='SelectNews(this.id,"
									+ list[i].PatentID
									+ ")'>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentType == null ? ""
											: PatentType_ChangetoText(data.list[i].PatentType))
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentTitle == null ? ""
											: data.list[i].PatentTitle)
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentRight == null ? ""
											: data.list[i].PatentRight)
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentNo == null ? ""
											: data.list[i].PatentNo) + "</td>"
									+ "</tr>";
						}
						$("#datatb").append(ht);
						pages(data.rows, pagerow, pageno);
						parent.miFrameHeight();
					}
				});
	}
	function GetChangePageData(pageno) {
		$.post("LoadPatentList.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerow,
			PatentTitle : "",
			PatentType : "",
			PatentRight : "",
			PatentNo : ""
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
									+ list[i].PatentID
									+ ")'>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentType == null ? ""
											:PatentType_ChangetoText(data.list[i].PatentType))
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentTitle == null ? ""
											: data.list[i].PatentTitle)
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentRight == null ? ""
											: data.list[i].PatentRight)
									+ "</td>"
									+ "<td style='text-align:center;'>"
									+ (data.list[i].PatentNo == null ? ""
											: data.list[i].PatentNo) + "</td>"
									+ "</tr>";
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
		$("#PatentType").val("0");
		$("#PatentTitle").val("");
		$("#PatentRight").val("");
		$("#PatentNo").val("");
		$("#hiddenID").val("");

	}

	function CheckUI() {
		if (parent.$("#PatentType").val().trim() == "0") {
			alert("请选择专利类型。");
			parent.$("#PatentType").focus();
			return false;
		}
		if (parent.$("#PatentTitle").val().trim() == "") {
			alert("请填写专利名称。");
			parent.$("#PatentTitle").focus();
			return false;
		}
		if (parent.$("#PatentRight").val().trim() == "") {
			alert("请填写专利权人。");
			parent.$("#PatentRight").focus();
			return false;
		}
		if (parent.$("#PatentNo").val().trim() == "") {
			alert("请填写专利号。");
			parent.$("#PatentNo").focus();
			return false;
		}
		return true;
	}
	
	function Save() {
		if (!CheckUI())
			return;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddPatent.do",
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
						;
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
				url : "EditPatent.do",
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
			$.post("DelPatent.do", {
				PatentID : $("#hiddenID").val(),
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
				url : "GetPatentByID.do",
				data : {
					PatentID : $("#hiddenID").val()
				},
				type : "post",
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data != null) {
						$("#PatentType").val(data.PatentType);
						$("#PatentTitle").val(data.PatentTitle);
						$("#PatentRight").val(data.PatentRight);
						$("#PatentNo").val(data.PatentNo);
					}
				}
			});
	}
	
	
	function PatentType_ChangeHandler() {
		if ($("#PatentType").find("option:selected").text() == '-请选择-') {
			PatentType = "";
		} else {
			PatentType = $("#PatentType").find("option:selected").val();
		}

	}

	function PatentType_ChangetoText(tid) {
		switch (tid) {
		case "1":
			return $("#PatentType option[value='1']").text();
			break;
		case "2":
			return $("#PatentType option[value='2']").text();
			break;
		case "3":
			return $("#PatentType option[value='3']").text();
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
			<li><a href="javascript:void(0);">专利成果</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-briefcase"></i> 专利成果
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
									<th style="width:100px;text-align:center;">专利类型</th>
									<th style="width:100px;text-align:center;">专利名称</th>
									<th style="width:100px;text-align:center;">专利权人</th>
									<th style="width:70px;text-align:center;">专利号</th>
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
							<span id="spTitle">专利成果</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="PatentID" />
							<input
								type="hidden" id="UserID" name="UserID" />
							<table class="table">
								<tr>
									<td style="width:90px;">专利类型：</td>
									<td style="width:210px;height:40px;"><select class="form-control"
										id="PatentType" name="PatentType"
										onchange="Patent_ChangeHandler()" 
										style="width:415px;height:40px;maxlength:200;">
											<option value="0" >-请选择-</option>
											<option value="1" selected = "selected">发明</option>
											<option value="2">外观</option>
											<option value="3">实用新型</option>
									</select></td>
								</tr>
								<tr>
									<td style="width:90px;">专利名称：</td>
									<td><input id="PatentTitle" type="text"
										class="form-control" name="PatentTitle" style="width:415px;height:40px;" maxlength="200"/></td>
								</tr>
								<tr>
									<td style="width:90px;">专利权人：</td>
									<td><input id="PatentRight" type="text"
										class="form-control" name="PatentRight" style="width:415px;height:40px;" maxlength = "100" /></td>
								</tr>
								<tr>
									<td style="width:90px;">专利号：</td>
									<td><input id="PatentNo" type="text" class="form-control"
										name="PatentNo" style="width:415px;height:40px;" maxlength = "40"/>
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
