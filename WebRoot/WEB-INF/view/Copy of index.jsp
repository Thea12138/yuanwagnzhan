<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>青岛智能产业技术研究院</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />

<link type="text/css" rel="stylesheet" href="Resources/css/style.css" />
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon"
	href="Resources/favicon.ico" media="screen" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Resources/js/jQuery-1.11.0.js"></script>
<script type="text/javascript" src="Resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="Resources/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<script type="text/javascript" src="Resources/js/iFrameHeight.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>


<style>
/* glyphicon glyphicon-chevron-down {
	font-size: 8px;
}
 */
 .nav .nav-main{
	width: 100%;
	height: 40px;
	padding: 0px;
	margin: 0px;
	margin: 0 auto;

}
.nav .nav-main li{
	display: inline;
	width: 14%;
	height: 40px;
	line-height: 40px;
	float: left;
	text-align: center;

}
.nav .nav-main li ul {
	position: absolute;
	z-index: 1;
	padding: 0;
	float: left;
	width: 100%;
	height: auto;
	display: none;
}

.nav .nav-main li ul li {
	clear: both;
	list-style: none;
	float: left;
	margin: 0;
	width: 100%;
}

.nav .nav-main li ul li a {
	margin: 0;
	text-decoration: none;
	width: 100%;
	height: 40px;
	color: #fff;
	line-height: 40px;
	/* background-color: #4a5659; */
	background-color:rgb(0,62,141);
	filter: alpha(Opacity =60);
	-moz-opacity: 0.57;
	opacity: 0.60;
}

.nav .nav-main li ul li a:link {
	color: #fff;
}

.nav .nav-main li ul li a:hover {
	filter: alpha(Opacity = 60);
	-moz-opacity: 0.60;
	opacity: 0.60;
	background-color: #2B3A4C; /* 
	 */
	color: #fff;
}

.xiala1 a:active {
	color: #fff;
}

.yjygkjj:after {
	position: absolute;
	bottom: 0;
	width: 0;
	height: 0;
	left: 50%;
	margin-left: -10px;
	border-bottom: 10px solid #000000;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
}

.yjygkjj:before {
	position: absolute;
	top: -10px;
	width: 0;
	height: 0;
	left: 50%;
	margin-left: -10px;
	content: " ";
	border-bottom: 10px solid #000000;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
}

.shadow {
	z-index: -100;
	width: 283px;
	height: 216px;
	background: #000;
	position: relative;
	top: -216px;
	right: -19px;
	opacity: 0.7;
	clear: both;
	pointer-events: none;
}

.carousel-indicators .active {
	background: #67AFFE;
}

.carousel-indicators li {
	background: #fff;
	border: 0;
}

.carousel1-caption {
	position: relative;
	top: -70px;
	display: block;
	text-align: center;
	width: 305px;
	height: 30px;
}

.carousel-caption {
	width: 1174px;
	height: 40px;
	position: absolute;
	left: 0px;
	top: 380px;
	z-index: 1000;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	padding: 20px;
	opacity: 0.6;
	filter: Alpha(opacity =   60);
	background-color: #000000;
	color: #ffffff;
}

.carouseltext {
	width: 774px;
	height: 40px;
	position: absolute;
	left: 230px;
	top: 0px;
	text-align: left;
	line-height: 40px;
}

.slideimg {
	width: 100px;
	height: 40px;
	float: right;
	opacity: 0.6;
	filter: Alpha(opacity = 60);
	background-color: #000000;
	padding: 0;
	position: absolute;
	right: 0px;
	top: 380px;
	z-index: 1000;
}

.item {
	height: 560px;
}

.item a {
	text-decoration: none;
	font-family: Arial;
	font-size: 12px;
	line-height: 28px;
	color: #000000;
}

.item a:hover {
	color: #0066cc;
}
</style>
<script type="text/javascript">
	//当前页数
	var pageno = 1;
	//每页加载记录数量
	var pagerow = 20;

	$(function() {
		sessionStorage.focusUrl_Name = "index";
		sessionStorage.focusUrl_ID = "";
		NavHOME();
		//parent.setiHeight(1340);
		initxssy();
		initDynamic();
		initzqdj();
		initnotice();

	});

	// 学术盛宴
	function initxssy() {
		$

				.post(
						"GetHomeNewsList.do",
						{
							NewsCategory : "D",
							rowcount : 3
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#mtimgdata").html('');
								var list = data.list;
								var ht = "";
								var tht = "";
								var m = 0;
								for (var i = 0; i < list.length; i++) {
									m += 1;
									ht = ht
											+ "<td style='width:283px;height:216px;'>"
											+ "<a href='javascript:ContentJumpPage(\"NewsShow.do?NewsID="
											+ list[i].NewsID
											+ "&NewsCategory=D"
											+ "\");'>"
											+ "<img style='width:283px;height:216px;' src= \'"
											+ list[i].ThumbPicture
											+ " \' onmouseover='shadowshow(this)' onmouseleave='shadowleave(this)'/>"
											+ "<div id='shadow' class= 'shadow'>"
											+ "<div style='color:#fff;font-weight:bold;text-align:center;line-height:18px;position:relative;left:30px;top:95px;width:224px;height:43px;' >"
											+ SubStrFun(list[i].NewsTitle, 40)
											+ "</div></div>" + "</a></td>";
									if (m > 2)
										break;
								}
								tht = "<table style='width:960px;height:220px;text-align:center;margin:0 auto;'><tr style='border-collapse: collapse;height:216px;'>"
										+ ht + "</tr></table>";
								$("#mtimgdata").append(tht);
							}
							;
						});
	}

	function shadowshow(id) {
		$(id).siblings(".shadow").css("z-index", "10");
	}

	function shadowleave(id) {
		$(id).siblings(".shadow").css("z-index", "-1");
	}
	

	// 政企对接列表
	function initzqdj() {
		$
				.post(
						"GetHomeNewsList.do",
						{
							NewsCategory : "B",
							rowcount : 7
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#zqdjdata").html('');
								var list = data.list;
								var ht = "";
								var tht = "<div class='item active' style='height:238px;'>";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td style='width:270px;height:27px;line-height:27px;padding-left:10px;padding-right:10px;border-bottom:2px dotted #a0a7af;'><a style='color:#626e7b;font-size:12px;font-family:Microsoft Yahei;' href='javascript:ContentJumpPage(\"NewsShow.do?NewsID="
											+ list[i].NewsID
											+ "&NewsCategory="
											+ "B"
											+ "\");'>"
											+ SubStrFun(list[i].NewsTitle, 11)
											+ "</a></td>"
											+ "<td style='width:80px;font-size:12px;color:#e0e0e0;border-bottom:2px dotted #a0a7af;'>"
											+ (list[i].PublishDate == null ? ""
													: ((ymdDate(
															list[i].PublishDate,
															'yyyy-MM-dd'))))
											+ "</td>" + "</tr>";
								}
								for (var i = 0; i < 4; i++) {
									tht = tht
											+ "<a href='javascript:ContentJumpPage(\"NewsShow.do?NewsID="
											+ list[i].NewsID
											+ "&NewsCategory=B"
											+ "\");'>"
											+ "<img style='width:305px;height:238px;' src= \'"
										    + list[i].ThumbPicture
										    + " \' /></a>"
											+ "<div class='carousel1-caption' style='font-size:14px;font-weight:bold;color:#fff;'>"
											+ SubStrFun(list[i].NewsTitle, 14)
											+ "</div></div>";
									if (i < 3) {
										tht = tht + "<div class='item'>";
									}
								}
								$("#zqdjdata").append(ht);
								$("#carouselinner").append(tht);
								pages(data.rows, pagerow, pageno);
								parent
										.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}

	// 通知通告
	function initnotice() {
		$
				.post(
						"GetHomeNewsList.do",
						{
							NewsCategory : "F",
							rowcount : 7
						},
						function(data) {
							//alert(JSON.stringify(data));
							if (data != null) {
								$("#noticedata").html('');
								var list = data.list;
								var ht = "";
								for (var i = 0; i < list.length; i++) {
									ht = ht
											+ "<tr>"
											+ "<td style='width:270px;height:27px;line-height:27px;padding-left:10px;padding-right:10px;border-bottom:2px dotted #a0a7af;'><a style='color:#626e7b;font-size:12px;font-family:Microsoft Yahei;' href='javascript:ContentJumpPage(\"NewsShow.do?NewsID="
											+ list[i].NewsID
											+ "&NewsCategory="
											+ "F"
											+ "\");'>"
											+ SubStrFun(list[i].NewsTitle, 11)
											+ "</a></td>"
											+ "<td style='width:80px;font-size:12px;color:#e0e0e0;border-bottom:2px dotted #a0a7af;'>"
											+ (list[i].PublishDate == null ? ""
													: ((ymdDate(
															list[i].PublishDate,
															'yyyy-MM-dd'))))
											+ "</td>" + "</tr>";
								}
								$("#noticedata").append(ht);
								pages(data.rows, pagerow, pageno);
								parent
										.setiHeight($(".rightcontent").height() + 240);
							}
						});
	}
</script>
</head>

<body style="overflow:auto;overflow-x:hidden;margin:0 0">
	<div id="header" class="header">
	    <div class="lunbomedia">
			<div id="myCarousel" class="carousel slide" data-interval="5000">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			        <li data-target="#myCarousel" data-slide-to="3"></li>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner"">
			        <div class="item active">
			            <img src="Resources/img/banner-01.png" width="100%" alt="First slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-02.png"  width="100%" alt="Second slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-03.png"  width="100%" alt="Third slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-04.png"  width="100%" alt="Third slide">
			        </div>
			        
			    </div>
			    <!-- 轮播（Carousel）导航 -->
			    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			    </a>

			</div>
		</div>
		<div class="headertop">			
			<img src="Resources/img/ic_logo.png" >	
			<div class=language>
				<a class="lanActive" href="index.do">中文</a> | <a href="index_e.do">English</a>
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
							href="javascript:ContentJump('jbgk_wyjs.do','jibengk');">我院介绍</a></li>
						<li id="zzjgxswyh"><a
							href="javascript:ContentJump('jbgk_xswyh.do','jibengk');">学术委员会</a></li>
						<li id="yjygkxrld"><a
							href="javascript:ContentJump('jbgk_yjyld.do','jibengk');">研究院领导</a></li>
						<li id="zzjg_zzjg_yanfazx"><a
							href="javascript:ContentJump('jbgk_zzjg_yanfazx.do','jibengk');">组织结构</a></li>
						<li id="yjygkywxw"><a
							href="javascript:ContentJump('jbgk_ywxw_frame.do','jibengk');">院务新闻</a></li>
						<li id="yjygkmbxz"><a
							href="javascript:ContentJump('jbgk_mbxz.do','jibengk');">模板下载</a></li>

					</ul></li>
				<li id="xwdtyjydtframe" class="xwdtyjydtframe"><a
					href="javascript:PageJumpNo('xwdtyjydtframe');">新闻中心</a>
					<ul class="xiala2" id="xiala2">
						<li><a
							href="javascript:ContentJump('xwdt_tztg_frame.do','xwdtyjydtframe');">通知通告</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');">领导视察</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zqdj_frame.do','xwdtyjydtframe');">政企对接</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ygfc_frame.do','xwdtyjydtframe');">员工风采</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zyry_frame.do','xwdtyjydtframe');">重要荣誉</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_hyqbjb_frame.do','xwdtyjydtframe');">行业情报简报</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zncyqk.do','xwdtyjydtframe');">智能产业期刊</a></li>

					</ul></li>
				<li id="kyhdyjfx" class="kyhdyjfx"><a
					href="javascript:PageJumpNo('kyhdyjfx');">产品介绍</a>
					<ul class="xiala3" id="xiala3">
						<li><a
							href="javascript:ContentJump('kyhd_xssy_frame.do','kyhdyjfx');">学术盛宴</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_zdxm_frame.do','kyhdyjfx');">重点项目</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">科研成果</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_zjft_frame.do','kyhdyjfx');">专家访谈</a></li>
					</ul></li>
				<li id="cpfayyhygl" class="cpfayyhygl"><a
					href="javascript:PageJumpNo('cpfayyhygl');">科学研究</a>
					<ul class="xiala4" id="xiala4">
						<li id="cpfa_yanfazx"><a
							href="javascript:ContentJump('cpfa_yanfazx_frame.do','cpfayyhygl');">技术研发中心</a></li>
						<li id="cpfa_jiankangs"><a
							href="javascript:ContentJump('cpfa_jiankangs_frame.do','cpfayyhygl');">智慧健康研究所</a></li>
						<li id="cpfa_jiaoyus"><a
							href="javascript:ContentJump('cpfa_jiaoyus_frame.do','cpfayyhygl');">智慧教育研究所</a></li>
						<li id="cpfa_wangluos.do"><a
							href="javascript:ContentJump('cpfa_wangluos_frame.do','cpfayyhygl');">智慧网络研究所</a></li>
						<li id="cpfa_nongyes"><a
							href="javascript:ContentJump('cpfa_nongyes_frame.do','cpfayyhygl');">智慧农业研究所</a></li>
						<li id="cpfa_chengshis"><a
							href="javascript:ContentJump('cpfa_chengshis_frame.do','cpfayyhygl');">智慧城市研究所</a></li>
						<li id="cpfa_shehuis"><a
							href="javascript:ContentJump('cpfa_shehuis_frame.do','cpfayyhygl');">智慧社会研究所</a></li>
						<li id="cpfa_wulius"><a
							href="javascript:ContentJump('cpfa_wulius_frame.do','cpfayyhygl');">智慧物流研究所</a></li>
						<li id="cpfa_qiyes"><a
							href="javascript:ContentJump('cpfa_qiyes_frame.do','cpfayyhygl');">智慧企业研究所</a></li>
						<li id="cpfa_shujus"><a
							href="javascript:ContentJump('cpfa_shujus_frame.do','cpfayyhygl');">智慧数据研究所</a></li>

					</ul></li>
				<li id="zxnsframe"><a
					href="javascript:PageJump('zxns_zxns_frame');">创新孵化</a></li>
				<li id="contactus"><a href="javascript:PageJump('lxwm_lxwm');">联系我们</a>
				</li>
			</ul>

		</div>

	</div>
	<div class="clear"></div>
	<div id="homepage" class="homepage">
		<div class="othernav">
			<div class="newsnavborder1">
				<div class="newsnav1">新闻中心</div>
			</div>
			<div class="othernewsnav">
				<div class="newsimg">
					<div id="Carousel-dt" class="carousel slide" data-ride="carousel"
						data-interval="4000" style="width:305px;height:238px;">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#Carousel-dt" data-slide-to="0" class="active"></li>
							<li data-target="#Carousel-dt" data-slide-to="1"></li>
							<li data-target="#Carousel-dt" data-slide-to="2"></li>
							<li data-target="#Carousel-dt" data-slide-to="3"></li>
						</ol>

						<!-- 轮播（Carousel）项目 -->
						<div id="carouselinner" class="carousel-inner"
							style="width:305px;height:238px;"></div>
					</div>
				</div>
				<div class="newszqdj">
					<div class="zqdjnav">
						<div class="zqdjtitle">政企对接</div>
						<div class="zqdjmore">
							<a
								href="javascript:ContentJump('xwdt_zqdj_frame.do','xwdtyjydtframe');">more
								&gt;&gt;</a>
						</div>
					</div>
					<div id="zqdjdata" class="zqdjdata"></div>
				</div>
				<div class="newsnotice">
					<div class="noticenav">
						<div class="noticetitle">通知通告</div>
						<div class="noticemore">
							<a
								href="javascript:ContentJump('xwdt_tztg_frame.do','xwdtyjydtframe');">more
								&gt;&gt;</a>
						</div>
					</div>
					<div id="noticedata" class="noticedata"></div>
				</div>
			</div>
		</div>
		<div class="news">
			<div class="newsnavborder2">
				<div class="newsnav2">学术盛宴</div>
			</div>
			<div class="newsshow" id="mtimgdata"></div>
		</div>
	</div>
	
	<div class="foot">
		<div class="foottext"></div>
		<div class="footnav">
			<ul>
				<li><a href="http://www.cas.cn/">中国科学院</a></li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.ia.cas.cn/">中国科学院自动化研究所</a></li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.compsys.ia.ac.cn/">复杂系统管理与控制国家重点实验室</a>
				</li>
				<li><span style="color:#fff;">|</span></li>
				<li><a href="http://www.casc.ac.cn/">东莞科学院云计算产业技术创新与育成中心</a></li>

			</ul>
		</div>
		<div class=copyright>青岛智能产业技术研究院 版权所有 鲁ICP备15005983号-1</div>
		<div class=address>地址：青岛高新区智力岛路1号创业大厦B座26层</div>
	</div>
	<div class="clear"></div>
</body>
</html>
