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
                    캠페인 관리<br>
                    <small>캠페인 정보를 확인/수정 할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li><a href="campaignList.tsis"><i class="fa fa-bars"></i> 캠페인 현황</a></li>
                    <li class="active">캠페인 확인/수정</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post" id="mainForm" name="mainForm">
                    	<input type="hidden" name="proc_aidx" value="${aidx }"/>
                    	<input type="hidden" id="seq" name="seq" value="${view.seq }"/>
                    	<input type="hidden" id="pidx" name="pidx" value="${view.pidx }"/>
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">캠페인 제목</th>
                                        <td colspan="3">
                                            <input type="text" class="form-control" name="subject" id="subject" value="${view.subject }" hname="제목" required="maxbyte" maxbyte="${len_subject}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">내용</th>
                                        <td colspan="3">
                                            <textarea class="form-control" rows="10" name="content" id="content"
                                            		hname="내용" required="maxbyte" maxbyte="${len_content}"
                                            			onkeyup="textCounter(this.form.content, 'content_cnt', ${len_content});">${view.content }</textarea>
											<input type="hidden" id="len_content" value="${len_content}"/>
                                            <p class="pull-right" id="content_cnt"></p>
                                            <p class="help-block text-red"></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">등록일</th>
                                        <td>${view.wrtdate }</td>
                                        <th scope="row">종료일</th>
                                        <td>${view.link_limit_day }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">캠페인 기간(일)</th>
                                        <td><input type="text" style="width:30px" name="link_limit" id="link_limit" value="${view.link_limit }" hname="캠페인일수" required="maxbyte" maxbyte="4"> 일</td>
                                        <th scope="row">링크 최대 접속 횟수</th>
                                        <td><input type="text" style="width:30px" name="link_cnt" id="link_cnt" value="${view.link_cnt }" hname="캠페인일수" required="maxbyte" maxbyte="4"> 회</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">사용 여부</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <select class="form-control" id="use" name="use">
			                                        <option value="Y" <c:if test="${view.use eq 'Y' }"> selected="selected" </c:if>>사용</option>
			                                        <option value="N" <c:if test="${view.use eq 'N' }"> selected="selected" </c:if>>미사용</option>
			                                    </select>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                        	
	                        <c:if test="${tmp.process eq 'A' || tmp.process eq null}">
	                        	    <button type="button" id="btnComp" class="btn btn-sm  btn-primary">수정</button>
	                        </c:if>
							
                            <button type="button" id="btnCancel" class="btn btn-sm  btn-default">취소</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->
                
            </section><!-- /.content -->
            
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

	
	// 취소
	$("#btnCancel").on("click", function(){
		movePage({},"campaignList.tsis");
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
	//textCounter(document.getElementById("add_content"), 'add_content_cnt', $("#len_add_content").val());
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