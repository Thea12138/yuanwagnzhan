<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>青岛智能产业技术研究院</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta name="keywords" content="青岛智能产业技术研究院，青岛智能产业研究院，青岛研究院，研究院，智能智铭科技有限公司，王飞跃，王晓，郑南宁，高彦臣，于立平，青岛智能产业，自动驾驶，人工智能，智能交通，智能驾驶" />
<meta name="description" content="青岛智能产业技术研究院（以下简称“青岛智能院”）按照“需求引导、创新驱动、联合协作、扎实推进”的原则，坚持世界眼光、树立国际标准，立足本土优势，在中科院自动化所市科技局、高新区管委的支持下，从无到有，汇集各方面人才与科技资源，走过了开创、建设和积累的四年，与300余位同事共同经历了建队伍、打基础、产学研转化上轨道、本地合作上台阶的四年。在团队建设、科技研发、产业落地等方面，均取得一定的成绩，获得30余项国家及省市区级别奖励。青岛智能院以“新理论支撑新技术，新技术赋能旧产业”为指导方针，时至2018，进一步明确了“科研顶天、产业立地”的发展战略。青岛智能院不断调整优化组织机构，紧紧围绕国际、国内技术进展，山东、青岛的实际需求，围绕智能制造、智能网络、智慧农业、智慧企业、智慧城市、智慧社会、智慧健康、智慧教育、智慧物流等方向设立14个研究所、1个技术研发中心和6个管理支撑部门，并基于平行理论统摄，在各所下设17个平行技术创新中心，为各行业提供灵捷、聚焦、收敛的技术服务。
智能院坚持世界眼光、国际标准，发挥自身优势，加快产业化步伐，在青岛高新区建立产业孵化基地，遵循“立足青岛、辐射山东、服务全国”的发展方针，围绕国家“十三五”发展重点，以项目合作、产学研结合、举办国际研讨会和学术论坛等多种形式，联合创办国际首家“智能科技学院”，打造智能领域的“黄埔军校”，培养智能产业的“红领人才”。" />
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
<script type="text/javascript" src="Resources/js/BackSpace.js"></script>
<script type="text/javascript" src="Resources/js/iFrameHeight.js"></script>
<script type="text/javascript" src="Resources/js/Jump.js"></script>
<script type="text/javascript" src="Resources/js/common.js"></script>

<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	//当前页数
	var pageno = 1;
	//每页加载记录数量
	var pagerow = 20;

	$(function() {
		sessionStorage.focusUrl_Name = "home";
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

	/* 首页轮播大图 */
	function initDynamic() {
		$
				.post(
						"GetHomeList.do",
						{
							pageno : pageno,//当前页码
							pagerow : pagerow
						//每页显示数量
						},
						function(data) {
						//	alert(JSON.stringify(data));
							if (data != null) {
								var ht = "<div class='item active'>";
								ht = ht
								+ "<a href=\"javascript:ContentJump('cpfa_yanfazx_frame.do','cpfayyhygl');\">"
										+ "<img style='width:1278px;height:420px;' src= \'"
										+ data.list3[0].PicUrl
										+ " \' />"
										+ "<div class='carousel-caption'>"
										+ "<div class='carouseltext'>"
										+ SubStrFun(data.list3[0].Title, 35)
										+ "</div></div>"
										+ "<div class='mediabrief' id='mediabrief1'>"
										+ SubStrFun(data.list3[0].Memo, 130)
										+ "</div></a></div>"
										+ "<div class='item'>"
										+ "<a href=\"javascript:ContentJump('kyhd_zdxm_frame.do','kyhdyjfx');\" >"
										+ "<img style='width:1278px;height:420px;' src= \'"
										+ data.list2[0].PicUrl
										+ " \' />"
										+ "<div class='carousel-caption'>"
										+ "<div class='carouseltext'>"
										+ SubStrFun(data.list2[0].Title, 35)
										+ "</div></div>"
										+ "<div class='mediabrief' id='mediabrief1'>"
										+ SubStrFun(data.list2[0].Memo, 130)
										+ "</div></a></div>"
										+ "<div class='item'>"
										+ "<a href=\"javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');\" >"
										+ "<img style='width:1278px;height:420px;' src= \'"
										+ data.list1[0].PicUrl
										+ " \' />"
										+ "<div class='carousel-caption'>"
										+ "<div class='carouseltext'>"
										+ SubStrFun(data.list1[0].Title, 35)
										+ "</div></div>"
										+ "<div class='mediabrief' id='mediabrief1'>"
										+ SubStrFun(data.list1[0].Memo, 130)
										+ "</div></a></div>";
								
								$("#DynamicData").append(ht);
							}
						});
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

<style type="text/css">
body,html {
	margin: 0;
	padding: 0;
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
</head>

<body style="margin:0;">
	<div id="homepage" class="homepage">
		<div class="lunbomedia">
			<div class="lunboimg" id="lunboimg">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					data-interval="5000">
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner" id="DynamicData"></div>
					<!-- 轮播（Carousel）导航 -->
					<div class="slideimg">
						<a class="carousel-control left" href="#myCarousel"
							data-slide="prev"
							style="line-height:40px;font-family:Arial;font-size:30px;width:50px;height:40px;">&lsaquo;</a>
						<a class="carousel-control right" href="#myCarousel"
							data-slide="next"
							style="line-height:40px;font-family:Arial;font-size:30px;width:50px;height:40px;"
							onclick="nextClick();">&rsaquo;</a>
					</div>
				</div>
			</div>
		</div>
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
</body>
</html>
