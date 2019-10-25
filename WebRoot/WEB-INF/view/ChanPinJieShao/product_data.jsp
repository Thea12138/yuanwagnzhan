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
<!-- <link type="text/css" rel="stylesheet" href="Resources/css/style.css" /> -->
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<link type="text/css" rel="stylesheet"	href="Resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>

<script type=text/javascript>
	$(function() {
		$(".fenlei").click(function(){
		    $("#mobileflbox").toggle();
		  });
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
				<li><a href="javascript:ContentJump('product_industry.do','yjygkjj');">智能产业</a></li>
				<li><a href="javascript:ContentJump('product_manufacture.do','yjygkjj');">智能制造</a></li>		
				<li><a href="javascript:ContentJump('product_driving.do','yjygkjj');">平行驾驶</a></li>
				<li><a href="javascript:ContentJump('product_traffic.do','yjygkjj');">平行交通</a></li>
				<li><a href="javascript:ContentJump('product_data.do','yjygkjj');">视频大数据</a></li>
				<li><a href="javascript:ContentJump('product_health.do','yjygkjj');">智慧医疗</a></li>
				<li><a href="javascript:ContentJump('product_logistics.do','yjygkjj');">智慧物流</a></li>
				<li><a href="javascript:ContentJump('product_education.do','yjygkjj');">智慧教育</a></li>
				<li><a href="javascript:ContentJump('product_argiculture.do','yjygkjj');">智慧农业</a></li>
				<li><a href="javascript:ContentJump('product_drone.do','yjygkjj');">无人机</a></li>
				<li><a href="javascript:ContentJump('product_energy.do','yjygkjj');">平行能源</a></li>
				<li><a href="javascript:ContentJump('product_media.do','yjygkjj');">平行传媒</a></li>		
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
							<li id="yjygkjj"><a class="active"
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
							<li id="yjygkjj"><a 
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
						<span class="nav_title">视频大数据</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>产品介绍</span><span>></span>
							<span>视频大数据 </span>
						</p>					
					</div>
					<div class="contents">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/itme_data.jpg"/>
							</div>
							<div class="productsum">
								<p class="subtitlec">
									<span>视频大数据</span><br>
									智慧数据研究所及其孵化公司青岛传视智能科技有限公司专注于提升互联网视频的收视体验，以“服务于互联网上的每一次视频播放”为自身使命，通过搭建的混合（公有＋私有）视频大数据云平台为互联网视频行业客户的系统运维（视频收视体验）和业务运营（盈利能力）提供数据服务。
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p>智慧数据研究所及其孵化公司青岛传视智能科技有限公司专注于提升互联网视频的收视体验，以“服务于互联网上的每一次视频播放”为自身使命，通过搭建的混合（公有＋私有）视频大数据云平台为互联网视频行业客户的系统运维（视频收视体验）和业务运营（盈利能力）提供数据服务。传视也为互联网视频分发链上的其他环节，比如内容传输网络（Content Delivery Network）和网络运营商（ISP）提供实时的、历史的性能评估和故障诊断服务。</p>
						<p class="protitlt">研发团队</p>
						<p style="margin-top:0px;">研究所执行所长张进宇, 北京大学计算机科学博士；2007年中国－卡内基梅隆大学赫伯.西蒙访问学者；Conviva公司高级软件工程师，架构师。2016年开始担任青岛智能产业技术研究院智慧数据研究所执行所长。团队现有成员7人，其中科研人员5人。</p>
						<p class="protitlt">基于全局优化的商业决策智能平台</p>
						<p style="margin-top:0px;">传视视频大数据云服务平台为其客户重新赢得了对视频用户收视体验的控制权。通过完全覆盖的、持续的和精准的数据采集和大数据分析，传视为客户提供针对视频生命周期每一个环节的可视化分析工具。客户能够实时地掌握每一个用户的收视体验，并和传视的行业标杆（benchmark）相比较。该行业标杆基于传视每年监测的互联网上超过500亿次的视频播放。传视也提供针对视频用户收视体验的自动优化服务，以延长用户观看时间，提升品牌忠实度，为客户的互联网视频业务增强盈利能力。</p>
						
						<p class="protitlt">传视凤凰：采用全球大数据为客户提供实时商业智能</p>
						<p style="margin-top:0px;">1.从“卡断情况”、“启动成功率”和“视频清晰度”三个方面提供与行业标杆的相对比较。</p>
						<p>2.利用视频播放客户端实际的市场份额为不同国家、地区和不同的网络接入制定视频播放客户端的开发和部署计划，大大地简化这一重要的战略决策过程。</p>						
						<p>3.对CDN-ISP（内容分发网络-网络运营商）的配对性能评估。这些数据能够帮助客户为其来自不同地域的用户找到最佳的视频分发资源，让视频内容更流畅的分发。</p>

					
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
