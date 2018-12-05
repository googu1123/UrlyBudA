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
	                    	시나리오 답변관리 등록<br>
	                    <small>자동응답 답변을 등록/수정합니다.</small>
	                </h1>
	                <ol class="breadcrumb">
	                    <%@include file="./gnb/home.jsp" %>
	                    <li><a href="callCenterScenarioList.tsis"><i class="fa fa-bars"></i> 시나리오 답변관리</a></li>
	                    <li class="active">시나리오 답변관리 등록</li>
	                </ol>
	            </section>
	
	            <!-- Main content -->
	            <section class="content">
	                <div class="phone_layout">
	                    <div class="tbl_view">
	                        <form action="#" method="post" id="mainForm" name="mainForm" enctype="multipart/form-data">
				      			<input type="hidden" name="pidx" id="pidx" value="${tmp.pidx }"/>
	                            <div class="table-responsive">
	                                <table class="table tbl_write">
	                                    <tbody>
	                                        <tr>
	                                            <th scope="row">버튼명</th>
	                                            <td>
	                                                <input type="text" class="form-control" name="subject" id="subject" value="${tmp.subject }"
														hname="버튼명" required="maxbyte" maxbyte="${len_subject}"
		                                            	onkeyup="textCounter(this.form.subject, 'subject_cnt', ${len_subject});">
	                                                <p class="pull-right padt5" id="subject_cnt"></p>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th scope="row">답변유형</th>
	                                            <td>
	                                                <div class="form-inline">
	                                                    <div class="form-group">
	                                                        <label class="fwn marr10"><input type="radio" name="send_type" class="ichk" value="buttons" <c:if test="${tmp.send_type eq 'buttons' or tmp.send_type == undefined}">checked="checked"</c:if>> 버튼</label>
	                                                        <label class="fwn marr10"><input type="radio" name="send_type" class="ichk" value="text" <c:if test="${tmp.send_type eq 'text' }">checked="checked"</c:if>> 텍스트</label>
	                                                    </div>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th scope="row">답변메시지</th>
	                                            <td>
	                                                <textarea class="form-control" rows="16" name="content" id="content"
														hname="답변메시지" required="maxbyte" maxbyte="${len_content}"
		                                            	onkeyup="textCounter(this.form.content, 'content_cnt', ${len_content});">${tmp.content }</textarea>
	                                                <p class="pull-right padt5" id="content_cnt"></p>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th scope="row">이미지</th>
	                                            <td>
	                                                <div class="form-inline">
	                                                    <div class="form-group">
	                                                        <label class="fwn marr10"><input type="radio" name="radio_useimg" class="ichk" value="Y" <c:if test="${tmp.image_url != undefined }">checked="checked"</c:if>> 사용</label>
	                                                        <label class="fwn marr10"><input type="radio" name="radio_useimg" class="ichk" value="N" <c:if test="${tmp.image_url == undefined }">checked="checked"</c:if>> 사용안함</label>
	                                                    </div>
	                                                </div>
	                                                <div class="slide slide_img">
	                                                    <div class="form-inline">
	                                                        <div class="form-group mart10">
	                                                            <div class="filebox">
	                                                                <input class="upload-name" value="파일선택" disabled="disabled">
	                                                                <label for="img_filename" class="btn btn-info btn-sm">파일찾기</label>
	                                                                
	                                                                <input type="hidden" 
	                                                                	   id="o_img_filename"  
	                                                                	   name="o_img_filename" 
	                                                                	   class="upload-hidden"
	                                                                	   value="${tmp.image_url}" />
	                                                                
	                                                                <input type="file" 
	                                                                	   id="img_filename"  
	                                                                	   name="img_filename" 
	                                                                	   class="upload-hidden" accept="image/*" />
	                                                                권장사이즈 : 720*630
	                                                            </div> 
	                                                            
	                                                           
	                                                        </div>
	                                                    </div>
	                                                    <div class="img_file_name mart10">
	                                                        <span class="text-orange">${tmp.image_url}</span>
	                                                        <div id="btnImageDelete" class="btn btn_del btnImageDelete"><i class="fa fa-window-close-o"></i></div>
	                                                    </div>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th scope="row" rowspan="2">링크</th>
	                                            <td>
	                                                <div class="form-inline">
	                                                    <div class="form-group">
	                                                        <label class="fwn marr10"><input type="radio" name="radio_uselink" class="ichk" value="Y" <c:if test="${tmp.link_btn_name != undefined }">checked="checked"</c:if>> 사용</label>
	                                                        <label class="fwn marr10"><input type="radio" name="radio_uselink" class="ichk" value="N" <c:if test="${tmp.link_btn_name == undefined }">checked="checked"</c:if>> 사용안함</label>
	                                                    </div>
	                                                </div>
	                                                <div class="slide slide_link">
	                                                    <div class="form-inline">
	                                                        <div class="form-group mart10">
	                                                            <input type="text" class="form-control input_wid300" placeholder="링크버튼 이름" value="${tmp.link_btn_name }" name="link_btn_name" id="link_btn_name"
	                                                            	hname="링크 버튼명" requirenum="maxbyte" maxbyte="${len_link_btn_name}"
					                                            	onkeyup="textCounter(this.form.link_btn_name, 'link_btn_name_cnt', ${len_link_btn_name});">
                                                				<p class="pull-right padt5" id="link_btn_name_cnt"></p>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-inline">
	                                                        <div class="form-group mart10">
	                                                            <input type="text" class="form-control input_wid300" placeholder="URL" value="${tmp.link_btn_url }" name="link_btn_url" id="link_btn_url"
																	hname="URL" requirenum="maxbyte" maxbyte="${len_link_btn_url}">
	                                                            <a href="#" class="btn btn-info btn-sm" id="btn_prv" data-toggle="modal" data-target=".pop_urlprv">미리보기</a>
	                                                        </div>
	                                                        
	                                                         <div class="link_btn_url mart10">
	                                                        <span class="text-orange"></span>
	                                                    </div>
	                                                    
	                                                    </div>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div><!-- /.table-responsive -->
	
	                        </form>
	                    </div><!-- /.tbl_view -->
	                </div>
	
	                <div class="phonebox type_chat">
	                    <div class="phone_body">
	                        <div class="chatbox">
	                            <h4>미리보기</h4>
	                            <div class="ovf">
	                                <div class="msg">
	                                    <div class="msgbox">
	                                        <p id="prvBtnName">버튼명</p>
	                                    </div>
	                                </div>
	                                <div class="msg chat_msg">
	                                    <div class="msgbox">
	                                        <pre id="prvMsg">답변메시지</pre>
	                                        <div class="msg_img slide_img">
	                                       		<img  id="img" alt="첨부이미지"
	                                       			<c:if test="${tmp.image_url != undefined }">src="${tmp.image_url}"</c:if>
	                                        		<c:if test="${tmp.image_url == undefined }">src="img/bg_msg.png"  </c:if>
	                                       		/>
	                                       	</div>
	                                        <div class="msg_link slide_link">
	                                            <div class="ellipsis">
	                                                <i class="fa fa-link"></i>
	                                                <span class="link_txt" id="prvUrl">링크버튼 이름</span>
	                                            </div>
	                                            <div class="ico_link">
	                                                <i class="fa fa-chevron-right"></i>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div><!-- //chatbox -->
	                        </div>
	                    </div>
	                </div>
	
	                <div class="clear search_btn">
	                    <button class="btn btn-danger btnDelete hide btn-sm">삭제</button>
	                    <button class="btn btn-primary btnRegi hide btn-sm">등록</button>
	                    <button class="btn btn-primary btnUpdate hide btn-sm">수정</button>
	                    <button class="btn btn-default btnCancel btn-sm">취소</button>
	                </div>
	                
	            </section><!-- /.content -->
	
	            <!-- urlprv pop  -->
	            <div class="modal fade pop_urlprv" tabindex="-1" role="dialog" aria-labelledby="previewLabel">
	                <div class="modal-dialog modal-sm">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                            <h5 class="modal-title">미리보기</h5>
	                        </div>
	                        <div class="modal-body">
	                            <iframe id="urlLoad" src="" class="mframe">
	                            </iframe>
	                        </div>
	                        <!-- <div class="modal-footer">
	                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                            <button type="button" class="btn btn-primary">Save changes</button>
	                        </div> -->
	                    </div>
	                </div>
	            </div>
	            <!-- //urlprv pop -->
	        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->
    
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if ($("#pidx").val() == "") {
		$('.btnRegi').removeClass('hide');
	} else {
		
		$('.btnDelete').removeClass('hide');
		$('.btnUpdate').removeClass('hide');
		
		
		if ($(".ichk[name=radio_useimg]:checked").val() == "Y") {
			$('.slide_img').fadeIn();
		}else{
			$('.slide_img').hide();
		}
		
		if ($(".ichk[name=radio_uselink]:checked").val() == "Y") {
			$('.slide_link').fadeIn();
		}else{
			$('.slide_link').hide();
		}
		
	}
	
	
    if(!isEmpty($("#o_img_filename").val())){
		$(".img_file_name").show();	    	
    }
    
	// 등록
	$(".btnRegi").on("click", function(){
		if (!validate(document.mainForm)) {
			return;
		}
		
		if($("input[name='radio_useimg']:checked").val() == 'Y' && isEmpty($("#img_filename").val())){
			alert("이미지파일을 선택하세요");
			return false;
		}
		
		if($("input[name='radio_uselink']:checked").val() == 'Y' && (isEmpty($("#link_btn_name").val()) || isEmpty($("#link_btn_url").val()) )){
			alert("링크 정보를 입력하세요.");
			return false;
		}
		
		if($("input[name='radio_useimg']:checked").val() == 'N'){
			$("#img_filename").val('');
			$("#o_img_filename").val("");
		}
		if($("input[name='radio_uselink']:checked").val() == 'N'){
			$("#link_btn_name").val('');
			$("#link_btn_url").val('');
		}
		
		$("#mainForm").attr({"action":"callCenterScenarioInsert.tsis","method":"post"}).submit();
	});
	
	// 수정
	$(".btnUpdate").on("click", function(){
		if (!validate(document.mainForm)) {
			return;
		}
		
		/*if($("input[name='radio_useimg']:checked").val() == 'Y' && isEmpty($("#img_filename").val())){
			alert("이미지파일을 선택하세요");
			return false;
		}*/
		
		
		if($("input[name='radio_useimg']:checked").val() == 'Y' && isEmpty($("#o_img_filename").val()) && isEmpty($("#img_filename").val())){
			alert("이미지파일을 선택하세요");
			return false;
		}
		
		
		if($("input[name='radio_uselink']:checked").val() == 'Y' && (isEmpty($("#link_btn_name").val()) || isEmpty($("#link_btn_url").val()) )){
			alert("링크 정보를 입력하세요.");
			return false;
		}
		
		if($("input[name='radio_useimg']:checked").val() == 'N'){
			$("#img_filename").val('');
			$("#o_img_filename").val("");
		}
		if($("input[name='radio_uselink']:checked").val() == 'N'){
			$("#link_btn_name").val('');
			$("#link_btn_url").val('');
		}
		
		$("#mainForm").attr({"action":"callCenterScenarioUpdate.tsis","method":"post"}).submit();
	});
	
	// 삭제
	$(".btnDelete").on("click", function(){
		if(confirm("삭제 하시겠습니까?")){
			$("#mainForm").attr({"action":"callCenterScenarioDelete.tsis","method":"post"}).submit();
		}
	});
	
	// 취소
	$(".btnCancel").on("click", function(){
		$("#mainForm").attr({"action":"callCenterScenarioManage.tsis","method":"post"}).submit();
	});
	
	// 이미지삭제
	$("#btnImageDelete").on("click", function(){
		
		$("#o_img_filename").val("");
		$("#img").attr("src", "img/bg_msg.png")
		$(".img_file_name").hide();
		console.log("이미지삭제22");
		return false;
	});
	
	
	// 버튼명 입력
    var btnName = $("#subject");
    $("#prvBtnName").text(btnName.val());
    $(btnName).on('keyup', function(){
        $("#prvBtnName").text(btnName.val());
    });

    // 답변메시지 입력
    var txtmsg = $("#content");
    $("#prvMsg").text(txtmsg.val());
    $(txtmsg).on('keyup', function(){
        $("#prvMsg").text(txtmsg.val());
    });
    
    // 링크 URL 입력
    var txtlink_name = $("#link_btn_name");
    $("#prvUrl").text(txtlink_name.val());
    $(txtlink_name).on('keyup', function(){
        
    	$("#prvUrl").text(txtlink_name.val());
    	
    	if(!url_validate()){
    		$(".link_btn_url span").html("유효하지 않은 URL주소입니다.");
    		$(".link_btn_url span").show();
    	}else{
    		$(".link_btn_url span").hide();
    	}
    	
    });
    
    $("#btn_prv").on('click', function(){
        $("#urlLoad").attr("src", $("#link_btn_url").val());
    });
    
    // 이미지 라디오버튼
    $(".ichk[name=radio_useimg]").on("ifChecked",function(){
    	if ($(this).val() == "Y") {
    		$('.slide_img').fadeIn();
    	} else {
    		$('.slide_img').slideUp(200);
    	}
	});
    
 	// 링크 라디오버튼
    $(".ichk[name=radio_uselink]").on("ifChecked",function(){
    	if ($(this).val() == "Y") {
    		$('.slide_link').fadeIn();
    	} else {
    		$('.slide_link').slideUp(200);
    	}
	});
 	
    
    
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
           		//console.log(e);
           		$(".upload-name").val($("#img_filename").val());
                $('#img').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#img_filename").change(function(){
        readURL(this);
    });
    
    
    
    function url_validate() {
    	
        var url = document.getElementById("link_btn_url").value;
        var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
        if (pattern.test(url)) {
            return true;
        } 
           return false;

    }
    
    
});
</script>
</body>

</html>