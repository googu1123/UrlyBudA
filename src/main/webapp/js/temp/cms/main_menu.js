$(document).ready(function() {
	$(".hide").hide();

	$(".menu1").mouseover(function() {
		$(".hide").show();
	});
	$(".menu1").mouseout(function() {
		$(".hide").hide();
	});
	

	// 도입안내/도입문의/고객지원
	$(".moveToPage").click(function(){
	
		$("#dataParam").val($(this).data("param"));
//		console.log("dataParam = " + $("#dataParam").val());
//		alert($("#dataParam").val());
		
		if($("#dataParam").val() == "sitemap") {
			$(".pop_area").show();
		} else {
			$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(this).data("url"), method:"post"}).submit();
		}

	});
	
	$(".btn_close").click(function(){
		$(".pop_area").hide();
	});
	
	$("#ticker").ticker();
	
	jQuery.fn.ticker = function(settings) {

		var ticker = $(this);
		var itemsCollection =  ticker.find('li');

		var current=0;
		var paused=0;
		var interval=4000;
		if (ticker.attr('interval')) interval = ticker.attr('interval');

		itemsCollection.each(function() {
			if ($(this).height() > ticker.height()) {
				ticker.height($(this).height());
			}
		});

		itemsCollection.hide().filter(":eq(0)").show().add("li");

		itemsCollection.hover(
			function(){ paused=1; },
			function(){ paused=0; }
		);

		function tick() {
			if (paused){ return; };

			ticker.find("li:eq("+current+")").fadeOut("slow",function(){
			  $(this).hide();
			});

			current = ++current%itemsCollection.size();
			ticker.find("li:eq("+current+")").fadeIn("slow");
		}

		if (itemsCollection.length > 1) {
			setInterval(tick,interval);
		}
	};
	
	
	
});

