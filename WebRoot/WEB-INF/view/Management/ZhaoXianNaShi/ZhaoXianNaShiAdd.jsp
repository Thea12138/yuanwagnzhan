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
	//新闻类型
	var NewsCategory = "I";
	var UserID = "";
	$(document).ready(function() {
		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");
	});

	$(function() {
		$("#btnClose").click(function() {
			srchange("ZhaoXianNaShi.do");
		});
		$("#btnSave").click(function() {
			Save();
		});

	});

	function ClearNews() {
		$("#datatb tr").each(function() {
			$(this).css("background-color", "");
			$(this).css("color", "");
		});
	}

	function ClearUI() {
		$("#hiddenID").val("");
		$("#PublishDate").val("");
		$("#NewsTitle").val("");
		$("#CreateBy").val("");

		$("#editlink").val("");
		$("#LinkAddress").fileinput('clear');
		$("#editpic").val("");
		$("#picturesList").fileinput('clear');
	}

	function CheckUI() {

		if ($("#recruitName").val().trim() == "") {
			alert("请填写职位名称。");
			$("#recruitName").focus();
			return false;
		}

		if ($("#recruitUnit").val().trim() == "") {
			alert("请填写职位部门。");
			$("#recruitUnit").focus();
			return false;
		}

		if ($("#recruitPerson").val().trim() == "") {
			alert("请填写所需人数。");
			$("#recruitPerson").focus();
			return false;
		}
		
		if($("#recruitPerson").val()>255){
			alert("所需人数数额大于255请与管理员联系。");
		}
		
		if ($("#recruitResponsibility").val().trim() == "") {
			alert("请填写岗位职责。");
			$("#recruitResponsibility").focus();
			return false;
		}
		
		if ($("#recruitRequire").val().trim() == "") {
			alert("请填写任职要求。");
			$("#recruitRequire").focus();
			return false;
		}
		return true;
	}

	function Save() {
		if (!CheckUI())
			return;
		$.ajax({
			async : false,
			url : "insertRecruit.do",
			data : {
				UserID: UserID,
		        recruitName: $("#recruitName").val(),
		        recruitUnit: $("#recruitUnit").val(),
		        recruitPerson: $("#recruitPerson").val(),
		        recruitResponsibility: $("#recruitResponsibility").val(),
		        recruitRequire: $("#recruitRequire").val()
			},
			type : "post",
			success : function(data) {
				srchange("ZhaoXianNaShi.do");
			}
		})
	}

	//页面跳转
	function srchange(obj){
	    $("body", parent.document).find('.ch-container #content #miframe:first').attr('src',obj);
	}

</script>
</head>

<body>

	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">招贤纳士添加</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-forward"></i> 招贤纳士添加
					</h2>
				</div>
				<div>
					<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="NewsID" /> <input
								type="hidden" id="UserID" name="UserID" /> <input type="hidden"
								id="NewsCategory" name="NewsCategory" value="I" />
							<table class="table">
								<tr>
									<td style="width:130px;">职位名称：</td>
									<td><input id="recruitName" type="text"
										class="form-control" name="recruitName" /></td>
								</tr>
								<tr>
									<td style="width:130px;">职位部门：</td>
									<td><input id="recruitUnit" type="text" class="form-control"
										name="recruitUnit" maxlength="100" /></td>
								</tr>
								<tr>
									<td style="width:130px;">所需人数：</td>
									<td><input id="recruitPerson" type="text" class="form-control"
										name="recruitPerson" maxlength="255" /></td>
								</tr>
								<tr>
									<td style="width:130px;">岗位职责：</td>
									<td><textarea id="recruitResponsibility" class="form-control"
										name="recruitResponsibility" maxlength="1000"></textarea></td>
								</tr>
								<tr>
									<td style="width:130px;">任职要求：</td>
									<td><textarea id="recruitRequire" class="form-control"
										name="recruitRequire" maxlength="1000"></textarea></td>
								</tr>
							</table>
						</form>
				</div>
				<div class="modal-footer">
					<button id="btnClose" type="button" class="btn btn-default">返&nbsp;&nbsp;回</button>
					<button id="btnSave" type="button" class="btn btn-primary">保&nbsp;存</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
