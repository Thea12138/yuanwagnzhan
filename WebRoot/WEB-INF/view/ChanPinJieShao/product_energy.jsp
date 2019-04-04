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
<!-- <link type="text/css" rel="stylesheet" href="Resources/css/style.css" /> -->
<link type="text/css" rel="stylesheet"	href="Resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>

<script type=text/javascript>
	$(function() {
		sessionStorage.focusUrl_Name = "jbgk_fzlc.do";
		sessionStorage.focusUrl_ID = "jibengk";
		NavCPFA();
		parent.setiHeight($(".rightcontent").height() + 240);
	});
</script>

<style>
.divtitle {
			padding-top: 20px;
		    padding-bottom: 10px;
			line-height: 36px;
			font-family: '微软雅黑';
			font-size: 24px;
		    
			text-align: center;
			color: #000000;
			opacity: 0.8;
		}
	
		p{
		 line-height:29px;
		 margin-top: 33px;
		 text-indent: 2em;
		 font-family: "微软雅黑";
		 font-size: 16px;
		 color: #000000;
		 opacity: 0.8;
		}
		.img{
			width: 540px;
			margin: 32px auto 6px;
		}
		video{
			width: 540px;
			margin: 32px auto 6px;
		}
		.img_title{
			font-family: "微软雅黑";
			font-size: 10px;
			text-align: center;
			margin-top: 10px;
			color: #000000;
			opacity: 0.8;
			
		}

</style>

</head>

<body style="overflow:auto;overflow-x:hidden;margin:0 0">
	<div id="header" class="header">
		<div class="headertop">
			<div class="headerinner">
				<img src="Resources/img/ic_logo.png" height="40px"/>	
				<!-- <div class=language>
					<a class="lanActive" href="index.do">中文</a> | <a href="index_e.do">English</a>
				</div> -->			
			</div>
		</div>
		<div class="nav" id="nav">
			<ul class="nav-main" id="nav-main">
				<li id="home" class="home"><a
					href="javascript:PageJump('index');">首页 </a></li>
				<li id="jibengk" class="jibengk"><a
					href="javascript:PageJumpNo('jibengk');">智能院概况</a>
					<ul id="xiala1" class="xiala1">
						<li id="yjygkjj"><a
							href="javascript:ContentJump('jbgk_wyjs.do','jibengk');">院情简介</a></li>
						<li id="yjygkmbxz"><a
							href="javascript:ContentJump('jbgk_fzlc.do','jibengk');">发展历程</a></li>
						<li id="zzjgxswyh"><a
							href="javascript:ContentJump('jbgk_xswyh.do','jibengk');">学术委员会</a></li>
						<li id="yjygkxrld"><a
							href="javascript:ContentJump('jbgk_sxkxj.do','jibengk');">首席科学家</a></li>
						<li id="zzjg_zzjg_yanfazx"><a
							href="javascript:ContentJump('jbgk_yjyld.do','jibengk');">现任领导</a></li>
						<li id="yjygkywxw"><a
							href="javascript:ContentJump('jbgk_ywxw_frame.do','jibengk');">重要荣誉</a></li>

					</ul>
				</li>
				<li id="xwdtyjydtframe" class="xwdtyjydtframe"><a
					href="javascript:PageJumpNo('xwdtyjydtframe');">新闻中心</a>
					<ul class="xiala2" id="xiala2">						
						<li><a
							href="javascript:ContentJump('xwdt_tztg_frame.do','xwdtyjydtframe');">通知通告</a></li>	
						<li><a
							href="javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');">领导视察</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zqdj_frame.do','xwdtyjydtframe');">合作交流</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ygfc_frame.do','xwdtyjydtframe');">员工风采</a></li>						

					</ul>
				</li>
				<li id="cpfayyhygl" class="cpfayyhygl"><a href="javascript:ContentJump('product_industry.do','kyhdyjfx');">产品介绍</a></li>
				<li id="kyhdyjfx" class="kyhdyjfx"><a
					href="javascript:PageJumpNo('kyhdyjfx');">科学研究</a>
					<ul class="xiala3" id="xiala3">
						<li><a
							href="javascript:ContentJump('kyhd_kyfx.do','kyhdyjfx');">科研方向</a></li>					
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">科研成果</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">知识产权</a></li>
					</ul>
				</li>			
				<li id="cxfhframe"><a
					href="javascript:PageJumpNo('cxfhframe');">产业孵化</a>
					<ul class="xiala4" id="xiala4">
						<li><a
							href="javascript:ContentJump('cxfh_fhfw.do','cxfhframe');">孵化服务</a></li>					
						<li><a
							href="javascript:ContentJump('cxfh_zcfc.do','cxfhframe');">众创风采</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_zcjj.do','cxfhframe');">众创基金</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_hdrl.do','cxfhframe');">活动日历</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_tztg_frame.do','cxfhframe');">通知通告</a></li>
					</ul>
				</li>
				<li id="contactus"><a 
					href="javascript:PageJumpNo('contactus');">联系我们</a>
					<ul class="xiala5" id="xiala5">
						<li><a
							href="javascript:ContentJump('lxwm_zxns.do','contactus');">招贤纳士</a></li>					
						<li><a
							href="javascript:ContentJump('lxwm_business.do','contactus');">商务</a></li>
					</ul>
				</li>
			</ul>

		</div>
	</div>
	<div class="clear"></div>
	
	<div class=pagecontent>
		<div class=pageimg>
			<img src="Resources/img/banner_product.png" width="100%"/>
		</div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav>
					<div class=ld>业务介绍</div>
					<div class=secondnav>
						<ul>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_industry.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>智能产业</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_manufacture.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>智能制造</a></li>		
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_driving.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>平行驾驶</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_traffic.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>平行交通</a></li>
							<li id="yjygkjj"><a
								href="javascript:ContentJump('product_data.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>视频大数据</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_health.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>智慧医疗</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_logistics.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>智慧物流</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_education.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>智慧教育</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_argiculture.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>智慧农业</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_drone.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>无人机</a></li>
							<li id="yjygkjj"><a class="active"
								href="javascript:ContentJump('product_energy.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>平行能源</a></li>
							<li id="yjygkjj"><a 
								href="javascript:ContentJump('product_media.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>平行传媒</a></li>
													
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">平行能源</span>
						<p>
						    <img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>产品介绍</span><span>></span>
							<span>平行能源</span>
						</p>					
					</div>
					<div class="contents">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/itme_pxny.jpg" />
							</div>
							<div class="productsum">
								<p class="subtitlec">
									<span>平行能源</span><br>
									平行能源创新技术中心以ACP平行理论为基础，应用人工智能算法、现代信息技术和系统工程，提供与能源、电网、新能源智慧城市相关的现代化技术解决方案。
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p>平行能源创新技术中心以ACP平行理论为基础，应用人工智能算法、现代信息技术和系统工程，提供与能源、电网、新能源智慧城市相关的现代化技术解决方案。主要研究方向包括平行能源管理系统、知识库平台、电网运行管理平台与大数据中心、电动车能量管理平台、核电人机一体化智能运行与安全保障平台、能源区块链技术开发等。中心还拥有区域能源系统一体化解决方案，涵盖区域能源系统的规划、总体技术方案设计、关键技术研发、系统集成、工程和运营服务，以及园区能源系统管理诊断、升级等全产业链服务。</p>
						<p class="protitlt">研发团队</p>
						<p style="margin-top:0px;">平行能源创新技术中心目前拥有国内知名高校和海外归来的专家教授、海外留学博士等10余人。中心人才包括国际能源分析管理系统专家，国内电网设备专家，以及能源互联网、核电站仪控、人工智能算法、大数据分析、计算机软件开发、数据库、区块链技术、信息系统架构等领域的专门人才。</p>
						
						<p class="protitlt">核心业务内容</p>
						<div style="padding-left: 2rem;line-height: 29px;font-size: 16px;color: #000000;opacity: 0.8;">
						• &nbsp;平行智慧能源管理系统  <br/> 
						• &nbsp;平行智能电网监控管理平台与大数据中心  <br/> 
						• &nbsp;平行核电人机一体化智能运行与安全保障平台  <br/>           
						• &nbsp;平行能源区块链技术平台
						</div>
						<p class="protitlt">平行智慧能源管理系统</p>
						<p style="margin-top:0px;">平行智慧能源管理系统目前主要用于开发区微电网系统管理，目前是青岛开发区智慧能源互联网试点项目，将积极探索以平行理论科学为指导依据，以天然气清洁能源+可再生能源+能量循环再开发为核心，利用物联网技术和智能控制与优化技术，将能源生产、储运、应用、回收和能量循环等各环节进行互联互通，集成能源系统的规划、总体技术方案设计、关键技术研发、系统集成、工程和运营服务等功能，实现精确计量以及多种能源形式灵活交易与需求侧响应。</p>
						<div class="img">
							<img src="Resources/img/cpjs/image038.png" style="max-width:100%;" />
						</div>
						<p class="protitlt">系统特点</p>
						<p style="margin-top:0px;">一体化智能管理及综合展示基于平行理论、人工智能新技术、微电网与新能源、智能配能、智能用能、能源管理的有机结合，实现平行智慧能源管理中心各个环节的优化与自适应互动控制、用能的智能化和高效化，以及互动展示。</p>
						<p class="protitlt">平行智能电网监控管理平台与大数据中心</p>
						<p style="margin-top:0px;">以平行理论为指导，建立开放式电网监控及管理研究平台。针对电网所有涉及到的流程设备步骤，通过物联网技术、智能控制与优化技术、传感与量测技术、电力电子技术以及仿真分析与决策控制技术，对智能电网涉及到的新能源发电及并网、输电网、配电网、用电、调度、气候与环境以及政策与社会等方面进行智能算法分析，决策辅助，最优化计算实验；通过大数据云平台探索大数据分析、智能挖掘等手段，最终实现一个高度智能化的电网管理及研究平台，提高社会效益。</p>
						<div class="img">
							<img src="Resources/img/cpjs/image040.png" style="max-width:100%;" />
						</div>
						
						<p class="protitlt">平行核电人机一体化智能运行与安全保障平台</p>
						<p style="margin-top:0px;">平行核电人机一体化智能运行与安全保障平台是核电站的“神经中枢”，控制着核电站几百个系统的人机交互、近万个设备的运行和各类工况处理过程，对于保证核电站智能化、安全、可靠、稳定运行发挥着重要作用。以平行理论为指导，平台正在对核岛、常规岛、核电站辅助设施（BOP）全系列仪控系统、辅助应用、试验平台、和应急指挥系统等方向进行人机一体化智能系统开发。力争发展成为国内核电站持续的、可信赖的系统解决方案提供者。</p>
						<p class="protitlt">平行能源区块链技术平台</p>
						<p style="margin-top:0px;">平行能源区块链技术将从当前的分布式支付技术、智能合约技术、去中心化应用技术、去中心化自主组织技术，发展到基于区块链的更深层次的智能化管控技术。如基于平行系统思想和ACP方法的平行区块链管控技术，遵从于默顿定律的、基于DPP（描述、预测、诱导）思想的平行动态规划技术等，新思想与技术将引导和驱动区块链所承载的能源系统，从而达到能源管控系统所期望的状态。</p>
					
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
				<li>
					<div class="footTitle">首页<div class="footline"></div></div>
				</li>
				<li>
					<div class="footTitle">智能院概况<div class="footline"></div></div>
					<ul>
						<li ><a
							href="javascript:ContentJump('jbgk_wyjs.do','jibengk');">院情简介</a></li>
						<li ><a
							href="javascript:ContentJump('jbgk_fzlc.do','jibengk');">发展历程</a></li>
						<li ><a
							href="javascript:ContentJump('jbgk_xswyh.do','jibengk');">学术委员会</a></li>
						<li ><a
							href="javascript:ContentJump('jbgk_sxkxj.do','jibengk');">首席科学家</a></li>
						<li ><a
							href="javascript:ContentJump('jbgk_yjyld.do','jibengk');">现任领导</a></li>
						<li ><a
							href="javascript:ContentJump('jbgk_ywxw_frame.do','jibengk');">荣誉奖励</a></li>
					</ul>
				</li>
				<li>
					<div class="footTitle">新闻中心<div class="footline"></div></div>
					<ul>
						<li><a
							href="javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');">通知公告</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');">领导视察</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zqdj_frame.do','xwdtyjydtframe');">合作交流</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ygfc_frame.do','xwdtyjydtframe');">员工风采</a></li>
					</ul>
				</li>
				<li>
					<div class="footTitle">科学研究<div class="footline"></div></div>
					<ul>
						<li><a
							href="javascript:ContentJump('kyhd_kyfx.do','kyhdyjfx');">科研方向</a></li>					
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">科研成果</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">知识产权</a></li>
					</ul>
				</li>
				<li>
					<div class="footTitle">产品介绍<div class="footline"></div></div>
					<ul class="small">
						<li><a
							href="javascript:ContentJump('product_industry.do','kyhdyjfx');">智能产业</a></li>					
						<li><a
							href="javascript:ContentJump('product_manufacture.do','kyhdyjfx');">智能制造</a></li>
						<li><a
							href="javascript:ContentJump('product_driving.do','kyhdyjfx');">平行驾驶</a></li>
						<li><a
							href="javascript:ContentJump('product_traffic.do','kyhdyjfx');">平行交通</a></li>
						<li><a
							href="javascript:ContentJump('product_data.do','kyhdyjfx');">视频大数据</a></li>
						<li><a
							href="javascript:ContentJump('product_health.do','kyhdyjfx');">智慧医疗</a></li>
						<li><a
							href="javascript:ContentJump('product_logistics.do','kyhdyjfx');">智慧物流</a></li>
						<li><a
							href="javascript:ContentJump('product_education.do','kyhdyjfx');">智慧教育</a></li>
						<li><a
							href="javascript:ContentJump('product_argiculture.do','kyhdyjfx');">智慧农业</a></li>
						<li><a
							href="javascript:ContentJump('product_energy.do','kyhdyjfx');">平行能源</a></li>
						<li><a
							href="javascript:ContentJump('product_media.do','kyhdyjfx');">平行传媒</a></li>
						<li><a
							href="javascript:ContentJump('product_drone.do','kyhdyjfx');">无人机</a></li>									
					</ul>
				</li>
				<li>
					<div class="footTitle">创新孵化<div class="footline"></div></div>
					<ul>
						<li><a
							href="javascript:ContentJump('cxfh_fhfw.do','cxfhframe');">孵化服务</a></li>					
						<li><a
							href="javascript:ContentJump('cxfh_zcfc.do','cxfhframe');">众创风采</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_zcjj.do','cxfhframe');">众创基金</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_hdrl.do','cxfhframe');">活动日历</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_tztg_frame.do','cxfhframe');">通知公告</a></li>
					</ul>
				</li>
				<li>
					<div class="footTitle">联系我们<div class="footline"></div></div>
					<ul>
						<li><a
							href="javascript:ContentJump('lxwm_zxns.do','contactus');">招贤纳士</a></li>					
						<li><a
							href="javascript:ContentJump('lxwm_business.do','contactus');">商务</a></li>
					</ul>
				</li>
				<li style="width: 13.8%;">
					<img src="Resources/img/ic_code.png" width="100%"/>
				</li>
			</ul>			
		</div>
		<div class="footlink">
			<ul>
				<li><span style="color:#fff;">友情链接：</span></li>
				<li><a href="http://www.cas.cn/" target="_blank">中国科学院</a></li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.ia.cas.cn/" target="_blank">中国科学院自动化研究所</a></li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.compsys.ia.ac.cn/" target="_blank">复杂系统管理与控制国家重点实验室</a>
				</li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.casc.ac.cn/" target="_blank">东莞科学院云计算产业技术创新与育成中心</a></li>

			</ul>
		</div>
		<div class="copyright">
			<span >青岛智能产业技术研究院 版权所有 鲁ICP备15005983号-1</span>
		    <span class=address>地址：青岛高新区智力岛路1号创业大厦B座26层</span>
		</div>
		
	</div>
	<div class="clear"></div>
</body>

</html>
