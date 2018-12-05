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
            <!-- /.sidebar -->
        </aside>

        <aside class="right-side">
	        <section class="content-header">
	                <h1>
	                    	시나리오 답변관리<br>
	                    <small>자동응답 답변을 등록/수정합니다.</small>
	                </h1>
	                <ol class="breadcrumb">
	                    <%@include file="./gnb/home.jsp" %>
	                    <li class="active">시나리오 답변관리</li>
	                </ol>
	            </section>
	
	            <!-- Main content -->
				<form action="callCenterScenarioList.tsis" method="post"  id="mainForm">
			      	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
			      	<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
		            <section class="content">
		                <div class="">
	                        <div class="row">
	                            <div class="col-xs-12 text-right">
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
	                                    <col style="width:200px;">
	                                    <col style="width:*;">
	                                    <col style="width:120px;">
	                                    <col style="width:120px;">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th scope="col">답변제목</th>
	                                        <th scope="col">답변 메시지</th>
	                                        <th scope="col">등록일</th>
	                                        <th scope="col">관리</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
		                                <c:choose>
	                                		<c:when test="${fn:length(tmpList) > 0 }">
	                                			<c:forEach var="st" items="${tmpList }" varStatus="status">
				                                    <tr>
				                                        <td><div class="ellipsis">${st.subject }</div></td>
				                                        <td class="text-left"><div class="ellipsis">${st.content }</div></td>
				                                        <td>${st.reg_date }</td>
				                                        <td>
				                                            <button type="button" class="btn btn-danger btnDelete btn-sm" data-pidx="${st.pidx }">삭제</button>
				                                            <a href="#" class="btn btn-info btnDetail btn-sm" data-pidx="${st.pidx }">수정</a>
				                                        </td>
				                                    </tr>
			                                    </c:forEach>
                                			</c:when>
	                                		<c:otherwise>
			                                    <tr>
			                                        <td colspan="4">내용이 없습니다.</td>
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
				
	        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->
   
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".btnDetail").on("click",function(){
    	var data = {
    			"pidx" : $(this).data("pidx")
    	};
    	movePage(data,"callCenterScenarioRegi.tsis");
    });
	
	$(".btnDelete").on("click",function(){
        if(confirm("삭제 하시겠습니까?")){
        	var data = {
        			"pidx" : $(this).data("pidx")
        	};
        	movePage(data,"callCenterScenarioDelete.tsis");
        }
    });
	
	$("#recordCount").on("change", function(){
    	$("#nowPage").val("1");
    	$("#mainForm").submit();
    });
	
	$(".goPage").on("click", function() {
		$("#nowPage").val($(this).data("page"));
		$("#mainForm").submit();
	});
    
});
</script>
</body>

</html>