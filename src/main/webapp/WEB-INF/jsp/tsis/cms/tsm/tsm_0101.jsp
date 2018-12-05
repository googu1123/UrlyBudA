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
                    메시지 규격관리<br>
                    <small>사용하는 메시지 규격을 확인할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                     <%@include file="./gnb/home.jsp" %>
                    <li class="active">메시지 규격관리</li>
                </ol>
            </section>

            <!-- Main content -->
            <form action="msgStandard.tsis" method="post"  id="mainForm">
            	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
            	<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
	            <section class="content">
	                <div class="search_form">
	                		<div class="dis_table">
		                        <dl class="dis_tr">
		                            <dt>발송코드</dt>
		                            <dd>
		                                <div class="form-inline">
		                                    <div class="form-group">
		                                        <input type="text" class="form-control" name="code" placeholder="검색어 입력" value="${code }" >
		                                        
		                                    </div>
		                                </div>
		                            </dd>
		                            <%-- <dt>관리자 ID</dt>
		                            <dd>
		                                <div class="form-inline">
		                                    <div class="form-group">
		                                        <input type="text" class="form-control" name="search_aidx" placeholder="검색어 입력" value="${search_aidx }">
		                                    </div>
		                                </div>
		                            </dd> --%>
		                            <dt>알림톡 승인여부</dt>
		                            <dd>
		                                <div class="form-inline">
		                                    <select class="form-control" id="use_yn" name="use_yn">
		                                    	<option value="All" <c:if test="${use_yn eq 'All' }">selected="selected"</c:if>>전체</option>
		                                        <option value="Y" <c:if test="${use_yn eq 'Y' }">selected="selected"</c:if>>승인</option>
		                                        <option value="N" <c:if test="${use_yn eq 'N' }">selected="selected"</c:if>>미승인</option>
		                                    </select>
		                                </div>
		                            </dd>
		                    	</dl>    
	                		</div>
	                		<div class="dis_table">
		                        <dl class="dis_ftr">
		                            <dt>제목</dt>
		                            <dd>
		                                <input type="text" class="form-control" name="subject" placeholder="검색어 입력" value="${subject }">
		                            </dd>
	                            </dl>
	                        </div>
	                        <div class="dis_table">
		                        <dl class="dis_ftr">
		                            <dt>내용</dt>
		                            <dd>
		                                <input type="text" class="form-control" name="content" placeholder="검색어 입력" value="${content }">
		                            </dd>
	                            </dl>
	                        </div>
	                        <div class="search_btn">
	                            <button type="button" id="btnSearch" class="btn btn-sm  btn-primary">검색</button>
	                        </div>
	                    
	                </div><!-- /.tbl_view -->
	                
	                <div class="list_bot">
	                        <div class="row">
	                            <div class="col-xs-6">
	                            	<c:if test="${sessionScope.admin_info.auth ne 'A' }">
	                                	<a href="msgStandardRegi.tsis" class="btn btn-sm  btn-success">등록</a>
	                                </c:if>
	                                <button type="button" id="btnDelete" class="btn btn-sm  btn-danger">삭제</button>
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
	                            </div>
	                        </div><!-- /.row -->
	
	                        <div class="table-responsive mart10">
	                            <table class="table tbl_list tbl_fixed">
	                            	<colgroup>
	                                   <col style="width:35px;">
	                                    <col style="width:80px;">
	                                    <col style="width:80px;">
	                                    <col style="width:*;">
	                                    <col style="width:80px;">
	                                    <col style="width:80px;">
	                                    <col style="width:70px;">
	                                    <col style="width:70px;">
	                                    <col style="width:70px;">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th scope="col"><input type="checkbox" id="chkAll" class="ichk"></th>
	                                        <th scope="col">코드명</th>
	                                        <th scope="col">제목</th>
	                                        <th scope="col">내용</th>
	                                        <th scope="col">부서</th>
	                                        <th scope="col">갱신일</th>
	                                        <th scope="col">진행현황</th>
	                                        <th scope="col">알림톡사용</th>
	                                        <th scope="col">상세</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="stList">
	                                	<c:choose>
	                                		<c:when test="${fn:length(standList) > 0 }">
	                                			<c:forEach var="st" items="${standList }" varStatus="status">
	                                				<tr data-code="${st.code }" data-pidx="${st.pidx }">
				                                        <td><input type="checkbox" class="ichk chk_code"></td>
				                                        <td>${st.code }</td>
				                                        <%-- <td>${st.aidx }</td> --%>
				                                        <td>
				                                            <div class="ellipsis">${st.subject }</div>
				                                        </td>
				                                        <td>
				                                            <div class="ellipsis">${st.content }</div>
				                                        </td>
				                                        <td>
				                                        	${st.div_nm }
				                                        </td>
				                                        <td>${st.reg_date }</td>
				                                        <td>
				                                        	<c:if test="${st.process eq 'A' }">등록요청</c:if>
				                                        	<c:if test="${st.process eq 'B' }">등록완료</c:if>
				                                        	<c:if test="${st.process eq 'C' }">승인요청</c:if>
				                                        	<c:if test="${st.process eq 'S' }">최종승인</c:if>
				                                        	<c:if test="${st.process eq 'N' }">미승인</c:if>
				                                        </td>
				                                        <td>
				                                        	<c:if test="${st.use_yn eq 'Y' }">사용</c:if>
				                                        	<c:if test="${st.use_yn eq 'N' }">미사용</c:if>
				                                        	<c:if test="${st.use_yn eq 'X' }">발송차단</c:if>
				                                        </td>
				                                        <td>
				                                            <a href="#" class="btn btn-info btnDetail btn-sm" data-code="${st.code }" data-pidx="${st.pidx }">보기</a>
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
	                        </div><!-- /.table-responsive -->
	                        
	                        <div class="text-center paging">
	                        	<p class="txt_count text-orange"><b>등록된 규격 : ${totalCount }</b></p>
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
<script>
$(document).ready(function(){
    iCheckAll();
    
    
    $("#btnDelete").on("click", function(){
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
    	
    });
    
    $(".search_form input").on("keydown", function(e){
    	if(event.keyCode ==13){
    		$('#btnSearch').click()
    	}
    });
    
    $("#btnSearch").on("click",function(){
    	$("#nowPage").val("1");
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
    			"code" :$(this).data("code"),
    			"pidx" : $(this).data("pidx")
    	};
    	movePage(data,"msgStandardDetail.tsis");
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
    });
}
</script>
</body>
</html>