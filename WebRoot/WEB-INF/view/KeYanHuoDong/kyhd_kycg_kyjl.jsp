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
	sessionStorage.focusUrl_Name = "kyhd_kycg_kyjl.do";
		sessionStorage.focusUrl_ID = "kyhdyjfx";
		initTableData();
		NavKYHD();
	});

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
							<table
								style="width:100%;height:80px;font-size:14px;color:#000000;"
								border="0" cellspacing=0>
								<tr>
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

								</tr>
							</table>
						</div>
						<table class="table table-bordered table-hover"
							style="border-collapse:collapse;width:780px;margin-top:20px;font-size:14px;line-height:32px;color:#000000;border-color:#ccc;"
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
