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
<!-- <link type="text/css" rel="stylesheet" href="Resources/css/style.css" /> -->
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<link type="text/css" rel="stylesheet"	href="Resources/css/bootstrap.min.css" />
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>

<!-- <script type=text/javascript>
	$(function() {
		sessionStorage.focusUrl_Name = "jbgk_wyjs.do";
		sessionStorage.focusUrl_ID = "jibengk";
		NavCXFH();
		parent.setiHeight($(".rightcontent").height() + 240);
	});
</script> -->

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
		.fuserver{
			border-top:1px solid #ededed;
			padding:0px;
		}
		.fuserver,.fuserver li{
			list-style:none;
			border-bottom:1px solid #ededed;
			min-height:47px;
			line-height:47px;
		} 
		.show{
		    margin-top: 20px;
		    margin-right: 20px;
		    float: right;
			width:14px;
			height:7px;
			background:url(Resources/img/show.png) no-repeat;}
		.showbox{
		background:#f7f7f7;
		padding:10px;
		display:none;}

</style>
<script>
$(function() {
	$(".fenlei").click(function(){
	    $("#mobileflbox").toggle();
	  });
	/* $(".handle").click(function(){
		$(this).siblings().children(".showbox").hide();
		 $(this).children(".showbox").toggle();
	}); */
});	 
</script>
</head>

<body style="overflow:auto;overflow-x:hidden;margin:0 0">
	<div id="header" class="header">
		<div class="headertop">
			<div class="headerinner">
				<a href="javascript:PageJump('index');">
					<img src="Resources/img/ic_logo.png" height="40px"/>	
				</a>
				<div class="mobile" style="float:right;">
					<img src="Resources/img/mobile/fenlei.png" class="fenlei"/>
				</div>		
			</div>
		</div>
		<div class="nav mobile" id="mobileflbox" style="display:none;">
			<ul class="nav-main">
				<li class="home"><a href="javascript:PageJump('index');">首页 </a></li>
				<li><a	href="javascript:ContentJump('cxfh_fhfw.do','cxfhframe');">孵化服务</a></li>					
				<li><a	href="javascript:ContentJump('cxfh_zcfc.do','cxfhframe');">众创风采</a></li>
				<li><a	href="javascript:ContentJump('cxfh_zcjj.do','cxfhframe');">众创基金</a></li>
				<li><a	href="javascript:ContentJump('cxfh_tztg_frame.do','cxfhframe');">通知通告</a></li>
			</ul>
		</div>
		<div class="nav computer" id="nav">
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

					</ul></li>
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
						<!-- <li><a
							href="javascript:ContentJump('cxfh_hdrl.do','cxfhframe');">活动日历</a></li> -->
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
			<img src="Resources/img/banner_cxfh.png" width="100%"/>
		</div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav>
					<div class=ld>产业孵化</div>
					<div class=secondnav>
						<ul>
							<li><a class="active"
								href="javascript:ContentJump('cxfh_fhfw.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 孵化服务</a></li>	
							<li><a
								href="javascript:ContentJump('cxfh_zcfc.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 众创风采</a></li>	
							<li><a
								href="javascript:ContentJump('cxfh_zcjj.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 众创基金</a></li>											
							
							<!-- <li><a
								href="javascript:ContentJump('cxfh_hdrl.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 活动日历</a></li> -->
							<li><a 
								href="javascript:ContentJump('cxfh_tztg_frame.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 通知通告</a></li>											
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">孵化服务</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>产品孵化</span><span>></span>
							<span>孵化服务 </span>
						</p>					
					</div>
					<div class="contents">
						<p>青岛智能院采用“投资+全方位孵化”服务模式，为智能领域的大学生、科研人员和青岛智能院创业者等创客个人和团体提供创业辅导、管理咨询、交流培训、项目推介、市场推广、融资投资、人才引进、技术支持等专业服务，致力于搭建多元化产业孵化服务体系，培育高成长性的智能科技创业公司，加快推动智能产业发展。服务内容包括：</p>
						<ul class="fuserver">
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">①创业辅导。</span>包含创业咨询、政策辅导、手续代理等内容。
									<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">②管理咨询。</span>包含财务代理、法律咨询、专利服务等内容。
									<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">③交流培训。</span>包含管理培训、技术交流、专家咨询等内容。
									<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">④项目推介。</span>包含成果展示、项目申报、新闻发布等内容。
								<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑤市场推广。</span>包含展览会议、产品对接、信息咨询等内容。
								<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑥融资投资。</span>包含银企对接、孵化基金、风险投资等内容。
								<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑦人才引进。</span>包括校企合作、猎头服务、人才招聘等内容
								<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑧技术支持。</span>包含技术平台、检验测试、技术联盟等内容。
								<!-- <div class="show"></div> -->
								</div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
						</ul>
						<img src="Resources/img/fhfw.jpg" style="width:100%;"/>	
					</div>
					
				</div>
			</div>
		</div>
					
		<div class="clear"></div>
	</div>
	
	<div class="foot">
		<div class="foottext computerb"></div>
		<div class="footnav mobile" style="text-align:center;">					
			<img src="Resources/img/ic_code.png" width="40%"/>			
		</div>
		<div class="footnav computerb">					
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
					<div class="footTitle">产业孵化<div class="footline"></div></div>
					<ul>
						<li><a
							href="javascript:ContentJump('cxfh_fhfw.do','cxfhframe');">孵化服务</a></li>					
						<li><a
							href="javascript:ContentJump('cxfh_zcfc.do','cxfhframe');">众创风采</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_zcjj.do','cxfhframe');">众创基金</a></li>
						<!-- <li><a
							href="javascript:ContentJump('cxfh_hdrl.do','cxfhframe');">活动日历</a></li> -->
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
		<div class="footlink computerb">
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
		<div class="copyright computerb">
			<span >青岛智能产业技术研究院 版权所有 鲁ICP备15005983号-1</span>
		    <span class=address>地址：青岛高新区智力岛路1号创业大厦B座26层</span>
		</div>
		<div class="copyright mobile">
			<span >青岛智能产业技术研究院 版权所有 鲁ICP备15005983号-1</span><br/>
		    <span class=address>地址：青岛高新区智力岛路1号创业大厦B座26层</span>
		</div>
		
	</div>
	<div class="clear"></div>
</body>

</html>
