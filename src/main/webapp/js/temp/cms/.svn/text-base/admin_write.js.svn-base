var sw = false;
$(document).ready(function(){
	init();
	
	$("#checkId").on("click",function(){
		var id = $("#admin_id").val();
		checkID(id);
	});
	
	$("#btnOk").on("click",function(){
		var id = $("#admin_id").val();
		var passwd = $("#admin_pwd").val();
		var checkPass = $("#checkPasswd").val();
		var email = $("#admin_email").val();
		var name = $("#admin_name").val();
		var cName = $("#admin_phone").val();
		
		var phone1 = $("#admin_tel1").val();
		var phone2 = $("#admin_tel2").val();
		var phone3 = $("#admin_tel3").val();
		
		var mobile1 = $("#admin_mobile1").val();
		var mobile2 = $("#admin_mobile2").val();
		var mobile3 = $("#admin_mobile3").val();
		
		var conIp = $("#admin_ip").val();
		
		var admin_module="";
		
		if($("#swit").val()=="update"){
			sw=true;
		}
		
		if(!(sw && id!="")){
			if(id==""){
				alert("ID값을 입력 해주십시오");
				$("#admin_id").focus();
			} else if(!sw){
				alert("중복체크를 해주십시오");
			}
			
			return false;
		}
		if(passwd!=""){
			if(!checkPasswd(passwd)){
				alert("패스워드가 형식에 맞지 않습니다.");
				$("#admin_pwd").focus();
				return false;
			} else {
				if(!(passwd == checkPass)){
					alert("입력하신 패스워드와 패스워드 확인이 일치하지 않습니다.");
					$("#admin_pwd").focus();
					return false;
				}
			}
		}
		
		
		if(name==""){
			alert("이름을 입력 해주십시오.");
			$("#admin_name").focus();
			return false;
		}
		
		if(cName==""){
			alert("회사명을 입력 해주십시오.");
			$("#company_name").focus();
			return false;
		}
		
		if(!checkEmail(email)){
			alert("email이 형식에 맞지 않습니다.");
			$("#admin_email").focus();
			return false;
		}
		
		if(phone1=="" || phone2=="" || phone3=="" ){
			alert("회사번호를 입력 해주십시오.");
			$("#admin_tel1").focus();
			return false;
		} else {
			$("#admin_tel").val(phone1+"-"+phone2+"-"+phone3);
		}
		
		if(mobile1=="" || mobile2=="" || mobile3=="" ){
			$("#admin_mobile1").focus();
			alert("핸드폰번호를 입력 해주십시오.");
			return false;
		} else {
			$("#admin_mobile").val(mobile1+"-"+mobile2+"-"+mobile3);
		}
		
		/*if(conIp!=""){
			if(!(checkIP(conIp))){
				alert("정확한 IP를 입력 해주십시오.");
				return false;
			}
		} else {
			$("#admin_ip").val("...");
		}*/
		
		if($("#md_push").attr("checked")=="checked"){
			admin_module +="Y|";
		} else {
			admin_module +="N|";
		}
		
		if($("#md_dm").attr("checked")=="checked"){
			admin_module +="Y|";
		} else {
			admin_module +="N|";
		}
		
		if($("#md_store").attr("checked")=="checked"){
			admin_module +="Y|";
		} else {
			admin_module +="N|";
		}
		
		if($("#md_motp").attr("checked")=="checked"){
			admin_module +="Y";
			$("#admin_module_access").val(admin_module);
		} else {
			admin_module +="N";
			$("#admin_module_access").val(admin_module);
		}
		
		if($("#ip_use").attr("checked")=="checked"){
			$("#use_yn").val("N");
		} else{
			$("#use_yn").val("Y");
		}
		
		if($("#swit").val()=="update"){
			$("#form_adminWrite").attr({"action":"/CMS/main/adminUpdate.tsis"}).submit();
		} else {
			$("#form_adminWrite").attr({"action":"/CMS/main/adminRegister.tsis"}).submit();
		}
		
		
		
	});
	
	$("#btnReset").on("click",function(){
		$("input[type=text]").val("");
		/*$("#form_adminWrite").reset();*/
	});
});

function init(){
	var admin_tel =$("#admin_tel").val();
	var admin_mobile = $("#admin_mobile").val();
	var admin_module_access = $("#admin_module_access").val();
	var use_yn = $("#use_yn").val();
	
	if(admin_tel!=""){
		admin_tel = admin_tel.split("-");
		$("#admin_tel1").val(admin_tel[0]);
		$("#admin_tel2").val(admin_tel[1]);
		$("#admin_tel3").val(admin_tel[2]);
	}
	
	if(admin_mobile!=""){
		admin_mobile= admin_mobile.split("-");
		$("#admin_mobile1").val(admin_mobile[0]);
		$("#admin_mobile2").val(admin_mobile[1]);
		$("#admin_mobile3").val(admin_mobile[2]);
	}
	
	if(admin_module_access!=""){
		admin_module_access = admin_module_access.split("|");
		if(admin_module_access[0]=='Y'){
			$("#md_push").attr("checked",true);
		} else {
			$("#md_push_n").attr("checked",true);
		}
		
		if(admin_module_access[1]=='Y'){
			$("#md_dm").attr("checked",true);
		} else {
			$("#md_dm_n").attr("checked",true);
		}
		
		if(admin_module_access[2]=='Y'){
			$("#md_store").attr("checked",true);
		} else {
			$("#md_store_n").attr("checked",true);
		}
		
		if(admin_module_access[3]=='Y'){
			$("#md_motp").attr("checked",true);
		} else {
			$("#md_motp_n").attr("checked",true);
		}	
	}
	
	if(use_yn!=""){
		if(use_yn=="Y")
			$("#ip_use").attr("checked",false);
		else
			$("#ip_use").attr("checked",true);
		//alert(use_yn);
	}
	
}