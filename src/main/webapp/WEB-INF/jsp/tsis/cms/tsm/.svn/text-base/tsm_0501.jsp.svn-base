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
                    문의내역 관리<br>
                    <small>자동응답에 등록된 고객 문의사항을 확인하고 답변합니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">문의내역 관리</li>
                </ol>
            </section>

            <!-- Main content -->
			<form action="callCenterHelpList.tsis" method="post"  id="mainForm">
		      	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
		      	<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
            	<input type="hidden" name="send_type" id="send_type" value="${send_type}"/>
           		<section class="content">
               		<div class="">
                        <div class="row">
                            <div class="col-xs-8">
                                <ul class="sort_list">
                                    <li><a href="#" class="btn" id="ALL">전체</a></li>
                                    <li><a href="#" class="btn" id="STR">신규</a></li>
                                    <li><a href="#" class="btn" id="ING">답변중</a></li>
                                    <li><a href="#" class="btn" id="END">완료</a></li>
                                </ul>
                            </div>
                            <div class="col-xs-4 text-right">
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
                            </div>
                        </div><!-- /.row -->

                        <div class="table-responsive mart10">
                            <table class="table tbl_list tbl_fixed">
                                <colgroup>
                                    <col style="width:150px;">
                                    <col style="width:*;">
                                    <col style="width:150px;">
                                    <col style="width:100px;">
                                    <col style="width:90px;">
                                    <col style="width:90px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">고객ID</th>
                                        <th scope="col">내용</th>
                                        <th scope="col">등록일시</th>
                                        <th scope="col">담당자</th>
                                        <th scope="col">상태</th>
                                        <th scope="col">상세</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:choose>
                                		<c:when test="${fn:length(tmpList) > 0 }">
                                			<c:forEach var="st" items="${tmpList }" varStatus="status">
	                                			<tr>
			                                        <td>${st.cust_id }</td>
			                                        <td class="ellipsis">${st.content }</td>
			                                        <td>${st.reg_date }</td>
			                                        <td>${st.aidx }</td>
			                                        <td>
			                                        	<c:if test="${st.status eq 'STR' }">신규</c:if>
			                                        	<c:if test="${st.status eq 'ING' }">답변중</c:if>
			                                        	<c:if test="${st.status eq 'END' }">완료</c:if>
			                                        </td>
			                                        <td>
			                                            <a href="#" class="btn btn-info btnDetail btn-sm" data-pidx="${st.pidx }">보기</a>
			                                        </td>
			                                    </tr>
		                                    </c:forEach>
                                		</c:when>
                                		<c:otherwise>
		                                    <tr>
		                                        <td colspan="6">내용이 없습니다.</td>
		                                    </tr>	                                			                                		
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->
                        
                        <div class="paging text-center">
                            <!--<p class="txt_count text-orange"><b>검색 건 : 12</b></p>-->
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
<script src="js/zebra_datepicker.js"></script>
<script src="js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var send_type = $("#send_type").val();
	if (send_type == null || send_type == "") {
		send_type = "ALL";
	}
	$("#" + send_type).addClass('active');
	
	$('.sort_list .btn').on('click', function(){
        $('.sort_list .btn').removeClass('active');
        $(this).addClass('active');
        
        var id_name = $(this).context.id;
        $("#send_type").val(id_name);

		$("#mainForm").submit();
    });
	
	$(".goPage").on("click", function() {
		$("#nowPage").val($(this).data("page"));
		$("#mainForm").submit();
	});
    
    $("#recordCount").on("change", function(){
    	$("#nowPage").val("1");
    	$("#mainForm").submit();
    });
    
    $(".btnDetail").on("click",function(){
    	var data = {
   			"pidx" : $(this).data("pidx")
   			, "nowPage" : $("#nowPage").val()
   			, "send_type" : $("#send_type").val()
   			, "recordCount" : $("#recordCount").val()
    	};
    	movePage(data,"callCenterHelpDetail.tsis");
    });
});
</script>
</body>

</html>