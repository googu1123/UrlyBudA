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
    <%-- <header class="header">
        <%@include file="./gnb/header.jsp" %>
    </header> --%>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <%-- <aside class="left-side sidebar-offcanvas">                
             <%@include file="./gnb/gnb_left.jsp" %>
            <!-- /.sidebar -->
        </aside> --%>

        <aside class="right-side">                
            <%-- <section class="content-header">
                <h1>
                    이력 현황2<br>
                    <small>보낸 메시지 현황을 확인할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">이력 현황2</li>
                </ol>
            </section> --%>

            <!-- Main content -->
            <form action="msgHistory.tsis" method="post" id="mainForm">
            	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
            	<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
	            <section class="content">
	                <div class="search_form">
	                	<%-- <div class="dis_table">
	                        <dl class="dis_tr">
	                            <dt>발송타입</dt>
	                            <dd>
	                                <div class="form-inline">
	                                    <select class="form-control" id="mtype" name="mtype">
	                                        <option value="All" <c:if test="${search.mtype  eq 'All' }">selected="selected"</c:if>>전체</option>
	                                        <option value="N" <c:if test="${search.mtype  eq 'N' }">selected="selected"</c:if>>NMS</option>
	                                        <option value="A" <c:if test="${search.mtype  eq 'A' }">selected="selected"</c:if>>알림톡</option>
	                                        <option value="S" <c:if test="${search.mtype  eq 'S' }">selected="selected"</c:if>>SMS</option>
	                                        <option value="L" <c:if test="${search.mtype  eq 'L' }">selected="selected"</c:if>>LMS</option>
	                                    </select>
	                                </div>
	                            </dd>
	                            <dt>결과</dt>
	                            <dd>
	                                <div class="form-inline">
	                                    <select class="form-control" id="result_value" name="result_value">
	                                        <option value="All" <c:if test="${search.result_value  eq 'All' }">selected="selected"</c:if>>전체</option>
	                                        <option value="S" <c:if test="${search.result_value  eq 'S' }">selected="selected"</c:if>>성공</option>
	                                        <option value="F" <c:if test="${search.result_value  eq 'F' }">selected="selected"</c:if>>실패</option>
	                                    </select>
	                                </div>
	                            </dd>
	                        </dl>
						</div> 
						<div class="dis_table">
							<dl class="dis_tr">
	                            <dt>발송코드</dt>
	                            <dd>
	                                <div class="form-inline">
	                                    <div class="form-group">
	                                        <input type="text" class="form-control" name="code" placeholder="검색어 입력" value="${search.code }">
	                                    </div>
	                                </div>
	                            </dd>
	                            <dt>발송내용</dt>
	                            <dd>
	                                <div class="form-inline">
	                                    <div class="form-group">
	                                        <input type="text" class="form-control" placeholder="검색어 입력" name="message" id="message" value="${search.message }">
	                                    </div>
	                                </div>
	                            </dd>
	                        </dl>
						</div>--%>
	                     <div class="dis_table">
	                        <dl class="dis_ftr">
	                            <dt>발송번호</dt>
	                            <dd>
	                                <div class="form-inline">
	                                    <select class="form-control" id="send_type" name="send_type">
	                                        <option value="All" >전체</option>
	                                        <option value="R" <c:if test="${search.send_type  eq 'R' }">selected="selected"</c:if>>수신번호</option>
	                                        <option value="S" <c:if test="${search.send_type  eq 'S' }">selected="selected"</c:if>>발신번호</option>
	                                    </select>
	                                    <div class="form-group">
	                                        <input type="tel" class="form-control" id="phone_num" placeholder="검색어 입력" name="search_num" value="${search.search_num }">
	                                    </div>
	                                    <span class="txt_help">'-' 없이 입력</span>
	                                    <button type="button" class="btn btn-sm  btn-primary" id="btnSearch">검색</button>
	                                </div>
	                            </dd>
	                        </dl>
						</div> 
                       <div class="dis_table">
	                        <dl class="dis_ftr">
	                            <dt>발송일</dt>
	                            <dd>
	                                <div class="form-inline">
	                                    <%-- <div class="form-group">
	                                        <input type="text" class="form-control input_datebox" id="date_start" name="start_date" value="${search.start_date }">
	                                    </div>
	                                    ~
	                                    <div class="form-group">
	                                        <input type="text" class="form-control input_datebox" id="date_end" name="last_date" value="${search.last_date }">
	                                    </div> --%>
	                                    <input type="hidden"  id="date_start" name="start_date" value="${search.start_date }">
	                                    <input type="hidden"  id="date_end" name="last_date" value="${search.last_date }">
	                                    <%-- <input type="hidden" class="form-control" id="phone_num" placeholder="검색어 입력" name="search_num" value="${search.search_num }"> --%>
	                                    <button type="button" class="btn btn-sm  btn-primary" id="btnTwoMonth"></button>
	                                    <button type="button" class="btn btn-sm  btn-primary" id="btnLastMonth"></button>
	                                    <button type="button" class="btn btn-sm  btn-primary" id="btnThisMonth"></button>
	                                </div>
	                            </dd>
	                        </dl>
	                        <!-- <div class="search_btn">
	                            <button type="button" class="btn btn-sm  btn-primary" id="btnSearch">검색</button>
	                        </div> -->
						</div>
	                        
	                </div><!-- /.tbl_view -->
	                
	                <div class="list_bot">
	                        <div class="row">
	                            <%-- <div class="col-xs-6">
	                            	<c:if test="${sessionScope.admin_info.auth  eq 'M' || sessionScope.admin_info.auth  eq 'A'}">
	                            	<c:if test="${sessionScope.admin_info.auth  eq 'M'}">
	                            		<a href="#" class="btn btn-sm  btn-success" id="btnExcel"><i class="fa fa-file-excel-o"></i> XLS 다운로드</a>
	                            	</c:if>	                                
	                            </div>
	                            <div class="col-xs-6 text-right">
	                                <div class="form-inline">
	                                    <select class="form-control" id="recordCount" name="recordCount">
	                                        <option value="5" <c:if test="${recordCount eq '5'}">selected</c:if>>5줄 보기</option>
											<option value="10" <c:if test="${recordCount eq '10'}">selected</c:if>>10줄 보기</option>
											<option value="20" <c:if test="${recordCount eq '20'}">selected</c:if>>20줄 보기</option>
											<option value="30" <c:if test="${recordCount eq '30'}">selected</c:if>>30줄 보기</option>
											<option value="40" <c:if test="${recordCount eq '40'}">selected</c:if>>40줄 보기</option>
											<option value="50" <c:if test="${recordCount eq '50'}">selected</c:if>>50줄 보기</option>
	                                    </select>
	                                </div>
	                            </div> --%>
	                        </div><!-- /.row -->
	
	                        <div class="table-responsive mart10">
	                            <table class="table tbl_list tbl_fixed">
	                            	<colgroup>
	                                    <%-- <col style="width:10%;">
	                                    <col style="width:10%;">
	                                    <col style="width:*;">
	                                    <col style="width:10%;">
	                                    <col style="width:10%;">
	                                    <col style="width:15%;">
	                                    <col style="width:10%;">
	                                    <col style="width:10%;"> --%>
	                                    <%-- <col style="width:75px;"> --%>
	                                    <col style="width:75px;">
	                                    <col style="width:*;">
	                                    <col style="width:110px;">
	                                    <col style="width:50px;">
	                                    <col style="width:70px;">
	                                    <col style="width:80px;">
	                                    <col style="width:80px;">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <!-- <th scope="col">번호</th> -->
	                                        <th scope="col">발송타입</th>
	                                        <th scope="col">내용</th>
	                                        <th scope="col">수신번호</th>
	                                        <th scope="col">결과</th>
	                                        <th scope="col">세부결과</th>
	                                        <th scope="col">발송일</th>
	                                        <th scope="col">수신일</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:choose>
	                                		<c:when test="${fn:length(hist) > 0 }">
	                                			<c:forEach var="hi" items="${hist }" varStatus="status">
	                                				<tr>
				                                        <%-- <td>${hi.pidx }</td> --%>
				                                        <td>
				                                        	<c:if test="${hi.mtype eq 'A' }">알림톡</c:if>
				                                        	<c:if test="${hi.mtype eq 'N' }">NMS</c:if>
				                                        	<c:if test="${hi.mtype eq 'S'}">SMS</c:if>
				                                        	<c:if test="${hi.mtype eq 'L'}">LMS</c:if>
				                                        	<c:if test="${hi.mtype eq 'D'}">미등록문구</c:if>
				                                        </td>
				                                        <td>
				                                            <div class="text-left">${hi.message }</div>
				                                        </td>
				                                        <td>${fn:substring(hi.receive_num, 0, 7) }****</td>
				                                        <td>
				                                        	<c:choose>
				                                        		<c:when test="${hi.req_result eq '1000' || hi.req_result eq '6600' || hi.req_result eq '4100' }">
				                                        			성공
				                                        		</c:when>
				                                        		<c:otherwise>
				                                        			실패
				                                        		</c:otherwise>
				                                        	</c:choose>
			                                        	</td>
			                                        	<td>
			                                        		${hi.description }
			                                        	</td>
			                                        	<td>
				                                        	<c:if test="${hi.req_date eq null || hi.req_date eq ''}">
				                                        		- 
				                                        	</c:if>
				                                        	<c:if test="${hi.req_date ne null && hi.req_date ne ''}">
				                                        		${hi.req_date }
				                                        	</c:if>
			                                        	</td>
				                                        <td>${hi.report_date }</td>
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
	                        </div><!-- /.table-responsive -->
	                        
	                        <div class="text-center paging">
	                        	<p class="txt_count text-orange" style="text-align: right;"><b>이력 건수 : ${totalCount }</b></p>
	                            <ul class="pagination pagination-sm">
	                                <c:choose>	
										<c:when test="${nowPage == 1}"><li class="disabled"><a href="#">«</a></li></c:when>
										<c:otherwise><li><a href="#" class="goPage" data-page="${prePage}">«</a></li></c:otherwise>
									</c:choose>
										<c:forEach var="plist" items="${pageList}" varStatus="status">
											<c:choose>	
												<c:when test="${nowPage == plist}">
													<li class="active"><a href="#"><c:out value="${plist}"/></a></li>
												</c:when>
												<c:otherwise>
													<li><a href="#" class="goPage" data-page="<c:out value="${plist}"/>"><c:out value="${plist}"/></a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									<c:choose>	
										<c:when test="${nowPage == totalPage}"><li class="disabled"><a href="#">»</a></li></c:when>
										<c:otherwise><li><a href="#" class="goPage" data-page="${nextPage}">»</a></li></c:otherwise>
									</c:choose>
	                            </ul>
	                        </div>
                	</div>
            	</section><!-- /.content -->
           	 </form>	
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/zebra_datepicker.js"></script>
<script src="js/common.js"></script>
<script>

function setDate(month){
	
	var tempDate = new Date();
	var tYear = tempDate.getFullYear();
	var day;
	if(month == "2"){
		day  = "29";
	}else if(month =="1" || month == "3" || month =="5" || month == "7" | month =="8" | month == "10" | month == "12"){
		day = "31";
	}else{
		day = "30";
	}
	
	$("#date_start").val(tYear + "-"+ fillZeros(month,2) + "-01");
	$("#date_end").val(tYear + "-"+ fillZeros(month,2) + "-"+ day);
}

function fillZeros(n, digits) {  
    var zero = '';  
    n = n.toString();  

    if (n.length < digits) {  
        for (var i = 0; i < digits - n.length; i++)  
            zero += '0';  
    }  
    return zero + n;  
} 

$(document).ready(function(){
	
	var tDate = new Date();
	var thisMonth = tDate.getMonth()+1;
	var lastMonth = thisMonth -1;
	var twoMonth = lastMonth -1;
	
	$("#btnTwoMonth").html(twoMonth+"월");
	$("#btnLastMonth").html(lastMonth+"월");
	$("#btnThisMonth").html(thisMonth+"월");
	
	$("#btnTwoMonth").on("click", function(){
		setDate(twoMonth);
		$("#mainForm").attr({"action":"msgHistoryByPhone.tsis"}).submit();
	});
	
	$("#btnLastMonth").on("click", function(){
		setDate(lastMonth);
		$("#mainForm").attr({"action":"msgHistoryByPhone.tsis"}).submit();
	});
		
	$("#btnThisMonth").on("click", function(){
		setDate(thisMonth);
		$("#mainForm").attr({"action":"msgHistoryByPhone.tsis"}).submit();
	});

	
	
	$("#btnExcel").on("click",function(){
		$("#mainForm").attr({"action":"msgHistoryDown.tsis"}).submit();
	});
	
	
	$(".search_form input").on("keydown", function(e){
    	if(event.keyCode ==13){
    		$('#btnSearch').click()
    	}
    });
	
	$("#btnSearch").on("click",function(){
    	$("#nowPage").val("1");
    	
    	/* alert($("#date_start").val());
    	 alert($("#date_end").val());
    	 */
    	 
    	 
    	 
    	if($("#phone_num").val() == ""){
    		alert("발송번호를 반드시 입력해야 합니다.");
    		return;
    	}
    	
    	if($("#phone_num").val().length < 10){
    		alert("발송번호는 반드시 10자리 이상 입력해야 합니다.");
    		return;
    	}
    	 
   		var endDate = new Date($("#date_end").val());
       	var preDate = new Date();
       	var startDate = new Date($("#date_start").val());
       	
       	preDate.setMonth(endDate.getMonth()-3);
       	preDate.setDate(1);
       	
       	if(startDate.getMonth() < preDate.getMonth()){
       		alert("3개월 이상 조회는 불가능 합니다.");
       		return;
       	}else{
       		$("#mainForm").attr({"action":"msgHistoryByPhone.tsis"}).submit();
       	}
    	
    });
    
    $(".goPage").on("click", function() {
		$("#nowPage").val($(this).data("page"));
		$("#mainForm").attr({"action":"msgHistoryByPhone.tsis?search_num="+ $("#phone_num").val()}).submit();
	});
    
    $("#recordCount").on("change", function(){
    	$("#nowPage").val("1");
    	$("#mainForm").attr({"action":"msgHistoryByPhone.tsis?search_num="+ $("#phone_num").val()}).submit();
    });
    
    $(".btnDetail").on("click",function(){
    	var data = {
   			"pidx" : $(this).data("pidx"),
   			"start_date" : $("#date_start").val()
    	};
    	
    	movePage(data,"msgHistoryDetail.tsis");
    });
	
	
    //DatePicker
    $("#date_start").Zebra_DatePicker({
        first_day_of_week: 0,
        direction: false,
        pair: $("#date_end")
    });
    $("#date_end").Zebra_DatePicker({
        first_day_of_week: 0,
        direction: true
    });
    
});

</script>
</body>
</html>