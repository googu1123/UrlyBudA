<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrator</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <!-- bootstrap 3.0.2 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/style.css">
    <!--[if lt IE 9]>
        <script src="/js/html5shiv.js"></script>
        <script src="/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/validate.js"></script>
	<script type="text/javascript" src="js/textUtil.js"></script>
</head>
<body class="skin-blue">
    <header class="header">
        <%@include file="./gnb/header.jsp" %>
    </header>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <aside class="left-side sidebar-offcanvas">                
             <%@include file="./gnb/gnb_left.jsp" %>
            <!-- /.sidebar -->
        </aside>

        <aside class="right-side">                
            <section class="content-header">
                <h1>
                    메시지 규격 승인처리<br>
                    <small>메시지 템플릿을 수정/승인처리 확인할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li><a href="msgStandard.tsis"><i class="fa fa-bars"></i> 메시지 규격관리</a></li>
                    <li class="active">메시지 규격 등록/수정</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post" id="mainForm" name="mainForm">
                    	<input type="hidden" name="proc_aidx" value="${aidx }"/>
                    	<input type="hidden" id="pidx" name="pidx" value="${tmp.pidx }"/>
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">발송 1순위</th>
                                        <td>
                                            <label class="fwn marr10"><input type="radio" name="send_priority1" class="ichk" value="A" <c:if test="${pri_fir eq 'A' }">checked="checked"</c:if>> 알림톡</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority1" class="ichk" value="N" disabled="disabled" <c:if test="${pri_fir eq 'N' }">checked="checked"</c:if>> NMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority1" class="ichk" value="S" <c:if test="${pri_fir eq 'S' }">checked="checked"</c:if>> SMS/LMS</label>
                                            <input type="hidden" id="pri_fir" value="${pri_fir }" hname="발송 1순위" required="required" />
                                        </td>
                                        <th scope="row">발송 2순위</th>
                                        <td>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk"  value="A" <c:if test="${pri_sec eq 'A' }">checked="checked"</c:if>> 알림톡</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk"  value="N" disabled="disabled" <c:if test="${pri_sec eq 'N' }">checked="checked"</c:if>> NMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk"  value="S" <c:if test="${pri_sec eq 'S' }">checked="checked"</c:if>> SMS/LMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk"  value="" <c:if test="${pri_sec eq '' }">checked="checked"</c:if>> 사용안함</label>
                                            <input type="hidden" id="pri_sec" value="${pri_sec }" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발송 3순위</th>
                                        <td>
                                        	<label class="fwn marr10"><input type="radio" name="send_priority3" class="ichk"  value="A" <c:if test="${pri_thi eq 'A' }">checked="checked"</c:if>> 알림톡</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority3" class="ichk"  value="N" disabled="disabled" <c:if test="${pri_thi eq 'N' }">checked="checked"</c:if>> NMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority3" class="ichk"  value="S" <c:if test="${pri_thi eq 'S' }">checked="checked"</c:if>> SMS/LMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority3" class="ichk"  value="" <c:if test="${pri_thi eq '' }">checked="checked"</c:if>> 사용안함</label>
                                            <input type="hidden" id="pri_thi" value="${pri_thi }"/>
                                        	<input type="hidden" id="priority" name="priority" value="${tmp.priority }" />
                                        </td>
                                        <th scope="row">알림톡 사용 유무</th>
                                        <td>
                                            <label class="fwn marr10"><input type="checkbox" class="ichk" id="ch_use" <c:if test="${tmp.use_yn eq 'Y' }">checked="checked"</c:if>> 사용</label>
                                            <input type="hidden" name="use_yn" value="${tmp.use_yn }" id="use_yn" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코드명</th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="code" id="code" value="${tmp.code }"
                                                    		hname="코드명" required="maxbyte" maxbyte="${len_code}" />
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row">당사관리 심의번호</th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="deli_no" id="deli_no" value="${tmp.deli_no }"
                                                    		hname="심의번호" required="maxbyte" maxbyte="${len_deli_no}" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발송 제목</th>
                                        <td colspan="3">
                                            <input type="text" class="form-control" name="subject" id="subject" value="${tmp.subject }"
                                            		hname="제목" required="maxbyte" maxbyte="${len_subject}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">내용</th>
                                        <td colspan="3">
                                            <textarea class="form-control" rows="10" name="content" id="content"
                                            		hname="내용" required="maxbyte" maxbyte="${len_content}"
                                            			onkeyup="textCounter(this.form.content, 'content_cnt', ${len_content});">${tmp.content }</textarea>
											<input type="hidden" id="len_content" value="${len_content}"/>
                                            <p class="pull-right" id="content_cnt"></p>
                                            <p class="help-block text-red">※ 가변 문구는 #로 입력해주십시오.</p>
                                        </td>
                                    </tr>
                                    <!--2017.04.06 추가-->
                                    <tr>
                                        <th scope="row" rowspan="2">링크관리</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input type="text" class="form-control input_wid300" placeholder="제목(버튼명)" name="link_btn_name" id="link_btn_name" value="${tmp.link_btn_name }"
                                            				hname="버튼 이름" requirenum="maxbyte" maxbyte="${len_link_btn_name}">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input type="text" class="form-control input_wid300" placeholder="URL" name="link_btn_url" id="link_btn_url" value="${tmp.link_btn_url }"
                                            				hname="버튼 URL" requirenum="maxbyte" maxbyte="${len_link_btn_url}">
                                                    <a href="#" class="btn btn-info btn-sm" id="btnLinkBtnView" data-toggle="modal">미리보기</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!--//2017.04.06 추가-->
									<tr>
                                        <th scope="row">추가 종료 문구<br>(삽입여부)</th>
                                        <td colspan="3">
                                        	<div class="toggle_con form-inline">
	                                            <label class="fwn marr10"><input type="radio" name="radio_add_content_yn" value="Y" class="ichk" <c:if test="${tmp.add_content_yn eq 'Y' }">checked="checked"</c:if>> 예</label>
	                                            <label class="fwn marr10"><input type="radio" name="radio_add_content_yn" value="N" class="ichk" <c:if test="${tmp.add_content_yn eq 'N' }">checked="checked"</c:if>> 아니오</label>
	                                            <input type="hidden" id="add_content_yn" name="add_content_yn" value="${tmp.add_content_yn }"/>
	                                            
                                                <div class="form-inline">
                                                    <input type="text" class="form-control" value="${tmp.add_content }" name="add_content" id="add_content"
                                                    		hname="추가 종료 문구" requirenum="maxbyte" maxbyte="${len_add_content}"
                                                    		onkeyup="textCounter(this.form.add_content, 'add_content_cnt', ${len_add_content});"/>
                                                    <input type="hidden" id="len_add_content" value="${len_add_content}"/>
                                                    <p class="pull-right" id="add_content_cnt"></p>
                                                </div>
                                            </div>
                                            <p class="help-block text-red">단, 알림톡에 사용가능하면 해당 문구 등록시 마지막 가변 처리 필수</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">문자 설명</th>
                                        <td colspan="3">
                                            <input type="text" class="form-control" name="description" id="description" value="${tmp.description }"
                                            		hname="문자 설명" requirenum="maxbyte" maxbyte="${len_description}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">테이블 구분</th>
                                        <td>
                                            <label class="fwn marr10"><input type="radio" name="radio_table" value="R" class="ichk" <c:if test="${tmp.table_div eq 'R' }">checked="checked"</c:if>> 실시간</label>
                                            <label class="fwn marr10"><input type="radio" name="radio_table" value="B" class="ichk" <c:if test="${tmp.table_div eq 'B' }">checked="checked"</c:if>> 배치</label>
                                            <input type="hidden" id="table_div" name="table_div" value="${tmp.table_div }"/>
                                        </td>
                                        <th scope="row">정보성 여부</th>
                                        <td>
                                            <label class="fwn marr10"><input type="radio" name="radio_info" value="Y" class="ichk" <c:if test="${tmp.info_yn eq 'Y' }">checked="checked"</c:if>> 예</label>
                                            <label class="fwn marr10"><input type="radio" name="radio_info" value="N" class="ichk" <c:if test="${tmp.info_yn eq 'N' }">checked="checked"</c:if>> 아니오</label>
                                            <input type="hidden" id="info_yn" name="info_yn" value="${tmp.info_yn }"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">등록일</th>
                                        <td>${tmp.reg_date }</td>
                                        <th scope="row">수정일</th>
                                        <td>${tmp.mod_date }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">요청자 정보</th>
                                        <td>${tmp.aidx }</td>
                                        <th scope="row">요청자 부서명</th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="${tmp.div_nm }" name="div_nm" id="div_nm"
                                                    		hname="요청자 부서명" requirenum="maxbyte" maxbyte="${len_div_nm}">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">문구 신청 상태</th>
                                        <td>
                                            <div class="form-inline">
                                                <select class="form-control" id="process" name="process">
			                                        <option value="A" <c:if test="${tmp.process eq 'A' }"> selected="selected" </c:if>>등록신청</option>
			                                        <option value="B" <c:if test="${tmp.process eq 'B' }"> selected="selected" </c:if>>등록완료</option>
			                                        <option value="S" <c:if test="${tmp.process eq 'S' }"> selected="selected" </c:if>>최종승인</option>
			                                        <option value="N" <c:if test="${tmp.process eq 'N' }"> selected="selected" </c:if>>미승인</option>					                                        
			                                    </select>
                                            </div>
                                        </td>
                                        <th scope="row">문구 사용여부</th>
                                        <td>
                                            <div class="form-inline">
                                                <select class="form-control" id="use" name="use">
			                                        <option value="Y" <c:if test="${tmp.use eq 'Y' }"> selected="selected" </c:if>>사용</option>
			                                        <option value="N" <c:if test="${tmp.use eq 'N' }"> selected="selected" </c:if>>미사용</option>
			                                        <option value="X" <c:if test="${tmp.use eq 'X' }"> selected="selected" </c:if>>발송차단</option>
			                                    </select>
                                            </div>
                                        </td>
                                    </tr>
                                   <tr>
                                        <th scope="row">발송량 제어</th>
                                        <td colspan="3">
                                            <label class="fwn marr10"><input type="checkbox" name="limit_yn" class="ichk" id="sendControl" value="Y" <c:if test="${tmp.limit_yn eq 'Y' }">checked="checked"</c:if>> 사용</label>
                                            <div class="toggle_con form-inline mart10">
                                            	<label class="fwn marr10">발송시작시간(0~23)<input type="number" name="limit_start_hour" class="form-control text-right" max="0" maxlength="2" oninput="maxLengthCheck(this)" value="${tmp.limit_start_hour}"></label>
                                            	<label class="fwn marr10">발송종료시간(0~23)<input type="number" name="limit_end_hour" class="form-control text-right" max="0" maxlength="2" oninput="maxLengthCheck(this)" value="${tmp.limit_end_hour}"></label>
                                            </div>
                                            <div class="toggle_con form-inline mart10">
                                              <label class="fwn marr10"><input type="radio" name="limit_type" class="ichk" value="D" <c:if test="${tmp.limit_type eq 'D' }">checked="checked"</c:if>> 일</label>
                                              <label class="fwn marr10"><input type="radio" name="limit_type" class="ichk" value="H" <c:if test="${tmp.limit_type eq 'H' }">checked="checked"</c:if>> 시</label>
                                              <label class="fwn marr10"><input type="radio" name="limit_type" class="ichk" value="M" <c:if test="${tmp.limit_type eq 'M' }">checked="checked"</c:if>> 분</label>
                                                    <div class="form-group">
                                                      <input type="number" name="limit_count" class="form-control text-right" max="999999" maxlength="6" oninput="maxLengthCheck(this)" value="${tmp.limit_count}">
                                                  </div> 건
                                              <span class="text-blue">ex) 1 ~ 999,999 건</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                        	
	                        <c:if test="${tmp.process eq 'A' || tmp.process eq null}">
	                        		<button type="button" id="btnDelete" class="btn btn-sm  btn-danger pull-left" data-pidx="${tmp.pidx }">삭제</button>
	                        		<button type="button" id="btnView" class="btn btn-sm  btn-info" data-toggle="modal" data-target=".pop_preview">미리보기</button>
	                        	    <button type="button" id="btnComp" class="btn btn-sm  btn-primary">등록완료</button>
	                        </c:if>
							<c:if test="${tmp.process eq 'B' || tmp.process eq 'S'  ||  tmp.process eq 'N' || tmp.process eq 'C'}">
								<button type="button" id="btnDelete" class="btn btn-sm  btn-danger pull-left" data-pidx="${tmp.pidx }">삭제</button>
								<button type="button" id="btnView" class="btn btn-sm  btn-info" data-toggle="modal" data-target=".pop_preview">미리보기</button>
								<button type="button" id="btnUpdate" class="btn btn-sm  btn-primary">수정</button>
								<%-- <c:if test="${tmp.process ne 'S' && tmp.process ne 'A'}">
                           			<button type="button" id="btnReq" class="btn btn-sm  btn-primary">승인요청</button>
                           		</c:if> --%>
                           	</c:if>
                            <button type="button" id="btnCancel" class="btn btn-sm  btn-default">취소</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->
                
            </section><!-- /.content -->
            
            
            
            <!-- preview pop -->
            <div class="modal fade pop_preview" tabindex="-1" role="dialog" aria-labelledby="previewLabel">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h5 class="modal-title">미리보기</h5>
                        </div>
                        <div class="modal-body">
							<pre>
							
							</pre>
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-sm  btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-sm  btn-primary">Save changes</button>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- //preview pop -->
            
            <!-- urlprv pop 2017.04.06 -->
            <div class="modal fade pop_urlprv" tabindex="-1" role="dialog" aria-labelledby="previewLabel">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h5 class="modal-title">미리보기</h5>
                        </div>
                        <div class="modal-body">
                            
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- //urlprv pop 2017.04.06 -->
            
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script>

$(document).ready(function(){
    
	$(".ichk[name=send_priority1]").on("ifChecked",function(){
		$("#pri_fir").val($(this).val());
	});
	
	$(".ichk[name=send_priority2]").on("ifChecked",function(){
		$("#pri_sec").val($(this).val());
	});
	
	$(".ichk[name=send_priority3]").on("ifChecked",function(){
		$("#pri_thi").val($(this).val());
	});

	// 알림톡 사용 유무
	$("#ch_use").on("ifChecked",function(){
		$("#use_yn").val("Y");
	}).on("ifUnchecked",function(){
		$("#use_yn").val("N");
	});
	
	// 추가 종료 문구
	$(".ichk[name=radio_add_content_yn]").on("ifChecked",function(){
		$("#add_content_yn").val($(this).val());		
	});
	
	// 테이블 구분
	$(".ichk[name=radio_table]").on("ifChecked",function(){
		$("#table_div").val($(this).val());		
	});
	
	// 정보성 여부
	$(".ichk[name=radio_info]").on("ifChecked",function(){
		$("#info_yn").val($(this).val());		
	});
	
	// 취소
	$("#btnCancel").on("click", function(){
		movePage({},"msgStandard.tsis");
	});
	
	//삭제
	$("#btnDelete").on("click",function(){
		
		if(confirm("삭제하시겠습니까?")){
			movePage({"code":$(this).data("code"),"pidx":$(this).data("pidx")},"msgStandardDelete.tsis");
		}
	});

	// 미리보기
	$("#btnView").on("click",function(){
		$(".modal-body pre").text($("#content").val());
	});
	
	// 링크관리 미리보기
	$("#btnLinkBtnView").on("click",function(){
		var url = $("#link_btn_url").val();
		if (url == null || url == "") {
			alert("URL 주소를 입력하십시오.");
			return;
		}

		$('.pop_urlprv').modal('toggle'); 
		$(".pop_urlprv .modal-body").html("<iframe id='urlLoad' src='" + url + "' class='mframe'></iframe>");
	});
	
	//수정 요청처리
	$("#btnUpdate").on("click", function(){
		if (!validate(document.mainForm)) {
			return;
		}
		
		if (!isSendPriorityCheck()) {
			return;
		}
		
		$("#priority").val($("#pri_fir").val()+$("#pri_sec").val()+$("#pri_thi").val());
		isCodeCheck(function(data){
			if(data == "Y"){
				$("#mainForm").attr({"action":"msgStandardComlete.tsis","method":"post"}).submit();
			} else {
				alert("문구코드가 중복됩니다.");
			}
		});
		
	});
	
	//등록 요청처리
	$("#btnComp").on("click", function(){
		if (!validate(document.mainForm)) {
			return;
		}
		
		if (!isSendPriorityCheck()) {
			return;
		}
		
		$("#priority").val($("#pri_fir").val()+$("#pri_sec").val()+$("#pri_thi").val());
		
		isCodeCheck(function(data){
			if(data == "Y"){
				$("#mainForm").attr({"action":"msgStandardComlete.tsis","method":"post"}).submit();
			} else {
				alert("문구코드가 중복됩니다.");
			}
		});
	});
	
	/* $("#btnReq").on("click",function(){
		alert("승인요청하였습니다(준비중)");
	}); */
	
	// (0/100) 문구에 표시
	textCounter(document.getElementById("content"), 'content_cnt', $("#len_content").val());
	textCounter(document.getElementById("add_content"), 'add_content_cnt', $("#len_add_content").val());
});

// 발송순서 중복체크
function isSendPriorityCheck() {
	var send_priority = {};
	send_priority[0] = $("#pri_fir").val();
	send_priority[1] = $("#pri_sec").val();
	send_priority[2] = $("#pri_thi").val();
	for(var i = 0; i < 3; i++) {
		for(var j = i + 1; j < 3; j++) {
			if(send_priority[i] != "" && send_priority[i] == send_priority[j]) {
				alert("발송 타입이 중복되었습니다. 다시 설정하십시오.");
				return false;
			}
		}
	}
	return true;
}

function isCodeCheck(successCallback){
	$.ajax({
		url : "isCodeCheck.tsis",
		data: "code="+$("#code").val()+"&pidx="+$("#pidx").val(),
		type : "post",
		success : function(data){
			successCallback(data);
		}, error:function(data){
			alert("ERR : " +data);
		}			
	});
}
</script>
</body>
</html>