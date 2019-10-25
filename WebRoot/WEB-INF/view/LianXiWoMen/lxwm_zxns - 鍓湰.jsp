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
<link type="text/css" rel="stylesheet"
	href="Resources/css/bootstrap.min.css" />
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/pages.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
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
			margin:0px;
			padding:0px;
		}
		.fuserver,.fuserver li{
			list-style:none;
			border-bottom:1px solid #ededed;
			min-height:47px;
			line-height:47px;
		} 
		.fuserver .titles{
		color:#134290;font-weight:bold;}
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
		.contact_way{
		margin-top:48px;
	}
	.contact_way h4{
		color:rgb(0,62,141);
		font-family: "微软雅黑";
		border-bottom:1px solid gray;
		
	}	
	.contact_way p{
		color:#333333;
		font-size:12px;
		font-family: "微软雅黑";
		margin:0;
		padding:0;
		text-indent: 0em;
		
		
	}	
</style>
<script>
$(function() {
	$(".fenlei").click(function(){
	    $("#mobileflbox").toggle();
	  });
	$(".handle").click(function(){
		$(this).siblings().children(".showbox").hide();
		 $(this).children(".showbox").toggle();
	});
});	
</script>
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
				<li><a	href="javascript:ContentJump('lxwm_zxns.do','contactus');">招贤纳士</a></li>					
				<li><a	href="javascript:ContentJump('lxwm_business.do','contactus');">商务</a></li>
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
			<img src="Resources/img/banner_contact.png" width="100%"/>
		</div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav>
					<div class="ld">联系我们</div>
					<div class=secondnav>
						<ul>
							<li><a class="active"
								href="javascript:ContentJump('lxwm_zxns.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span>招贤纳士</a></li>	
							<li><a
								href="javascript:ContentJump('lxwm_business.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 商务</a></li>	
															
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">招贤纳士</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>联系我们</span><span>></span>
							<span>招贤纳士</span>
						</p>					
					</div>

					<div class=contents>
						<p>人才是最宝贵的财富，是发展的真正动力。智能院信奉以人为本的管理理念，重视人才的开发和培养，并竭力为人才成长创造条件，做到以事业留人、以发展留人、以文化留人。通过对人员的合理配置、丰富的员工培训、完善的劳动关系管理和绩效评估体系等一系列活动，将先进的人力资源管理思想转化为适合智能院发展的、可操作的制度，提高人力资源的管理水准。遵循"招培同步，内外结合，德才兼备”的原则，以爱才之心，求才之渴，结九州人脉，纳四海英才。随时接收员工的合理化建议，与员工互动，营造规范化管理与人文管理相结合的环境和氛围，通过各种方式培养员工的荣誉感，激发工作的积极性，培养创新的意识，激发创新的潜能，提供创新的舞台。</p>
						<ul class="fuserver">
							<li class="handle">
								<div class="titles">·&nbsp;院长助理<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：青岛智能产业技术研究院</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、负责协助院长梳理、制定、实施研究院发展战略规划；<br />
										2、建立与政府相关部门的沟通渠道并维系良好的互动、合作关系，搭建顺畅的沟通平台；争取合理的项目资源，促进产学研业务拓展；<br />
										3、协助常务副院长进行研究院日常行政事务管理、建立健全研究院管理制度和基础团队建设，协调各部门工作；<br />
										4、参加院长会和其他例会，负责院简报、职能部门会议纪要、业务部门月度工作汇报以及研究院对外展示材料等文件的审阅与相关工作推进；<br />
										5、代表研究院对外出访、宣传及沟通工作，树立良好的企业形象，促进研究院与本地企业的合作发展；<br />
										6、负责同行业企业竞争情况调研工作，撰写分析报告，为院长层提供工作改进意见；<br />
										7、负责研究院重要活动的组织、协调和接待工作；<br />
										8、完成院长交给的临时性工作任务。

									</div>
									
									<div>任职要求：</div>
									<div>
										1、硕士及以上学历，并具有3年以上企业运营管理经验；<br />
										2、从事过院长助理等相关工作的人员优先考虑；<br />
										3、具有在计算机、电子信息、统计物理、人工智能等相关领域的研究背景者优先；<br />
										4、外语较好，具备一定的英语阅读和写作能力；<br />
										5、性格开朗，亲和力强，具备较强的事业心及责任感，工作积极努力、抗压能力强；<br />
										6、要求长期稳定，能吃苦耐劳，执行力、沟通及统筹规划能力强；有较强的进取精神和团队合作精神。


									</div>
								</div>
							</li>
							
							<li class="handle">
								<div class="titles">·&nbsp;科研助理<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：高端服务中心</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、负责科技活动报告PPT制作；<br />
										2、协助工作室负责人做好学术成果梳理等科研管理工作。
									</div>
									
									<div>任职要求：</div>
									<div>
										1、身体健康，品行端正，工作踏实，责任心强，乐于奉献；<br />
										2、有较强的综合协调能力，团队协作精神，较好的服务意识和创新意识；<br />
										3、工作积极主动，执行力强，善于沟通； <br />
										4、硕士及以上学历，优先考虑985或211高校毕业学生； <br />
										5、较好的科研基础和组织管理能力，曾发表SCI/EI论文，撰写过专利；<br />
										6、有较强的英语表达及计算机应用能力。
									</div>
								</div>
							</li>
							
							<li class="handle">
								<div class="titles">·&nbsp;文案编辑（可兼职）<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：高端服务中心</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、独立策划并撰写各类稿件（新闻稿、综述稿、专访稿等）；<br />
										2、擅长科技话题与人物大咖的跟踪、深入调研与文案撰写；<br />
										3、具备较强的创新与智能科技应用分析能力，分析与解决问题的能力。


									</div>
									
									<div>任职要求：</div>
									<div>
										1、有一定的科技行业积累，可以独立组织和策划选题；<br />
										2、逻辑清晰，表达流畅，文笔出色，善于交流，对于当前人工智能领域的各领军人物有基本了解；<br />
										3、自我驱动，热爱这份工作，并把它当作一份事业来看待；<br />
										4、英语4级及以上；<br />
										5、大学本科以上学历。<br />
										备注：能力优秀者，可以兼职，工作地点不限，薪酬按照投稿数量结算。

									</div>
								</div>
							</li>	
							
							<li class="handle">
								<div class="titles">·&nbsp;JAVA开发工程师<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：高端服务中心</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、负责公司内部系统的研发；<br />
										2、负责和后端人员一起搭建系统架构；<br />
										3、完成软件系统代码的实现，编写代码注释和开发文档；<br />
										4、协助并完成其他各类技术的开发任务；<br />
										5、具备需求分析和系统设计能力，以及较强的逻辑分析和独立解决问题的能力。

									</div>
									
									<div>任职要求：</div>
									<div>
										1、熟悉j2ee基础语法以及jsp/Servlet,Jquery,js等；<br />
										2、熟悉ssm或者ssh web框架，熟悉springBoot者优先；<br />
										3、熟悉多线程编程以及分布式编程，熟悉Redis缓存机制；<br />
										4、熟悉tomcat配置以及nginx配置；<br />
										5、熟悉linux操作系统指令；<br />
										6、有成熟的上线项目可供查看；<br />
										7、有独自搭建项目框架的能力；<br />
										8、熟悉sql编辑以及具备sql,触发器，函数，存储过程的编写能力；<br />
										9、熟悉使用git或者svn版本管理器，会使用git者优先考虑。<br />
										加分项：<br />
										1、如果您在java开发语言之外还会其它开发技术我们将优先考虑录取，例如nodejs，vue.js，angularjs，React；<br />
										2、熟悉数据结构，能灵活运用数据结构；<br />
										3、本科及以上学历，如果你的能力十分优秀我们将放低学历要求。


									</div>
								</div>
							</li>	
							
							<li class="handle">
								<div class="titles">·&nbsp;市场推广专员<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智能制造研究所</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、负责市场各类宣传活动的策划及实施，拓展销售渠道；<br />
										2、开展讲座、解答无人机的相关问题；<br />
										3、区域市场操作思路与操作模式；<br />
										4、媒体信息的收集、整理与反馈；<br />
										5、有一定的设计能力和软件应用；<br />
										6、业务流程的了解与熟悉。


									</div>
									
									<div>任职要求：</div>
									<div>
										1、本科及以上学历，市场营销专业优先；<br />
										2、良好的沟通能力，语言表达能力强；<br />
										3、性格积极向上，团队合作意识强；<br />
										4、工作主动性强，耐心细致，有责任心；<br />
										5、敏锐、独到的观察力和策划、组织能力，具有开拓创新精神；<br />
										6、口头表达能力和文档写作能力强，做过报告、课程辅导、讲座等相关经验者优先；<br />
										7、了解无人机的飞行原理优先。
									</div>
								</div>
							</li>	
							
							<li class="handle">
								<div class="titles">·&nbsp;JAVA开发工程师（实习）<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智慧医疗研究所</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、从事智慧医疗相关系统的研发工作；<br/>
										2、参与JAVA项目的开发工作，包括模块功能设计、文档编写、编码实现、测试等；<br/>
										3、参与代码维护、优化，shell脚本发布等运维工作。

									</div>
									
									<div>任职要求：</div>
									<div>
										1、掌握JAVA编程，能够熟练应用jFinal、 Spring、Hibernate等主流开发框架之一；<br/>
										2、理解OOA/OOD/OOP编程思想，掌握多种常用的设计模式；<br/>
										3、了解 T-SQL 语言及Sql Server数据库技术；<br/>
										4、有过互联网后台开发经验或大并发系统开发经验者优先；<br/>
										5、熟悉Html、CSS、Bootstrap、Jquery等前端开发框架者优先；<br/>
										6、有创业激情，热爱新技术，良好的团队合作能力、沟通能力；自主学习能力、解决问题能力超强者优先。

									</div>
								</div>
							</li>	
							
							<li class="handle">
								<div class="titles">·&nbsp;前端开发工程师<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智慧医疗研究所</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、Web前端网站产品设计、开发；<br/>
										2、同后端工程师紧密合作，高效地完成开发工作；<br/>
										3、配合产品经理和UI设计师，研究并改善产品的用户体验。


									</div>
									
									<div>任职要求：</div>
									<div>
										1、精通HTML/XHTML、CSS等网页技术，熟练掌握DIV+CSS页面架构和布局方式；<br/>
										2、精通JavaScript开发，熟悉Jquery、Prototype、Bootstrap等前端框架；<br/>
										3、熟悉React、React Native等开发技术者优先；<br/>
										4、熟悉W3C规范及浏览器差异，能手写符合W3C标准、兼容多种浏览器的前端页面代码；<br/>
										5、熟悉Ajax、DOM、XML、JSON等技术；<br/>
										6、熟悉Android、iOS、Git等技术优先；<br/>
										7、熟悉.NET、JAVA等开发语言者优先；<br/>
										8、有创业激情，热爱新技术，良好的团队合作能力、沟通能力；自主学习能力、解决问题能力超强者优先。

									</div>
								</div>
							</li>	
							
														
							<li class="handle">
								<div class="titles">·&nbsp;Web前端开发工程师（实习）<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智慧医疗研究所</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、参与智慧医疗系统Web前端设计及开发；<br/>
										2、同后端工程师紧密合作，高效地完成开发工作；<br/>
										3、参与Javascript数据处理及复杂Ajax交互开发。

									</div>
									
									<div>任职要求：</div>
									<div>
										1、对Html、JavaScript、CSS有一定理解；<br/>
								2、熟悉JavaScript开发，熟悉Jquery、Bootstrap等前端框架；<br/>
								3、熟悉W3C规范及浏览器差异，能手写符合W3C标准、兼容多种浏览器的前端页面代码；<br/>
								4、了解React、React Native等开发技术者优先；<br/>
								5、了解Ajax、DOM、XML、JSON、Git等技术者优先；<br/>
								6、熟悉.NET、JAVA等开发语言者优先；<br/>
								7、有创业激情，热爱新技术，自主学习能力，解决问题能力超强者优先。


									</div>
								</div>
							</li>							
							
							<li class="handle">
								<div class="titles">·&nbsp;算法工程师（实习）<div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智慧医疗研究所</div>
									<div>需求人数：2人（北京、青岛各1人）</div>
									<div>岗位职责：</div>
									<div>
										岗位职责：
								1、负责智慧医疗相关诊断和治疗算法的开发和维护；<br/>
								2、利用机器学习、深度学习相关算法进行模型训练和参数优化；<br/>
								3、前沿论文进展追踪，相关算法实现；<br/>
								4、参与论文撰写、专利申报、课题项目申报与材料准备工作。


									</div>
									
									<div>任职要求：</div>
									<div>
										1、本科及以上学历，自然语言处理、机器学习、数据挖掘等相关专业，掌握基本数据结构、算法和系统设计知识；<br/>
								2、熟悉面向对象思想和设计模式，掌握一门以上面向对象语言，比如Python、JAVA、C++、C#等；<br/>
								3、对数据结构和算法设计有深刻的理解,具有良好的分析问题和解决问题的能力；<br/>
								4、有机器学习、深度学习相关项目开发经验者优先；<br/>
								5、具有模糊逻辑和神经网络相关结构搭建和技术开发经验者优先；<br/>
								6、有较强的文献阅读及算法实现能力、良好的英语读写能力者优先；<br/>
								7、发表过论文或有研究经验者优先；<br/>
								8、思维严谨、突出的分析和归纳能力，优秀的沟通、团队协作能力和自我驱动能力。


									</div>
								</div>
							</li>
							<li class="handle">
								<div class="titles">·&nbsp;Unity游戏开发工程师 <div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智慧教育研究所</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										岗位职责：
								1、负责基于Unity 3D引擎的3D和2D游戏开发和部署；<br/>
								2、开发Unity3D扩展工具包、引擎应用组件，协助3D建模等工作；<br/>
								3、根据需求进行功能设计，以及程序设计、开发、优化工作；<br/>
								4、与教研工程师保持良好沟通，确保程序功能与设计方保持一致。



									</div>
									
									<div>任职要求：</div>
									<div>
										1、计算机、自动化或电子工程等相关专业，专科及以上学历；<br/>
								2、精通C#编程语言、Unity 3D引擎以及其相关插件之运用，熟练掌握Unity3D相关技术体系及结构，熟悉UI框架和3D性能优化，熟练掌握开发中的常用技能及技术原理；<br/>
								3、具备良好的编程习惯，严谨的编程风格；<br/>
								4、能独立完成游戏相关模块功能并有上线项目经验；<br/>
								5、具备良好的钻研精神、团队协作能力和学习能力。

									</div>
								</div>
							</li>
										
							<li class="handle">
								<div class="titles">·&nbsp;3D游戏建模师 <div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：智慧教育研究所</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、基于3D max/Maya各种游戏场景、角色、道具模型的制作；<br/>
										2、基于Photoshop、AI等平面模型的制作；<br/>
										3、根据原画设定制作模型，能独立完成游戏角色、场景以及相关设定的美术概念图设计和制作工作；<br/>
										4、与Unity游戏工程师保持良好沟通，确保程序功能与设计方保持一致。
									</div>
									
									<div>任职要求：</div>
									<div>
										1、多媒体设计与制作、平面设计、动漫设计等相关专业，具备扎实的美术功底与良好的把控能力；具备一定故事情节设计与场景构思的能力；<br/>
										2、精通3D max/Maya，精通Photoshop、AI等平面软件；<br/>
										3、有完整的动画项目制作经历，学习能力强，热爱动画行业；<br/>
										4、具备良好的钻研精神、团队协作能力和学习能力。
									</div>
								</div>
							</li>
								
							<li class="handle">
								<div class="titles">·&nbsp;知识算法工程师 <div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：平行智能技术创新中心</div>
									<div>需求人数：2人</div>
									<div>岗位职责：</div>
									<div>
										1、开发数据-知识双向转化及基于知识的语义空间演化算法开发；<br/>
										2、开发CPSS（物理信息社会系统）相关算法及系统。

									</div>
									
									<div>任职要求：</div>
									<div>
										1、具备扎实的自然语言、深度学习、数学基础，计算机相关专业优先，博士优先；<br/>
										2、熟悉自然语言处理方法和知识图谱； <br/>
										3、在人工智能领域有一定的积累，能够从复杂的业务场景中进行算法选型、算法优化以及不断提升效果；<br/>
										4、熟悉Java/ Scala /Python等至少一门编程语言，深刻理解数据结构和算法设计，有项目经验者优先；<br/>
										5、在国际主流控制期刊发表过多篇论文者优先； <br/>
										6、良好的沟通能力和组织协调能力，有良好的创新意识。

									</div>
								</div>
							</li>
							<li class="handle">
								<div class="titles">·&nbsp;多智能体工程师 <div class="show"></div></div>
								<div class="showbox">
									<div>需求部门：平行智能技术创新中心</div>
									<div>需求人数：1人</div>
									<div>岗位职责：</div>
									<div>
										1、开发人在回路人机混合多智能体协同交互机制算法；<br/>
										2、开发CPSS（物理信息社会系统）相关算法及系统。

									</div>
									
									<div>任职要求：</div>
									<div>
										1、应用数学、运筹学、控制理论、计算机等相关专业全日制硕士及以上学历，优秀硕士及博士优先；<br/>
										2、具有扎实的理论分析基础，研究方向为多智能体协同方向者优先考虑；<br/>
										3、在国际主流控制期刊发表过多篇论文者优先；<br/>
										4、熟练使用多智能体系统仿真软件，实现模型分析及算法验证分析；<br/>
										5、具备良好的编程基础，有用Java/Python实现算法的经验更佳；<br/>
										6、具有良好的英文阅读与写作能力；<br/>
										7、良好的沟通表达能力，责任心强，有团队合作精神。

									</div>
								</div>
							</li>						
						</ul>
						
						<div class="contact_way">
							<h4>联系方式</h4>
							<p>工作地点：青岛高新区智力岛路1号创业大厦B座26层</p>
							<p>招聘热线：0532-68012187</p>
							<p>简历投递邮箱：hr@qaii.ac.cn</p>
							<p>邮件标题：姓名-毕业学校/原单位-应聘岗位名称</p>
							<p>咨询电话：0532-68012187</p>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="clear"></div>
	
	
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
