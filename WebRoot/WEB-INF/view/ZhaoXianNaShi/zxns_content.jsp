<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>青岛智能产业技术研究院</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="keywords" content="青岛智能产业技术研究院，青岛智能产业研究院，青岛研究院，研究院，智能智铭科技有限公司，王飞跃，王晓，郑南宁，高彦臣，于立平，青岛智能产业，自动驾驶，人工智能，智能交通，智能驾驶" />
<meta name="description" content="青岛智能产业技术研究院（以下简称“青岛智能院”）按照“需求引导、创新驱动、联合协作、扎实推进”的原则，坚持世界眼光、树立国际标准，立足本土优势，在中科院自动化所市科技局、高新区管委的支持下，从无到有，汇集各方面人才与科技资源，走过了开创、建设和积累的四年，与300余位同事共同经历了建队伍、打基础、产学研转化上轨道、本地合作上台阶的四年。在团队建设、科技研发、产业落地等方面，均取得一定的成绩，获得30余项国家及省市区级别奖励。青岛智能院以“新理论支撑新技术，新技术赋能旧产业”为指导方针，时至2018，进一步明确了“科研顶天、产业立地”的发展战略。青岛智能院不断调整优化组织机构，紧紧围绕国际、国内技术进展，山东、青岛的实际需求，围绕智能制造、智能网络、智慧农业、智慧企业、智慧城市、智慧社会、智慧健康、智慧教育、智慧物流等方向设立14个研究所、1个技术研发中心和6个管理支撑部门，并基于平行理论统摄，在各所下设17个平行技术创新中心，为各行业提供灵捷、聚焦、收敛的技术服务。
智能院坚持世界眼光、国际标准，发挥自身优势，加快产业化步伐，在青岛高新区建立产业孵化基地，遵循“立足青岛、辐射山东、服务全国”的发展方针，围绕国家“十三五”发展重点，以项目合作、产学研结合、举办国际研讨会和学术论坛等多种形式，联合创办国际首家“智能科技学院”，打造智能领域的“黄埔军校”，培养智能产业的“红领人才”。" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<link type="text/css" rel="stylesheet" href="Resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="Resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script type="text/javascript"
	src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/pages.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>

<style type="text/css">
#win {
	display: none;
	height: 400px;
	left: 50%;
	margin-left: -311px;
	margin-top: -161px;
	position: fixed;
	top: 50%;
	width: 622px;
}

#sqcenter {
	background-color: #FFFFFF;
	width: 572px;
	margin-left: 25px;
	border-left: 1px solid;
	border-bottom: 1px solid;
	border-right: 1px solid;
	font-family: Arial;
	font-size: 10px;
	color: #000000;
}

#apply {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	function showWin() {
		var winNode = $("#win");
		winNode.show("slow");
	}
	function hideWin() {
		var winNode = $("#win");
		winNode.hide("slow");
	}
	$(function(data) {
		$("#apply")
				.click(
						function() {
							var FullName = $("#FullName").val();
							var Mailbox = $("#Mailbox").val();
							var Phone = $("#Phone").val();
							var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
							var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
							if (FullName == '') {
								alert("姓名不能为空!");
								return;
							}
							if (Mailbox == '') {
								alert("邮箱不能为空!");
								return;
							}
							if (Phone == '') {
								alert("联系电话不能为空!");
								return;
							}
							
							if (!myreg.test($("#Phone").val())) {
								alert('请输入有效的手机号码！');
								return false;
							}
							if (!reg.test(Mailbox)) {
								alert("邮箱格式不正确!");
								return;
							}
							$("#form").submit();
						});
		var winNode = $("#win");
		winNode.hide("slow");
	});

	$(function() {
	    NavZXNS();
		initRecruitmentList();
	});
	function initRecruitmentList() {
		$
				.post(
						"RecruitmentAll.do",
						function(data) {
							if (data != null) {
								var hid = $("#RecruitmentID").val();
								//alert(JSON.stringify(data));
								$("#listulData").html('');
								//获取总记录条数
								for (var i = 0; i < data.length; i++) {
									var classstr = "";
									if (data[i].RecruitmentID == hid) {
										classstr = " class='active' ";
									}

									$("#listulData")
											.append(
													"<li><a "
															+ classstr
															+ " id='"
															+ data[i].RecruitmentID
															+ "' style='width:140px;' href=\"javascript:ContentJumpPage('RecruitmentByID.do?RecruitmentID="
															+ data[i].RecruitmentID
															+ "');\" title='"
															+ data[i].JobTitle
															+ "' >"
															+ SubStrFun(
																	data[i].JobTitle,
																	8)
															+ "</a></li>");
								}
								parent.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}
</script>
</head>

<body>
	<div id="header" class="header">
		<div class="headertop">
			<div class="headerinner">
				<div class=logo>
					<div class=language>
						<a class="lanActive" href="index.do">中文</a> | <a href="index_e.do">English</a>
					</div>
					<div class=qrcode>
						<img src="Resources/css/img/qrcode.png" width=50px height=50px />
					</div>
					<div class=code>
						<img src="Resources/css/img/code.png" width=50px height=50px />
					</div>
				</div>
			</div>
		</div>
		<div class="nav" id="nav">
			<ul class="nav-main" id="nav-main">
				<li id="home" class="home"><a
					href="javascript:PageJump('index');">首页 </a></li>
				<li id="jibengk" class="jibengk"><a
					href="javascript:PageJumpNo('jibengk');">基本概况 &nbsp;<span
						class="glyphicon glyphicon-chevron-down" style="font-size:10px;"></span></a>
					<ul id="xiala1" class="xiala1">
						<li id="yjygkjj"><a
							href="javascript:ContentJump('jbgk_wyjs.do','jibengk');">我院介绍</a></li>
						<li id="zzjgxswyh"><a
							href="javascript:ContentJump('jbgk_xswyh.do','jibengk');">学术委员会</a></li>
						<li id="yjygkxrld"><a
							href="javascript:ContentJump('jbgk_yjyld.do','jibengk');">研究院领导</a></li>
						<li id="zzjg_zzjg_yanfazx"><a
							href="javascript:ContentJump('jbgk_zzjg_yanfazx.do','jibengk');">组织结构</a></li>
						<li id="yjygkywxw"><a
							href="javascript:ContentJump('jbgk_ywxw_frame.do','jibengk');">院务新闻</a></li>
						<li id="yjygkmbxz"><a
							href="javascript:ContentJump('jbgk_mbxz.do','jibengk');">模板下载</a></li>

					</ul></li>
				<li id="xwdtyjydtframe" class="xwdtyjydtframe"><a
					href="javascript:PageJumpNo('xwdtyjydtframe');">新闻动态 &nbsp;<span
						class="glyphicon glyphicon-chevron-down" style="font-size:10px;"></span></a>
					<ul class="xiala2" id="xiala2">
						<li><a
							href="javascript:ContentJump('xwdt_tztg_frame.do','xwdtyjydtframe');">通知通告</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');">领导视察</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zqdj_frame.do','xwdtyjydtframe');">政企对接</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ygfc_frame.do','xwdtyjydtframe');">员工风采</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zyry_frame.do','xwdtyjydtframe');">重要荣誉</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_hyqbjb_frame.do','xwdtyjydtframe');">行业情报简报</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zncyqk.do','xwdtyjydtframe');">智能产业期刊</a></li>

					</ul></li>
				<li id="kyhdyjfx" class="kyhdyjfx"><a
					href="javascript:PageJumpNo('kyhdyjfx');">科研活动 &nbsp;<span
						class="glyphicon glyphicon-chevron-down" style="font-size:10px;"></span></a>
					<ul class="xiala3" id="xiala3">
						<li><a
							href="javascript:ContentJump('kyhd_xssy_frame.do','kyhdyjfx');">学术盛宴</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_zdxm_frame.do','kyhdyjfx');">重点项目</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">科研成果</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_zjft_frame.do','kyhdyjfx');">专家访谈</a></li>
					</ul></li>
				<li id="cpfayyhygl" class="cpfayyhygl"><a
					href="javascript:PageJumpNo('cpfayyhygl');">产品方案 &nbsp;<span
						class="glyphicon glyphicon-chevron-down" style="font-size:10px;"></span></a>
					<ul class="xiala4" id="xiala4">
						<li id="cpfa_yanfazx"><a
							href="javascript:ContentJump('cpfa_yanfazx_frame.do','cpfayyhygl');">技术研发中心</a></li>
						<li id="cpfa_jiankangs"><a
							href="javascript:ContentJump('cpfa_jiankangs_frame.do','cpfayyhygl');">智慧健康研究所</a></li>
						<li id="cpfa_jiaoyus"><a
							href="javascript:ContentJump('cpfa_jiaoyus_frame.do','cpfayyhygl');">智慧教育研究所</a></li>
						<li id="cpfa_wangluos.do"><a
							href="javascript:ContentJump('cpfa_wangluos_frame.do','cpfayyhygl');">智慧网络研究所</a></li>
						<li id="cpfa_nongyes"><a
							href="javascript:ContentJump('cpfa_nongyes_frame.do','cpfayyhygl');">智慧农业研究所</a></li>
						<li id="cpfa_chengshis"><a
							href="javascript:ContentJump('cpfa_chengshis_frame.do','cpfayyhygl');">智慧城市研究所</a></li>
						<li id="cpfa_shehuis"><a
							href="javascript:ContentJump('cpfa_shehuis_frame.do','cpfayyhygl');">智慧社会研究所</a></li>
						<li id="cpfa_wulius"><a
							href="javascript:ContentJump('cpfa_wulius_frame.do','cpfayyhygl');">智慧物流研究所</a></li>
						<li id="cpfa_qiyes"><a
							href="javascript:ContentJump('cpfa_qiyes_frame.do','cpfayyhygl');">智慧企业研究所</a></li>
						<li id="cpfa_shujus"><a
							href="javascript:ContentJump('cpfa_shujus_frame.do','cpfayyhygl');">智慧数据研究所</a></li>

					</ul></li>
				<li id="zxnsframe"><a
					href="javascript:PageJump('zxns_zxns_frame');">招贤纳士</a></li>
				<li id="contactus"><a href="javascript:PageJump('lxwm_lxwm');">联系我们</a>
				</li>
			</ul>

		</div>

	</div>
	<div class="clear"></div>
	<div class=pagecontent>
		<div class=pageimg></div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav>
					<div class=ld>招贤纳士</div>
					<div class=secondnav>
						<ul>
							<li id="zxns"><img src="Resources/css/img/juset.jpg" /><a
								href="javascript:ContentJump('zxns_zxns_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 招贤纳士</a></li>
						</ul>
					</div>

				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<a href="javascript:JumpToIndex();"><span
							style="color:#666666;">首页</span></a> <span
							class="glyphicon glyphicon-chevron-right" style="font-size:10px;"></span>
						<a href="javascript:void(0);"><span style="color:#0066cc;">
								招贤纳士</span></a>
					</div>
					<div class=contents>
						<div style="font-size: 18px; padding:10px 0;">${JobTitle}</div>
						<div
							style="font-size: 14px; padding-bottom:10px; border-bottom:2px solid #64bf36;">
							工作地点：<b>青岛</b>&nbsp;&nbsp;&nbsp;招聘人数：<b>${Vacancies}</b>
						</div>
						<div style="font-size: 14px; padding:10px 0;">职位描述:</div>
						<div style="font-size: 14px; color:#999999;">${Description}</div>
						<div style="font-size: 14px; padding:20px 0 10px;">任职要求:</div>
						<div style="font-size: 14px; color:#999999;">${Qualifications}</div>
						<div
							style="height:2px; overfloe:hidden; width:100%; background:#488ccd; clear:both; margin:10px 0;"></div>
						<div style="width:100%; text-align:right;">
							<a style="color:#45698b"
								href="javascript:ContentJumpPage('zxnsframe.do')">查看更多职位</a>
						</div>
						<div
							style="margin:0 auto; margin-top:20px; height:32px; width:127px; background:url(Resources/css/img/sq.png) no-repeat; cursor:pointer;"
							onclick="showWin()"></div>
						<div id="win">
							<div
								style="wight:622px;height:47px;background:url(Resources/css/img/t.png) no-repeat;">
								<div
									style="float:left;width:589px;line-height:30px;color:#fff;font-size:14px;text-align:center;cursor:default;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位申请信息</div>
								<div
									style="width:23px;height:23px;background:url(Resources/css/img/gb.png) no-repeat;margin:4px 10px 0 0;cursor:pointer;float:right"
									onclick="hideWin()"></div>
							</div>
							<div id="sqcenter">
								<form action="Apply.do" method="post" name="form" id="form"
									ENCTYPE="multipart/form-data">
									<input type="hidden" value="${RecruitmentID }"
										name="RecruitmentID" id="RecruitmentID" />
									<table style="width:500px; margin:0 auto;">
										<tr>
											<td style="width:100px;font-size:12px;">申请人姓名：</td>
											<td><input type="text" name="FullName" id="FullName"
												class="form-control" style="width:350px;height:30px;"
												maxlength="20" /></td>
										</tr>
										<tr>
											<td style="font-size:12px;">申请人邮箱：</td>
											<td><input type="text" name="Mailbox" id="Mailbox"
												class="form-control" style="width:350px;height:30px;"
												maxlength="100" /></td>
										</tr>
										<tr>
											<td style="font-size:12px;">申请人联系电话：</td>
											<td><input type="text" name="Phone" id="Phone"
												class="form-control" style="width:350px;height:30px;"
												maxlength="20" /></td>
										</tr>
										<tr>
											<td style="font-size:12px;">申请描述：</td>
											<td><textarea name="WorkExperience" id="WorkExperience"
													class="form-control"
													style="width:350px;height: 100px;resize:none;"
													maxlength="200"></textarea></td>
										</tr>
										<tr>
											<td style="font-size:12px;">求职简历上传：</td>
											<td style="padding-top:15px;padding-bottom:10px;"><input
												type="file" id="Attachment" name="Attachment"
												class="form-control" style="width:350px;" /></td>
										</tr>
									</table>
									<br />
									<div
										style="height:32px; width:127px;background:url('Resources/css/img/sq.png') no-repeat ;cursor:pointer;"
										id="apply"></div>
									<br /> <br />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	
	<div class="foot">
		<div class="foottext"></div>
		<div class="footnav">
			<ul>
				<li><a href="http://www.cas.cn/">中国科学院</a></li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.ia.cas.cn/">中国科学院自动化研究所</a></li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.compsys.ia.ac.cn/">复杂系统管理与控制国家重点实验室</a>
				</li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.casc.ac.cn/">东莞科学院云计算产业技术创新与育成中心</a></li>

			</ul>
		</div>
		<div class=copyright>青岛智能产业技术研究院 版权所有 鲁ICP备15005983号-1</div>
		<div class=address>地址：青岛高新区智力岛路1号创业大厦B座26层</div>
	</div>
	<div class="clear"></div>
	
</body>
</html>

