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
<style>
	p{
		 line-height:29px;
		 margin-top: 33px;
		 text-indent: 2em;
		 font-family: "微软雅黑";
		 font-size: 14px;
		 color: #000000;
		 opacity: 0.8;
	}
	.contents ul{
		width:100%;
		height: auto;
		padding: 0 0;
		border-top:1px solid #9b9b9b;
		margin-left: 0;
	}
	.contents ul li{
		width:100%;
		height:auto;
		line-height:40px;
		padding: 0 0;
		margin: 0;
		display:block;
		cursor: pointer;
		 font-family: "微软雅黑";
		 font-size: 14px;
		 color: #000000;
		border-bottom: 1px solid #9b9b9b;
	}
	.recruitment_title{
	 	color:rgb(0,62,141);
	}
	.contents ul li span{
		float:right;
		height:40px;
		line-height:40px;
	}
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
	.recruitment_detail{
		width:100%;
		background-color: #f7f7f9;
		padding:24px;
	}
	.recruitment_detail p{
		color:#333333;
		font-size:12px;
		font-family: "微软雅黑";
		margin:0;
		padding:0;
	}
	.recruitment_detail .submit{
		color:white;
		font-size:12px;
		font-family: "微软雅黑";
		/* background-color: rgb(0,62,141); */
		background: url(Resources/img/btn_apply.png)  no-repeat center;
		width:93px;
		outline:none;
		border-color: transparent;  
        box-shadow:none;
        padding:0;
        margin:0;
		
	}
	
#win {
	display: none;
	height: 400px;
	left: 50%;
	margin-left: -311px;
	margin-top: -161px;
	position: fixed;
	top: 50%;
	width: 622px;
}

#sqcenter {
	background-color: #FFFFFF;
	width: 572px;
	margin-left: 25px;
	border-left: 1px solid;
	border-bottom: 1px solid;
	border-right: 1px solid;
	font-family: Arial;
	font-size: 10px;
	color: #000000;
}

#apply {
	margin: 0 auto;
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

<script type="text/javascript">

    var RecruitmentID=1;
	
	function initRecruitmentList() {		
		$.post(
				"RecruitmentAll.do",
				function(data) {
					if (data != null) {
						/* alert(JSON.stringify(data)); */
						$("#recruitment_data").html('');
						//获取总记录条数
						for (var i = 0; i < data.length; i++) {
							$("#recruitment_data")
									.append(
											"<li onclick='javascript:showDetail(this)'>"															
													+ data[i].JobTitle
													+ "<span class='glyphicon glyphicon-chevron-down'></span>"//代表招聘职位字段
													+"<div class='recruitment_detail'  style='display:none' >"
													+"<div><h5>岗位职责:</h5><p>"
													+data[i].Description
													+"</p></div>"
													+"<div><h5>招聘要求:</h5><p>"
													+data[i].Qualifications
													+"</p></div>"
													+"<div><input type='button' value='投递简历' class='submit' onclick='javascript:showWin("
													+data[i].RecruitmentID
													+",this)'></input></div>"
													+ "</div></li>");
							
						}

						
					}
				});

	
	}
	
	/* function showDetail(obj) {
		$(obj).addClass("recruitment_title");
		$(obj).find("span").toggleClass("glyphicon glyphicon-chevron-down");
		$(obj).find("span").toggleClass("glyphicon glyphicon-chevron-up");
		$(obj).find(".recruitment_detail").toggle();
	} */
	function showWin(recruitmentID,event) {		
	   // alert("RecruitmentID:"+RecruitmentID);
	    RecruitmentID=recruitmentID;
		var winNode = $("#win");
		winNode.show("slow");
		if (event.stopPropagation) {
			 // 针对 Mozilla 和 Opera 
		 	event.stopPropagation(); 
	 	} else if (window.event) { 
	 		// 针对 IE 
	 		window.event.cancelBubble = true;
		} 
		
	}
/* 	function hideWin() {
		var winNode = $("#win");
		winNode.hide("slow");
	}
	
	$(function() {
		$("#apply").click(
						function() {						 
					        $("#RecruitmentID").val(window.RecruitmentID);
					        var	RecruitmentID= $("#RecruitmentID").val();						    		  
							var FullName = $("#FullName").val();
							var Mailbox = $("#Mailbox").val();
							var Phone = $("#Phone").val();
							var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
							var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
							if (FullName == '') {
								alert("姓名不能为空!");
								return;
							}
							if (Mailbox == '') {
								alert("邮箱不能为空!");
								return;
							}
							if (Phone == '') {
								alert("联系电话不能为空!");
								return;
							}
							
							if (!myreg.test($("#Phone").val())) {
								alert('请输入有效的手机号码！');
								return false;
							}
							if (!reg.test(Mailbox)) {
								alert("邮箱格式不正确!");
								return;
							}
							$("#form").submit();
						});
						hideWin();
	}); */
	
	/* $(function() {
		sessionStorage.focusUrl_Name = "lxwm_zxns";
		sessionStorage.focusUrl_ID = "";
		NavContus();
	    initRecruitmentList(); 	
	}); */
		
</script>
<script>
$(function() {
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
				<img src="Resources/img/ic_logo.png" height="40px"/>	
				<div class=language>
					<a class="lanActive" href="index.do">中文</a> | <a href="index_e.do">English</a>
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
					href="javascript:PageJumpNo('cxfhframe');">创新孵化</a>
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
								<div><span style="color:#134290;font-weight:bold;">①创业辅导。</span>包含创业咨询、政策辅导、手续代理等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">②管理咨询。</span>包含财务代理、法律咨询、专利服务等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">③交流培训。</span>包含管理培训、技术交流、专家咨询等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">④项目推介。</span>包含成果展示、项目申报、新闻发布等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑤市场推广。</span>包含展览会议、产品对接、信息咨询等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑥融资投资。</span>包含银企对接、孵化基金、风险投资等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑦人才引进。</span>包括校企合作、猎头服务、人才招聘等内容<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
							<li class="handle">
								<div><span style="color:#134290;font-weight:bold;">⑧技术支持。</span>包含技术平台、检验测试、技术联盟等内容。<div class="show"></div></div>
								<div class="showbox">
									以协助大学毕业生、城市下岗工人、失地农民等个人进入创业领域为发展目标，并为他们提供优质的创业平台及后续跟踪支持服务；以打造小本创业项目的超市平台为经营特色，为优质的特许经营项目在中国培养专业的代理商及推广服务；以咨询培训及人才甑别（规划）为经营优势，为发展中的企业提供创业辅导及人才提升服务。
								</div>
							</li>
						</ul>
						<!-- <ul id="recruitment_data"></ul> -->
						<!-- <div id="win">
							<div
								style="wight:622px;height:47px;background:url(Resources/css/img/t.png) no-repeat;">
								<div
									style="float:left;width:589px;line-height:30px;color:#fff;font-size:14px;text-align:center;cursor:default;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位申请信息</div>
								<div
									style="width:23px;height:23px;background:url(Resources/css/img/gb.png) no-repeat;margin:4px 10px 0 0;cursor:pointer;float:right"
									onclick="hideWin()"></div>
							</div>
							<div id="sqcenter">
								<form action="Apply.do" method="post" name="form" id="form"
									ENCTYPE="multipart/form-data">
									<input type="hidden" 
										name="RecruitmentID" id="RecruitmentID" />
									<table style="width:500px; margin:0 auto;">
										<tr>
											<td style="width:100px;font-size:12px;">申请人姓名：</td>
											<td><input type="text" name="FullName" id="FullName"
												class="form-control" style="width:350px;height:30px;"
												maxlength="20" /></td>
										</tr>
										<tr>
											<td style="font-size:12px;">申请人邮箱：</td>
											<td><input type="text" name="Mailbox" id="Mailbox"
												class="form-control" style="width:350px;height:30px;"
												maxlength="100" /></td>
										</tr>
										<tr>
											<td style="font-size:12px;">申请人联系电话：</td>
											<td><input type="text" name="Phone" id="Phone"
												class="form-control" style="width:350px;height:30px;"
												maxlength="20" /></td>
										</tr>
										<tr>
											<td style="font-size:12px;">申请描述：</td>
											<td><textarea name="WorkExperience" id="WorkExperience"
													class="form-control"
													style="width:350px;height: 100px;resize:none;"
													maxlength="200"></textarea></td>
										</tr>
										<tr>
											<td style="font-size:12px;">求职简历上传：</td>
											<td style="padding-top:15px;padding-bottom:10px;"><input
												type="file" id="Attachment" name="Attachment"
												class="form-control" style="width:350px;" /></td>
										</tr>
									</table>
									<br />
									<div
										style="height:32px; width:127px;background:url('Resources/css/img/sq.png') no-repeat ;cursor:pointer;"
										id="apply"></div>
									<br /> <br />
								</form>
							</div>
						</div> -->
						<div class="contact_way">
							<h4>联系方式</h4>
							<p>工作地点：青岛高新区智力岛路1号创业大厦B座26层</p>
							<p>招聘热线：0532-68012187</p>
							<p>简历投递邮箱：hr@qaii.ac.cn</p>
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
