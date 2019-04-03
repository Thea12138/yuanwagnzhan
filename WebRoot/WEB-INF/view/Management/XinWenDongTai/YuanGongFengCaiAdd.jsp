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
	var NewsCategory = "H";
	var UserID = "";
	$(document).ready(function() {
		$("#UserID").val(sessionStorage.getItem("AccountID"));
		UserID = sessionStorage.getItem("AccountID");
	});

	$(function() {
		$("#btnClose").click(function() {
			Close();
		});
		$("#btnSave").click(function() {
			Save();
		});

		$("#btnmodalclose").click(function() {
			Close();
		});

	});

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
		$("#PublishDate").val("");
		$("#NewsTitle").val("");
		$("#CreateBy").val("");

		$("#editlink").val("");
		$("#LinkAddress").fileinput('clear');
		$("#editpic").val("");
		$("#picturesList").fileinput('clear');
	}

	function CheckUI() {

		if ($("#PublishDate").val().trim() == "") {
			alert("请填写创建日期。");
			$("#PublishDate").focus();
			return false;
		}

		if ($("#NewsTitle").val().trim() == "") {
			alert("请填写标题。");
			$("#NewsTitle").focus();
			return false;
		}

		if ($("#CreateBy").val().trim() == "") {
			alert("请填写创建人。");
			$("CreateBy").focus();
			return false;
		}
		return true;
	}

	function Save() {
		if (!CheckUI())
			return;
		var ajax_option = {
			url : "AddNews.do",
			data: {
                'title': title,
                'content': content
            },
			success : function(data) {
				alert(JSON.stringify(data));
				/* var flg = false;
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
				} */
			}
		};
		$("#editform").ajaxSubmit(ajax_option);
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
				url : "GetNewsByNewsID.do",
				data : {
					newsid : $("#hiddenID").val()
				},
				type : "post",
				success : function(data) {
					if (data != null) {
						$("#hiddenID").val(data.NewsID);
						$("#PublishDate").val(data.PublishDate);
						$("#NewsTitle").val(data.NewsTitle);
						$("#CreateBy").val(data.CreateBy);

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
	    $("body", parent.document).find('iframe').attr('src',obj);
	}

</script>
</head>

<body>

	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">员工风采添加</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-forward"></i> 员工风采添加
					</h2>
				</div>
				<div>
					<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="NewsID" /> <input
								type="hidden" id="UserID" name="UserID" /> <input type="hidden"
								id="NewsCategory" name="NewsCategory" value="H" />
							<table class="table">
								<tr>
									<td style="width:130px;">创建日期：</td>
									<td><input id="PublishDate" type="text"
										class="form-control" name="PublishDate"
										onclick="WdatePicker()" /></td>
								</tr>
								<tr>
									<td style="width:130px;">标题：</td>
									<td><input id="NewsTitle" type="text" class="form-control"
										name="NewsTitle" maxlength="100" /></td>
								</tr>
								<tr>
									<td style="width:130px;">创建人：</td>
									<td><input id="CreateBy" type="text" class="form-control"
										name="CreateBy" maxlength="20" /></td>
								</tr>
								<tr>
									<td style="width:130px;">内容：</td>
									<td>
										<div id="editor">
									        <p>请输入内容</p>
									    </div>
									
									</td>
								</tr>
							</table>
						</form>
				</div>
				
			
			    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
			    <script type="text/javascript" src="Resources/js/wangEditor.min.js"></script>
			    <script type="text/javascript">
			        var E = window.wangEditor
			        var editor = new E('#editor')
			        // 或者 var editor = new E( document.getElementById('editor') )
					// editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
			     editor.customConfig.uploadImgServer = '/upload'  // 上传图片到服务器
			        editor.create()
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
