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
</head>
<body class="skin-blue">
    <header class="header">
       <%@include file="./gnb/header.jsp" %>
    </header>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <aside class="left-side sidebar-offcanvas">
            <%@include file="./gnb/gnb_left.jsp" %>
        </aside>

        <aside class="right-side">
            <section class="content-header">
                <h1>
                    일괄등록<br>
                    <small>엑셀파일을 업로드 하여 메시지 규격을 일괄등록 할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">일괄등록</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="search_form">
                    <form action="#" method="post" id="mainForm" enctype="multipart/form-data">
                        <div class="dis_table">
                            <dl class="dis_ftr">
                                <dt>파일 업로드</dt>
                                <dd>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <!-- <input type="text" class="form-control"> -->
                                            <div class="filebox">
                                                <input class="upload-name" value="파일선택" disabled="disabled">
                                                <label for="ex_filename" class="btn btn-sm  btn-info">파일찾기</label>
                                                <input type="file" id="ex_filename" class="upload-hidden" name="upload_data">
                                            </div>
                                        </div>
                                        <span class="txt_help">(xls, xlsx 파일만 가능)</span>
                                    </div>
                                </dd>
                            </dl>
                        </div><!-- //dis_table -->
                        <div class="search_btn">
                            <button type="button" id="btnReg" class="btn btn-sm  btn-primary">등록하기</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->

                <div class="upload_sam_box">
                    <h4><i class="fa fa-info-circle"></i> 엑셀 입력 양식</h4>
                    <ol>
                        <li>문구의 코드명을 입력</li>
                        <li>문구의 제목을 입력</li>
                        <li>문구 내용 입력</li>
                        <li>알림톡 사용 유/무 입력(Y/N)</li>
                        <li>발송순서 입력(알림톡 : A, SMS/LMS : S, NMS : N)</li>
                        <li>심의번호 입력</li>
                        <li>테이블 구분 입력(실시간 : R, 배치 : B)</li>
                        <li>정보성 유/무 입력(Y/N)</li>
                        <li>문구에 대한 설명 입력</li>
                        <li>문구 사용 여부(Y/N)</li>
                        <li>문구 내용 마지막에 추가 문구 사용 여부(Y/N)</li>
                        <li>문구 내용 마지막에 추가할 문구를 입력</li>
                    </ol>
                    <p>※ 등록양식 다운로드 : <a href="excelDown/template_import.xlsx" class="btn btn-sm  btn-success"><i class="fa fa-file-excel-o"></i> 다운로드</a></p>
					<h4><i class="fa fa-info-circle"></i> 등록예제</h4>
                    <table class="table tbl_excel tbl_fixed">
                        <colgroup>
                            <col style="width:50px">
                            <col style="width:70px">
                            <col style="width:*">
                            <col style="width:50px">
                            <col style="width:60px">
                            <col style="width:60px">
                            <col style="width:70px">
                            <col style="width:60px">
                            <col style="width:90px">
                            <col style="width:65px">
                            <col style="width:80px">
                            <col style="width:65px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">코드</th>
                                <th scope="col">제목</th>
                                <th scope="col">문구내용</th>
                                <th scope="col">알림톡</th>
                                <th scope="col">발송순서</th>
                                <th scope="col">심의번호</th>
                                <th scope="col">테이블구분</th>
                                <th scope="col">정보성</th>
                                <th scope="col">설명</th>
                                <th scope="col">문구사용</th>
                                <th scope="col">추가문구사용</th>
                                <th scope="col">추가문구</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>HF00</td>
                                <td>접수안내</td>
                                <td class="text-left">
                                    <div class="ellipsis">고객님 보험금 접수가 완료 되었습니다.</div>
                                </td>
                                <td>Y</td>
                                <td>AS</td>
                                <td>HF00</td>
                                <td>R</td>
                                <td>N</td>
                                <td>접수안내 문구</td>
                                <td>Y</td>
                                <td>Y</td>
                                <td>추가문구</td>
                            </tr>
                            <tr>
                                <td>HF01</td>
                                <td>명의안내</td>
                                <td class="text-left">
                                    <div class="ellipsis">고객님 명의변경이 완료 되었습니다.</div>
                                </td>
                                <td>N</td>
                                <td>AS</td>
                                <td>HF01</td>
                                <td>R</td>
                                <td>N</td>
                                <td>명의안내 문구</td>
                                <td>Y</td>
                                <td>Y</td>
                                <td>추가문구</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //upload_sam_box -->

            </section><!-- /.content -->
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script>
$(document).ready(function(){
    iCheckAll();

    // 체크라인 제거
    $("#btn_listDel").on("click", function(){
        $("#listForm").find(".icheckbox_minimal.checked").parents("tr").hide();
        return false;
    });
    
    
    $("#btnReg").on("click",function(){
    	$("#mainForm").attr({"action":"updateTemplate.tsis"}).submit();
    });
    

    // 업로드 파일 버튼
    var fileTarget = $('.filebox .upload-hidden');
    fileTarget.on('change', function(){
	    if(window.FileReader){
	        var filename = $(this)[0].files[0].name;
	    }
	    else {
	        var filename = $(this).val().split('/').pop().split('\\').pop();
	    }
	    
	    
	    var ext = filename.split(".");
    	ext = ext[ext.length-1];
    	
    	if(ext != "xlsx" && ext != "xls"){
    		alert("확장자가 xlsx 또는 xls 만 가능합니다.");
    		$(this).val("");
    		return false;
    	}
    	
    	$(this).siblings('.upload-name').val(filename);
    });


});

function iCheckAll(){
    //checkbox
    var $chk_all = $(".tbl_list th .icheckbox_minimal");
    var $chk_item = $(".tbl_list td .icheckbox_minimal");

    $chk_all.on('ifChecked', function(){
        $chk_item.iCheck("check");
    });
    $chk_all.on('ifUnchecked', function(){
        $chk_item.iCheck("uncheck");
    })
}
</script>
</body>
</html>