<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    수신거부 등록<br>
                    <small>스마트 메시징 시스템에서 수신거부 할 메신저를 등록/수정할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                     <%@include file="./gnb/home.jsp" %>
                    <li class="active">수신거부 등록</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post" id="mainForm">
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">수신번호</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" placeholder="번호 입력" name="receive_num" id="receive_num" maxlength="12">
                                                </div>
                                                <button type="button" class="btn btn-sm  btn-warning" id="btnCheck">중복검사</button>
                                                <span class="txt_help"> '-' 없이 입력</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">신청자 아이디</th>
                                        <td colspan="3">${sessionScope.aidx }
                                        	<input type="hidden" name="aidx" value="${sessionScope.aidx }"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수신여부</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <select class="form-control" id="refuse" name="refuse">
                                                    <option value="Y">거부</option>
                                                    <option value="N">허용</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <t>
                                        <th scope="row">메신저 선택</th>
                                        <td colspan="3" class="chkList">
                                            <label class="fwn marr10"><input type="checkbox" class="ichk" id="allChk"> 전체</label>
                                            <label class="fwn marr10"><input type="checkbox" class="ichk" id="mtype_a" value="A"> 알림톡</label>
                                            <input type="hidden" id="mtypeA" value=""/>
                                            <label class="fwn marr10"><input type="checkbox" class="ichk" id="mtype_s" value="S"> SMS/LMS</label>
                                            <input type="hidden" id="mtypeS" value=""/>
                                            <label class="fwn marr10"><input type="checkbox" class="ichk" id="mtype_n" value="N"> NMS</label>
                                            <input type="hidden" id="mtypeN" value=""/>
                                            <input type="hidden" name="mtype" id="mtype" value=""/>
                                            <input type="hidden" name="src_desc" id="src_desc" value="-"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수신거부 요청 처</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <select class="form-control" name="src_table">
                                                    <option value="ARS">ARS</option>
                                                    <option value="DNC">DNC</option>
                                                    <option value="CALL">콜센터</option>
                                                    <option value="ETC">기타</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">등록일</th>
                                        <td colspan="3">${reg_date }</td>
                                        <!-- <th scope="row">수정일</th>
                                        <td>2015-12-12</td> -->
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                            <!-- <button type="button" class="btn btn-danger pull-left btn-sm" data-toggle="modal" data-target=".pop_reason">삭제</button> -->
                            <button type="button" class="btn btn-primary btn-sm" id="btnRegi">등록</button>
                            <button type="button" class="btn btn-default btn-sm" id="btnCancel" onclick="javascript:history.back(-1);">취소</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->

            </section><!-- /.content -->

            <!-- reason pop -->
            <div class="modal fade pop_reason" tabindex="-1" role="dialog" aria-labelledby="previewLabel" data-backdrop="static">
                <div class="modal-dialog modal-sm">
                    <form action="#" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h5 class="modal-title">수신거부 해지 사유 입력</h5>
                            </div>
                            <div class="modal-body">
                                <input type="text" class="form-control" placeholder="사유를 입력하세요." required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary btn-sm">등록</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- //reason pop -->
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script>
$(document).ready(function(){
	var sw = false;
	$("#receive_num").on("change",function(){
		sw = false;
	});
	
	$("#btnRegi").on("click", function(){
		if($("#receive_num").val()==""){
			alert("수신번호를 입력해주세요");
			return false;
		}
			
		if(!sw){
			alert("중복검사 버튼을 눌러주세요");
			return false;
		}
		
		$("#mtype").val($("#mtypeA").val()+$("#mtypeS").val()+$("#mtypeN").val());
		
		if($("#mtype").val()==""){
			alert("수신거부할 메신저를 하나이상 선택해주세요");
			return false;
		}
		
		$("#mainForm").attr({"action":"refuseInsert.tsis","method":"post"}).submit();
		
	});
	
	
	/* $("#btnDelete").on("click", function(){
    	var $del = $("#stList").find(".icheckbox_minimal.checked");
    	var len = $del.length;
    	
    	if(len == 0 ){
    		alert("선택하신 항목이 없습니다.");
    		return false;
    	}
    	
    	var pidxs = "";
    	for(var i = 0 ; i < len; i++){
    		if(i == (len-1)){
    			pidxs += $del.parents("tr").eq(i).data("pidx");
    		} else {
    			pidxs += $del.parents("tr").eq(i).data("pidx")+",";
    		}
    	}
    	
        if(confirm("삭제하시겠습니까?")){
        	var data = {"pidx":pidxs};
        	//$("#mainForm").attr({"action":"msgStandardDetail.tsis"});
        	movePage(data , "msgStandardDelete.tsis");
        }
    	
    }); */
	
	
	$("#btnCheck").on("click", function(){
		var num = $("#receive_num").val();
		$.ajax({
			url:"checkRefuseNum.tsis",
			data : "receive_num="+num,
			type : "post",
			success : function(data){
				if(data == "1"){
					alert("이미 등록된 번호입니다.");
					sw = false;
				} else{
					alert("등록할 수 있는 번호입니다.");
					sw = true;
				}
			}
		});
	});
	
    //전체체크
    iCheckAll();

    //수신여부에 따른 체크박스 활성화
    $("#refuse").change(function(){
        if($("#refuse").val() != "Y"){
            $(".chkList input").iCheck('disable');
        } else {
           $(".chkList input").iCheck('enable');
        }
    });
    
    $("#mtype_a").on('ifChecked', function(){
        $("#mtypeA").val("A");
    }).on('ifUnchecked', function(){
    	$("#mtypeA").val("");
    });
    
    $("#mtype_s").on('ifChecked', function(){
        $("#mtypeS").val("S");
    }).on('ifUnchecked', function(){
    	$("#mtypeS").val("");
    });
    
    
    $("#mtype_n").on('ifChecked', function(){
        $("#mtypeN").val("N");
    }).on('ifUnchecked', function(){
    	$("#mtypeN").val("");
    });
    
    
});

function iCheckAll(){
    //checkbox
    var $chk_all = $("#allChk").parent(".icheckbox_minimal");
    var $chk_item = $(".chkList .icheckbox_minimal");

    $chk_all.on('ifChecked', function(){
        $chk_item.iCheck("check");
        $("#mtype").val("ASN");
    });
    $chk_all.on('ifUnchecked', function(){
        $chk_item.iCheck("uncheck");
        $("#mtype").val("");
    });
}
</script>
</body>
</html>