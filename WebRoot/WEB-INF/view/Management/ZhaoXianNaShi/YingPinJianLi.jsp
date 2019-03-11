<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>青岛智能产业技术研究院——应聘简历</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
	var currentPage = 1;

	//每页加载记录数量
	var pagerowCount = 20;

	//数据记录数
	var rowcount;

	$(document).ready(
			function() {

				$("#txtAttachment").fileinput(
						{
							'showPreview' : false,
							'showUpload' : false,
							'allowedFileExtensions' : [ 'doc', 'docx', 'xls',
									'xlsx', 'ppt', 'pptx', 'pdf', 'txt' ],
							'elErrorContainer' : '#errorlink'
						});

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

	function LoadData() {
		$.post("LoadApplication.do", {
			pageno : currentPage, // 当前页码，初始化时为1
			pagerow : pagerowCount
		// 每页显示记录数
		}, function(data) {
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
							+ list[i].ApplicationID
							+ ")'><td>"
							+ list[i].FullName
							+ "</td><td>"
							+ list[i].Phone
							+ "</td><td>"
							+ list[i].Mailbox
							+ "</td><td>"
							+ list[i].WorkExperience
							+ "</td><td>"
							+ (list[i].ApplicationDate == null ? "" : (ymdDate(
									list[i].ApplicationDate, 'yyyy-MM-dd')))
							+ "</td></tr>";
				}
				$("#datatb").append(ht);
				pages(data.rows, pagerowCount, currentPage);
				parent.miFrameHeight();
			}
		});
	}
	function GetChangePageData(pageno) {
		$.post("LoadApplication.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerowCount
		}, function(data) {
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
							+ list[i].ApplicationID
							+ ")'><td>"
							+ list[i].FullName
							+ "</td><td>"
							+ list[i].Phone
							+ "</td><td>"
							+ list[i].Mailbox
							+ "</td><td>"
							+ list[i].WorkExperience
							+ "</td><td>"
							+ (list[i].ApplicationDate == null ? "" : (ymdDate(
									list[i].ApplicationDate, 'yyyy-MM-dd')))
							+ "</td></tr>";
				}
				$("#datatb").append(ht);
				currentPage = pageno;
				pages(data.rows, pagerowCount, currentPage);
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
		$("#hiddenID").val("");
	}

	function DownLoad() {
		if ($("#hiddenID").val() == "") {
			alert("请选择要下载的信息。");
			return false;
		}
		$.get("DownLoadApplication.do", {
			ApplicationID : $("#hiddenID").val()
		}, function(data) {
			//alert(JSON.stringify(data));
			if (data == 0) {
				alert("找不到文件路径。");
				return false;
			} else {
				window.location.href = "DownLoadApplication.do?ApplicationID="
						+ $("#hiddenID").val();
				ClearNews();
				return false;
			}
		});
	}
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table th,td {
	word-wrap: break-word;
}
</style>

</head>

<body>

	<!-- content starts -->
	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">应聘简历</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well">
					<h2>
						<i class="glyphicon glyphicon-forward"></i> 应聘简历
					</h2>
				</div>
				<div class="box-content row">
					<div class="col-lg-7 col-md-12">

						<div class="alert alert-info">
							<!-- <a id="btnAdd" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal" data-backdrop='static'> <i
								class="glyphicon glyphicon-plus icon-white"></i> 增加
							</a> <a id="btnEdit" class="btn btn-info" data-toggle="modal"
								data-backdrop='static'> <i
								class="glyphicon glyphicon-edit icon-white"></i> 修改
							</a>  -->
							<a id="btnDel" class="btn btn-success"
								href="javascript:void DownLoad();" data-backdrop='static'> <i
								class="glyphicon glyphicon-download icon-white"></i> 下载
							</a>
						</div>
						<table class="table table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th style="width:100px;">姓名</th>
									<th style="width:100px;">电话</th>
									<th style="width:100px;">邮箱</th>
									<th style="width:200px;">留言内容</th>
									<th style="width:100px;">留言日期</th>
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
							<span id="spTitle">应聘简历</span>
						</h4>
					</div>
					<div class="modal-body">
						<form id="editform" name="editform" method="post"
							enctype="multipart/form-data">
							<!-- TODO 修改隐藏域hiddenID 的name属性 -->
							<input type="hidden" id="hiddenID" name="ApplicationID" />
							<table class="table">
								<tr>
									<td style="width:100px;">名字：</td>
									<td><input type="text" name="FullName" id="txtFullName"
										class="form-control" style="width:350px;" maxlength="100" /></td>
								</tr>
								<tr>
									<td>邮箱：</td>
									<td><input type="text" name="Mailbox" id="txtMailbox"
										class="form-control" style="width:350px;" maxlength="50" /></td>
								</tr>
								<tr>
									<td>联系电话：</td>
									<td><input type="text" name="Phone" id="txtPhone"
										class="form-control" style="width:350px;" maxlength="11" /></td>
								</tr>
								<tr>
									<td>描述：</td>
									<td><textarea name="WorkExperience" id="txtWorkExperience"
											class="form-control"
											style="width:360px;height: 100px;resize:none;"></textarea></td>
								</tr>
								<tr>
									<td>简历上传：</td>
									<td><input id="txtAttachment" type="file"
										name="txtAttachment" />
										<div id="errorlink" class="help-block"></div></td>
									<!-- <td style="padding-top:15px;padding-bottom:10px;"><input
										type="file" id="txtAttachment" class="form-control"
										name="Attachment" style="width:360px;" />
										<div id="errorlink" class="help-block"></div></td> -->
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
	<!-- content ends -->
</body>
</html>
