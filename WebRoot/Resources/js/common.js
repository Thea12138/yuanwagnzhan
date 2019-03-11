
function getQueryString(realName) {
	var url = location.href;
	var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
	var paraObj = {};
	for (var i = 0; j = paraString[i]; i++) {
		paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
				.indexOf("=") + 1, j.length);
	}
	var returnValue = paraObj[realName.toLowerCase()];
	if (typeof (returnValue) == "undefined") {
		return "";
	} else {
		alert(returnValue);
		return returnValue;
	}
}



function ContentiFrameHeight() {
	
	var ifm = document.getElementById("frame_content");

	var subWeb = document.frames ? document.frames["frame_content"].document
			: ifm.contentDocument;

	if (ifm != null && subWeb != null) {

		var Sys = {};
		var ua = navigator.userAgent.toLowerCase();
		var s;
		(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] : (s = ua
				.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] : (s = ua
				.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] : (s = ua
				.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] : (s = ua
				.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

		if (Sys.chrome) {
			ifm.height = subWeb.body.offsetHeight + 50;
		} else {
			ifm.height = (subWeb.body.offsetHeight > subWeb.body.scrollHeight ? subWeb.body.offsetHeight
					: subWeb.body.scrollHeight) + 50;
		}
	}
}

function SubStrFun(str, len) {
	if (str.length > len) {
		return str.substring(0, len) + "...";
	} else {
		return str;
	}
}

Date.prototype.format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
};

function ymdDate(date, f) {
	var testDate = new Date(date);// 这里必须是整数，毫秒
	return testDate.format(f);
}

(function($) {
	$.getUrlParam = function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	};
})(jQuery);

function NavJump(Selectid){
		$("#navul li").each(function(index) {
			$("#navul li").removeClass("active");
		});
		$("#"+Selectid).addClass("active");
		$("#"+Selectid).focus();
}