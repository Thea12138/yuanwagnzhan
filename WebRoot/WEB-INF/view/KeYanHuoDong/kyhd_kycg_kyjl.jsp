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
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta name="keywords" content="青岛智能产业技术研究院，青岛智能产业研究院，青岛研究院，研究院，智能智铭科技有限公司，王飞跃，王晓，郑南宁，高彦臣，于立平，青岛智能产业，自动驾驶，人工智能，智能交通，智能驾驶" />
<meta name="description" content="青岛智能产业技术研究院（以下简称“青岛智能院”）按照“需求引导、创新驱动、联合协作、扎实推进”的原则，坚持世界眼光、树立国际标准，立足本土优势，在中科院自动化所市科技局、高新区管委的支持下，从无到有，汇集各方面人才与科技资源，走过了开创、建设和积累的四年，与300余位同事共同经历了建队伍、打基础、产学研转化上轨道、本地合作上台阶的四年。在团队建设、科技研发、产业落地等方面，均取得一定的成绩，获得30余项国家及省市区级别奖励。青岛智能院以“新理论支撑新技术，新技术赋能旧产业”为指导方针，时至2018，进一步明确了“科研顶天、产业立地”的发展战略。青岛智能院不断调整优化组织机构，紧紧围绕国际、国内技术进展，山东、青岛的实际需求，围绕智能制造、智能网络、智慧农业、智慧企业、智慧城市、智慧社会、智慧健康、智慧教育、智慧物流等方向设立14个研究所、1个技术研发中心和6个管理支撑部门，并基于平行理论统摄，在各所下设17个平行技术创新中心，为各行业提供灵捷、聚焦、收敛的技术服务。
智能院坚持世界眼光、国际标准，发挥自身优势，加快产业化步伐，在青岛高新区建立产业孵化基地，遵循“立足青岛、辐射山东、服务全国”的发展方针，围绕国家“十三五”发展重点，以项目合作、产学研结合、举办国际研讨会和学术论坛等多种形式，联合创办国际首家“智能科技学院”，打造智能领域的“黄埔军校”，培养智能产业的“红领人才”。" />
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
<script type="text/javascript" src="Resources/js/WdatePicker.js"></script>

<script type="text/javascript">
	//当前页数
	var pageno = 1;

	//每页加载记录数量
	var pagerow = 10;
	//数据记录数
	var rowcount;
	var AwardTitle = "";
	var GetTime = "";
	var GrantUnit = "";
	var Winners = "";
	$(function() {
		$(".fenlei").click(function(){
		    $("#mobileflbox").toggle();
		  });
	sessionStorage.focusUrl_Name = "kyhd_kycg_kyjl.do";
		sessionStorage.focusUrl_ID = "kyhdyjfx";
		initTableData();
		NavKYHD();
		
	});
	function selectOnchang(){
		let str=$("#sel1").val();
		$(".find").hide();
		$("[name='"+str+"']").show(); 
		console.log(str);
	}
	//初始化表格内容
	function initTableData() {
		//XXXX代表后台do方法
		$.post("LoadAwardList.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerow,// 每页显示记录数
			AwardTitle : AwardTitle,
			GetTime : GetTime,
			GrantUnit : GrantUnit,
			Winners : Winners
		}, function(data) {
			//alert(JSON.stringify(data));
			if (data != null) {
				$("#newsTable").html('');
				//获取总记录条数
				var ht = "";
				for (var i = 0; i < data.list.length; i++) {
					ht = ht
							+ "<tr>"
							+ "<td style='text-align:center;'>"
							+ (i + 1)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].AwardTitle == null ? ""
									: data.list[i].AwardTitle)

							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].GrantUnit == null ? ""
									: data.list[i].GrantUnit)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].GetTime == null ? "" : (ymdDate(
									data.list[i].GetTime, 'yyyy-MM-dd')))
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].Winners == null ? ""
									: data.list[i].Winners) + "</td>" + "<tr>";
				}
				$("#newsTable").append(ht);//XXXX代表主要完成人字段
				pages(data.rows, pagerow, pageno);
				parent.setiHeight($(".rightcontent").height() + 240);
			}
		});
	}

	function GetChangePageData(pageno) {
		//XXXX代表后台do名称
		$.post("LoadAwardList.do", {
			pageno : pageno, // 当前页码，初始化时为1
			pagerow : pagerow,// 每页显示记录数
			AwardTitle : AwardTitle,
			GetTime : GetTime,
			GrantUnit : GrantUnit,
			Winners : Winners
		// 每页显示记录数
		}, function(data) {
			if (data != null) {
				$("#newsTable").html('');
				var ht = "";
				for (var i = 0; i < data.list.length; i++) {
					ht = ht
							+ "<tr>"
							+ "<td style='text-align:center;'>"
							+ ((pageno * 10 - 10) + i + 1)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].AwardTitle == null ? ""
									: data.list[i].AwardTitle)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].GrantUnit == null ? ""
									: data.list[i].GrantUnit)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].GetTime == null ? "" : (ymdDate(
									data.list[i].GetTime, 'yyyy-MM-dd')))
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].Winners == null ? ""
									: data.list[i].Winners) + "</td>" + "<tr>";
				}
				$("#newsTable").append(ht);//XXXX代表主要完成人字段
				pages(data.rows, pagerow, pageno);
				parent.setiHeight($(".rightcontent").height() + 240);
			}
		});
	}
	//点击开始搜索按钮触发事件
	function searchBtn_clickHandler() {
		//XXXX代表后台do方法
		$.post("LoadAwardList.do", {
			pageno : 1,
			pagerow : pagerow,
			AwardTitle : $("#AwardTitle").val(),
			GetTime : $("#GetTime").val(),
			GrantUnit : $("#GrantUnit").val(),
			Winners : $("#Winners").val()
		// 每页显示记录数
		}, function(data) {
			if (data != null) {
				//alert(JSON.stringify(data));
				$("#newsTable").html('');
				//获取总记录条数
				rowcount = null;
				rowcount = data.rows;
				var ht = "";
				if (rowcount == 0) {
					pages(data.rows, 0, 1);
					alert("没有匹配数据！");
				}
				for (var i = 0; i < data.list.length; i++) {
					ht = ht
							+ "<tr>"
							+ "<td style='text-align:center;'>"
							+ (i + 1)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].AwardTitle == null ? ""
									: data.list[i].AwardTitle)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].GrantUnit == null ? ""
									: data.list[i].GrantUnit)
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].GetTime == null ? "" : (ymdDate(
									data.list[i].GetTime, 'yyyy-MM-dd')))
							+ "</td>"
							+ "<td style='text-align:center;'>"
							+ (data.list[i].Winners == null ? ""
									: data.list[i].Winners) + "</td>" + "<tr>";
				}

				$("#newsTable").append(ht);
				pages(data.rows, pagerow, pageno);
				pageno = 1;
				parent.iFrameHeight();

			}

		});

	}
</script>
</head>

<body>
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
				<li><a	href="javascript:ContentJump('kyhd_kyfx.do','kyhdyjfx');">科研方向</a></li>					
				<li><a	href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">科研成果</a></li>
				<li><a	href="javascript:ContentJump('kyhd_kycg_zlcg.do','kyhdyjfx');">知识产权</a></li>	
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
							href="javascript:ContentJump('kyhd_kycg_zlcg.do','kyhdyjfx');">知识产权</a></li>
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
			<img src="Resources/img/banner_research.png" width="100%"/>
		</div>
		<div class=contentall>
			<div class=blank></div>
			<div class=contentshow>
				<div class=leftnav>
					<div class=ld>科学研究</div>
					<div class=secondnav>
						<ul>							
							<li><a 
								href="javascript:ContentJump('kyhd_kyfx.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 科研方向</a></li>
							<li><a class="active"
								href="javascript:ContentJump('kyhd_kycg_kyjl.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 科研成果</a></li>
							<li><a
								href="javascript:ContentJump('kyhd_kycg_zlcg.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 知识产权</a></li>							
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">科研成果</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>科学研究</span><span>></span>
							<span>科研成果</span>
						</p>					
					</div>
					<div class=contents>
						<div class="researchborder">
							<div class="row">
								 <div class="col">
									<div class="form-group">
										<select class="form-control" id="sel1" onchange="selectOnchang()">
											<option value="">请选择搜索项</option>
									        <option value="hjmc">获奖名称</option>
									        <option value="sydw">授予单位</option>
									        <option value="hdsj">获得时间</option>
									        <option value="hjry">获奖人员</option>
									      </select>
									 </div>
								</div>
								<div class="col">
									<div class="form-group find" name="hjmc">
									   <input type=text id="AwardTitle" maxlength="200" placeholder="搜索获奖名称" class="form-check-input">
									</div>
									<div class="form-group find" name="sydw" style="display:none;">
									   <input type=text id="GrantUnit" maxlength="200" placeholder="搜索授予单位" class="form-check-input">
									</div> 
									<div class="form-group find" name="hdsj" style="display:none;">
									   <input type=text id="GetTime" maxlength="200" onclick="WdatePicker()" placeholder="搜索获得时间" class="form-check-input">
									</div> 
									<div class="form-group find" name="hjry" style="display:none;">
									   <input type=text id="Winners" maxlength="200" placeholder="搜索获奖人员" class="form-check-input">
									</div>  
								</div>
								<div class="col selectbox">
									<input	type="button" value="开始搜索" onclick="searchBtn_clickHandler()"	class="btn btn-success">
								</div>	
								
								<!-- <tr>
									<td style="width:70px;height:40px;text-align:right;">获奖名称：</td>
									<td style="width:220px;height:40px;"><input type=text
										id="AwardTitle" style="height:30px;line-height:30px;"
										maxlength="200"></td>
									<td style="width:90px;height:40px;text-align:right;">授予单位：</td>
									<td style="width:220px;height:40px;"><input type=text
										id="GrantUnit" style="height:30px;line-height:30px;"
										maxlength="200"></td>
									<td rowspan="2" style="text-align:center;"><input
										type="button" value="开始搜索" onclick="searchBtn_clickHandler()"
										class="btn btn-success"></td>
								</tr>
								<tr>
									<td style="width:70px;height:40px;text-align:right;">获得时间：</td>
									<td style=" width:220px;height:40px;"><input type="text"
										class="form-control" id="GetTime" onclick="WdatePicker()"
										style="width:206px;height:30px;line-height:30px;"></td>
									<td style="width:90px;height:40px;text-align:right;">获奖人员：</td>
									<td style="width:220px;height:40px;"><input type=text
										id="Winners" style="height:30px;line-height:30px;"
										maxlength="200"></td>

								</tr> -->
							
						</div>
						<table class="table table-bordered table-hover"
							style="border-collapse:collapse;width:100%;margin-top:20px;font-size:14px;line-height:32px;color:#000000;border-color:#ccc;"
							cellspacing=0px cellpadding=5px>
							<thead>
								<tr>
									<th style="width: 70px;text-align:center;">序号</th>
									<th style="width: 300px;text-align:center;">奖励名称</th>
									<th style="width: 230px;text-align:center;">授予单位</th>
									<th style="width: 150px;text-align:center;">获得时间</th>
									<th style="width: 200px;text-align:center;">获奖人员</th>
								</tr>

							</thead>
							<tbody id="" style="word-break: break-all;">

							</tbody>
						</table>
						<div id="pages"></div>
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
