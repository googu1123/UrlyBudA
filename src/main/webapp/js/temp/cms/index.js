$(document).ready(function(){
	init();
	
	$(".b_bottom a").on("click",function(){
		if($(this).attr("class")=="off"){
			return false;
		} else {
			$("#form_index").attr({action:"/CMS"+$(this).data("url"), method:"post"}).submit();
		}
	});
	
	$(".b_bottom a").on("mouseover",function(){
		var img =$(this).find("img").attr("src");
		if($(this).attr("class")=="off"){
			return false;
		} else {
			img = img.replace("_off\.png","_on\.png");
			$(this).find("img").attr("src",img);
		}
	}).on("mouseout",function(){
		var img =$(this).find("img").attr("src");
		if($(this).attr("class")=="off"){
			return false;
		} else {
			img = img.replace("_on\.png","_off\.png");
			$(this).find("img").attr("src",img);
		}
		
	});
	
	
});


function init(){
	for(var i = 0; i < $(".b_bottom dl dt").length; i++){
		var temp = $(".b_bottom dl dt").eq(i).text();
		if(temp.length >= 10){
			$(".b_bottom dl dt").eq(i).addClass("ft16");
		} 
	}
}