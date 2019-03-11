<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>青岛智能产业技术研究院——软件著作</title>
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
	var SoftwareWorksTitle = "";//软著名称
	var CopyrightOwner = "";//著作权人
	var RegistrationNo = "";//登记号
	var InstituteID = "";//所名

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
	//初始化表格内容
	function LoadData() {
		//XXXX代表后台do方法
		$
				.post(
						"LoadSoftwareWorksList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow,// 每页显示记录数
							SoftwareWorksTitle : "",//软著名称
							CopyrightOwner : "",//著作权人
							RegistrationNo : "",//登记号
							InstituteID : 0
						//所名 
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#datatb").html('');
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr id='tr"
											+ i
											+ "'onclick='SelectNews(this.id,"
											+ list[i].SoftwareWorksID
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].SoftwareWorksTitle == null ? ""
													: data.list[i].SoftwareWorksTitle)

											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].CopyrightOwner == null ? ""
													: data.list[i].CopyrightOwner)
											+ "</td>"

											+ "<td style='text-align:center;'>"
											+ (data.list[i].RegistrationNo == null ? ""
													: data.list[i].RegistrationNo)
											+ "</td>"
											/*	+ "<td style='text-align:center;'>"
											+ (data.list[i].InstituteID == null ? ""
													: SoftwareWorks_ChangetoText(data.list[i].InstituteID))
											+ "</td>" */
											 + "<tr>";
								}
								$("#datatb").append(ht);//XXXX代表主要完成人字段
								pages(data.rows, pagerow, pageno);
								parent.miFrameHeight();
							}
						});
	}

	function GetChangePageData(pageno) {
		//XXXX代表后台do名称
	$
				.post(
						"LoadSoftwareWorksList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow,// 每页显示记录数
							SoftwareWorksTitle : "",//软著名称
							CopyrightOwner : "",//著作权人
							RegistrationNo : "",//登记号
							InstituteID : 0
						//所名 
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#datatb").html('');
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr id='tr"
											+ i
											+ "'onclick='SelectNews(this.id,"
											+ list[i].SoftwareWorksID
											+ ")'>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].SoftwareWorksTitle == null ? ""
													: data.list[i].SoftwareWorksTitle)

											+ "</td>"
											+ "<td style='text-align:center;'>"
											+ (data.list[i].CopyrightOwner == null ? ""
													: data.list[i].CopyrightOwner)
											+ "</td>"

											+ "<td style='text-align:center;'>"
											+ (data.list[i].RegistrationNo == null ? ""
													: data.list[i].RegistrationNo)
											+ "</td>"
										/*	+ "<td style='text-align:center;'>"
											+ (data.list[i].InstituteID == null ? ""
													: SoftwareWorks_ChangetoText(data.list[i].InstituteID))
											+ "</td>" */
											+ "<tr>";
								}
								$("#datatb").append(ht);//XXXX代表主要完成人字段
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
		$("#SoftwareWorksTitle").val("");
		$("#CopyrightOwner").val("");
		$("#RegistrationNo").val("");
		$("#InstituteID").val("0");

	}

	function CheckUI() {
		if (parent.$("#SoftwareWorksTitle").val().trim() == "") {
			alert("请填写软著名称。");
			parent.$("#SoftwareWorksTitle").focus();
			return false;
		}
		if (parent.$("#CopyrightOwner").val().trim() == "") {
			alert("请填写著作权人。");
			parent.$("#CopyrightOwner").focus();
			return false;
		}
		if (parent.$("#RegistrationNo").val().trim() == "") {
			alert("请填写登记号。");
			parent.$("#RegistrationNo").focus();
			return false;
		}
		/*if (parent.$("#InstituteID").val().trim() == "0") {
			alert("请选择所或中心。");
			parent.$("#InstituteID").focus();
			return false;
		}*/

		return true;
	}
	function Save() {
		if (!CheckUI())
			return;
		if (parent.$("#hiddenID").val() == "") {
			var ajax_option = {
				url : "AddSoftwareWorks.do",
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
				url : "EditSoftwareWorks.do",
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
			$.post("DelSoftwareWorks.do", {
				SoftwareWorksID : $("#hiddenID").val(),
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
				url : "GetSoftwareWorksByID.do",
				data : {
					SoftwareWorksID : $("#hiddenID").val(),
				},
				type : "post",
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data != null) {
						$("#hiddenID").val(data.SoftwareWorksID);
						$("#SoftwareWorksTitle").val(data.SoftwareWorksTitle);
						$("#CopyrightOwner").val(data.CopyrightOwner);
						$("#RegistrationNo").val(data.RegistrationNo);
						$("#InstituteID").val(data.InstituteID);

					}
				}
			});
		}
		//编辑内容

	}

	function SoftwareWorks_ChangeHandler() {
		if ($("#InstituteID").find("option:selected").text() == '-请选择-') {
			InstituteID = 0;
		} else {
			InstituteID = $("#InstituteID").find("option:selected").val();
		}

	}

	function SoftwareWorks_ChangetoText(tid) {
		switch (tid) {
		case 1:
			return $("#InstituteID option[value='1']").text();
			break;
		case 2:
			return $("#InstituteID option[value='2']").text();
			break;
		case 3:
			return $("#InstituteID option[value='3']").text();
			break;
		case 4:
			return $("#InstituteID option[value='4']").text();
			break;
		case 5:
			return $("#InstituteID option[value='5']").text();
			break;
		case 6:
			return $("#InstituteID option[value='6']").text();
			break;
		case 7:
			return $("#InstituteID option[value='7']").text();
			break;
		case 8:
			return $("#InstituteID option[value='8']").text();
			break;
		case 9:
			return $("#InstituteID option[value='9']").text();
			break;
		case 10:
			return $("#InstituteID option[value='10']").text();
			break;
		
	}

}
</script>
<style type="text/css">
table{
table-layout:fixed;
}

table td,th{
word-wrap:break-word;
}
</style>

</head>

<body>

	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">软件著作</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-inbox"></i> 软件著作
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
									<th style="width: 400px;text-align:center;">软著名称</th>
									<th style="width: 330px;text-align:center;">著作权人</th>
									<th style="width: 150px;text-align:center;">登记号</th>
									<!-- <th style="width: 200px;text-align:center;">所/中心</th> -->
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
							<span id="spTitle">软件著作</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="SoftwareWorksID"
								value="" /> <input type="hidden" id="UserID" name="UserID" />
							<table class="table">
								<tr>
									<td style="width:130px;">软著名称：</td>
									<td><input id="SoftwareWorksTitle" type="text"
										class="form-control" name="SoftwareWorksTitle" maxlength="200" /></td>
								</tr>
								<tr>
									<td style="width:130px;">著作权人：</td>
									<td><input id="CopyrightOwner" type="text"
										class="form-control" name="CopyrightOwner" maxlength="100" /></td>
								</tr>
								<tr>
									<td style="width:130px;">登记号：</td>
									<td><input id="RegistrationNo" type="text"
										class="form-control" name="RegistrationNo" maxlength="40" ></input></td>

								</tr>
								<tr>
									<td style="width:130px;">所/中心：</td>
									<td style="width:210px;height:40px;"><select class="form-control"
										id="InstituteID" name="InstituteID"
										onchange="SoftwareWorks_ChangeHandler()"
										style="width:415px;height:36px;maxlength:200;">
											<option value="0">-请选择-</option>
											<option value="1">技术研发中心</option>
											<option value="2">智慧健康研究所</option>
											<option value="3">智慧教育研究所</option>
											<option value="4">智慧网络研究所</option>
											<option value="5">智慧农业研究所</option>
											<option value="6">智慧城市研究所</option>
											<option value="7">智慧社会研究所</option>
											<option value="8">智慧物流研究所</option>
											<option value="9">智慧企业研究所</option>
											<option value="10">智慧数据研究所</option>
									</select></td>
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

