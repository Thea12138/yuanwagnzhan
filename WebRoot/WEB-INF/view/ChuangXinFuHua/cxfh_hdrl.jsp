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
<link type="text/css" rel="stylesheet"	href="Resources/css/bootstrap.min.css" />
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/pages.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<style>
	#newsTable{
	width:100%;
	}
	#newsTable tr{
	width:100%;
	height:70px;
	font-size: 12px;
	
	}
	#newsTable tr td{
	border-bottom:1px dashed gray;

	
	}
	#newsTable .time{
	   /*  background-color: gray; */
		background: url(Resources/img/btn_time.png)  no-repeat center;
		color:white;
		text-align:center;
	}

	#newsTable .enter{
		background: url(Resources/img/btn_enter.png)  no-repeat center;
		color:white;
		text-align:center;
	}
	
</style>

<script type="text/javascript">
	//当前页数
	var pageno = 1;

	//每页加载记录数量
	var pagerow = 20;
	var NewsCategory = "F";
	//数据记录数
	var rowcount;
	/* window.onload = function() {
		parent.setiHeight($(".rightcontent").height() + 240);

	}; */
	$(function() {
	if(sessionStorage.focusUrl_Name=="xwdt_ldsc_frame.do" ){
		if(sessionStorage.pageno!=undefined && sessionStorage.pageno!='')	{
		    pageno=sessionStorage.pageno;
		}
		
	 }
	 sessionStorage.focusUrl_Name = "xwdt_ldsc_frame.do";
		sessionStorage.focusUrl_ID = "xwdtyjydtframe";
		initNewsList();
		NavCXFH();
		/* window.onload = parent.setiHeight($(".rightcontent").height() + 240); */

	});
	function initNewsList() {
		$
				.post(
						"LoadNewsList.do",
						{
							pageno : pageno,
							pagerow : pagerow,
							NewsCategory : NewsCategory
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#newsTable").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td class='time'>"
											+ (list[i].PublishDate == null ? ""
													: (""+ (ymdDate(list[i].PublishDate,'yyyy-MM-dd')) + ""))
											+ "</td>"
											+ "<td style='padding-left:24px'><span style='color:#0066cc;font-size:15px;'>"
											+"<a href='javascript:ContentJumpPage(\"NewsShow.do?NewsID="
											+ list[i].NewsID
											+ "&NewsCategory="
											+ NewsCategory
											+ "\");'>"
											+ SubStrFun(list[i].NewsTitle, 50)
											+ "</a></span><br/>"
											 +"<img src='Resources/img/ic_location.png'/><span style='color:gray;margin:6px'>" 
											+"高新区创业大厦"
											+"</span></td>"
											+"<td class='enter'>报名中</td>"
											+ "</tr>";
								}
								$("#newsTable").append(ht);
								pages(data.rows, pagerow, pageno);

								/* parent
										.setiHeight($(".rightcontent").height() + 240); */
							}
						});
	}
	function GetChangePageData(pageno) {
		$
				.post(
						"LoadNewsList.do",
						{
							pageno : pageno,
							pagerow : pagerow,
							NewsCategory : NewsCategory
						},
						function(data) {
							if (data != null) {
								$("#newsTable").html('');
								rowcount = data.rows;
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td class='new_title;'>"
											+"<img src='Resources/img/icon_point.png'/>"
											+"<a href='javascript:ContentJumpPage(\"NewsShow.do?NewsID="
											+ list[i].NewsID
											+ "&NewsCategory="
											+ NewsCategory
											+ "\");'>"
											+ SubStrFun(list[i].NewsTitle, 50)
											+ "</a></td>"
											+ "<td class='new_time'>"
											+ (list[i].PublishDate == null ? ""
													: ("["
															+ (ymdDate(
																	list[i].PublishDate,
																	'yyyy-MM-dd')) + "]"))
											+ "</td>" + "</tr>";
								}
								$("#newsTable").append(ht);
								currentPage = pageno;
								pages(data.rows, pagerow, pageno);
							 /* 	parent
										.setiHeight($(".rightcontent").height() + 240); */
							} 
						});
	}
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
							href="javascript:ContentJump('kyhd_kyfx.do','cxfhframe');">孵化服务</a></li>					
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','cxfhframe');">众创风采</a></li>
						<li><a
							href="javascript:ContentJump('cxfh_zcjj.do','cxfhframe');">众创基金</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','cxfhframe');">活动日历</a></li>
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
							<li><a 
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
							
							<li><a class="active"
								href="javascript:ContentJump('cxfh_hdrl.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 活动日历</a></li>
							<li><a 
								href="javascript:ContentJump('cxfh_tztg_frame.do');"><span
									class="glyphicon glyphicon-triangle-right"
									style="font-size:10px;"></span> 通知通告</a></li>											
						</ul>
					</div>
				</div>
				<div class=rightcontent>
					<div class=contentnav>
						<span class="nav_title">活动日历</span>
						<p>
							<img src="Resources/img/home.png" width="14px" style="margin-top:-2px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>产品孵化</span><span>></span>
							<span>活动日历</span>
						</p>					
					</div>

					<div class=contents>
						<table id="newsTable" >
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
