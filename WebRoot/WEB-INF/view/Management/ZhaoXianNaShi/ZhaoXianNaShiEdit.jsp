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
	var htmlConten="";
	$(document).ready(function() {
		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");
		/* alert(${param.id}); */
		$("#hiddenID").val(${param.id});
	});

	function ClearUI() {
		$("#hiddenID").val("");
		$("#PublishDate").val("");
		$("#NewsTitle").val("");
		$("#CreateBy").val("");

		$("#ed招贤纳士tlink").val("");
		$("#LinkAddress").fileinput('clear');
		$("#editpic").val("");
		$("#picturesList").fileinput('clear');
	}

	function CheckUI() {

		if ($("#recruit_name").val().trim() == "") {
			alert("请填写职位名称。");
			$("#recruit_name").focus();
			return false;
		}

		if ($("#recruit_unit").val().trim() == "") {
			alert("请填写职位部门。");
			$("#recruit_unit").focus();
			return false;
		}

		if ($("#recruit_person").val().trim() == "") {
			alert("请填写所需人数。");
			$("#recruit_person").focus();
			return false;
		}
		
		if($("#recruit_person").val()>255){
			alert("所需人数数额大于255请与管理员联系。");
		}
		
		if ($("#recruit_responsibility").val().trim() == "") {
			alert("请填写岗位职责。");
			$("#recruit_responsibility").focus();
			return false;
		}
		
		if ($("#recruit_require").val().trim() == "") {
			alert("请填写任职要求。");
			$("#recruit_require").focus();
			return false;
		}
		return true;
	}

	function Save() {
		if (!CheckUI())
			return;
		$.ajax({
			async : false,
			url : "updateRecruit.do",
			data : {
				UserID: UserID,
				id : $("#hiddenID").val(),
		        /* category: "H", */
		        recruitName: $("#recruit_name").val(),
		        recruitUnit: $("#recruit_unit").val(),
		        recruitPerson: $("#recruit_person").val(),
		        recruitResponsibility: $("#recruit_responsibility").val(),
		        recruitRequire: $("#recruit_require").val()
			},
			type : "post",
			success : function(data) {
				srchange("ZhaoXianNaShi.do");
			}
		})
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
			$.post("DelNews.do", {
				newsid : $("#hiddenID").val(),
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
			document.getElementById("spTitle").innerText = "新增院务新闻";
		} else {//Edit
			document.getElementById("spTitle").innerText = "修改院务新闻";

			$.ajax({
				async : false,
				url : "getRecruit.do",
				data : {
					id : $("#hiddenID").val()
				},
				type : "post",
				success : function(data) {
					if (data != null) {
						$("#hiddenID").val(data.id);
						$("#recruit_name").val(data.recruit_name);
						$("#recruit_unit").val(data.recruit_unit);
						$("#recruit_person").val(data.recruit_person);
						$("#recruit_responsibility").val(data.recruit_responsibility);
						$("#recruit_require").val(data.recruit_require);
						
						$("#editlink").val(data.LinkAddress);
						$("#editlink").show();
						var picurls = "";
						for (var i = 0; i < data.picturesList.length; i++) {
							picurls += data.picturesList[i] + ";";
						}
						if (picurls != "") {
							$("#editpic").val(picurls);
							$("#editpic").show();
						}
					}
				}
			});
		}
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
			<li><a href="javascript:void(0);">招贤纳士修改</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-forward"></i> 招贤纳士修改
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
									<td><input id="recruit_name" type="text"
										class="form-control" name="recruit_name" /></td>
								</tr>
								<tr>
									<td style="width:130px;">职位部门：</td>
									<td><input id="recruit_unit" type="text" class="form-control"
										name="recruit_unit" maxlength="100" /></td>
								</tr>
								<tr>
									<td style="width:130px;">所需人数：</td>
									<td><input id="recruit_person" type="text" class="form-control"
										name="recruit_person" maxlength="255" /></td>
								</tr>
								<tr>
									<td style="width:130px;">岗位职责：</td>
									<td><textarea id="recruit_responsibility" class="form-control"
										name="recruit_responsibility" maxlength="1000"></textarea></td>
								</tr>
								<tr>
									<td style="width:130px;">任职要求：</td>
									<td><textarea id="recruit_require" class="form-control"
										name="recruit_require" maxlength="1000"></textarea></td>
								</tr>
							</table>
						</form>
				</div>
				
			
			    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
			    <script type="text/javascript" src="Resources/js/wangEditor.min.js"></script>
			    <script type="text/javascript">
			       
			        $(function() {
						//alert(${param.id});//获取地址携带id
						$.ajax({
							async : false,
							url : "getRecruit.do",
							data : {
								id: ${param.id}
							},
							type : "post",
							success : function(data) {
					           console.log(data+",,"+data.recruit_name);
					            $("#recruit_name").val(data.recruit_name);
						        $("#recruit_unit").val(data.recruit_unit);
						        $("#recruit_person").val(data.recruit_person);
						        $("#recruit_responsibility").val(data.recruit_responsibility);
						        $("#recruit_require").val(data.recruit_require);
							}
						})
						
						$("#btnClose").click(function() {
							srchange("ZhaoXianNaShi.do");
						});
						$("#btnSave").click(function() {
							Save();
						});
				
						$("#btnmodalclose").click(function() {
							Close();
						});
				
					});
			    </script>
				<div class="modal-footer">
					<button id="btnClose" type="button" class="btn btn-default">返&nbsp;&nbsp;回</button>
					<button id="btnSave" type="button" class="btn btn-primary">保&nbsp;存</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
