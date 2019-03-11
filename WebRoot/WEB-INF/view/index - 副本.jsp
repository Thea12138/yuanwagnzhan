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
.bannerhm{
	height:1073px !important;
}
@media screen and (max-width: 1600px){
	height:800px !important;
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
/*产品详情效果*/
.wrapper{
  width: 90%;
  margin: 0 auto;
  max-width: 80rem;
}

.cols{
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
      flex-wrap: wrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.col{
  width: calc(25% - 2rem);
  margin: 1rem;
  cursor: pointer;
}

.containerpro{
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
    -webkit-perspective: 1000px;
            perspective: 1000px;
}

.front,
.back{
  background-size: cover;
    background-position: center;
    -webkit-transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    -o-transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1), -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
    text-align: center;
    min-height: 240px;
    height: auto;
    border-radius: 10px;
    color: #fff;
    font-size: 1.5rem;
}

.back{
  background: #cedce7;
  background: -webkit-linear-gradient(45deg,  #222323 0%,#222323 100%);
  background: -o-linear-gradient(45deg,  #cedce7 0%,#596a72 100%);
  background: linear-gradient(45deg,  #cedce7 0%,#596a72 100%);
}

.front:after{
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
    content: '';
    display: block;
    opacity: .6;
    background-color: #rgba(0,0,0,0.3);
    -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
    border-radius: 10px;
}
.containerpro:hover .front,
.containerpro:hover .back{
    -webkit-transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    -o-transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1), -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
}

.back{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
}

.inner{
    -webkit-transform: translateY(-50%) translateZ(60px) scale(0.94);
            transform: translateY(-50%) translateZ(60px) scale(0.94);
    top: 50%;
    position: absolute;
    left: 0;
    width: 100%;
    padding: 2rem;
    -webkit-box-sizing: border-box;
            box-sizing: border-box;
    outline: 1px solid transparent;
    -webkit-perspective: inherit;
            perspective: inherit;
    z-index: 2;
}

.containerpro .back{
    -webkit-transform: rotateY(180deg);
            transform: rotateY(180deg);
    -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
}

.containerpro .front{
    -webkit-transform: rotateY(0deg);
            transform: rotateY(0deg);
    -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
}

.containerpro:hover .back{
  -webkit-transform: rotateY(0deg);
          transform: rotateY(0deg);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
}

.containerpro:hover .front{
  -webkit-transform: rotateY(-180deg);
          transform: rotateY(-180deg);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
}

.front .inner p{
  font-size: 26px;
  margin-bottom: 2rem;
  position: relative;
}

.front .inner p:after{
  content: '';
  width: 4rem;
  height: 2px;
  position: absolute;
  background: #C6D4DF;
  display: block;
  left: 0;
  right: 0;
  margin: 0 auto;
  bottom: -.75rem;
}

.front .inner span{
  color: rgba(255,255,255,1);
  font-family: 'Montserrat';
  font-weight: 300;
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
		var winW=$(window).width();
		if(winW<=1366){
			$("#md_lunbo").addClass("show");
			$("#lunbo").addClass("hide");
		}else{
			$("#md_lunbo").addClass("hide");
			$("#lunbo").addClass("show");

		}
		
		$(".productitem").hover(
		    function(){
		         $(this).children(".back").show();
		        $(this).children(".front").hide();
		    },
		    function(){
		        $(this).children(".back").hide();
		        $(this).children(".front").show();
		    }
		);		
		
		//parent.setiHeight(1340);
		////initxssy();
		//initDynamic();
		//initzqdj();
		//initnotice();

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
		$.post(
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

<body style="overflow:auto;overflow-x:hidden;margin:0 0;">
	<div class="header">
	    <div class="lunbomedia bannerhm" id="lunbo">
			<div id="myCarousel" class="carousel slide" data-interval="5000" style="width:100%;height:auto">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			        <li data-target="#myCarousel" data-slide-to="3"></li>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner bannerhm" style="width:100%;">
			        <div class="item active">
			            <img src="Resources/img/banner-01.png" alt="First slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-02.png" alt="Second slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-03.png" alt="Third slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-04.png" alt="Third slide">
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
		 <div class="lunbomedia" id="md_lunbo">
			<div id="myCarousel2" class="carousel slide" data-interval="5000" style="width:100%;height:auto">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel2" data-slide-to="1"></li>
			        <li data-target="#myCarousel2" data-slide-to="2"></li>
			        <li data-target="#myCarousel2" data-slide-to="3"></li>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner" style="width:100%;height:762px;">
			        <div class="item active">
			            <img src="Resources/img/banner-01.png" alt="First slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-02.png" alt="Second slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-03.png" alt="Third slide">
			        </div>
			        <div class="item">
			            <img src="Resources/img/banner-04.png" alt="Third slide">
			        </div>
			        
			    </div>
			    <!-- 轮播（Carousel）导航 -->
			    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			    </a>

			</div>
		</div>
	    <div class="headertop">			
			<img src="Resources/img/logo.png" height="40px"/>
			<div class=language>
				<!-- <img src="Resources/img/fir1.png" height="40px"/> -->	
				<div class="langue">
					<a class="lanActive" href="index.do">中文</a> | <a href="index_e.do" target="_blank">English</a>
				</div>	
				<div>
					<img src="Resources/img/weibo.png" height="40px" style="float:right;"/>
					<div class="wechat" style="display:none;"><img src="Resources/img/code.png"/></div>
					<img src="Resources/img/wechart.png" height="40px" id="wechat" style="float:right;margin-right:5px;"/>
				</div>	
			</div>
														
		</div>
		<div class="nav" id="nav">
			<ul class="nav-main" id="nav-main">
				<li id="home" class="home"><a
					href="javascript:PageJump('index');"><span class="spanactive">首页</span> </a></li>
				<li id="jibengk" class="jibengk">
					<a	href="javascript:PageJumpNo('jibengk');"><span class="spanhov">关于我们</span></a>
					<!-- <a	href="javascript:PageJumpNo('jibengk');">关于我们</a> -->
					<ul id="xiala1" class="xiala1 slideupd">
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
							href="javascript:ContentJump('jbgk_ywxw_frame.do','jibengk');">荣誉奖励</a></li>

					</ul>
				</li>
				<li id="xwdtyjydtframe" class="xwdtyjydtframe"><a
					href="javascript:PageJumpNo('xwdtyjydtframe');"><span class="spanhov">新闻中心</span></a>
					<ul class="xiala2 slideupd" id="xiala2">
						<li><a
							href="javascript:ContentJump('xwdt_tztg_frame.do','xwdtyjydtframe');">通知公告</a></li>						
						<li><a
							href="javascript:ContentJump('xwdt_ldsc_frame.do','xwdtyjydtframe');">领导视察</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_zqdj_frame.do','xwdtyjydtframe');">合作交流</a></li>
						<li><a
							href="javascript:ContentJump('xwdt_ygfc_frame.do','xwdtyjydtframe');">员工风采</a></li>						
					</ul>
				</li>
				<li id="cpfayyhygl" class="cpfayyhygl"><a
					href="#product"><span class="spanhov">产品介绍</span></a></li>
				<li id="kyhdyjfx" class="kyhdyjfx"><a
					href="javascript:PageJumpNo('kyhdyjfx');"><span class="spanhov">科学研究</span></a>
					<ul class="xiala3 slideupd" id="xiala3">
						<li><a
							href="javascript:ContentJump('kyhd_kyfx.do','kyhdyjfx');">科研方向</a></li>					
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">科研成果</a></li>
						<li><a
							href="javascript:ContentJump('kyhd_kycg_kyjl.do','kyhdyjfx');">知识产权</a></li>
					</ul>
				</li>			
				<li id="cxfhframe"><a
					href="javascript:PageJumpNo('cxfhframe');"><span class="spanhov">产业孵化</span></a>
					<ul class="xiala4 slideupd" id="xiala4">
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
				<li id="contactus"><a 
					href="javascript:PageJumpNo('contactus');"><span class="spanhov">联系我们</span></a>
					<ul class="xiala5 slideupd" id="xiala5">
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
	<div id="homepage" class="homepage">
		<div class="news">
			<div class="newsnav">
				 <span>新闻中心</span>
				 <a href="javascript:ContentJump('xwdt_ldsc_frame.do','kyhdyjfx');">
				 	<img src="Resources/img/ic_more.png">	
				 </a>			
			</div>
			<div class="line">
				 <img src="Resources/img/ic_line.png" width="100%">			
			</div>
			<div class="newscontent">
				<div class="newsimg">
					<!-- <img src="Resources/img/new_pic.png" width="100%"  height="100%" > -->
				</div>				
				<div class="newslist">
					<div class="newshow">
						<p class="newshowtitle">2018国家智能产业峰会即将在青岛盛大开幕</p>
						<p class="newshowcontent">为丰富员工的业余生活，加强精神文明建设，增强团队凝聚力，舒缓工作压力，青岛智能产业技术研究院工会于5月27日组织开展。</p>
					</div>
					<div class="newsotherlist">
						<ul>							
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-09]</span>
							</li>
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-09]</span>
							</li>
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-09]</span>
							</li>
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-09]</span>
							</li>
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-09]</span>
							</li>
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-09]</span>
							</li>						
							<li>
								<img src="Resources/img/ic_ new_point.png"/>
								<span class="itemtitle">青岛智能院开展“凝心聚力，携手并进”团队开展团建活动</span>
								<span class="itemtime">[2017-10-08]</span>
							</li>
						
						</ul>
					</div>
				</div>
				
				            				
			</div>
		</div>
		<div class="product" id="product">
		  	<img src="Resources/img/product_intro_bg.png" width="100%"/>
			<div class="productnav">
				 <span>产品介绍</span>
				 <a href="javascript:ContentJump('product_industry.do','kyhdyjfx');">
				 	<img src="Resources/img/ic_more.png"/>
				 </a>				
			</div>
			<div class="line">
				 <img src="Resources/img/ic_line_white.png" width="100%"/>			
			</div>
			<div class="productshow">
			   <div class="cols">
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
                <a href="javascript:ContentJump('product_industry.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_industry.png);">
                        <div class="inner">
                            <p>智慧产业</p>
              <span>Intelligent Industry</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                          <p>Our technology can be used for intelligent industry.</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_manufacture.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_manufacture.png);">
                        <div class="inner">
                            <p>智能制造</p>
              <span>Manufacture</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in manufacture.</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_driving.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_driving.png);">
                        <div class="inner">
                            <p>平行驾驶</p>
              <span>Driving</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology used in driving.</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_traffic.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_traffic.png);">
                        <div class="inner">
                            <p>平行交通</p>
              <span>Traffic</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in traffic.</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_data.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_data.png);">
                        <div class="inner">
                            <p>视频大数据</p>
              <span>Big Data</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in big data</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            <a href="javascript:ContentJump('product_health.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_health.png);">
                        <div class="inner">
                            <p>智慧医疗</p>
              <span>Medical  & Health</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in medical  & health</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_logistics.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_logistics.png);">
                        <div class="inner">
                            <p>智慧物流</p>
              <span>Logistics</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in logistics</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_education.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_education.png);">
                        <div class="inner">
                            <p>智慧教育</p>
              <span>Education</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in education</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_argiculture.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_agriculture.png);">
                        <div class="inner">
                            <p>智慧农业</p>
              <span>Agriculture</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in agriculture</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_energy.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_energy.png);">
                        <div class="inner">
                            <p>平行能源</p>
              <span>Energy</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in energy</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_media.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_media.png);">
                        <div class="inner">
                            <p>平行传媒</p>
              <span>Media</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in media</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col" ontouchstart="this.classList.toggle(&#39;hover&#39;);">
            	<a href="javascript:ContentJump('product_drone.do','kyhdyjfx');">
                <div class="containerpro">
                    <div class="front" style="background-image: url(Resources/img/product_intro_drone.png);">
                        <div class="inner">
                            <p>无人机</p>
              <span>Drone</span>
                        </div>
                    </div>
                    <div class="back">
                        <div class="inner">
                            <p>Our technology can be used in drone</p>
                        </div>
                    </div>
                </div>
                </a>
            </div>
        </div>									         					        		            	           				            				
			</div>
			<div class="clear"></div>
		</div>
		<div class="cooperation_partner">				
		    <img src="Resources/img/pic_partner.png" width="100%">
		</div>
	</div>
	
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
