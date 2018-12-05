$(document).ready(function(){
	$(".tac a").on("click",function(){
		//해당 아이디 저장
		var admin_id=$(this).data("admin_id");
		
		if(admin_id!=undefined){
			$("#admin_id").val(admin_id);
			
			$("#form_admin_li")
				.attr({"action":"/CMS/main/selectAdmin.tsis"})
				.submit();
		} else {
			alert("ID : "+admin_id+"\n잘못된 값이 입력되었습니다.");
		}
	});
	
	$("#newRegi").on("click",function(){
		$("#form_admin_li")
		.attr({"action":"/CMS/main/adminManageNew.tsis"})
		.submit();
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
		var arrId="";
		for(var i = 0 ; i < length ; i++){
			if(i==length-1){
				arrId += $("input[type=checkbox]:checked").eq(i).data("id");
			} else {
				arrId += $("input[type=checkbox]:checked").eq(i).data("id")+",";
			}
		}
		if(length==0){
			alert("선택된 항목이 없습니다.");
		}else {
			$("#admin_id").val(arrId);
			$("#form_admin_li")
			.attr({"action":"/CMS/main/deleteAdmin.tsis"})
			.submit();
		}
	});
});