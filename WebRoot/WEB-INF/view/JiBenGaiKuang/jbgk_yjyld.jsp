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

<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<link rel="stylesheet"	href="Resources/css/bootstrap.min.css" />
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>


<script type=text/javascript>
	$(function() {
	sessionStorage.focusUrl_Name = "jbgk_yjyld.do";
		sessionStorage.focusUrl_ID = "jibengk";
		$("#xrldimg").children().not("#lditem1").addClass("touming");
		NavYK();
		$(".fenlei").click(function(){
		    $("#mobileflbox").toggle();
		  });
	});
	
	function ClickXrld(yzx,obj) {
		$("#xrldimg").children().addClass("touming");
		$("#yz").children().hide();
		$("." + yzx).show();
		$(obj).parent().removeClass("touming");
	} 
</script>

<style type="text/css">
	
p{
	 line-height:29px;
	 margin-top: 33px;
	 text-indent: 2em;
	 font-family: "微软雅黑";
	 font-size: 14px;
	 color: #000000;
	 opacity: 0.8;
}
.ldname{
	font-size:14px;
	font-weight:bold;
	color:#093e8e;
}
.touming {
	filter: alpha(opacity = 40);
	-moz-opacity: 0.4;
	opacity: 0.4;
}

.lditem{
	width:14.5%;
	margin:0.3%;
	margin-right:35px;
	float:left; 
	display:inline-block;
	cursor: pointer;	
}
.lditem img{
	 width:100%;	
	 display:inline-block;
	/* -webkit-border-radius: 50%;
	-moz-border-radius:50%;
	-o-border-radius: 50%;
	border-radius: 50%;
	border:2px solid blue; */
	cursor: pointer;	
}
.lditem span{
     width:100%;
	 margin-top: 13px;		
	 font-family: "微软雅黑";
	 font-size: 12px;
	 display:block;
	 text-align:center;
	 color: #000000;
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
				<li><a	href="javascript:ContentJump('jbgk_wyjs.do','jibengk');">院情简介</a></li>
				<li><a	href="javascript:ContentJump('jbgk_fzlc.do','jibengk');">发展历程</a></li>
				<li><a	href="javascript:ContentJump('jbgk_xswyh.do','jibengk');">学术委员会</a></li>
				<li><a	href="javascript:ContentJump('jbgk_sxkxj.do','jibengk');">首席科学家</a></li>
				<li><a	href="javascript:ContentJump('jbgk_yjyld.do','jibengk');">现任领导</a></li>
				<li><a	href="javascript:ContentJump('jbgk_ywxw_frame.do','jibengk');">重要荣誉</a></li>			
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
			<img src="Resources/img/banner_news.png" width="100%"/>
		</div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav>
					<div class=ld>智能院概况</div>
					<div class=secondnav>
						<ul>
							<li id="yjygkjj"><a  
								href="javascript:ContentJump('jbgk_wyjs.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>院情简介</a></li>
							<li id=yjygkxswyh><a
								href="javascript:ContentJump('jbgk_fzlc.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 发展历程</a></li>
							<li id=yjygkxswyh><a
								href="javascript:ContentJump('jbgk_xswyh.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 学术委员会</a></li>
							<li id=yjygkxswyh><a
								href="javascript:ContentJump('jbgk_sxkxj.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 首席科学家</a></li>
							<li id=yjygkxrld><a class=active
								href="javascript:ContentJump('jbgk_yjyld.do','yjygkjj');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 现任领导</a></li>							
							<li id="jbgk_ywxw_frame"><a
								href="javascript:ContentJump('jbgk_ywxw_frame.do','jjbgk_ywxw_frame');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>荣誉奖励</a></li>							
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">现任领导</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>智能院概况</span><span>></span>
							<span>现任领导</span>
						</p>					
					</div>
					<div class=contents>
						<div class="xrldimg" id="xrldimg">							 
						     <div class="lditem" id="lditem1">
						     	 <img src="Resources/img/xrld_1.png" 					     	
						     	 onclick="ClickXrld('yz1',this);"/>						     	
						     	 <span>院长&nbsp;&nbsp;王飞跃</span>			     	 							     	
						     </div>
						     <div class="lditem">
						     	 <img src="Resources/img/xrld_7.png"
						     	 onclick="javascript:ClickXrld('yz7',this);"/>						     	
					     	 	<span>常务副院长&nbsp;&nbsp;王晓</span>			     	 							     	
						     </div>	
						     <!-- <div class="lditem">
						     	 <img src="Resources/img/xrld_2.png"
						     	 onclick="ClickXrld('yz2',this);"/>						     	
						     	 <span>常务副院长&nbsp;&nbsp;康孟珍</span>			     	 							     	
						     </div> -->
						     <div class="lditem">
						     	 <img src="Resources/img/xrld_4.png"
						     	 onclick="javascript:ClickXrld('yz4',this);"/>						     	
						     	 <span>副院长&nbsp;&nbsp;高彦臣</span>			     	 							     	
						     </div>
						    <div class="lditem">
						     	 <img src="Resources/img/xrld_6.png" 
						     	 onclick="javascript:ClickXrld('yz6',this);"/>						     	
						     	 <span>副院长&nbsp;&nbsp;于立平</span>			     	 							     	
						     </div>
						      <!-- <div class="lditem">
						     	 <img src="Resources/img/xrld_5.png"
						     	 onclick="javascript:ClickXrld('yz5',this)"/>						     	
						     	 <span>副院长&nbsp;&nbsp;袁勇</span>			     	 							     	
						     </div> -->
						     <!-- <div class="lditem">
						     	 <img src="Resources/img/xrld_3.png" 
						     	 onclick="javascript:ClickXrld('yz3',this);"/>						     	
						     	 <span>副院长&nbsp;&nbsp;施小博</span>			     	 							     	
						     </div> -->
						     
						</div>
						<div style="clear:both;"></div>     						
						<div id="yz">
							<div class="yz1">
								<p class="ldname">院长：王飞跃 教授</p>
								<p>1990年获美国伦塞利尔理工学院计算机与系统工程博士学位。1990年起在美国亚利桑那大学先后任助教授、终身职副教授和教授。1998年作为国家计划委员会“引入海外杰出人才计划”和中国科学院“百人计划”人才回国工作，曾任中国科学院自动化研究所副所长、复杂系统与智能科学重点实验室主任。现为中国科学院自动化研究所复杂系统管理与控制国家重点实验室主任，中科院自动化所青岛智能产业技术研究中心主任。</p>
								<p>主要研究领域为智能控制、复杂系统、和社会计算等。自上世纪80年代末即为国际智能控制领域的领军学者之一，为该领域的早期开拓者和研究者之一，提出并建立了智能系统的协调结构和理论、语言动力学理论、代理控制方法、复杂系统的ACP方法等，并在工业界得到了广泛的应用。自二十一世纪初，发起并开拓了社会计算、平行控制、平行管理等新的研究领域。在控制、智能系统、复杂系统、社会计算、机器人、自动化力学和数学等领域出版专著七部、发表论文三百余篇。</p>
								<p>曾任多份IEEE和其它主要国际期刊的副主编或编委，现任IEEE Transactions on
									Intelligent Transportation
									Systems、《自动化学报》的主编。曾任ACM理事、WSRI理事、IEEE智能交通系统学会主席（2007–2008年）、旅美科协主席（2005年）、北美竺可桢教育基金会会长（2006–2008年）。现任中国自动化学会副理事长兼秘书长、中国管理现代化研究会系统管理与复杂性科学专业委员会主任、国际自动控制联合会（IFAC）经济和商业系统委员会主席。</p>
								<p style="margin-bottom:32px">1996年获美国Caterpillar技术发明奖，2001年获广东省科学技术奖二等奖和国家杰出青年基金，2004年获北京市科技进步二等奖，2007年获国家自然科学二等奖（唯一完成人）和国际计算机协会（ACM）杰出科学家奖，2009年获IEEE智能交通系统杰出应用奖，2010年获得IEEE智能交通系统团队领先奖，2011年获IEEE智能交通系统杰出研究奖、2010年度中国石油与化工自动化行业科技进步一等奖，2012年获美国机械工程师学会机电嵌入式系统及应用（ASMEMESA）杰出成就奖。现为电气电子工程师学会（IEEE）
									Fellow（2003），国际系统工程学会（INCOSE）Fellow（2005年），国际自动控制联合会（IFAC）Fellow（2007），美国科学促进协会（AAAS）Fellow（2007年），美国机械工程学会（ASME）Fellow（2007年）。</p>
							</div>
							<div class=yz2>
								<p class="ldname">常务副院长：康孟珍 博士</p>
								<p>2003年获中国科学院自动化研究所博士学位。2004 年至2006
									年间在法国国家信息与自动化研究院(INRIA)和荷兰瓦赫宁根大学进行博士后研究。就职于中科院自动化所，复杂系统管理与控制国家重点实验室副研究员，中欧信息、自动化与应用数学联合实验室(LIAMA)
									cPlant课题组负责人。2014年担任中科院自动化所青岛智能产业技术研究中心常务副主任。多年来从事计算植物这一交叉学科课题及其在农林业应用的研究。在国内外期刊和会议发表论文50余篇，曾应邀在多个国际会议做特邀报告。作为大会主席举办第四届IEEE植物生长建模与可视化国际会议，并组织2016本领域联合国际会议。作为Guest
									Editor编辑Ecological Modelling(IF
									2.399)专刊，撰写两部外文专著的章节。2013年起担任北京农业信息化学会理事。作为课题负责人承担了科技部863、国家自然科学基金委课题及子课题、企业横向合作课题等十余项。
								</p>
							</div>
							<div class=yz3>
								<p class="ldname">副院长：施小博 博士</p>
								<p>1996年获美国亚利桑那大学博士学位。1997 ~
									1998年美国亚利桑那大学和美国卡特皮拉公司从事博士后研究；1999 ~
									2012年美国APS电力公司能源控制中心高级计算机系统分析师；2013~2014美国阿克罗工程商务公司总裁。历任美国IEEE国际学术大会编委会委员，IEEE新兴技术与工厂自动化学术会议智能机器人系统组委会委员，美国采矿冶金与勘探学会机械化采矿委员会委员；美国甲骨文数据库执照专家，美国甲骨文数据库系统执照管理员。主要研究方向与成就包括：机器人的行为控制，应用模糊控制和人工神经元在动态、非确定、不准确和不完整环境中的自激式控制，大型轮式铲运机机器人自动挖掘装载的操作控制，动态环境中计算机视觉制导的实时智能控制，机器人及CCD照相机的校正技术；大型发、输、变、配电系统状态的实时监控，实时数据的采集，大型数据的存储、读取与系统响应，数据分析、挖掘与质量控制，不同系统间的数据交换，电子网络的数据安全管理；美中工业技术的引进、消化与吸收，等等。发表有学术专著、论文等20余篇。
								</p>
							</div>
							<div class=yz4>
								<p class="ldname">副院长：高彦臣 博士</p>
								<p>2011年获浙江大学博士学位。曾任国家橡胶与轮胎工程技术研究中心副主任、青岛伊科思技术工程有限公司董事长、国家轮胎工艺与控制工程技术研究中心副主任、中国自动化学会常务理事、中国仪器仪表学会常务理事、中国软件行业协会常务理事、山东省软件工程技术研究中心主任、青岛市工业信息化技术重点实验室副主任、青岛市计算机学会理事、青岛市软件行业协会副理事长；其研发成果获得中国石油和化学工业协会科技进步一等奖、中国仪器仪表学会科学技术一等奖等多个奖项。</p>
							</div>
							<div class=yz5>
								<p class="ldname">副院长：袁勇 博士</p>
								<p>2008年获山东科技大学计算机软件与理论专业工学博士学位，同年9月进入中国科学院自动化研究所，主要从事互联网大数据和商务智能领域的博士后研究工作；2010年出站并进入中国科学院自动化研究所复杂系统管理与控制国家重点实验室。现为中国科学院自动化研究所副研究员，中国人工智能学会社会计算与社会智能专业委员会秘书长，ACM社会与经济计算北京分会主席。</p>
								<p>主要科研成果涵盖互联网舆情大数据、垂直搜索、商务智能、互联网金融、智慧社区等领域。现主持2项国家自然科学基金项目，并作为项目主要成员承担国家自然科学基金重大项目、863重点、中国科学院知识创新工程重要方向项目等共10余项；在国内外重要期刊及会议上发表学术论文50余篇，搜索引擎机制设计方面的研究成果曾获得管理信息系统领域权威国际会议WITS唯一的最佳论文奖；撰写搜索引擎关键字竞价领域的第一部中文理论专著《关键字竞价基础理论与计算实验》。</p>
							</div>
							<div class=yz6>
								<p class="ldname">副院长：于立平</p>
								<p>北京大学理学硕士、加拿大滑铁卢大学电子工程硕士，美国电子及电气工程师协会 IEEE 会员、加拿大安大略省专业工程师协会(PEO)会员。曾就职于加拿大黑莓公司，回国后先后担任青岛计世智岛软件园开发有限公司、青岛奥克生物开发有限公司总经理。</p>
								<p>在移动通信技术领域工作多年，具有现代无线通讯终端研发、大规模生产、测试、调试的经验和技能，具有独立的科研与创新能力以及丰富的高科技跨国公司工作经验，以及丰富的跨国公司工作经验。获得山东省省级高端项目外国专家、青岛市海外高层次人才、“智岛计划”领军人才等荣誉奖励。</p></p>
							</div>
							<div class=yz7>
								<p class="ldname">常务副院长：王晓 博士</p>
								<p>2016年获得中国科学院自动化研究所社会计算博士学位。是国内社会计算领域第一位毕业的博士研究生。2016年7月起在中国科学院自动化研究所任助理研究员、副研究员。2017年4月至今，先后任青岛智能产业技术研究院院长助理、副院长、常务副院长。</p>

								<p>主要研究领域为社会计算，平行驾驶，人工智能，社会网络结构分析及其内容挖掘，知识自动化。研究成果在国际、国内刊物发表论文30余篇，并被SCI/EI收录。其中作为共同第一作者所攥论文：“ Parallel Testing of Vehicle Intelligence via Virtual-Real Interaction”，于2019年3月27日作为焦点论文发表在《科学•机器人学》(Science Robotics)。译著三部：《社会机器》（第一译者）；《机器崛起》（第一译者）；《决策知识自动化》（第二译者）。</p>

								<p>现任《IEEE Transactions on Intelligent Transportations Systems》、《IEEE/CAA Journal of Automatica Sinica》、《IEEE Transactions on Computational Social Systems》等多个国际刊物担任审核稿人。担任中国自动化学会混合智能专委会副秘书长，中国自动化学会智慧教育专委会副主任委员，青岛市人工智能学会副理事长等。</p>

								<p style="margin-bottom:32px">2017年，博士毕业论文《动态网群组织CMOs 建模分析与研究》荣获中国自动化学会全国优秀博士学位论文奖；2018年，入选中国科协青年人才托举工程；2018年，“平行交通管理与控制关键技术及应用”荣获中国自动化学会科学技术进步奖特等奖；2018年，《基于数字四胞胎的平行驾驶系统及应用》荣获ABB智能科学与技术论文大赛特等奖；2018年，荣获中国自动化学会小微创业奖等多个奖项。</p>
								
								
							</div>
						</div>
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
