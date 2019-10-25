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

<script type="text/javascript">
	//当前页数
	var pageno = 1;

	//每页加载记录数量
	var pagerow = 20;

	var InstituteID = 3;

	//数据记录数
	var rowcount;
	window.onload = function() {
		parent.setiHeight($(".rightcontent").height() + 240);

	};
	$(function() {
	if(sessionStorage.focusUrl_Name=="cpfa_jiaoyus_frame.do" ){
		if(sessionStorage.pageno!=undefined && sessionStorage.pageno!='')	{
		    pageno=sessionStorage.pageno;
		}
		
	 }
	sessionStorage.focusUrl_Name = "cpfa_jiaoyus_frame.do";
		sessionStorage.focusUrl_ID = "cpfayyhygl";
		initcpfaList();
		NavCPFA();

		window.onload = parent.setiHeight($(".rightcontent").height() + 240);

	});
	function initcpfaList() {
		$
				.post(
						"LoadProductSolutionsList.do",
						{
							pageno : pageno,
							pagerow : pagerow,
							InstituteID : InstituteID
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#newsTable").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td  style='width:690px;'><a href='javascript:ContentJumpPage(\"ProductSolutionsShow.do?ProductSolutionsID="
											+ list[i].ProductSolutionsID
											+ "&InstituteID="
											+ InstituteID
											+ "\");'>"
											+ SubStrFun(list[i].Title, 50)
											+ "</a></td>"
											+ "<td style='width:80px;'>"
											+ (list[i].CreateDate == null ? ""
													: ("["
															+ (ymdDate(
																	list[i].CreateDate,
																	'yyyy-MM-dd')) + "]"))
											+ "</td>" + "</tr>";
								}
								$("#newsTable").append(ht);
								pages(data.rows, pagerow, pageno);

								parent
										.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}
	function GetChangePageData(pageno) {
		$
				.post(
						"LoadProductSolutionsList.do",
						{
							pageno : pageno,
							pagerow : pagerow,
							InstituteID : InstituteID
						},
						function(data) {
							if (data != null) {
								$("#newsTable").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td  style='width:690px;'><a href='javascript:ContentJumpPage(\"ProductSolutionsShow.do?ProductSolutionsID="
											+ list[i].ProductSolutionsID
											+ "&InstituteID="
											+ InstituteID
											+ "\");'>"
											+ SubStrFun(list[i].Title, 50)
											+ "</a></td>"
											+ "<td style='width:80px;'>"
											+ (list[i].CreateDate == null ? ""
													: ("["
															+ (ymdDate(
																	list[i].CreateDate,
																	'yyyy-MM-dd')) + "]"))
											+ "</td>" + "</tr>";
								}
								$("#newsTable").append(ht);
								currentPage = pageno;
								pages(data.rows, pagerow, pageno);
								parent
										.setiHeight($(".rightcontent").height() + 240);
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
					<div class=ld>产品方案</div>
					<div class=secondnav>
						<ul>
							<li id="cpfayfzx"><a
								href="javascript:ContentJump('cpfa_yanfazx_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 技术研发中心</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_jiankangs_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧健康研究所</a></li>
							<li><img src="Resources/css/img/juset.jpg" /><a
								href="javascript:ContentJump('cpfa_jiaoyus_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧教育研究所</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_wangluos_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧网络研究所</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_nongyes_frame.do');"> <span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧农业研究所
							</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_chengshis_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧城市研究所</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_shehuis_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧社会研究所</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_wulius_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧物流研究所</a></li>
							<li><a href="javascript:ContentJump('cpfa_qiyes_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧企业研究所</a></li>
							<li><a
								href="javascript:ContentJump('cpfa_shujus_frame.do');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 智慧数据研究所</a></li>
						</ul>
					</div>
					<div class=jbbeijing></div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<a href="javascript:JumpToIndex();"><span
							style="color:#666666;">首页</span></a> <span
							class="glyphicon glyphicon-chevron-right" style="font-size:10px;"></span>
						<a href="javascript:void(0);"><span style="color:#0066cc;">智慧教育研究所</span></a>
					</div>

					<div class=contents>
						<table id="newsTable" class="listtable">
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
