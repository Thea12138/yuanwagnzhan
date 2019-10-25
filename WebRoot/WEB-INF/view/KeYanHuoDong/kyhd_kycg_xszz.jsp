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
<link rel="stylesheet" type="text/css" href="Resources/css/style.css">
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="Resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/pages.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<script type="text/javascript" src="Resources/js/WdatePicker.js"></script>

<script type="text/javascript">
	//当前页数
	var pageno = 1;

	//每页加载记录数量
	var pagerow = 10;
	//数据记录数
	var rowcount;
	$(function() {
	sessionStorage.focusUrl_Name = "kyhd_kycg_xszz.do";
		sessionStorage.focusUrl_ID = "kyhdyjfx";
		initTableData();
		NavKYHD();
	});

	//初始化表格内容
	function initTableData() {
		//XXXX代表后台do方法
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
							PublishPlace : "",//刊物/出版社/会议名称
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#newsTable").html('');
								//获取总记录条数
								rowcount = data.rows;
								var ht = "";
								for (var i = 0; i < data.list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td style='text-align:center;'>"
											+ (i + 1)
											+ "</td>"
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
								$("#newsTable").append(ht);//XXXX代表主要完成人字段
								pages(data.rows, pagerow, pageno);
								parent
										.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}

	function GetChangePageData(pageno) {
		//XXXX代表后台do名称
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
							PublishPlace : "",//刊物/出版社/会议名称
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#newsTable").html('');
								//获取总记录条数
								rowcount = data.rows;
								var ht = "";
								for (var i = 0; i < data.list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td style='text-align:center;'>"
											+ ((pageno * 10 - 10) + i + 1)
											+ "</td>"
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
								$("#newsTable").append(ht);//XXXX代表主要完成人字段
								pages(data.rows, pagerow, pageno);
								parent
										.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}
	//点击开始搜索按钮触发事件
	function searchBtn_clickHandler() {
		//XXXX代表后台do方法
		$
				.post(
						"LoadAcademicWorksList.do",
						{
							pageno : pageno, // 当前页码，初始化时为1
							pagerow : pagerow,// 每页显示记录数				
							AcademicWorksTitle : $("#AcademicWorksTitle").val(),
							AcademicWorksType : $("#AcademicWorksType").val(),
							Author : $("#Author").val(),
							PublishDate : $("#PublishDate").val(),
							PublishPlace : $("#PublishPlace").val()
						// 每页显示记录数
						},
						function(data) {
							if (data != null) {
								//alert(JSON.stringify(data));
								$("#newsTable").html('');
								//获取总记录条数
								rowcount = null;
								rowcount = data.rows;
								if (rowcount == 0) {
									pages(data.rows, 0, 1);
									alert("没有匹配数据！");
								}
								var ht = "";
								for (var i = 0; i < data.list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td style='text-align:center;'>"
											+ (i + 1)
											+ "</td>"
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
								$("#newsTable").append(ht);
								pages(data.rows, pagerow, pageno);
								parent
										.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}

	function AcademicWorks_ChangeHandler() {
		if ($("#AcademicWorksType").find("option:selected").text() == '-请选择-') {
			AcademicWorksType = "";
		} else {
			AcademicWorksType = $("#AcademicWorksType").find("option:selected")
					.val();
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
					<div class=ld>科研活动</div>
					<div class=secondnav>
						<ul>
							<li id="kyhdxssyframe"><a
								href="javascript:ContentJump('kyhd_xssy_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 学术盛宴</a></li>
							<li id="kyhdzdxmframe"><a
								href="javascript:ContentJump('kyhd_zdxm_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 重点项目</a></li>
							<li id="kyhdkycg"><img src="Resources/css/img/juset.jpg" /><a id="kycg"><span
									class="glyphicon glyphicon-chevron-down"
									style="font-size:10px;"></span> 科研成果</a>
								<ul id="kycgxiala" class="kycgxiala">
									<li id="kyhd_kycg_kyjl"><a
										href="javascript:ContentJump('kyhd_kycg_kyjl.do');"
										style="margin-left:22px;">科研奖励</a></li>
									<li id="kyhd_kycg_xszz"><a
										href="javascript:ContentJump('kyhd_kycg_xszz.do');"
										style="color:#0956ac;"><img
											src="Resources/css/img/thirdnav.png" />&nbsp;学术著作</a></li>
									<li id="kyhd_kycg_rjzz"><a
										href="javascript:ContentJump('kyhd_kycg_rjzz.do');"
										style="margin-left:22px;">软件著作</a></li>
									<li id="kyhd_kycg_zlcg"><a
										href="javascript:ContentJump('kyhd_kycg_zlcg.do');"
										style="margin-left:22px;">专利成果</a></li>
								</ul></li>
							<li id="kyhdzjftframe"><a
								href="javascript:ContentJump('kyhd_zjft_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 专家访谈</a></li>
						</ul>
					</div>
					<div class=jbbeijing></div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<a href="javascript:JumpToIndex();"><span
							style="color:#666666;">首页</span></a> <span
							class="glyphicon glyphicon-chevron-right" style="font-size:10px;"></span>
						<a href="javascript:void(0);"><span style="color:#666666;">
								科研成果</span></a> <span class="glyphicon glyphicon-chevron-right"
							style="font-size:10px;"></span> <a href="javascript:void(0);"><span
							style="color:#0066cc;"> 学术著作</span></a>
					</div>
					<div class=contents>
						<div class="researchborder">
							<table
								style="width:780px;height:80px;font-size:14px;color:#000000;"
								border="0" cellspacing=0>
								<tr>
									<td style="width:45px;height:40px;text-align:right;">名称：</td>
									<td style="width:200px;height:40px;"><input type=text
										id="AcademicWorksTitle" name="AcademicWorksTitle"
										style="height:30px;line-height:30px;width : 200px;"></td>
									<td style="width:160px;height:40px;text-align:right;">发表（出版）时间：</td>
									<td style="width:200px;height:40px; vertical-align: middle;"><input
										type="text" class="form-control" onclick="WdatePicker()"
										id="PublishDate" name="PublishDate"
										style="height:30px;line-height:30px;width:200px;"></td>

									<td rowspan="2" style="text-align:center;"><input
										type="button" value="开始搜索" onclick="searchBtn_clickHandler()"
										class="btn btn-success"></td>
								</tr>
								<tr>
									<td style="width:45px;height:40px;text-align:right;">类型：</td>
									<td style="width:200px;height:40px;"><select
										id="AcademicWorksType" name="AcademicWorksType"
										onchange="AcademicWorks_ChangeHandler()"
										style="width:200px;height:30px;line-height:30px;">
											<option value="">-请选择-</option>
											<option value="1">会议论文</option>
											<option value="2">期刊论文</option>
											<option value="3">专著</option>
											<option value="4">译著</option>
									</select></td>
									<td style="width:45px;height:40px;text-align:right;">刊物/出版社/会议名称：</td>
									<td style="width:200px;height:40px;"><input type=text
										id="PublishPlace" name="PublishPlace"
										style="height:30px;line-height:30px;width:200px;"></td>
								</tr>
								<tr>
									<td style="width:45px;height:50px;text-align:right;">作者：</td>
									<td style="width:200px;height:50px;"><input type=text
										id="Author" name="Author"
										style="height:30px;line-height:30px;width:200px;"></td>

								</tr>
							</table>
						</div>
						<table class="table table-bordered table-hover"
							style="border-collapse:collapse;width:780px;margin-top:20px;font-size:14px;line-height:32px;color:#000000;border-color:#ccc;"
							cellspacing=0px cellpadding=5px>

							<thead>
								<tr>
									<th style="width: 70px;text-align:center;">序号</th>
									<th style="width: 150px;text-align:center;">名称</th>
									<th style="width: 100px;text-align:center;">类型</th>
									<th style="width: 150px;text-align:center;">作者</th>
									<th style="width: 120px;text-align:center;">发表（出版）时间</th>
									<th style="width: 180px;text-align:center;">刊物/出版社/会议名称</th>
								</tr>

							</thead>
							<tbody id="newsTable" style="word-break: break-all;">

							</tbody>
						</table>
						<div id="pages"></div>


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
