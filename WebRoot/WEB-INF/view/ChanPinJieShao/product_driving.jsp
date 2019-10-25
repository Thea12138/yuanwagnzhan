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
							<li id="yjygkjj"><a class="active"
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
						<span class="nav_title">平行驾驶</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>产品介绍</span><span>></span>
							<span>平行驾驶 </span>
						</p>					
					</div>
					<div class="contents">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/item_industry.png" />
							</div>
							<div class="productsum">
								<p class="subtitlec">
									<span>平行驾驶</span><br>
									我院孵化公司青岛慧拓智能机器有限公司（VIPioneers）（简称‘慧拓智能’）是由一批具有北美顶级名校、国际无人驾驶及人工智能巨头企业背景的AI博士与行业专家成立的一家趋于行业内领先地位的科技创新型企业。
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p>我院孵化公司青岛慧拓智能机器有限公司（VIPioneers）（简称‘慧拓智能’）是由一批具有北美顶级名校、国际无人驾驶及人工智能巨头企业背景的AI博士与行业专家成立的一家趋于行业内领先地位的科技创新型企业。公司成立于2014年10月，公司以ACP平行理论为基础，致力于新一代云端化智能网联自动驾驶技术的研发及产业化，专注于特定刚性需求场景下的平行驾驶产品、解决方案和测试评估系统研发。</p>
						<p class="protitlt">研发团队</p>
						<p style="margin-top:0px;">公司团队分布在北京、青岛、加拿大、美国。现有人员90余人，80%左右为硕士及以上学历，30余人具有海内外博士学位或留学经历。现有成员主要来自：卡耐基梅隆大学、加大伯克利分校、剑桥大学、滑铁卢大学、慕尼黑工大、米兰理工、清华、北大、中科院、中山大学、北理、北航、吉大等。目前，慧拓智能在北京和加拿大设有研发中心。</p>
						<p class="protitlt">核心业务</p>
						<p style="margin-top:0px;">公司专注于工程机械与商用车等刚需产业的平行驾驶解决方案和平行测试业务等。公司最新开发和真实路演的第三代“平行驾驶系统”，致力于协助客户安全高效快速实现自动驾驶技术落地。全新升级的平行驾驶3.1系统可在统一的平行驾驶远程管控平台上展现多家单位的网联自动驾驶车辆在多种典型应用场景下的协同驾驶及平安出行。在矿山、物流场景已有示范工程实现订单销售，已签署平行驾驶示范工程/测试技术开发合同十余个，整体合同金额超过6,000万元。</p>
						<div class="img">
							<img src="Resources/img/cpjs/image009.png" style="max-width:100%;" />
						</div>	
						<p class="protitlt">无人矿山整体场景平行智能解决方案与系统</p>
						<p style="margin-top:0px;">慧拓智能是国内首家和唯一提供无人矿山及短倒运输完整的端到端自动驾驶解决方案和产品的供应商。目前公司在国内无人驾驶无人矿山细分领域具有绝对优势。公司提出的平行矿山及短倒运输完整的端到端自动驾驶解决方案能够在降低单车改装成本的前提下实现集群化的运营管理，使矿山运输更安全高效，并提高矿山机械挖掘与装卸效率。</p>
						<div class="img">
							<img src="Resources/img/cpjs/image011.png" style="max-width:100%;" />
						</div>	
						<p class="protitlt">基于平行驾驶的无人物流解决方案</p>
						<p style="margin-top:0px;">慧拓智能以面向量产为目标、以“智能化”为导向，建立高效、准时、精益化运作的自动驾驶物流体系。2018年，慧拓与东风集团达成战略合作协议，双方将在无人物流车研发领域进行深度合作。	</p>
						<p class="protitlt">基于平行驾驶的无人市政解决方案</p>
						<p style="margin-top:0px;">	2018年，慧拓与红岛市政达成战略合作协议，双方将在无人驾驶市政环卫车研发领域进行深度合作。慧拓将为红岛市政提供无人驾驶市政环卫车的解决方案。目前，项目已经进入实施阶段。</p>
						<a class="protitlt" href="http://www.vipioneers.com/" target="_blank" >网址链接：http://www.vipioneers.com/</a>
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
