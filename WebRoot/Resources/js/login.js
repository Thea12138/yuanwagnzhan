function logout() {
	$.ajax({
		url : "AccountLogout.do"
	});

	window.location = "login.do";
}