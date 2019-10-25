<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>青岛智能产业技术研究院</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="青岛智能产业技术研究院，青岛智能产业研究院，青岛研究院，研究院，智能智铭科技有限公司，王飞跃，王晓，郑南宁，高彦臣，于立平，青岛智能产业，自动驾驶，人工智能，智能交通，智能驾驶" />
<meta name="description" content="青岛智能产业技术研究院（以下简称“青岛智能院”）按照“需求引导、创新驱动、联合协作、扎实推进”的原则，坚持世界眼光、树立国际标准，立足本土优势，在中科院自动化所市科技局、高新区管委的支持下，从无到有，汇集各方面人才与科技资源，走过了开创、建设和积累的四年，与300余位同事共同经历了建队伍、打基础、产学研转化上轨道、本地合作上台阶的四年。在团队建设、科技研发、产业落地等方面，均取得一定的成绩，获得30余项国家及省市区级别奖励。青岛智能院以“新理论支撑新技术，新技术赋能旧产业”为指导方针，时至2018，进一步明确了“科研顶天、产业立地”的发展战略。青岛智能院不断调整优化组织机构，紧紧围绕国际、国内技术进展，山东、青岛的实际需求，围绕智能制造、智能网络、智慧农业、智慧企业、智慧城市、智慧社会、智慧健康、智慧教育、智慧物流等方向设立14个研究所、1个技术研发中心和6个管理支撑部门，并基于平行理论统摄，在各所下设17个平行技术创新中心，为各行业提供灵捷、聚焦、收敛的技术服务。
智能院坚持世界眼光、国际标准，发挥自身优势，加快产业化步伐，在青岛高新区建立产业孵化基地，遵循“立足青岛、辐射山东、服务全国”的发展方针，围绕国家“十三五”发展重点，以项目合作、产学研结合、举办国际研讨会和学术论坛等多种形式，联合创办国际首家“智能科技学院”，打造智能领域的“黄埔军校”，培养智能产业的“红领人才”。" />
<link rel="stylesheet" type="text/css" href="Resources/css/common.css">
<link type="text/css" rel="stylesheet" href="Resources/css/style.css" />
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="Resources/favicon.ico" media="screen" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> 
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<style type="text/css">
.fontstyle {
	text-align: center;
	font-size: 36px;
	line-height: 130px;
	color: #4e4e4e;
}

.ulnav {
	margin: 0;
	padding: 0;
	/* width: 200px; */
	list-style: disc;
}

.ulnav li {
	margin: 0;
	padding: 0 0 8px 0;
	font-size: 16px;
	cursor: pointer;
}

.ulnav li:hover {
	font-size: 16px;
	cursor: pointer;
	color: orange;
}

.ulnav .active {
	font-size: 16px;
	cursor: pointer;
	color: orange;
}

p {
	margin: 0 10px;
	text-align: left;
	text-indent: 2em;
}

.tabcontent {
	width: 100%;
	padding: 10px 0;
	font-size: 14px;
	line-height: 28px;
	color: #4e4e4e;
}

.fcolor {
	color: #5b9bd5;
}
.header .headertop {
    width: 100%;
    padding: 16px 19.3%;
    height: 77px;
    margin: 0 auto;
    vertical-align: middle;
    background-color: #093e8e;
    border:none;
}
.pagecontent .pageimg{
padding-top:137px;}
.pagecontent .contentall .contentshow .leftnav .ld{
	background-image:url(Resources/img/engnav.png);
	background-position-x:center;
	background-position-y:center;
	background-repeat:no-repeat;
}
.pagecontent .contentall .contentshow .leftnav .secondnav ul li a{
    line-height: 20px;
    text-align: left;
    padding: 0px;
    height: 62px;
    padding-top: 10px;
    padding-left: 20px;
    background-color: none;
    width: auto;
    float: none; }
 .contents p{
 margin:15px 0px;
 text-indent: 0rem;
 line-height:25px;}
 .pagecontent .contentall .contentshow .leftnav .secondnav .active{
 background:#134290;
 color:#fff;}
 .pagecontent .contentall .contentshow .leftnav .secondnav ul li {
    width: 100%;
    height: 63px;
    display: block;
    margin: 0;
    padding: 0;
    cursor: pointer;
    background-color: #f7f7f9;
    border-bottom: 1px dashed #ededed;
    height: 70px;
    clear: both;
} 
.pagecontent .contentall .contentshow .leftnav .secondnav ul li.active a{
	background:none;
	color:#fff;
	} 
.header .nav ul li a{
	color: #093e8e;
}	 
</style>
<script type="text/javascript">
	function ChangeDesc(tabid, liid) {
		$(".contents").hide();
		$("#" + tabid).show();
		$(".ulnav li").removeClass("active");
		$("#" + liid).parent("li").addClass("active");
	}
</script>
</head>

<body style="overflow:auto;overflow-x:hidden;margin:0 0">
    <!-- <div id="header" class="header">
		<div class="headertop">
			<div class="headerinner">
				<img src="Resources/img/ic_logo.png" height="40px"/>	
				<div class=language>
				<img src="Resources/img/fir1.png" height="40px"/>	
				<div class="langue">
					<a href="index.do">中文</a> | <a href="index_e.do" target="_blank" style="color:red;">English</a>
				</div>	
				<div>
					<img src="Resources/img/weibo.png" height="40px" style="float:right;"/>
					<div class="wechat" style="display:none;"><img src="Resources/img/code.png"/></div>
					<img src="Resources/img/wechart.png" height="40px" id="wechat" style="float:right;margin-right:5px;"/>
				</div>	
			</div>		
			</div>
		</div>
	</div>      -->
 <div id="header" class="header">
		<div class="headertop">
			<div class="headerinner">
				<img src="Resources/img/ic_logo.png" height="40px"/>	
				<div class=language style="width:200px;">
				<!-- <img src="Resources/img/fir1.png" height="40px"/>	 -->
				<div class="langue">
					<a href="index.do">中文</a> | <a href="index_e.do" target="_blank" style="color:red;">English</a>
				</div>	
				<div>
					<img src="Resources/img/weibo.png" height="40px" style="float:right;"/>
					<div class="wechat" style="display:none;"><img src="Resources/img/code.png"/></div>
					<img src="Resources/img/wechart.png" height="40px" id="wechat" style="float:right;margin-right:5px;"/>
				</div>	
			</div>		
			</div>
		</div>
		<div class="nav" id="nav">
			<ul class="nav-main" id="nav-main">
				<li id="home" class="home"><a
					href="javascript:PageJump('index');">首页 </a></li>
				<li id="jibengk" class="jibengk"><a
					href="javascript:PageJumpNo('jibengk');">关于我们</a>
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
				<li id="cpfayyhygl" class="cpfayyhygl"><a
					href="#product">产品介绍</a></li>
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
			<img src="Resources/img/english.jpg" width="100%"/>
		</div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav style="width:22%;">
					<div class="ld" style="padding-top: 20px;line-height: 35px;">Profile of <br/>QAII</div>
					<div class="secondnav">
						<ul class="ulnav">
							<li class="active"><a id="li1" onclick="ChangeDesc('tab1',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Qingdao Academy of <br />Intelligent Industries</div></a></li>	
							<li><a id="li2" onclick="ChangeDesc('tab2',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Intelligent<br/>Manufacturing and Robotic<br/>Systems</div></a></li>
							<li><a id="li3" onclick="ChangeDesc('tab3',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Intelligent Sensing<br />and Networking Systems</div></a></li>
							<li><a id="li4" onclick="ChangeDesc('tab4',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart<br />Agricultural Systems</div></a></li>
							<li><a id="li5" onclick="ChangeDesc('tab5',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart<br />Healthcare Systems</div></a></li>
							<li><a id="li6" onclick="ChangeDesc('tab6',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart<br />Enterprise Systems</div></a></li>		
							<li><a id="li7" onclick="ChangeDesc('tab7',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart Cities<br/>and Infrastructures</div></a></li>
							<li><a id="li8" onclick="ChangeDesc('tab8',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart<br />Societies and Services</div></a></li>
							<li><a id="li9" onclick="ChangeDesc('tab9',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart<br />EDucation Systems</div></a></li>
							<li><a id="li10" onclick="ChangeDesc('tab10',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Smart<br />Logistical Systems</div></a></li>
							<li><a id="li11" onclick="ChangeDesc('tab11',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of<br />Data Intelligence</div></a></li>
							<li><a id="li12" onclick="ChangeDesc('tab12',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of<br />Intelligent Systems</div></a></li>		
							<li><a id="li13" onclick="ChangeDesc('tab13',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Institute of Intelligent<br />Services Systems</div></a></li>
							<li><a id="li14" onclick="ChangeDesc('tab14',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>R&D and Innovation Center</div></a></li>
							<li><a id="li15" onclick="ChangeDesc('tab15',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Parellel workshop</div></a></li>		
							<li><a id="li16" onclick="ChangeDesc('tab16',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Department of<br />Administration</div></a></li>																								
							<li><a id="li17" onclick="ChangeDesc('tab17',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Department of<br />Human Resources</div></a></li>
							<li><a id="li18" onclick="ChangeDesc('tab18',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Department of Finance</div></a></li>
							<li><a id="li19" onclick="ChangeDesc('tab19',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Department of Research<br />Management</div></a></li>
							<li><a id="li20" onclick="ChangeDesc('tab20',this.id)">
							<span class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span><div>Department of<br />Industrialization Management</div></a></li>																		
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">QAII</span><span>-Qingdao Academy of Intelligent Industries</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>Profile of QAII</span>
						</p>					
					</div>

					<div class="contents" id="tab1">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/itme_zncy.png"/>
							</div>
							<div class="productsum">
								<p style="padding:20px;">
									<span style="color:#093e8e;line-height:16px;">Qingdao Academy of Intelligent Industries</span><br>
									Qingdao Academy of Intelligent Industries (hereafter referred to as QAII) is jointly founded by Institute of Automation, Chinese Academy of Sciences, Qingdao National High-tech Industrial Development Zone, and Qingdao Science and Technology Bureau. It is officially registered as a new research institution with independent legal entity in May 2014.
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p style="color:#093e8e;">Founding Information</p>

						<p>Qingdao Academy of Intelligent Industries (hereafter referred to as QAII) is jointly founded by Institute of Automation, Chinese Academy of Sciences, Qingdao National High-tech Industrial Development Zone, and Qingdao Science and Technology Bureau. It is officially registered as a new research institution with independent legal entity in May 2014.</p>
						
						<p style="color:#093e8e;">Organization of QAII</p>
						
						<p>QAII is mainly composed of “one institute (center), one enterprise, one industrial park, one industrial fund, and one platform”, namely, Qingdao Academy of Intelligent Industries (CASIA Center for Intelligent Systems and Technology, Chinese Academy of Sciences), Intelligent Industries Development Platform Corporation, Intelligent Industries Park, Intelligent Industries Fund, and Big Data Platform.</p>
						
						<p>Currently, QAII includes 14 research institutes including Intelligent Manufacturing, Intelligent Networks, Smart Agriculture, Smart Enterprise, Smart City, Smart Society, Smart Health, Smart Education, Intelligent Logistics, Intelligent Data, Intelligent Systems, Intelligent Services, Parallel Economy, Parallel Control, and one Technology Research and Development Center.</p>
						
						<p style="color:#093e8e;">Talents and Research Team</p>
						
						<p>QAII has established an academic and technology committee that composes of many academician and experts from both China and abroad. There are currently 258 staff, including 6 “1000 Talents Plan” experts, 4 “100 Talents Plan” members, 4 winners of the National Science Fund for Distinguished Young Scholars, 1 winner of National Natural Science Foundation Outstanding Youth Fund, 4 Editor-in-Chief of premier international journals, 126 staff with Master degree and above. QAII has gradually formed a major force of talents in intelligent fields.</p>
						
						<p style="color:#093e8e;">Development of QAII</p>
						
						<p>Based on principles of “Demand-Guided, Innovation-Driven, Joint Collaboration, and Steady Progressing”, QAII is committed to fully utilizing resources from different parties to attract talents in information, software, automation, and intelligence areas both from home and abroad. Through innovation of frontier intelligent industrial technology, development of emerging intelligent industries with core competitiveness, and technology transfer to products, QAII strives to build a technology innovation base, an emerging incubator of intelligent industries, a high-level center for talents training, and an institute for international academic exchange and education cooperation with international influence and reputation.</p>
						
						<p>Since its establishment, QAII has founded the Intelligent Transportation Joint Research and Development Center, led the establishment of the Strategic Alliance Formation for Smart Agricultural Industrial Technology Innovation and the Strategic Alliance for Smart Health, actively taken participation into industrial alliance of 3D Printing, Smart Education, Smart Healthcare, and made full efforts for promoting the development of the related industries. QAII has gradually set up several joint laboratories with Shandong Province Gout Research Center, Xi’an Jiao Tong University, Tsinghua University, and other units. It signed cooperative agreements to jointly foster high-level talents training with well-known institutions such as University of Macau, University of California, Indiana University-Purdue University Indianapolis, and others.</p>
						
						<p>Considering the rapid development of emerging intelligent industries and the talents shortage in Qingdao, QAII aims to build the first “Intelligent Technology Academy” in the world and establish the “Huangpu Military Academy” to train the “red-collar talents” in intelligent industries. Up to now, it has incubated more than 10 technological companies.</p>
						
						<p>QAII aims to maintain an international foresight, create international standards, and lead the development of intelligent industries based on Parallel Intelligence based theories and technologies. The purpose is to help Qingdao become a city of innovation, a capital of entrepreneurs, and an island of maker culture.</p>
					</div>
					<div class="contents" id="tab2" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab3" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab4" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<!-- 内容分割先 -->
					<div class="contents" id="tab5" style="display:none;">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/itme_zhyl.jpg"/>
							</div>
							<div class="productsum">
								<p style="padding:20px;">
									<span style="color:#093e8e;line-height:16px;">Institute of Smart Healthcare Systems</span><br>
									Based on the theory of parallel control, which comes directly from the ACP approach, the institute of smart healthcare Systems, combined with the artificial intelligence algorithms, modern information technology and systems engineering, provides modern technology solutions related to medical care, health care, and health for elderlies. 
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p style="color:#093e8e;">Introduction</p>

						<p>Based on the theory of parallel control, which comes directly from the ACP approach, the institute of smart healthcare Systems, combined with the artificial intelligence algorithms, modern information technology and systems engineering, provides modern technology solutions related to medical care, health care, and health for elderlies. The main research directions include, computer-aided automation diagnostic and treatment system; knowledge base of medicine, health, food, sport, lifestyle and healthcare; remote and wearable health monitoring system; life-safety monitoring system for elderly people; open health and safety monitoring platform; health records, personal health profile and health management system; big data intelligent analysis in healthcare, data mining and early warning, alarm algorithm; parallel service system for elderly people; remote health medication inquiry system, automated online medical diagnosis, consulting and advertising system and other research and development of technical solutions.</p>
						
						<p style="color:#093e8e;">Projects</p>
						
						<p>1. Parallel computer-aided automation diagnostic and treatment system for gout disease</p>
						<p style="color:#093e8e;">Introduction</p>
						
						<p>Based on the theory of parallel control, which comes directly from the ACP approach, through the establishment and use of medical knowledge base, intelligent medical records library, expert diagnostic and treatment rule library, using computer information system, artificial intelligence, big data mining and machine learning technology, develop parallel computer-aided automation diagnostic and treatment system for gout and hyperuricemia diseases, so as to provide the doctor with the diagnosis and treatment decision-making basis and suggestions. The system consists of three sub-systems: smart clinic management system for gout disease, information platform for gout disease, computer-aided automation diagnosis and treatment system for gout disease.</p>
						
						<p style="color:#093e8e;">Functions</p>
						<p>● Standardizing the diagnosis and treatment process</p>

						<p>● Medical knowledge base, intelligent medical records library, expert diagnostic and treatment rule library</p>
						
						<p>● Simulation of medical experts in the decision-making process of diagnosis and treatment</p>
						
						<p>● Providing the diagnosis and treatment decision-making basis and suggestions, Inferred details and similar medical records</p>
						
						<p>● The self-improvement system for the algorithm to consistently evolve</p>
						
						<p>● 7x24 hours of patient care</p>
						
						<p>● Desensitized data sharing between hospitals</p>
						
						<p>● Professional knowledge in a timely manner</p>
						
						<p>● Medical Education</p>
						
						<p>● Research platform</p>
						<p>2. Smart health and safety monitoring platform</p>
						<p style="color:#093e8e;">Introduction</p>

						<p>To establish an open health and safety monitoring platform under the guidance of the theory of parallel control, and to store the data of vital signs, health, position and living rules from the cloud into the health records data center for all the groups concerned with their own health through mobile and wearable equipment. Through the intelligent algorithm for real-time and historical analysis of user data, sketch out personal health and personal habits profile. According to the specific health of the customer, our platform makes customized advices for clients to achieve a better lifestyle.</p>
						
						<p style="color:#093e8e;">Functions</p>
						
						<p>● Providing people with timely, accurate, economic, comprehensive, personalized, high-quality health and safety monitoring, illness warning, personalized health management services</p>
						
						<p>● To help people effectively prevent the various diseases and health risks on the threat of life safety</p>
						
						<p>● To calculate the best health guidance program for customers , and assist users to improve their health and physical indicators effectively.</p>
						
						<p>3. Parallel service system for elderly people</p>
						
						<p>Through the large data collection and mining, the parallel service system analyzes the portrait of individual needs for elderly people. Applying the theory of parallel control to establish the individualized model for the elderly people caring, the parallel service system is able to guide the old - age service. Through the continuous collection of feedbacks in the analysis of old - age data, the parallel service system improves the model for the elderly people caring, in order to organize all of the resources, like medical institutions, family members, community neighborhoods, individuals, government, charity, professional services, to provide the most needed material supply, health care, life care, spiritual care and other precision old - age services for elderly people, and then to achieve the best old - age supply, demand matching and old - age service industrialization.</p>
						
					</div>
					<!-- 内容分割线 -->
					<div class="contents" id="tab6" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab7" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab8" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<!-- 内容分割先 -->
					<div class="contents" id="tab9" style="display:none;">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/itme_zhjy.jpg"/>
							</div>
							<div class="productsum">
								<p style="padding:20px;">
									<span style="color:#093e8e;line-height:16px;">Institute of Smart EDucation Systems</span><br>
									ISES aims to apply the intelligent technology to education domain and to promote the industrialization, studies the deep integration of Big Data, Cloud Computing, Internet of Things, and parallel system with education, supports to boost the comprehensive education reform and curriculum reform. 
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p style="color:#093e8e;">nstitute of Smart Education Systems (ISES)</p>
					
						<p>ISES aims to apply the intelligent technology to education domain and to promote the industrialization, studies the deep integration of Big Data, Cloud Computing, Internet of Things, and parallel system with education, supports to boost the comprehensive education reform and curriculum reform.</p>
						
						<p style="color:#093e8e;">Key work 1: iSTREAM program for innovative practice education at K-12 students</p>
						
						<p>Base on the iCDIOS（i & Conceive, Design, Implement, Operate, Services）engineering education model and iSTREAM（i & Sciences, Technology, Robotics, Engineering, Arts, Management）multi-disciplinary education concept, where i may represent the new IT intelligent technology element for individual, inspiration, intelligence, invention, innovation, integration, interdisciplinary, international, and more, this work aims to serve for the popularization of science, innovation and entrepreneurship training, extracurricular practice activity, maker education together, and involves to develop a systematic standard including education equipment, science education curriculums, innovation laboratory, innovation and practice education base, supportive parallel system platform, extracurricular activity, and etc..</p>
						
						<p>Curriculum: combination of campus and outside campus, theoretical and practice; common sense and innovation, integration and synthetization, fundament and frontier</p>
						
						<p>Characteristic: interesting, informative, standardized, modularized, and diversified.</p>
						<div style="text-align:center;"><img src="Resources/img/educationg.jpg"/></div>
						
						<p style="color:#093e8e;">Key work 2: Parallel intelligent adaptive education system</p>
						
						<p>Based on the constructivism education theory and hybrid-augmented intelligence, this work aims to construct corresponding artificial education systems from the learner-centered viewpoint including education scenario, social environment, director, and learner four fundamental elements in the real education system. Adaptive personalized designs for teaching scenario, teaching method and knowledge system for specific learners and comprehensive evaluation of teaching and learning performance are made by computational experiments, based on which actual teaching and learning processes are optimized. Meanwhile, the artificial education systems are adjusted based on Big Data analysis, and the adaptive learning algorithm is improved based on Human-computer collaborative hybrid-augmented intelligence.</p>

						<div style="text-align:center;"><img src="Resources/img/education.jpg" style="max-width:100%;"/></div>
						<p style="color:#093e8e;">Key work 3: Professional education</p>
						
						<p>Hongdao Institute of Intelligent Industries is built under the support of Qingdao Academy of Intelligent Industries, and conducts engineering management education for the ecological chains in intelligent industries. This work aims to cultivate engineering technology and management talents for the multi-level, multi-mode, cross-border intelligent industries, and to research and develop new curriculums and majors through the resource integration and cooperation for the intelligent industries based on the market demands.</p>
					</div>
					<!-- 内容分割线 -->
					<div class="contents" id="tab10" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab11" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab12" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab13" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<!-- 内容分割先 -->
					<div class="contents" id="tab14" style="display:none;">
						<div class="producttitle">
					
							<div class="productimg">
								<img src="Resources/img/instuite.jpg"/>
							</div>
							<div class="productsum">
								<p style="padding:20px;line-height: 19px;padding-top: 10px;">
									<span style="color:#093e8e;line-height:16px;">R&D and Innovation Center</span><br>
									Technology R & D Center supported by the State Key Laboratory of Management and Control for Complex Systems and Qingdao Academy of Intelligent Industries, focuses on the hardware and software design, development, integration and implementation of engineering research projects, and Provides communication and comprehensive deployment for network, platform solutions, technology development, technology transfer, technology service and service for consulting and personnel internship training. Specific, Technology R & D Center provides the services as follows: 
								</p>
							</div>
						</div>	
						<div class="clear"></div>				
						<p style="color:#093e8e;">Hardware Technology Group</p>
						<p>to be updated</p>
						
						<p style="color:#093e8e;">Software Technology Group</p>
						<p>Technology R & D Center supported by the State Key Laboratory of Management and Control for Complex Systems and Qingdao Academy of Intelligent Industries, focuses on the hardware and software design, development, integration and implementation of engineering research projects, and Provides communication and comprehensive deployment for network, platform solutions, technology development, technology transfer, technology service and service for consulting and personnel internship training. Specific, Technology R & D Center provides the services as follows:</p>
						
						<p>● Platform-level system solution design.</p>
						
						<p>● system design, technology development, technology transfer, technical advice, technical services.</p>
						
						<p>● website design services, Internet, management information system services.</p>
						
						<p>● intelligent network control system equipment design and integration.</p>
						
						<p>● computer hardware and software systems and network, communication system integration, design, installation and maintenance services.</p>
						
						<p>Technology R & D Center has an experienced, business skilled R&D team, staff role covers the project managers, architects, database experts, research and development engineers, test engineers, network engineers, etc. Center has successively for the Intelligent Industries provides a variety of public technical service and support, covering infrastructure operation support services, system integration design services and public information maintenance services; And undertake a number of software/hardware system design and development work, covers the enterprise integrated management, traffic management and decision support, data analysis and processing, agricultural intensification management, intelligent data monitoring and control, etc. R&D team now has a wealth of work foundation, mainly involves the following areas:</p>
						
						<p>● enterprise integrated management information construction, including learning and training, work standardization, inspection, production management, emergency management, analysis, evaluation, etc.</p>
						
						<p>● integrated transportation management informatization, including multiple construction traffic integrated management platform, the signal control platform, bus BRT monitoring and scheduling command system, traffic simulation environment, the orbit transportation simulation environment, etc.</p>
						
						<p>● agricultural informatization construction, including office automation, monitoring of agricultural production, agriculture orchard production management, etc.</p>
						
						<p>● network construction, including the network hardware environment construction plan and implementation, the basis of integrated services network software and governance.</p>
						
						<p>● data integration information construction, including multiple system comprehensive integration, data integration platform construction scheme and implementation.</p>
						
						<p>● other aspects, including the geographic information system GIS platform construction, electronic maps, visualization, mobile phone APP, etc.</p>
						
						<p style="color:#093e8e;">Embedded Systems Group</p>
						<p>Technology R&D Center is relying on The State Key Laboratory of Management and Control for Complex Systems and QingDao Academy of Intelligent Industries. Now the center main research direction is IOT, big data, cloud computing, embedded security system and the robot, and the main application direction is IOT cloud platform, wireless network communication network, embedded system development, hardware circuit design and help robot. The center provide data platform, application services and a full range of solutions for the Industry Internet. Its areas involve cold chain logistics, intelligent manufacturing, smart home, intelligent energy, intelligent agriculture, intelligent transportation, environmental monitoring and many other industries, and provide IoT solutions and product service.</p>
						
						<p>The center has a research and development and sales team about 13 people. The center has successively with the CHINA Academy of Railway Sciences, the Chinese Academy of Agricultural Sciences, Guangzhou Transportation Commission, Qingdao University of Technology, Hunan Cothink Robotics Tech.Co.,LTD and many other scientific research institutes,high-tech enterprises expand cooperation in the field of Intelligent data monitoring, Big data analysis, data visualization analysis, Large data storage, Data visualization analysis, Big data storage, Industrial Information Collection and Intelligent Decision, device management, Robot application.</p>
						
						<p>Department launched the Internet of things cloud platform, cold chain information systems, indoor environmental monitoring system has been on the line.</p>
												
					</div>
					<!-- 内容分割线 -->
					<div class="contents" id="tab15" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab16" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab17" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab18" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab19" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<div class="contents" id="tab20" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div>
					<!-- <div class="contents" id="tab2" style="display:none;">
						<div class="producttitle">
						to be update
						</div>
					</div> -->
				</div>

			</div>
		</div>
	</div>
    <div class="clear"></div>
    <div class="foot">
		<div class="foottext"></div>
		<div class="footnav">					
			<ul>
				<li>
					<div class="footTitle">首页<div class="footline"></div></div>
				</li>
				<li>
					<div class="footTitle">关于我们<div class="footline"></div></div>
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
