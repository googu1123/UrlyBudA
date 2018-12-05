$(document).ready(function(){
	var module_icon="";
	$(".btn_td").click(function(){
		$("#mSeq").val($(this).data("param"));
		module_icon = $(this).data("img").split(".");
		module_icon = module_icon[0];
//		alert($("#module_seq").val());

		if($(this).data("effect") == "activate") {
			$(".pop").css("display", "block");
		}
		else {
			if(confirm("선택한 모듈을 비활성화 하시겠습니까?")) {
				module_icon = module_icon+"_off.png";
				$("form").append("<input type='hidden' name='module_icon' value='"+module_icon+"'/>");
				$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();				
			}
		}
	});
	
	$(".popClose").click(function() {
		$(".pop").css("display", "none");
	});

	$("#keyConfirm").click(function() {
		if($("#module_key").val() == "") {
			alert("활성화 키를 입력해 주세요.");
			$("#module_key").focus();
			return false;
		}
		//module_icon[0].replace("_off", ".png");
		module_icon = module_icon.replace("_off","\.png");
		$("form").append("<input type='hidden' name='module_icon' value='"+module_icon+"'/>");
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});

});
