
	
	function changeTab(a) {
		$(a).addClass("active").siblings().removeClass("active")
		$(".tab-con").hide();
		$(".tab-con").eq($(a).index()).show()
	}
	//下拉菜单
	$(function() {

		$("#toTop").click(function functionName() {
			$('body,html').animate({
				scrollTop : 0
			}, 500)
		})
		$(".tab li").click(function() {
			$(this).addClass("active").siblings().removeClass("active")
			$(".tab-content").children("ul").hide();
			$(".tab-content").children("ul").eq($(this).index()).show()
		})
		
		
		$(".select").each(function() {
			var s = $(this);
			var z = parseInt(s.css("z-index"));
			var dt = $(this).children("dt");
			var dd = $(this).children("dd");
			var _show = function() {
				dd.slideDown(200);
				dt.addClass("cur");
				s.css("z-index", z + 1);
			}; //展开效果
			var _hide = function() {
				dd.slideUp(200);
				dt.removeClass("cur");
				s.css("z-index", z);
			}; //关闭效果
			dt.click(function() {
				dd.is(":hidden") ? _show() : _hide();
			});
			dd.find("a").click(function() {
				dt.html($(this).html());
				_hide();
			}); //选择效果（如需要传值，可自定义参数，在此处返回对应的“value”值 ）
			$("body").click(function(i) {
				!$(i.target).parents(".select").first().is(s) ? _hide() : "";
			});
		})
		var index = $("#selextTitle").data("index");
		$("#nav").find("li").removeClass("active");
		$("#nav").find("li").eq(index).addClass("active");
		
		//覆盖
	    $(".menu li").mouseover(function () {
	    	console.log("li over");
	        $(".business-wrap").show();
	        $("#myCarousel").hide();
	    })
	    $(".business-wrap").mouseover(function () {
	    	console.log("business-wrap over");
	        $(".business-wrap").show();
	        $("#myCarousel").hide();
	    })
	    $(".wrap-box").mouseleave(function () {
	    	console.log("out");
	        $(".business-wrap").hide();
	        $("#myCarousel").show();
	    })
	    
	    
	    
	    //下拉
	    $(".navbar-header").mouseover(function() {
		$(".menu").slideDown("slow");
    });
	 $(".menu-wrap").mouseover(function(){
    	$(".menu").stop().show();
    }); 
	$(".menu-wrap").mouseout(function(){
    	$(".menu").slideUp("slow");
    })
    
  
	});
	
	
    
    
    