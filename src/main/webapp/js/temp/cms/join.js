var sw = false;
$(document).ready(function(){
	$("#checkId").on("click",function(){
		var id = $("#textId").val();
		checkID(id);
		
		/*if(checkID(id) && (id.length >= 4) &&( id.length<=16)){
			alert("사용가능한 ID입니다.");
			sw = true;
		} else {
			alert("형식에 맞지 않습니다.");
			$("#textId").focus();
			return;
		}
		sw = true;*/
	});
	
	$("#btnOk").on("click",function(){
		var id = $("#textId").val();
		var passwd = $("#textPasswd").val();
		var checkPass = $("#checkPasswd").val();
		var email = $("#textEmail").val();
		var name = $("#textName").val();
		var cName = $("#textCname").val();
		var empno = $("#textEmpno").val();
		
		var cPhone1 = $("#textCphone1").val();
		var cPhone2 = $("#textCphone2").val();
		var cPhone3 = $("#textCphone3").val();
		
		var phone1 = $("#textPhone1").val();
		var phone2 = $("#textPhone2").val();
		var phone3 = $("#textPhone3").val();
		
		var conIp = $("#textConIp").val();
		if(!(sw && id!="")){
			if(id==""){
				alert("ID값을 입력 해주십시오");
				$("#textId").focus();
			} else if(!sw){
				alert("중복체크를 해주십시오");
			}
			
			return false;
		}
		
		if(!checkPasswd(passwd)){
			alert("패스워드가 형식에 맞지 않습니다.");
			$("#textPasswd").focus();
			return false;
		} else {
			if(!(passwd == checkPass)){
				alert("입력하신 패스워드와 패스워드 확인이 일치하지 않습니다.");
				$("#textPasswd").focus();
				return false;
			} 
		}
		
		if(name==""){
			alert("이름을 입력 해주십시오.");
			$("#textName").focus();
			return false;
		}
		
		if(cName==""){
			alert("회사명을 입력 해주십시오.");
			$("#textCname").focus();
			return false;
		}
		
		if(!checkEmail(email)){
			alert("email이 형식에 맞지 않습니다.");
			$("#email").focus();
			return false;
		}
		
		if(cPhone1=="" || cPhone2=="" || cPhone3=="" ){
			alert("회사번호를 입력 해주십시오.");
			$("#textCphone1").focus();
			return false;
		} else {
			$("#cPhone").val(cPhone1+"-"+cPhone2+"-"+cPhone3);
		}
		
		if(phone1=="" || phone2=="" || phone3=="" ){
			$("#textPhone1").focus();
			alert("핸드폰번호를 입력 해주십시오.");
			return false;
		} else {
			$("#phone").val(phone1+"-"+phone2+"-"+phone3);
		}
		
		if(conIp !=""){
			if(!(checkIP(conIp))){
				alert("정확한 IP를 입력 해주십시오.");
				return false;
			}
		} else { 
			$("#admin_ip").val("*.*.*.*");
		}
		

		$("#form_join").attr({"action":"/CMS/main/joinProcess.tsis"}).submit();
		
	});
	
});