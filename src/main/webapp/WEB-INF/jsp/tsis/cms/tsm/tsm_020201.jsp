<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <!-- datepicker -->
    <link rel="stylesheet" href="css/zebra_datepicker_metallic.css">
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
                    기간별 통계 상세보기<br>
                    <small>선택한 기간별 발송 건 수를 확인하실 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">기간별 통계</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="msgDaysChartDetail.tsis" method="post" id="mainForm">
                    	<dl>
                            <dt>조회 기간</dt>
                            <dd>
                                <div class="form-inline">
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-sm  btn-info btn-sm <c:if test="${day_type eq 'D' }">active</c:if>" id="btnDay">	
                                            <input type="radio" name="options" autocomplete="off" checked="checked" > 일간
                                        </label>
                                        <label class="btn btn-sm  btn-info btn-sm <c:if test="${day_type eq 'M' }">active</c:if>" id="btnMonth">
                                            <input type="radio" name="options" autocomplete="off" > 월간
                                        </label>
                                        <input type="hidden" id="day_type" name="day_type" value="${day_type }"/>
                                    </div> 
                                    <div class="form-group">
                                        <input type="text" class="form-control input_datebox" id="date_start" name="start_date" value="${start_date }">
                                    </div>
                                    ~
                                    <div class="form-group">
                                        <input type="text" class="form-control input_datebox" id="date_end" name="last_date" value="${last_date }">
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>조회 문구코드</dt>
                            <dd>
                                <div class="form-inline">
                                	 <div class="form-group">
                                    	<input type="text" class="form-control" placeholder="검색어 입력" name="code" id="code" value="${code }">
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <div class="search_btn">
                            <button type="button" id="btnSearch" class="btn btn-sm  btn-primary btn_long">검색</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->
                
                <div class="list_bot">
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-xs-6">
                            	<c:if test="${sessionScope.admin_info.auth eq 'M' || sessionScope.admin_info.auth eq 'A' }">
                                	<a href="#" class="btn btn-sm  btn-success" id="btnExcel"><i class="fa fa-file-excel-o"></i> XLS 다운로드</a>
                                </c:if>
                            </div>
                            <div class="col-xs-6 text-right">
                        		<p class="padt5 text-orange"><b>검색된 문구 수 : ${totalSize }</b></p>
                            </div>
                        </div><!-- /.row -->

                        <table class="table tbl_list mart10">
                            <thead>
                                <tr>
                                    <th scope="col" rowspan="2" class="valign_mid">문구코드</th>
                                    <th scope="col" colspan="2">NMS</th>
                                    <th scope="col" colspan="2">알림톡</th>
                                    <th scope="col" colspan="2">SMS</th>
                                    <th scope="col" colspan="2">LMS</th>
                                </tr>
                                <tr>
                                    <th scope="col">성공건수<br>&nbsp;</th>
                                    <th scope="col">전체건수<br>(성공율)</th>
                                    <th scope="col">성공건수<br>&nbsp;</th>
                                    <th scope="col">전체건수<br>(성공율)</th>
                                    <th scope="col">성공건수<br>&nbsp;</th>
                                    <th scope="col">전체건수<br>(성공율)</th>
                                    <th scope="col">성공건수<br>&nbsp;</th>
                                    <th scope="col">전체건수<br>(성공율)</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${fn:length(chart) > 0 }">
                            			<c:forEach var="ch" items="${chart }" varStatus="status">
                            				<tr>
			                                    <td>
			                                    	<c:if test="${sessionScope.admin_info.auth eq 'M' || sessionScope.admin_info.auth eq 'A' || sessionScope.admin_info.auth eq 'W' }">
			                                    		<a href="#" class="detail" data-code="${ch.code }">${ch.code }</a>
			                                    	</c:if>
			                                    	<c:if test="${sessionScope.admin_info.auth eq 'H'}">
			                                    		${ch.code }
			                                    	</c:if>
			                                    </td>
			                                    <td>
			                                    	<fmt:formatNumber value="${ch.n_succ }" groupingUsed="true"/>
			                                    </td>
			                                    <td>
			                                    	<c:if test="${(ch.n_succ+ch.n_fail) eq 0 }">0 (0%)</c:if>
			                                    	<c:if test="${(ch.n_succ+ch.n_fail) ne 0 }">
			                                    		<fmt:formatNumber value="${ch.n_succ+ch.n_fail }" groupingUsed="true"/> (<fmt:formatNumber value="${(ch.n_succ/(ch.n_succ+ch.n_fail))*100 }" type="number" pattern="0"/>%)
			                                    	</c:if>
			                                    </td>
			                                    <td>
			                                    	<fmt:formatNumber value="${ch.a_succ }" groupingUsed="true"/>
			                                    </td>
			                                    <td>
			                                    	<c:if test="${(ch.a_succ+ch.a_fail) eq 0 }">0 (0%)</c:if>
			                                    	<c:if test="${(ch.a_succ+ch.a_fail) ne 0 }">
			                                    		<fmt:formatNumber value="${ch.a_succ+ch.a_fail }" groupingUsed="true"/> (<fmt:formatNumber value="${(ch.a_succ/(ch.a_succ+ch.a_fail))*100 }" type="number" pattern="0"/>%)
			                                    	</c:if>			                                    	
			                                    </td>
			                                    <td>
			                                    	<fmt:formatNumber value="${ch.s_succ }" groupingUsed="true"/>
		                                    	</td>
			                                    <td>
			                                    	<c:if test="${(ch.s_succ+ch.s_fail) eq 0 }">0 (0%)</c:if>
			                                    	<c:if test="${(ch.s_succ+ch.s_fail) ne 0 }">
			                                    		<fmt:formatNumber value="${ch.s_succ+ch.s_fail }" groupingUsed="true"/> (<fmt:formatNumber value="${(ch.s_succ/(ch.s_succ+ch.s_fail))*100 }" type="number" pattern="0"/>%)
			                                    	</c:if>
			                                    </td>
			                                    <td>
			                                    	<fmt:formatNumber value="${ch.l_succ }" groupingUsed="true"/>
		                                    	</td>
			                                    <td>
			                                    	<c:if test="${(ch.l_succ+ch.l_fail) eq 0 }">0 (0%)</c:if>
			                                    	<c:if test="${(ch.l_succ+ch.l_fail) ne 0 }">
			                                    		<fmt:formatNumber value="${ch.l_succ+ch.l_fail }" groupingUsed="true"/> (<fmt:formatNumber value="${(ch.l_succ/(ch.l_succ+ch.l_fail))*100 }" type="number" pattern="0"/>%)
			                                    	</c:if>
			                                    </td>
			                                </tr>
                            			</c:forEach>
                            		</c:when>
                            		<c:otherwise>
										<tr>
		                                    <td colspan="9">내용이 없습니다.</td>
		                                </tr>                            		
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>

                    </form>
                </div><!-- //list_bot -->
	
				<div class="search_btn">
					<button type="button" id="btnCancel" class="btn btn-sm  btn-default">목록</button>
               </div>
                    
            </section><!-- /.content -->
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/zebra_datepicker.js"></script>
<script src="js/common.js"></script>
<script>
$(document).ready(function(){
	
	$("#btnExcel").on("click",function(){
		$("#mainForm").attr({"action":"msgChartDetailDown.tsis"}).submit();
	});
	
	$("#btnSearch").on("click",function(){
		$("#mainForm").submit();
	});
	
	$(".detail").on("click",function(){
		movePage({
			"start_date":$("#date_start").val()
			, "last_date":$("#date_end").val()
			, "code" : $(this).data("code")},"msgHistory.tsis");
	});
	
	$("#btnCancel").on("click", function(){
		movePage({
			"start_date":$("#date_start").val()
			, "last_date":$("#date_end").val()
			, "day_type" : $("#day_type").val()},"msgDaysChart.tsis");
	});
	
	if($("#day_type").val()=="M"){
	 	$("#date_start").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: false,
	        pair: $("#date_end"),
	        format: 'Y-m',
	        onChange: function(view, elements) {
	        	console.log(view , elements);
	        }, 
	        onSelect :function(){
	        	$(this).val($(this).val()+"-01");
	        }
	    });
		
		 $("#date_end").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: true,
	        format: 'Y-m',
	        onSelect : function(view, elements) {
	        	var m = $(this).val().split("-")[1];
	        	if(m == "02"){
	        		$(this).val($(this).val()+"-29");
	        	} else if(m == "01" || m == "03" || m == "05" || m == "07" || m == "08" ||
	        			m == "10" || m == "12"){
	        		$(this).val($(this).val()+"-31");
	        	} else {
	        		$(this).val($(this).val()+"-30");
	        	}
	        }
	    });
	} else {
		 $("#date_start").Zebra_DatePicker({
		        first_day_of_week: 0,
		        direction: false,
		        pair: $("#date_end"),
		        format: 'Y-m-d',
		        onChange: function(view, elements) {
		        	console.log(view , elements);
		        }
		    });
			
			 $("#date_end").Zebra_DatePicker({
		        first_day_of_week: 0,
		        direction: true,
		        format: 'Y-m-d',
		        onChange: function(view, elements) {
		        	console.log(view , elements);
		        }
		    });
	}	
	
	$("#btnMonth").on("click",function(){
		$("#day_type").val("M");
		//DatePicker
		var start = $('#date_start').data('Zebra_DatePicker');
	    start.destroy();
	    $("#date_start").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: false,
	        pair: $("#date_end"),
	        format: 'Y-m',
	        view : "months",
	        onChange: function(view, elements) {
	        	console.log(view , elements);
	        }, 
	        onSelect :function(){
	        	$(this).val($(this).val()+"-01");
	        }
	    });
		
		var end = $('#date_end').data('Zebra_DatePicker');
	    end.destroy();
	    $("#date_end").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: true,
	        format: 'Y-m',
	        view : "months",
	        onChange: function(view, elements) {
	        	console.log(view , elements);
	        }, 
	        onSelect :function(){
	        	var m = $(this).val().split("-")[1];
	        	if(m == "02"){
	        		$(this).val($(this).val()+"-29");
	        	} else if(m == "01" || m == "03" || m == "05" || m == "07" || m == "08" ||
	        			m == "10" || m == "12"){
	        		$(this).val($(this).val()+"-31");
	        	} else {
	        		$(this).val($(this).val()+"-30");
	        	}
	        }
	    }); 
	});
	
	$("#btnDay").on("click",function(){
		$("#day_type").val("D");
		var start = $('#date_start').data('Zebra_DatePicker');
	    start.destroy();
	    var end = $('#date_end').data('Zebra_DatePicker');
	    end.destroy();
		//DatePicker
		$("#date_start").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: false,
	        pair: $("#date_end"),
	        format: 'Y-m-d',
	        view : "days",
	        onChange: function(view, elements) {
	        	console.log(view , elements);
	        }
	    });
		
		$("#date_end").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: true,
	        format: 'Y-m-d',
	        view : "days",
	        onChange: function(view, elements) {
	        	console.log(view , elements);
	        }
	    });
	});
    
});

</script>
</body>
</html>