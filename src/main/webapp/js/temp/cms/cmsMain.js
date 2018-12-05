
$(document).ready(function(){

	$(".adminSel").on("click", function(){
		if($(this).data("param") == 1) {
			$("#admin").addClass("on");
			$("#subAdmin").removeClass("on");
		} else {
			$("#subAdmin").addClass("on");
			$("#admin").removeClass("on");
		}

		$("#admin_level").val($(this).data("param"));
	});
	
	
	$("#findID").on("click", function(){
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});

	
	$("#confirmID").on("click", function(){
		
		if($("#admin_name1").val() == "") {
			alert("이름를 입력해 주세요.");
			$("#admin_name1").focus();
			return false;
		}
		if($("#company_name").val() == "") {
			alert("회사명을 입력해 주세요.");
			$("#company_name").focus();
			return false;
		}
		$("#admin_name").val($("#admin_name1").val());
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});
	
	$("#confirmPW").on("click", function(){
		
		if($("#admin_name2").val() == "") {
			alert("이름를 입력해 주세요.");
			$("#admin_name2").focus();
			return false;
		}
		
		if($("#admin_id").val() == "") {
			alert("아이디를 입력해 주세요.");
			$("#admin_id").focus();
			return false;
		}
		
		if($("#admin_email").val() == "") {
			alert("이메일을 입력해 주세요.");
			$("#admin_email").focus();
			return false;
		}
		$("#admin_name").val($("#admin_name2").val());
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});


	$("#confirm").on("click", function(){
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});
	
	
	$("#join").on("click", function(){
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});

	
	//topMenu
	$("#topmenu li a, .menu2_b li a, .menu4_b li a").on("click", function(){
		if($(this).attr("class")=="off"){
			return false;
		} else {
			$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
		}
	});
	
	$("#topmenu li a, .menu2_b li a, .menu4_b li a").on("mouseover", function(){
		if($(this).attr("class")=="off"){
			//console.log($(this).attr("class"));
			return false;
		}
	});
	//admin info 이동
	//adminManage.tsis
	$(".h_info a").on("click", function(){
		$("form").attr({action:"/CMS/main/adminManage.tsis", method:"post"}).submit();
	});
	
	
	//logout
	$(".logout").on("click", function(){
		if(confirm("로그아웃 하시겠습니까?")) {
			$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
		}
	});
	
	$("#addBook").on("click", function(){
		$("form").attr({action:"/CMS/main/addBookmark.tsis", method:"post"}).submit();
	});
	
	$("#bookmark").on("click", function(){
		$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
	});

	$(".goBookmark").on("click", function(){
		$("form").attr({action:"/CMS"+$(this).data("url"), method:"post"}).submit();
	});

	$("#save_id,#save_pwd").on("click",function(){
		if($(this).val()=="off"){
			$(this).val("on").attr("checked",true);
		} else {
			$(this).val("off").removeAttr("checked");
		}
	});
});


function loginCheck() {
	if($("#admin_id").val() == "") {
		alert("ID를 입력해 주세요.");
		$("#admin_id").focus();
		return;
	}
	if($("#admin_pwd").val() == "") {
		alert("Password를 입력해 주세요.");
		$("#admin_pwd").focus();
		return;
	}
	
	$("form").attr({action:"/CMS/main/loginCheck.tsis", method:"post"}).submit();
}

function checkID(id){
	var reg1 = /^[a-z0-9]{4,16}$/;
	var reg2 = /[a-z]/g;
	var reg3 = /[0-9]/g;
	
	
	if(id!="" && (reg1.test(id) && reg2.test(id) && reg3.test(id))){
		var xmlhttp=new XMLHttpRequest();
		// Server쪽으로 연결 할 URL.
		var url = "/CMS/main/idCheck.tsis";
		   
		xmlhttp.open("POST",url,true);
		   
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4){
				if(xmlhttp.status == 200){
					var text = xmlhttp.responseText;
					if(text=="1"){
						$("#success,#default").css("display","none");
						$("#err1").css("display","inline");
						sw=false;
					} else {
						$("#success").css("display","inline");
						$("#default, #err1").css("display","none");
						sw=true;
					}
				}
			}
		}
		xmlhttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xmlhttp.send("admin_id=" + id);
	} else {
		alert("아이디 형식이 맞지 않습니다.");
	} 

}

// 메일 형식 체크
function checkEmail(email){
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return regExp.test(email);
}

//아이피 형식 체크
function checkIP(strIP) {
    var expUrl = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
    
    return expUrl.test(strIP);
}

//숫자만 입력
function number() {
	if(!((event.keyCode >=37 && event.keyCode<=57) || (event.keyCode >=96 && event.keyCode<=105) || event.keyCode == 8 || event.keyCode ==9)){
		alert("숫자만 입력해 주세요");
		event.returnValue= false;
	}
    /*if ((event.keyCode == null) || (event.keyCode == 0) || (event.keyCode == 8) || (event.keyCode == 9) || (event.keyCode == 13)
            || (event.keyCode == 27)) {
        return true;
    } else if((event.keyCode < 48) || (event.keyCode >57)){
		event.returnValue = false;
	}*/
}

//패스워드 양식체크
function checkPasswd(passwd){
	var reg= /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
	
	return reg.test(passwd) && (passwd.length>=8);
}
