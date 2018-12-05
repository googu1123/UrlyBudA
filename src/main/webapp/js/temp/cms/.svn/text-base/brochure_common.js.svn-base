$(document).ready(function(){
	$("#mvList").click(function(){
//		$("form").attr({action:"/tsisBrochure/brochure/"+$("#mvList").data("url"), method:"post"}).submit();
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$("#mvList").data("url"), method:"post"}).submit();
	});
	
	$("#mvEditor").click(function(){
		$("#qidx").val($("#mvEditor").data("param"));
		if($("#user").val() == $("#mvEditor").data("writer")) {
			$("form").attr({action:"/tNGMP_Brochure/brochure/"+$("#mvEditor").data("url"), method:"post"}).submit();
		} else {
			alert("본인이 작성한 글만 수정 가능합니다.");
			return;
		}
	});

	$("#mvRemove").click(function(){
		$("#qidx").val($("#mvEditor").data("param"));
		if($("#user").val() == $("#mvEditor").data("writer")) {
			if(confirm("선택하신 질문글을 삭제하시겠습니까?")){
				$("form").attr({action:"/tNGMP_Brochure/brochure/"+$("#mvRemove").data("url"), method:"post"}).submit();
			} else {
				return;
			}
		} else {
			alert("본인이 작성한 글만 삭제가능합니다.");
			return;
		}
	});
	
	$(".allContent").click(function(){
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(".allContent").data("url"), method:"post"}).submit();
	});
	
	
	$(".answer").css("display", "none");

	$("tr").click(function(){
		var row = $(".parent").index(this) + 1;	// jQuery index는 0부터 시작하고 JSTL <c:out value="${status.count}"/>는 1부터 시작하므로 index+1 해줘야 정상 작동
		//$(".answer").hide();
		if($("#answer_"+row).is(":hidden")) $("#answer_"+row).show();
		else $("#answer_"+row).hide();
	});


	$("#idChk").click(function(){
		var objIdPattern = /^[a-zA-Z]{1}[a-zA-Z0-9_]+$/;
		$("#idcheck").val("confirm");
		
		// ID 체크
		if($("#user_id").val().length < 6 || $("#user_id").val().length > 16 ) {
			alert("아이디는 6~15자 이내로 입력해 주세요.");
			$("#user_id").val("");
			$("#user_id").focus();
			return;
		}
		if(!objIdPattern.test($("#user_id").val())) {
			alert("아이디는 첫 글자는 영문으로 하여야 하며, 영어와 숫자 조합으로만 입력해 주세요.");
			$("#user_id").val("");
			$("#user_id").focus();
			return;
		}
		
		$("form").attr({action:"/tNGMP_Brochure/brochure/duplicateIdCheck.do", method:"post"}).submit();
		
	});

	
	$("#idUse").click(function(){
		$(opener.document).find("#user_id").val($("#idcheck").val());
		window.open("about:blank","_self").close();
	});
	
	
	$("#findID").click(function() {
		
		$("#findWhat").val("ID");
		var objMailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		
		if($("#user_name1").val() == "") {
			alert("이름를 입력해 주세요.");
			$("#user_name1").focus();
			return;
		}
		if(!objMailPattern.test($("#email1").val())) {
			alert("이메일 주소를 정확히 입력해 주세요");
			$("#email1").val("");
			$("#email1").focus();
			return;
		}

		$("form").attr({action:"/tNGMP_Brochure/brochure/findIDnPW.do", method:"post"}).submit();
		
	});
	
	$("#findPW").click(function() {
		
		$("#findWhat").val("PW");
		var objIdPattern = /^[a-zA-Z]{1}[a-zA-Z0-9_]+$/;
		var objMailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		
		if($("#user_name2").val() == "") {
			alert("이름를 입력해 주세요.");
			$("#user_name2").focus();
			return;
		}
		if(!objMailPattern.test($("#email2").val())) {
			alert("이메일 주소를 정확히 입력해 주세요");
			$("#email2").val("");
			$("#email2").focus();
			return;
		}
		if($("#user_id").val().length < 6 || $("#user_id").val().length > 16 ) {
			alert("아이디는 6~15자 이내로 입력해 주세요.");
			$("#user_id").val("");
			$("#user_id").focus();
			return;
		}
		if(!objIdPattern.test($("#user_id").val())) {
			alert("아이디는 첫 글자는 영문으로 하여야 하며, 영어와 숫자 조합으로만 입력해 주세요.");
			$("#user_id").val("");
			$("#user_id").focus();
			return;
		}

		$("form").attr({action:"/tNGMP_Brochure/brochure/findIDnPW.do", method:"post"}).submit();

	});
	
	$("#findPasswd").click(function(){
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$("#findPasswd").data("url"), method:"post"}).submit();
	});
	
	$(".mvBtn").click(function(){
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(this).data("url"), method:"post"}).submit();	// 같은 클래스일 경우 첫번째 url 객체만 가져오게 되므로 this 사용
	});
	
	$("#loginBtn").click(function(){
		if($("#user_id").val() == "") {
			alert("아이디를 입력해 주세요.");
			$("#user_id").focus();
			return;
		}
		if($("#passwd").val() == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#passwd").focus();
			return;
		}
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(this).data("url"), method:"post"}).submit();
	});
	

	$("#confirmBtn").click(function() {
		if($("#passwd").val() == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#passwd").focus();
			return;
		}
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(this).data("url"), method:"post"}).submit();
	});
	
	
	if($("#checkRes").val() == "retry") {
		alert("비밀번호를 잘못 입력 하셨습니다.\n정확하게 입력해 주세요.");
	}
	

	$("#leaveBtn").click(function() {
		alert("탈퇴가 완료되었습니다.");
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(this).data("url"), method:"post"}).submit();
	});
	
	
	
	$("#pwMail").click(function(){
		alert("메일을 발송 했습니다.");
		$("form").attr({action:"/tNGMP_Brochure/brochure/"+$(this).data("url"), method:"post"}).submit();
	});
	
	

	
});


function linkName() {
	if($("#returnUrl").val() == null || $("#returnUrl").val() == "") $("#linkName").text("회원 정보 변경");
	else $("#linkName").text("회원 탈퇴 신청");
}


// 정보 변경 이메일/전화번호 자르기
function modifyOnload() {

	var mailSplit = $("#email").val().split("@");
	var hpSplit = $("#hphone").val().split("-");
	var cpSplit = $("#cphone").val().split("-");

	$("#mail").val(mailSplit[0]);
	$("#email_domain").val(mailSplit[1]);
	$("#email_domain").attr("readonly", true);
	$("#domain").val(mailSplit[1]);
	
	$("#hphone0").val(hpSplit[0]);
	$("#hphone1").val(hpSplit[1]);
	$("#hphone2").val(hpSplit[2]);

	$("#cphone0").val(cpSplit[0]);
	$("#cphone1").val(cpSplit[1]);
	$("#cphone2").val(cpSplit[2]);
}


// 화면이동
function fn_brochure_mv(pid) {
	var url = "";

	switch(pid) {
		case 0 : url = "/tNGMP_Brochure/brochure/index.do"; break;
		case 1 : url = "/tNGMP_Brochure/brochure/tngmpIntro.do"; break;
		case 2 : url = "/tNGMP_Brochure/brochure/serviceIntroduce.do"; break;
		case 3 : url = "/tNGMP_Brochure/brochure/cooperation.do"; break;
		case 4 : url = "/tNGMP_Brochure/brochure/dataCenter.do"; break;
		case 5 : url = "/tNGMP_Brochure/brochure/apiReference.do"; break;
		case 6 : url = "/tNGMP_Brochure/brochure/useInfo.do"; break;
		case 7 : url = "/tNGMP_Brochure/brochure/login.do"; break;
		case 8 : url = "/tNGMP_Brochure/brochure/provisionAgree.do"; break;
		case 9 : url = "/tNGMP_Brochure/brochure/modifyUser.do"; break;
	}

	$("form").attr({action:url, method:"post"}).submit();
}

// 직접입력
function mailDomainChange() {
	if($("#domain").val() == "") {
		$("#email_domain").val($("#domain").val());	//선택된 값 넣어주기
		$("#email_domain").attr("readonly", false);	//직접	
	}
	else {
		$("#email_domain").val($("#domain").val());	//선택된 값 넣어주기
		$("#email_domain").attr("readonly", true);	//선택
	}
}

// form validation check
function fn_mailTrans(type) {

	$("#email_type").val(type);
	$("#email").val($("#mail").val() + "@" + $("#email_domain").val());

	if($("#email_type").val() == "C" || $("#email_type").val() == "O") {
		$("#phone").val($("#phone0").val() + "-" + $("#phone1").val()  + "-" + $("#phone2").val());
	} else {
		$("#phone").val("");
		$("#department").val("");
	}
	
	if($("#company").val() == "") {
		alert("기업명을 입력해주세요.");
		$("#company").focus();
		return;
	}
	if($("#business").val() == "") {
		alert("업종을 선택해주세요.");
		$("#business").focus();
		return;
	}
	
	if($("#email_type").val() == "C" || $("#email_type").val() == "O") {
		if($("#department").val() == "") {		// 서비스 1:1문의에선 제외
			alert("부서명을 입력해주세요.");
			$("#department").focus();
			return;
		}
	} else {
		$("#department").val("");
	}
	
	if($("#charger_name").val() == "") {
		alert("담당자명을 입력해주세요.");
		$("#charger_name").focus();
		return;
	}

	if($("#email_type").val() == "C" || $("#email_type").val() == "O") {
		if($("#phone0").val() == "" || $("#phone1").val() == "" || $("#phone2").val() == "") {		// 서비스 1:1문의에선 제외
			alert("전화번호를 입력해주세요.");
			$("#phone0").focus();
			return;
		}
	} else {
		$("#phone").val("");
	}
	
	if($("#mail").val() == "" || $("#email_domain").val() == "") {
		alert("형식에 맞는 메일주소를 입력해주세요.");
		$("#mail").focus();
		return;
	}
	if($("#title").val() == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return;
	}
	if($("#content").val() == "") {
		alert("메일 내용을 입력해주세요.");
		$("#content").focus();
		return;
	}
	
	alert("메일을 발송했습니다.");

	$("form").attr({action:"/tNGMP_Brochure/brochure/mailTrans.do", method:"post"}).submit();
	
}

// 리셋
function reset() {
	$('form').each(function() {
		$("#txtLength").html("0");
		this.reset();
	});
}

// 숫자만입력
var numValidate = function(event) {
	var key = window.event ? event.keyCode : event.which;
	var keychar = String.fromCharCode(key);
	var reg = /[0-9]/;
	return reg.test(keychar);
};


// textarea id, 제한 글자 수, 입력 결과 메세지 저장 ID
function limitCharacters(textid, limit, limitid)
{
	var text = $('#'+textid).val();	// 잆력 값 저장
	var textlength = text.length;		// 입력값 길이 저장
	
	if(textlength > limit) 	{
		alert('메일 내용은 ' + limit + '자 이상 쓸수 없습니다!');
		
		// 제한 글자 길이만큼 값 재 저장
		$('#'+textid).val(text.substr(0, limit));
		return false;
	}
	else {
		$('#' + limitid).html((textlength));
		return true;
	}
}

// 사용 코드
$(function() {
	$("#content").keyup(function(){
		limitCharacters("content", 5000, "txtLength");
	});
});


// 검색
function boardSearch(bType) {
	$("#board_type").val(bType);

	if($("#board_type").val() == "N") {		// news & notice
		$("form").attr({action:"/tNGMP_Brochure/brochure/newsNotice.do", method:"post"}).submit();			
	} else if($("#board_type").val() == "F") {		// faq
		$("form").attr({action:"/tNGMP_Brochure/brochure/introduceFAQ.do", method:"post"}).submit();
	} else if($("#board_type").val() == "D") {	// dataCenter
		$("form").attr({action:"/tNGMP_Brochure/brochure/dataCenter.do", method:"post"}).submit();
	} else if($("#board_type").val() == "PR") {	// apiReference
		$("form").attr({action:"/tNGMP_Brochure/brochure/apiReference.do", method:"post"}).submit();
	} else if($("#board_type").val() == "PG") {	// installOperationGuide
		$("form").attr({action:"/tNGMP_Brochure/brochure/installOperationGuide.do", method:"post"}).submit();
	} else if($("#board_type").val() == "PQ") {	// developQna
		$("form").attr({action:"/tNGMP_Brochure/brochure/developQna.do", method:"post"}).submit();
	}
}


// 검색값 유지
function searchKeep(con, key) {
	if(con == "title") $("#searchCondition > option[value='title']").attr("selected", true);
	else if (con == "content") $("#searchCondition > option[value='content']").attr("selected", true);
	else if (con == "question") $("#searchCondition > option[value='question']").attr("selected", true);
	
	if(key == "null" || key == null || key == "") $("#searchKeyword").val("");
	else $("#searchKeyword").val(key);
}


//상세
function fn_detailView(idx, bType) {

	if(bType == "PQ") {
		$("#qidx").val(idx);
	} else {
		$("#bidx").val(idx);		
	}
	$("#board_type").val(bType);
	
	switch(bType) {
		case "D" : $("form").attr({action:"/tNGMP_Brochure/brochure/dataDetailView.do", method:"post"}).submit(); break;
		case "F" : $("form").attr({action:"/tNGMP_Brochure/brochure/faqDetailView.do", method:"post"}).submit(); break;
		case "N" : $("form").attr({action:"/tNGMP_Brochure/brochure/newsDetailView.do", method:"post"}).submit(); break;
		case "PR" : $("form").attr({action:"/tNGMP_Brochure/brochure/apiDetailView.do", method:"post"}).submit(); break;
		case "PG" : $("form").attr({action:"/tNGMP_Brochure/brochure/guideDetailView.do", method:"post"}).submit(); break;
		case "PQ" : $("form").attr({action:"/tNGMP_Brochure/brochure/qnaDetailView.do", method:"post"}).submit(); break;
	}
}

function fn_qnaDetailView(idx, writer, secret) {
	
	$("#qidx").val(idx);
	
	if(secret == 0)	 {
		if($("#user").val() == writer) {
			$("form").attr({action:"/tNGMP_Brochure/brochure/qnaDetailView.do", method:"post"}).submit();
		} else {
			alert("비밀글은 본인이 작성하신 글만 확인할 수 있습니다.");
		}
	} else {
		$("form").attr({action:"/tNGMP_Brochure/brochure/qnaDetailView.do", method:"post"}).submit();
	}
}



function fn_introduce(section) {
	if(section == "I") $("form").attr({action:"/tNGMP_Brochure/brochure/serviceIntroduce.do", method:"post"}).submit();
	else if(section == "O") $("form").attr({action:"/tNGMP_Brochure/brochure/onlineIntroduce.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/introduceFAQ.do", method:"post"}).submit();
}

function fn_customer(section) {
	if(section == "D") $("form").attr({action:"/tNGMP_Brochure/brochure/dataCenter.do", method:"post"}).submit();
	else if(section == "O") $("form").attr({action:"/tNGMP_Brochure/brochure/oneOnOne.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/customerCenter.do", method:"post"}).submit();
}

function fn_cooperation(section) {
	if(section == "C") $("form").attr({action:"/tNGMP_Brochure/brochure/cooperation.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/newsNotice.do", method:"post"}).submit();
}

function fn_developer(section) {
	if(section == "R") $("form").attr({action:"/tNGMP_Brochure/brochure/apiReference.do", method:"post"}).submit();
	else if(section == "G") $("form").attr({action:"/tNGMP_Brochure/brochure/installOperationGuide.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/developQna.do", method:"post"}).submit();
}

function fn_memberJoin(section) {
	if(section == "P") $("form").attr({action:"/tNGMP_Brochure/brochure/provisionAgree.do", method:"post"}).submit();
	else if(section == "I") $("form").attr({action:"/tNGMP_Brochure/brochure/inquiry.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/joinProcess.do", method:"post"}).submit();
}

function fn_member(section) {
	if(section == "M") $("form").attr({action:"/tNGMP_Brochure/brochure/modifyUser.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/memberLeave.do", method:"post"}).submit();
}


// qna 등록/수정
function fn_qnaInsert(type) {
	
	if($("#preface").val() == "") {
		alert("글머리를 선택해주세요.");
		$("#preface").focus();
		return;
	}
	if($("#title").val() == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return;
	}
	if($("#question").val() == "") {
		alert("내용을 입력해주세요.");
		$("#question").focus();
		return;
	}

	if(type == "I") $("form").attr({action:"/tNGMP_Brochure/brochure/qnaInsert.do", method:"post"}).submit();
	else $("form").attr({action:"/tNGMP_Brochure/brochure/qnaUpdate.do", method:"post"}).submit();

}


// 회원가입 동의
function fn_agree() {

	if(!$("#provisionAgree").is(":checked")) {
		alert("이용약관 동의에 체크해야 가입가능 합니다.");
		$("#provisionAgree").focus();
		return;
	}
	if(!$("#privacyAgree").is(":checked")) {
		alert("개인정보 수집, 이용 동의에 체크해야 가입가능 합니다.");
		$("#privacyAgree").focus();
		return;
	}
	
	$("form").attr({action:"/tNGMP_Brochure/brochure/infoRegistration.do", method:"post"}).submit();
	
}


function pop() {
	window.open("checkPopup.do", "ID_Check", "width=400,height=170,history=no,resizable=no,status=no,scrollbars=no,menubar=no"); 
} 



function checkJoinForm(type) {
	//email validation check
	var objMailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;

	$("#email").val($("#mail").val() + "@" + $("#email_domain").val());
	$("#hphone").val($("#hphone0").val() + "-" + $("#hphone1").val() + "-" + $("#hphone2").val());
	$("#cphone").val($("#cphone0").val() + "-" + $("#cphone1").val() + "-" + $("#cphone2").val());

	if(type == "R") {	// R = 회원가입, M = 회원정보수정
		if($("#user_name").val() == "") {
			alert("이름를 입력해 주세요.");
			$("#user_name").focus();
			return;
		}
	}
	
	// id, pw validation check
	if(check_id_pw(type) == true) {

		if($("#company").val() == "") {
			alert("소속회사명을 입력해 주세요.");
			$("#company").focus();
			return;
		}
		if($("#department").val() == "") {
			alert("소속부서명을 입력해 주세요.");
			$("#department").focus();
			return;
		}
		if(!objMailPattern.test($("#email").val())) {
			alert("이메일 주소를 정확히 입력해 주세요");
			$("#mail").val("");
			$("#email_domain").val("");
			$("#mail").focus();
			return;
		}
		if($("#hphone0").val() == "" || $("#hphone1").val() == "" || $("#hphone2").val() == "") {
			alert("휴대폰 번호를 입력해 주세요.");
			$("#hphone0").val("");
			$("#hphone1").val("");
			$("#hphone2").val("");
			
			$("#hphone0").focus();
			return;
		}
		if($("#cphone0").val() == "" || $("#cphone1").val() == "" || $("#cphone2").val() == "") {
			alert("회사 전화번호를 입력해주세요.");
			$("#cphone0").val("");
			$("#cphone1").val("");
			$("#cphone2").val("");
			
			$("#cphone0").focus();
			return;
		}

		if(type == "R") {	// R = 회원가입, M = 회원정보수정
			$("form").attr({action:"/tNGMP_Brochure/brochure/memberInfoInsert.do", method:"post"}).submit();
		} else {
			$("form").attr({action:"/tNGMP_Brochure/brochure/memberInfoUpdate.do", method:"post"}).submit();
		}
	}
	
}



/*
 * ID 첫글자는 영문, 6~15개의 영문/숫자 조합으로 이뤄져야 함 
 * 비밀번호 유효성 체크 (영문 대문자, 소문자, 숫자, 특수문자의 조합으로 6~16자리)
 */
function check_id_pw(type) {

	var objUserID = document.infoForm.user_id;
	var objUserPassWord = document.infoForm.passwd;
	var objUserPassWordRe = document.infoForm.passwdChk;
//	var objIdPattern = /^[a-zA-Z]{1}[a-zA-Z0-9_]+$/;
	var objPwPattern = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
	
//	// ID 체크
//	if(objUserID.value.length < 6 || objUserID.value.length > 16 ) {
//		alert("아이디는 6~15자 이내로 입력해 주세요.");
//		$("#user_id").focus();
//		return false;
//	}
//	if(!objIdPattern.test(objUserID.value)) {
//		alert("아이디는 첫 글자는 영문으로 하여야 하며, 영어와 숫자 조합으로만 입력해 주세요.");
//		$("#user_id").val("");
//		$("#user_id").focus();
//		return false;
//	}
	
	// PW 체크
	if(objUserPassWord.value != objUserPassWordRe.value) {
		alert("입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다");
		passwdClear();
		return false;
	}
	if(objUserPassWord.value.length < 8 || objUserPassWord.value.length > 17) {
		alert("비밀번호는 영대문자, 영소문자, 숫자, 특수문자 중 3종류 이상 조합으로 8~16자리로 입력해주세요.");
		passwdClear();
		return false;
	}
//	if(!objUserPassWord.value.test(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
	if(!objPwPattern.test(objUserPassWord.value)) {
		alert("비밀번호는 영대문자, 영소문자, 숫자, 특수문자 중 3종류 이상 조합으로 8~16자리로 입력해주세요.");
		passwdClear();
		return false;
	}
	if(type == "R") {
		if(objUserID.value.indexOf(objUserPassWord) > -1) {
			alert("비밀번호에 아이디를 사용할 수 없습니다.");
			passwdClear();
			return false;
		}
	}

	var SamePass_0 = 0; //동일문자 카운트
	var SamePass_1 = 0; //연속성(+) 카운드
	var SamePass_2 = 0; //연속성(-) 카운드
	var chr_pass_0;
	var chr_pass_1;
	var chr_pass_2;

	for(var i=0; i < objUserPassWord.value.length; i++) {
		chr_pass_0 = objUserPassWord.value.charAt(i);
		chr_pass_1 = objUserPassWord.value.charAt(i+1);
	    
		//동일문자 카운트
		if(chr_pass_0 == chr_pass_1) {
			SamePass_0 = SamePass_0 + 1;
		}
		chr_pass_2 = objUserPassWord.value.charAt(i+2);
		
		//연속성(+) 카운드
		if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
			SamePass_1 = SamePass_1 + 1;
		}
		//연속성(-) 카운드
		if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
			SamePass_2 = SamePass_2 + 1;
		}
	}
	
	if(SamePass_0 > 1) {
		alert("동일문자를 3번 이상 사용할 수 없습니다.");
		passwdClear();
		return false;
	}
	   
	if(SamePass_1 > 1 || SamePass_2 > 1 ) {
		alert("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
		passwdClear();
		return false;
	}

	return true;
}


function passwdClear() {
	$("#passwd").val("");
	$("#passwdChk").val("");
	$("#passwd").focus();
}


function stateChange(no) {
	
	$("#ngmp").hide();
	$("#ios").hide();
	$("#android").hide();
	$("#sample").hide();
	$("#security").hide();
	$("#comm").hide();
	
	if(no == 1) {
		$("#ngmp").show();
		$("#linkName").text("t-NGMP란?");
	} else if(no == 2) {
		$("#ios").show();
		$("#linkName").text("iOS 브릿지");
	} else if(no == 3) {
		$("#android").show();
		$("#linkName").text("Android 브릿지");
	} else if(no == 4) {
		$("#sample").show();
		$("#linkName").text("Sample");
	} else if(no == 5) {
		$("#security").show();
		$("#linkName").text("Security");
	} else if(no == 6) {
		$("#comm").show();
		$("#linkName").text("Mobile Communication");
	}
}

function changeView(no) {
	
	$("#provision").hide();
	$("#privacy").hide();
	$("#email").hide();
	
	if(no == 1) {
		$("#provision").show();
		$("#linkName").text("이용약관");
	} else if(no == 2) {
		$("#privacy").show();
		$("#linkName").text("개인정보 취급방침");
	} else {
		$("#email").show();
		$("#linkName").text("이메일 무단수집 거부");
	}
}









