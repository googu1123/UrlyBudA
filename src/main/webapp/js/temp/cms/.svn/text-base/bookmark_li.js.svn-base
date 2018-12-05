$(document).ready(function(){
	
	$(".tac a").on("click",function(){
		$("#form_bookmark").attr({"action":"/CMS"+$(this).data("url"),"method":"post"}).submit();
	});
	
	$("#checkAll").on("click",function(){
		if($("#checkAll").attr("checked")=="checked"){
			$(".tac input[type=checkbox]").attr("checked",true);
		} else {
			$(".tac input[type=checkbox]").attr("checked",false);
		}
	});
	
	$(".tac input[type=checkbox]").on("click",function(){
		$("#checkAll").attr("checked",false);
	});
	
	$("#btnDelete").on("click",function(){
		var length = $("input[type=checkbox]:checked").not("#checkAll").length;
		var arrSeq="";
		for(var i = 0 ; i < length ; i++){
			if(i==length-1){
				arrSeq += $("input[type=checkbox]:checked").not("#checkAll").eq(i).data("page_index");
			} else {
				arrSeq += $("input[type=checkbox]:checked").not("#checkAll").eq(i).data("page_index")+",";
			}
		}
		if(length==0){
			alert("선택된 항목이 없습니다.");
		}else {
			$("#delete_number").val(arrSeq);
			$("#form_bookmark")
			.attr({"action":"/CMS/main/deleteBookmark.tsis"})
			.submit();
		}
	});
});