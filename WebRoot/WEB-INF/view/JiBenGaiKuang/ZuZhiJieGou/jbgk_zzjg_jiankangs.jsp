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
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="Resources/css/style.css">
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>

<script type="text/javascript">
	$(function() {
	sessionStorage.focusUrl_Name = "jbgk_zzjg_jiankangs.do";
		sessionStorage.focusUrl_ID = "jibengk";
		NavYK();
		parent.setiHeight($(".rightcontent").height() + 240);
	});
</script>
</head>
<body style="overflow:auto;overflow-x:hidden;margin:0 0">
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
					<div class=ld>基本概况</div>
					<div class=secondnav>
						<ul>
							<li id="yjygkjj"><a
								href="javascript:ContentJump('jbgk_wyjs.do','yjygkjj');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 我院介绍</a></li>
							<li id=yjygkxswyh><a
								href="javascript:ContentJump('jbgk_xswyh.do','yjygkjj');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 学术委员会</a></li>
							<li id=yjygkxrld><a
								href="javascript:ContentJump('jbgk_yjyld.do','yjygkjj');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 研究院领导</a></li>
							<li id="yjygkzzjg" style="height:auto;" class="yjygkzzjg"><img
								src="Resources/css/img/juset.jpg" /><a id="zzjg"><span
									class="glyphicon glyphicon-chevron-down"
									style="font-size:10px;"></span> 组织机构</a>
								<ul id="zzjgxiala" class="zzjgxiala">
									<li id="jbgk_zzjg_yanfazx"><a
										href="javascript:ContentJump('jbgk_zzjg_yanfazx.do','jbgk_zzjg_yanfazx');"
										style="margin-left:22px;">技术研发中心</a></li>
									<li id="jbgk_zzjg_jiankangs"><a
										href="javascript:ContentJump('jbgk_zzjg_jiankangs.do','jbgk_zzjg_jiankangs');"
										style="color:#0956ac;"><img
											src="Resources/css/img/thirdnav.png" />&nbsp;智慧健康研究所</a></li>
									<li id="jbgk_zzjg_jiaoyus"><a
										href="javascript:ContentJump('jbgk_zzjg_jiaoyus.do','jbgk_zzjg_jiaoyus');"
										style="margin-left:22px;">智慧教育研究所</a></li>
									<li id="jbgk_zzjg_wangluos"><a
										href="javascript:ContentJump('jbgk_zzjg_wangluos.do','jbgk_zzjg_wangluos');"
										style="margin-left:22px;">智慧网络研究所</a></li>
									<li id="jbgk_zzjg_nongyes"><a
										href="javascript:ContentJump('jbgk_zzjg_nongyes.do','jbgk_zzjg_nongyes');"
										style="margin-left:22px;">智慧农业研究所</a></li>
									<li id="jbgk_zzjg_chengshis"><a
										href="javascript:ContentJump('jbgk_zzjg_chengshis.do','jbgk_zzjg_chengshis');"
										style="margin-left:22px;">智慧城市研究所</a></li>
									<li id="jbgk_zzjg_shehuis"><a
										href="javascript:ContentJump('jbgk_zzjg_shehuis.do','jbgk_zzjg_shehuis');"
										style="margin-left:22px;">智慧社会研究所</a></li>
									<li id="jbgk_zzjg_wulius"><a
										href="javascript:ContentJump('jbgk_zzjg_wulius.do','jbgk_zzjg_wulius');"
										style="margin-left:22px;">智慧物流研究所</a></li>
									<li id="jbgk_zzjg_qiyes"><a
										href="javascript:ContentJump('jbgk_zzjg_qiyes.do','jbgk_zzjg_qiyes');"
										style="margin-left:22px;">智慧企业研究所</a></li>
									<li><a
										href="javascript:ContentJump('jbgk_zzjg_shujus.do','jbgk_zzjg_shujus');"
										style="margin-left:22px;">智慧数据研究所</a></li>
									<li><a
										href="javascript:ContentJump('jbgk_zzjg_pxnengyuan.do','jbgk_zzjg_pxnengyuan');"
										style="margin-left:22px;letter-spacing:-1px;">平行能源技术创新中心</a></li>
									<li><a
										href="javascript:ContentJump('jbgk_zzjg_pxjiashi.do','jbgk_zzjg_pxjiashi');"
										style="margin-left:22px;letter-spacing:-1px;">平行驾驶技术创新中心</a></li>
									<li><a
										href="javascript:ContentJump('jbgk_zzjg_pxshijue.do','jbgk_zzjg_pxshijue');"
										style="margin-left:22px;letter-spacing:-1px;">平行视觉技术创新中心</a></li>
								</ul></li>
							<li id="jbgk_ywxw_frame"><a
								href="javascript:ContentJump('jbgk_ywxw_frame.do','jjbgk_ywxw_frame');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 院务新闻</a></li>
							<li id=jbgk_mbxz><a
								href="javascript:ContentJump('jbgk_mbxz.do','jbgk_mbxz');"><span
									class="glyphicon glyphicon-chevron-right"
									style="font-size:10px;"></span> 模板下载</a></li>
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<a href="javascript:JumpToIndex();"><span
							style="color:#666666;">首页</span></a> <span
							class="glyphicon glyphicon-chevron-right" style="font-size:10px;"></span><a
							href="javascript:void(0);"> <span style="color:#666666;">组织机构</span></a>
						<span class="glyphicon glyphicon-chevron-right"
							style="font-size:10px;"></span><a href="javascript:void(0);"><span
							style="color:#0066cc;"> 智慧健康研究所</span></a>
					</div>

					<div class=contents>
						<div class="departmenttitle">智慧健康研究所</div>
						<p style="font-size:20px;font-weight:bold;">智慧健康研究所  <img src="Resources/css/contentimg/jiankangs2.jpg" width="50px" height="50px" align="right" /><img src="Resources/css/contentimg/jiankangs3.jpg" width="50px" height="50px" align="right" /></p>
						<br/>
						<p>智慧健康研究所以ACP平行理论为基础，使用人工智能算法、现代信息技术和系统工程，提供与医疗、健康、养老相关的现代化技术解决方案。主要研究方向包括平行辅助诊疗系统、知识库平台、健康监护平台与大数据中心、平行养老体系等。</p>
						<p style="font-size:20px;font-weight:bold;">研发团队</p>
						<p>智慧健康研究所目前拥有核心成员20余名，其中博士3人，硕士7人；美国、英国、俄罗斯等国留学归国人员4人；包括海外智慧医疗系统专家，国内移动电子设备专家，以及临床医学、健康咨询、人工智能算法、大数据分析、计算机软件研发、数据库、信息系统架构等领域的专门人才。</p>
						<p style="font-size:20px;font-weight:bold;">核心业务内容</p>
						<ul type="disc"
							style="font-family: 黑体;font-size: 16px;color: #202020;">
							<li>痛风病平行辅助诊疗系统</li>
							<li>健康监护平台与大数据中心</li>
							<li>平行养老项目</li>
						</ul>
						<p style="text-align:center;"><img src="Resources/css/contentimg/jiankangs1.jpg" width="600px" height="306px"  /></p>
						
					</div>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	
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
