$(function() {
	$(".menu-box a").click(function() {
		$(".menu-box a").removeClass("active");
		$(this).addClass("active");
	})
	
	var href = window.location.href;
	var index = href.lastIndexOf("/") + 1;
	var currentPath = href.substring(index, href.length);
	$("#"+currentPath).addClass("active");
	
})
