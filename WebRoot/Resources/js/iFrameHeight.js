/*function iFrameHeight() {

	var ifm = document.getElementById("mainframe");

	var subWeb = document.frames ? document.frames["mainframe"].document
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
*/

function setiHeight(h) {

	var ifm = document.getElementById("mainframe");
	ifm.height = h;
}

