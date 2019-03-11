
/*导航动态效果*/
$(document).ready(function(){
  $("#nav-main li").mouseenter(function(){
	  $(this).children("ul.slideupd").slideDown("slow");
  });
  $("#nav-main li").mouseleave(function(){
	  $(this).children("ul.slideupd").slideUp("1000");
  });
  /*微信点击事件*/
  $("#wechat").click(function(){
  	$(".wechat").toggle();
  });
});
function PageJump(navid) {
	/*$(".nav a").each(function(index) {
		$(".nav a").removeClass("active1");
	});
	$("#" + navid + ">a").addClass("active1");*/
//	var ifm = document.getElementById("mainframe");
//	ifm.src = navid + ".do";
	parent.window.location.href= navid + ".do";
	window.scroll(0, 0);
}

/*function PageJumpNo(navid) {
	$(".nav a").each(function(index) {
		$(".nav a").removeClass("active1");
	});
	$("#" + navid + ">a").addClass("active1");
}*/

function navJump(navid, firstnavid) {
	/*$(".nav a").each(function(index) {
		$(".nav a").removeClass("active1");
	});
	$("#" + firstnavid + ">a").addClass("active1");*/
	var ifm = document.getElementById("mainframe");
	ifm.src = navid + ".do";
	window.scroll(0, 0);
}

function ContentJump(contentdo, navid) {
	  // parent.document.getElementById("mainframe").src = contentdo;
		/*$("#" + navid + ">a").addClass("active1");*/
		parent.window.location.href= contentdo;
		

}



function JumpToIndex() {
	parent.window.location = "index.do";
	
}

function ContentJumpPage(purl) {
	//parent.document.getElementById("mainframe").src = purl;
	parent.window.location.href= purl;

}

function IndexPageJump(navid, contentID) {
	$(".nav a").each(function(index) {
		$(".nav a").removeClass("active1");

	});
	$("#" + navid + ">a").addClass("active1");
	var ifm = document.getElementById("mainframe");
	ifm.src = navid + ".do";
	parent.document.getElementById("mainframe").src = contentID;
}

function NavHOME() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#home", window.parent.document).children(":first-child").addClass(
			"active1");
	$("#home", window.parent.document).children(":first-child").focus();
}

function NavYK() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#jibengk", window.parent.document).children(":first-child").addClass(
			"active1");
	$("#jibengk", window.parent.document).children(":first-child").focus();
	$("#jibengk", window.parent.document).children(":first-child").blur();
}

function NavXWDT() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#xwdtyjydtframe", window.parent.document).children(":first-child")
			.addClass("active1");
	$("#xwdtyjydtframe", window.parent.document).children(":first-child")
			.focus();
}

function NavKYHD() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#kyhdyjfx", window.parent.document).children(":first-child").addClass(
			"active1");
	$("#kyhdyjfx", window.parent.document).children(":first-child").focus();
}

function NavCPFA() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#cpfayyhygl", window.parent.document).children(":first-child").addClass(
			"active1");
	$("#cpfayyhygl", window.parent.document).children(":first-child").focus();
}

function NavZXNS() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#zxnsframe", window.parent.document).children(":first-child").addClass(
			"active1");
	$("#zxnsframe", window.parent.document).children(":first-child").focus();
}
function NavCXFH() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#cxfhframe", window.parent.document).children(":first-child")
			.addClass("active1");
	$("#cxfhframe", window.parent.document).children(":first-child")
			.focus();
}
function NavContus() {
	$("#nav", window.parent.document).children("ul").children("li").children(
			":first-child").removeClass("active1");
	$("#contactus", window.parent.document).children(":first-child").addClass(
			"active1");
	$("#contactus", window.parent.document).children(":first-child").focus();
}

$(document).ready(
		function() {

			$("#home").click(
					function() {
						$('#nav-main').children().not("#home").find("ul")
								.hide();						
					});

			$("#jibengk").click(
					function() {
						$('#nav-main').children().not("#jibengk").find("ul")
								.hide();						
						$('#xiala1').toggle();
						
					});


			$("#xwdtyjydtframe").click(
					function() {
						$('#nav-main').children().not("#xwdtyjydtframe").find(
								"ul").hide();
						
						$('#xiala2').toggle();
						
					});


			$("#kyhdyjfx").click(
					function() {
						$('#nav-main').children().not("#kyhdyjfx").find("ul")
								.hide();					
						$('#xiala3').toggle();
					});

			$("#cxfhframe").click(
					function() {
						$('#nav-main').children().not("#cxfhframe").find("ul")
								.hide();						
						$('#xiala4').toggle();						
					});


			$("#zxnsframe").click(
					function() {
						$('#nav-main').children().not("#zxnsframe").find("ul")
								.hide();
						$('#nav-main').children().not("#zxnsframe")
								.find("span").removeClass(
										"glyphicon glyphicon-chevron-up")
								.addClass("glyphicon glyphicon-chevron-down");

					});
			
			$("#contactus").click(
					function() {
						$('#nav-main').children().not("#contactus").find("ul")
								.hide();
						$('#xiala5').toggle();						
					});


	/*		$("#yjygkzzjg").click(
					function() {	
						$("#zzjgxiala").toggle();
						
						$("#yjygkzzjg").find("span").toggleClass(
								"glyphicon glyphicon-chevron-right");
						$("#yjygkzzjg").find("span").toggleClass(
						"glyphicon glyphicon-chevron-down");
						height = $("#yjygkzzjg").css("height");
					});*/
			
			/*$("#recruitment_data li").click(
					
					function() {	
						alert("ss");
						$(this).addClass("recruitment_title");
						$(this).find("span").toggleClass("glyphicon glyphicon-chevron-down");
						$(this).find("span").toggleClass("glyphicon glyphicon-chevron-up");
						$(this).find(".recruitment_detail").toggle();
						
						
					});*/
			$("#zzjg").click(
					function() {	
						$("#zzjgxiala").toggle();
						
						$("#yjygkzzjg").find("span").toggleClass(
								"glyphicon glyphicon-chevron-right");
						$("#yjygkzzjg").find("span").toggleClass(
						"glyphicon glyphicon-chevron-down");
						height = $("#yjygkzzjg").css("height");
						
					});

/*			$("#kyhdkycg").click(
					function() {
						$("#kycgxiala").toggle();
						$("#kyhdkycg").find("span").toggleClass(
								"glyphicon glyphicon-chevron-down");
						$("#kyhdkycg").find("span").toggleClass(
								"glyphicon glyphicon-chevron-right");
						height = $("#kyhdkycg").css("height");
						if (height != "134px") {
							$("#kyhdkycg").css("height", "134px");
						} else
							$("#kyhdkycg").css("height", "auto");
					});*/
			$("#kycg").click(
					function() {
						$("#kycgxiala").toggle();
						$("#kyhdkycg").find("span").toggleClass(
								"glyphicon glyphicon-chevron-down");
						$("#kyhdkycg").find("span").toggleClass(
								"glyphicon glyphicon-chevron-right");
					});


		});

