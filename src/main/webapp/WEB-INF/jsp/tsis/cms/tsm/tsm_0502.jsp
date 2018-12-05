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
    <!-- swiper -->
    <link rel="stylesheet" href="css/swiper.min.css">
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
                    시나리오 관리<br>
                    <small>자동응답 시나리오를 관리합니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">시나리오 관리</li>
                </ol>
            </section>

            <!-- Main content -->
			<form action="#" method="post"  id="mainForm">
		      	<input type="hidden" name="buttonData" id="buttonData" value="${buttonData }"/>
 				<input type="hidden" name="tmpInfoLen" id="tmpInfoLen" value="${fn:length(tmpList) }"/>
 				<c:choose>
					<c:when test="${fn:length(tmpList) > 0 }">
						<c:forEach var="st" items="${tmpList }" varStatus="status">
							<input type="hidden" id="pidx${st.ukey }" name="pidx${st.ukey }" value="${st.pidx }"/>
							<input type="hidden" id="subject${st.ukey }" name="subject${st.ukey }" value="${st.subject }"/>
							<input type="hidden" id="priority${st.ukey }" name="priority${st.ukey }" value="${st.priority }"/>
							<input type="hidden" id="res_message${st.ukey }" name="res_message${st.ukey }" value="${st.res_message }"/>
							<input type="hidden" id="send_type${st.ukey }" name="send_type${st.ukey }" value="${st.send_type }"/>
							<input type="hidden" id="etc1${st.ukey }" name="etc1${st.ukey }" value="${st.etc1 }"/>
							<input type="hidden" id="etc2${st.ukey }" name="etc2${st.ukey }" value="${st.etc2 }"/>
							<input type="hidden" id="order_num${st.ukey }" name="order_num${st.ukey }" value="${st.order_num }"/>
					    </c:forEach>
					</c:when>
				</c:choose>

	            <section class="content">
	                <div class="btnbox">
	                    <a href="#" class="btn btn-primary btnNew">신규 답변등록</a>
	                </div>
	                <div class="ovf_x">
	                    <div class="ovf_box">
	                        <div class="row">
	                            <div class="col-sm-3">
	                                <div class="flowlistbox">
	                                    <h3>답변목록</h3>
	                                    <ul id="sortable0" class="connectsortbl">
	                                    </ul>
	                                </div>
	                            </div>
	
	                            <div class="col-sm-3">
	                                <div class="flowbox">
	                                    <div class="depthbox">
	                                        <h3>Depth 1</h3>
	                                        <ul id="sortable1" class="connectsortbl">
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="col-sm-3">
	                                <div class="flowbox">
	                                    <div class="depthbox">
	                                        <h3>Depth 2</h3>
	                                        <ul id="sortable2" class="connectsortbl">
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="col-sm-3">
	                                <div class="flowbox">
	                                    <div class="depthbox">
	                                        <h3>Depth 3</h3>
	                                        <ul id="sortable3" class="connectsortbl">
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	                        </div><!--// row-->
	                    </div>
	                </div>
	
	                <div class="phonebox">
	                    <div class="phone_body">
	                        <div class="chatbox">
	                            <h4>미리보기</h4>
	                        </div>
	                        <div class="listbox">
	                            <div class="swiper-container">
                                	<div class="swiper-wrapper">
                                	</div>
                                	<div class="swiper-pagination"></div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="search_btn">
	                    <p class="text-orange">* 답변은 단계별 10개까지 추가할 수 있습니다.</p>
	                    <button class="btn btn-primary btnUpdate">변경사항 저장</button>
	                </div>
	            </section><!-- /.content -->
			</form>
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/swiper.jquery.min.js"></script>
<script src="js/common.js"></script>
<script>
var selectIdx;
var selectIdx2;

/**
 * 최초 로딩
 */
$(document).ready(function(){
	// sorting depth
	var sortablePress = false;
    $( "#sortable0, #sortable1, #sortable2, #sortable3" ).sortable({
        handle: ".handle"
        , placeholder: "ui-state-highlight"
        , connectWith: ".connectsortbl"
        , start: function(event, ui) {
        	sortablePress = true;
        }
    	, stop: function(event, ui) {
    		if (sortablePress == false)
    			return;
        	
        	// 순서변경만 했을때 처리
        	var len = $("#"+event.target.id+" > li > div > span").length;
			for (var i = 0; i < len; i++) {
				var tmpIdx = $("#"+event.target.id+" > li > div").eq(i).find("#idx").val();
				$("#order_num"+tmpIdx).val("" + i);
			}
        }
    	, receive: function(event, ui) {
    		sortablePress = false;
			console.log("receive:"+event.target.id);

			var idx = ui.item[0].children[0].children.idx.value;
			var pidx = $("#pidx"+idx).val();
			var send_type = $("#send_type"+idx).val();
			
			if (event.target.id == "sortable0") {
				var len = $("#"+event.target.id+" > li > div > span").length;
				
				// 재 정렬
				for (var i = 0; i < len; i++) {
					var tmpIdx = $("#"+event.target.id+" > li > div").eq(i).find("#idx").val();
					$("#order_num"+tmpIdx).val("" + i);
				}
				
				// 이동시킨 데이터의 소속된 데이터들 초기화
				listRowInit(idx);
				
				getListInfo("0", "");
				getListInfo("1", "");
				getListInfo("2", $("#pidx"+selectIdx).val());
				getListInfo("3", $("#pidx"+selectIdx2).val());
			}
			else if (event.target.id == "sortable1") {
				var len = $("#"+event.target.id+" > li > div > span").length;
				for (var i = 0; i < len; i++) {
					var tmpIdx = $("#"+event.target.id+" > li > div").eq(i).find("#idx").val();
					$("#order_num"+tmpIdx).val("" + i);
				}
				listMove(idx, 1);
				
				// 눌려져 있는거 제거
				if (ui.item[0].className.indexOf('active') > 0) {
					ui.item[0].className = ui.item[0].className.replace('active', '');
					selectIdx2 = "";
				}
				
				getListInfo("3", "");
			}
			else if (event.target.id == "sortable2") {
				if (selectIdx == undefined || selectIdx == "") {
					$(ui.sender).sortable("cancel");	// 실행취소
					alert("Depth 1 목록을 선택 후 추가하세요");
					return;
				}
				
				if (!listMoveCheck(idx, $("#priority" + idx).val())) {
					$(ui.sender).sortable("cancel");	// 실행취소
					alert("하위 메뉴중 Depth 3의 데이터가 있습니다");
					return;
				}
				listMove(idx, 2);
				
				var len = $("#"+event.target.id+" > li > div > span").length;
				for (var i = 0; i < len; i++) {
					var tmpIdx = $("#"+event.target.id+" > li > div").eq(i).find("#idx").val();
					$("#order_num"+tmpIdx).val("" + i);
				}
				
				$("#etc1"+idx).val($("#subject" + selectIdx).val());
				$("#etc2"+idx).val($("#pidx" + selectIdx).val());
				$("#priority"+idx).val("2");
				
				getListInfo("2", $("#pidx" + selectIdx).val());
				getListInfo("3", $("#pidx" + selectIdx2).val());
			}
			else if (event.target.id == "sortable3") {
				if (selectIdx2 == undefined || selectIdx2 == "") {
		            $(ui.sender).sortable("cancel");	// 실행취소
					alert("Depth 2 목록을 선택 후 추가하세요");
					return;
				}
				
	    		if (send_type != "text") {
	    			$(ui.sender).sortable("cancel");	// 실행취소
	    			alert("Depth 3 목록에는 텍스트만 등록가능합니다");
	    			return;
	    		}
	    		
	    		if (!listMoveCheck(idx, $("#priority" + idx).val())) {
					$(ui.sender).sortable("cancel");	// 실행취소
					alert("하위 메뉴중 Depth 3의 데이터가 있습니다");
					return;
				}
	    		listMove(idx, 3);
	    		
				var len = $("#"+event.target.id+" > li > div > span").length;
				for (var i = 0; i < len; i++) {
					var tmpIdx = $("#"+event.target.id+" > li > div").eq(i).find("#idx").val();
					$("#order_num"+tmpIdx).val("" + i);
				}
				
	    		$("#etc1"+idx).val($("#subject" + selectIdx2).val());
				$("#etc2"+idx).val($("#pidx" + selectIdx2).val());
				$("#priority"+idx).val("3");
			}
    	}
    });
    $("#sortable1").disableSelection();
    
    $(".btnNew").on("click",function(){
    	movePage({},"callCenterScenarioRegi.tsis");
    });
    
    $(".btnUpdate").on("click",function(){
    	$("#mainForm").attr({"action":"callCenterScenarioManageUpdate.tsis","method":"post"}).submit();
    });
    
    getListInfo("0", "");
    getListInfo("1", "");
});

function listMove(idx, step) {
	var pidx = $("#pidx" + idx).val();
	
	// 정렬 시키기 위해 값을 담는다
	var arrList = [];
	for (var i = 0; i < $("#tmpInfoLen").val(); i++) {
		var tmpEtc2 = $("#etc2" + i).val();
		var tmpStep = Number($("#priority" + i).val());
		
		if (tmpEtc2 == pidx) {
			var obj = {
					order_num : $("#order_num"+i).val()
					, idx : i
			};
			arrList.push(obj);
		}
	}
	arrList.sort(function(a, b) {
		return a.order_num > b.order_num;
	});
	
	if (step == 1) {
		$("#etc1"+idx).val("");
		$("#etc2"+idx).val("");
	}
	
	var nowStep = Number($("#priority"+idx).val());
	$("#priority"+idx).val("" + step);
	
	for (var i = 0; i < arrList.length; i++) {
		var tmpStep = Number($("#priority" + arrList[i].idx).val());
		listMove(arrList[i].idx, tmpStep - (nowStep - step));
	}
}

function listMoveCheck(idx, prevStep) {
	var pidx = $("#pidx" + idx).val();
	var send_type = $("#send_type" + idx).val();
	var step = Number($("#priority" + idx).val());
	
	if (step >= 3 && prevStep != 3) {
		return false;
	}
	
	if (send_type == "text") {
		return true;
	}
	
	for (var i = 0; i < $("#tmpInfoLen").val(); i++) {
		var tmpEtc2 = $("#etc2" + i).val();
		var tmpStep = Number($("#priority" + i).val());
		
		if (tmpEtc2 == pidx) {
			if (!listMoveCheck(i, prevStep))
				return false;
		}
	}
	return true;
}

/**
 * 리스트 트리 데이터 초기화
 이동시킨 데이터의 소속된 데이터들 초기화
 */
function listRowInit(idx) {
	var pidx = $("#pidx" + idx).val();
	var send_type = $("#send_type" + idx).val();
	var step = Number($("#priority"+idx).val());
	
	if (step < 1 || step > 3) {
		return;
	}
	
	for (var i = 0; i < $("#tmpInfoLen").val(); i++) {
		var tmpEtc2 = $("#etc2"+i).val();
		
		if (tmpEtc2 == pidx) {
			listRowInit(i);
			
			$("#etc1"+i).val("");
			$("#etc2"+i).val("");
			$("#priority"+i).val("0");
		}
	}
	
	$("#etc1"+idx).val("");
	$("#etc2"+idx).val("");
	$("#priority"+idx).val("0");
}

/**
 * 뎁스별 리스트 셋팅
 */
function getListInfo(step, etc2) {

	// 정렬 시키기 위해 값을 담는다
	var arrList = [];
	for (var i = 0; i < $("#tmpInfoLen").val(); i++) {
		if ($("#priority"+i).val() == step) {
			var obj = {
					order_num : $("#order_num"+i).val()
					, idx : i
			};
			arrList.push(obj);
		}
	}
	arrList.sort(function(a, b) {
		return a.order_num > b.order_num;
	});
	
	// 정렬시킨 데이터를 리스트에 표시
	if (step == "0") {
		var info = "";
		for (var i = 0; i < arrList.length; i++) {
			info = info
				+ "<li>"
		        + " <div class='ellipsis'>"
		        + "     <i class='fa " + ($("#send_type"+arrList[i].idx).val() == "buttons" ? "fa-hand-o-down" : "fa-file-text") + "'></i>"
		        + "		<input type='hidden' id='idx' value='" + arrList[i].idx + "'/>"
				+ "     <span class='name'>" + $("#subject"+arrList[i].idx).val() + "</span>"
		        + " </div>"
		        + " <button class='btn btn_close'><i class='fa fa-times'></i></button>"
		        + " <span class='handle'><i class='fa fa-bars'></i></span>"
		        + "</li>";
		}
		$("#sortable0").html(info);
	} else {
		var info = "";
		for (var i = 0; i < arrList.length; i++) {
			//console.log("pri:"+$("#priority"+i).val()+"   etc:"+$("#etc1"+i).val() + " ===> " + step + ":" + etc1);
			if ($("#etc2"+arrList[i].idx).val() == etc2) {
				var active = "";
				
				if (step == "1" && selectIdx != undefined) {
					if (arrList[i].idx == selectIdx) {
						active = "active";
					}
				}
				
				if (step == "2" && selectIdx2 != "") {
					if (arrList[i].idx == Number(selectIdx2)) {
						active = "active";
					}
				}
				
				info = info
					+ "<li class='ui-state-default " + active + "'>"
			        + "	<div class='ellipsis'>"
			        + "		<i class='fa " + ($("#send_type"+arrList[i].idx).val() == "buttons" ? "fa-hand-o-down" : "fa-file-text") + "'></i>"
			        + "		<input type='hidden' id='idx' value='" + arrList[i].idx + "'/>"
					+ "		<span class='name'>" + $("#subject"+arrList[i].idx).val() + "</span>"
			        + "	</div>"
			        + " <a href='#' class='btn btn_close'><i class='fa fa-times'></i></a>"
			        + "	<span class='handle'><i class='fa fa-bars'></i></span>"
			        + "</li>";
			}
		}
		
		$("#sortable"+step).html(info);
		
		phonePreView(step, etc2);
		
		$(".ui-sortable > li").off("click");
		$(".ui-sortable > li").one('click', function(){
	        if ( $(this).find('i').hasClass('fa-hand-o-down') ) {
	            var sibling = $(this).parent('.ui-sortable').find('li');
	            
	            var clickIdx = $(this).find('#idx').val();
	            var clickPidx = $("#pidx" + clickIdx).val();
	            var clickStep = $("#priority" + clickIdx).val();
	            var clickSubject = $("#subject" + clickIdx).val();
	            
	           	if ($(this).hasClass('active')) {
	           		$(this).removeClass('active');
	           		
	           		// 뒷쪽 스탭 지우기
	           		var nextStep = Number(clickStep) + 1;
	           		for (var i = nextStep; i <= 3; i++) {
	           			getListInfo(i, "");
	           		}
					
	           		if (clickStep == "1") {
	           			phonePreView(clickStep, "");
	           			
			           	selectIdx = "";
			           	selectIdx2 = "";
	           		} else if (clickStep == "2") {
	           			phonePreView(clickStep, clickSubject);
	           			
			           	selectIdx2 = "";
	           		}
	           	} else {
	           		$(sibling).removeClass('active');
	           		$(this).addClass('active');
	           		
	           		if (clickStep == "1") {
			           	selectIdx = clickIdx;
			           	
			            getListInfo("2", clickPidx);
			            getListInfo("3", "");
			            phonePreView("2", clickSubject);
	           		} else if (clickStep == "2") {
			           	selectIdx2 = clickIdx;
			           	
			            getListInfo("3", clickPidx);
	           		}
	           	}
	        }
	    });
	}
}

/**
 * 미리보기
 */
function phonePreView(step, etc1) {
	
	var swiper_final =
		"<div class='swiper-slide'>"
        + "	<ul>{0}</ul>"
		+ "</div>";
	var swiper_row = "";
	var swiper_num = 0;
	
	var rowDataNum = 0;
	var rowData = [];
	
	var len = $("#sortable"+step+" > li > div > span").length;
	for (var i = 0; i < len; i++) {
		var text = $("#sortable"+step+" > li > div > span").eq(i).text();
		swiper_num++;
		if (swiper_num <= 3) {
			swiper_row = swiper_row + "<li><div class='ellipsis'>"+text+"</div></li>";
        } else {
        	rowData[rowDataNum++] = String.format(swiper_final, swiper_row);
        	swiper_num = 1;
        	swiper_row = "<li><div class='ellipsis'>"+text+"</div></li>";
		}
	}
	
	if (swiper_row != undefined) {
		rowData[++rowDataNum] = String.format(swiper_final, swiper_row);
	}

	swiper.removeAllSlides();
	swiper.appendSlide(rowData);
}

/**
 * 리스트 컨트롤러 셋팅
 */
var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    // slidesPerColumn: 3,
    // slidesPerGroup: 1,
    paginationClickable: true,
    spaceBetween: 10
});

/**
 * 특정문자 찾아서 글자바꾸기
 */
String.format = function() {
    // The string containing the format items (e.g. "{0}")
    // will and always has to be the first argument.
    var theString = arguments[0];
    
    // start with the second argument (i = 1)
    for (var i = 1; i < arguments.length; i++) {
        // "gm" = RegEx options for Global search (more than one instance)
        // and for Multiline search
        var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        theString = theString.replace(regEx, arguments[i]);
    }
    
    return theString;
}
</script>
</body>
</html>