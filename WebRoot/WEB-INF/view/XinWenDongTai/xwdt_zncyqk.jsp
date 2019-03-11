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
<script type="text/javascript" src="Resources/js/pages.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<script type="text/javascript" src="Resources/js/getFrameHeight.js"></script>

<script type="text/javascript">
	$(function() {
	    sessionStorage.focusUrl_Name = "xwdt_zncyqk.do";
		sessionStorage.focusUrl_ID = "xwdtyjydtframe";
		NavXWDT();
		parent.setiHeight($(".rightcontent").height());
	});
</script>
<style type="text/css">
.contenttitle {
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
}

.jianjie {
	font-size: 14px;
}

.zazhibjb {
	width: 780px;
	height: 550px;
}

.jjleft {
	width: 370px;
	height: 550px;
	float: left;
}

.jjleftconent {
	width: 320px;
	height: 550px;
	margin-left: 50px;
	margin-top: 20px;
}

.jjright {
	width: 390px;
	height: 400px;
	margin-top: 165px;
	float: right;
}

.lianxiwm {
	width: 780px;
	height: 600px;
}

.lxwmcontent {
	width: 700px;
	height: 550px;
	margin-left: 40px;
	font-size: 13px;
	line-height: 20px;
	padding-left: 15px;
}
</style>
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
					<div class=ld>新闻动态</div>
					<div class=secondnav>
						<ul>
							<li id="xwdttztgframe"
								><a
								href="javascript:ContentJump('xwdt_tztg_frame.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span> 通知通告</a></li>
							<li id="xwdtldscframe"><a
								href="javascript:ContentJump('xwdt_ldsc_frame.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span> 领导视察</a></li>
							<li id="xwdtzqdjframe"><a
								href="javascript:ContentJump('xwdt_zqdj_frame.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span> 政企对接</a></li>
							<li id="xwdtygfcframe"><a
								href="javascript:ContentJump('xwdt_ygfc_frame.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span> 员工风采</a></li>
							<li id="xwdtzyryframe"><a
								href="javascript:ContentJump('xwdt_zyry_frame.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span> 重要荣誉</a></li>
							<li id="xwdthyqbjbframe"><a
								href="javascript:ContentJump('xwdt_hyqbjb_frame.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span> 行业情报简报</a></li>
							<li id="intelligentinduestries"><img src="Resources/css/img/juset.jpg"/><a
								href="javascript:ContentJump('xwdt_zncyqk.do');"><span
								class="glyphicon glyphicon-chevron-right"
								style="font-size:10px;"></span>
									智能产业期刊</a></li>
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<a href="javascript:JumpToIndex();"><span
							style="color:#666666;">首页</span></a> <span
							class="glyphicon glyphicon-chevron-right" style="font-size:10px;"></span> <a
							href="javascript:void(0);"><span style="color:#0066cc;">智能产业期刊</span></a>
					</div>
					<div class=contents>
						<div class=contenttitle>《智能产业》</div>
						<div class=jianjie>
							<span  style="font-weight:bold;font-size:18px;">简介</span>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;《智能产业》Intelligent
								Industries（ISSN:2378-0924，季刊）由青岛智能产业技术研究院主办，是覆盖智慧社会、智慧企业、智慧农业、智慧健康、智能物流、智能系统、智能网络、智能制造、智能机器人等智能产业领域的国际中文行业期刊。报道智能产业信息，聚焦智能产业热点，透视智能产业风向，引领智能产业发展,
								为政府决策提供事实和依据，为创业发展提供信息和商机、为各界学者提供交流学习的平台。</p>
						</div>
						<div class=zazhibjb>
							<div class=jjleft>
								<span style="font-weight:bold;font-size:18px;">杂志编辑部</span>
								<div class=jjleftconent>
									<table cellspacing=0px border=0px style="font-size:14px;">
										<tr>
											<td
												style="font-weight:bold;height:35px;border-top:1px solid #333;line-height:35px;">主管/主办</td>
											<td style="width:50px;border-top:1px solid #333;"></td>
											<td style="border-top:1px solid #333;">青岛智能产业技术研究院</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">出版单位</td>
											<td></td>
											<td>青岛智能产业技术研究院</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">杂志总编辑</td>
											<td></td>
											<td>王飞跃</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">副总编辑</td>
											<td></td>
											<td>康孟珍 施小博 高彦臣</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">执行副总编辑</td>
											<td></td>
											<td>宫晓燕 杨静</td>
										</tr>
										<tr style="border-top:1px solid #333;">
											<td
												style="color:red;height:30px;line-height:30px;border-bottom:1px solid #333;">采编</td>
											<td style="border-bottom:1px solid #333;"></td>
											<td style="border-bottom:1px solid #333;"></td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">新闻中心主任</td>
											<td></td>
											<td>杨静</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">透视栏目主编</td>
											<td></td>
											<td>宫晓燕</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">聚焦栏目主编</td>
											<td></td>
											<td>刘希未</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:30px;">资讯栏目主编</td>
											<td></td>
											<td>荆思凤</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">论坛栏目主编</td>
											<td></td>
											<td>袁勇</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">汇编栏目主编</td>
											<td></td>
											<td>董博</td>
										</tr>
										<tr>
											<td style="font-weight:bold;height:35px;line-height:35px;">创意栏目主编</td>
											<td></td>
											<td>欧梦蕾</td>
										</tr>
									</table>
								</div>
							</div>
							<div class=jjright>
								<table cellspacing=0px border=0px style="font-size:14px;">
									<tr>
										<td
											style="color:red;height:35px;border-bottom:1px solid #333;line-height:35px;">发行</td>
										<td style="width:50px;border-bottom:1px solid #333;"></td>
										<td style="border-bottom:1px solid #333;"></td>
										<td style="border-bottom:1px solid #333;width:130px;"></td>
									</tr>
									<tr>
										<td style="font-weight:bold;height:35px;">发行部主任</td>
										<td></td>
										<td>黄松筠</td>
									</tr>
									<tr>
										<td style="font-weight:bold;height:35px;line-height:35px;">主任助理</td>
										<td></td>
										<td>胡亚楠</td>
									</tr>
									<tr>
										<td
											style="color:red;height:35px;border-bottom:1px solid #333;line-height:35px;">广告</td>
										<td style="width:50px;border-bottom:1px solid #333;"></td>
										<td style="border-bottom:1px solid #333;"></td>
										<td style="border-bottom:1px solid #333;width:130px;"></td>
									</tr>
									<tr>
										<td style="font-weight:bold;height:35px;line-height:35px;">广告部主任</td>
										<td></td>
										<td>战德成</td>
									</tr>
									<tr>
										<td style="font-weight:bold;height:35px;line-height:35px;">客户经理</td>
										<td></td>
										<td>王钦翔</td>
									</tr>
									<tr>
										<td style="font-weight:bold;height:35px;line-height:35px;">渠道经理</td>
										<td></td>
										<td>杨华成</td>
									</tr>
								</table>



							</div>
						</div>
						<div class=lianxiwm>
							<span style="font-weight:bold;font-size:18px;">联系我们</span>
							<div class=lxwmcontent>
								<img src="Resources/css/contentimg/lxwmlogo.png" /><br /> <span><b>编辑部地址：</b>山东省青岛市高新区智力岛路1号创业大厦B座26层</span><br />
								<span><b>邮编：</b>266111</span><br /> <span><b>Email：</b>intelligentinduestries@qaii.ac.cn</span><br />
								<span><b>微信订阅号：</b>telligentIndustries</span><br /> <span><b>电话：</b>0532-68012033</span><br />
								<span><b>网址：</b>www.qaii.cn/intelligentinduestries</span>
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
