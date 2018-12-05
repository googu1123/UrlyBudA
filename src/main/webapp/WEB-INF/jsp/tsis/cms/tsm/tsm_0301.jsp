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
                    관리자 현황<br>
                    <small>부서 별 관리자 현황을 확인 할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">관리자 현황</li>
                </ol>
            </section>

            <!-- Main content -->
             <form action="#" method="post" id="mainForm">
	           	<section class="content">
		           	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
	            	<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
	                <div class="search_form">
	                	<div class="dis_table">
	                        <dl class="dis_tr">
	                            <dt>사용자 ID</dt>
	                            <dd>
	                                <input type="text" class="form-control" name="search_aidx" value="${search_aidx }" placeholder="검색어 입력">
	                            </dd>
	                            <dt>사용자 명</dt>
	                            <dd>
									<input type="text" class="form-control" name="search_name" value="${search_name }" placeholder="검색어 입력">
	                            </dd>
	                        </dl>
	                	</div>
                        <div class="search_btn">
                            <button type="button" class="btn btn-sm  btn-primary" id="btnSearch">검색</button>
                        </div>
	                </div><!-- /.tbl_view -->
                
                <div class="list_bot">
                        <div class="row">
                            <div class="col-xs-6">
                            	<c:if test="${sessionScope.admin_info.auth eq 'M' }">
	                                <a href="agentRegister.tsis" class="btn btn-sm  btn-success">신규등록</a>                                
	                                <button type="button" class="btn btn-sm  btn-danger" id="btnDelete">삭제</button>
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
                            </div>
                        </div><!-- /.row -->

                        <div class="table-responsive mart10">
                            <table class="table tbl_list tbl_fixed">
                                <thead>
                                    <tr>
                                        <th scope="col"><input type="checkbox" id="chkAll" class="ichk"></th>
                                        <th scope="col">번호</th>
                                        <th scope="col">사용자 ID</th>
                                        <th scope="col">관리자 명</th>
                                        <th scope="col">휴대전화번호</th>
                                        <th scope="col">등록일</th>
                                        <th scope="col">상세</th>
                                    </tr>
                                </thead>
                                <tbody id="stList">
                                	<c:choose>
	                                	<c:when test="${fn:length(adminList) > 0 }">
	                                		<c:forEach var="ad" items="${adminList }" varStatus="status">
			                                    <tr data-aidx="${ad.aidx }">
			                                        <td><input type="checkbox" class="ichk"></td>
			                                        <td>${ad.idx }</td>
			                                        <td>${ad.aidx }</td>
			                                        <td>${ad.name }</td>
			                                        <td>${ad.phone }</td>
			                                        <td>${ad.reg_date }</td>
			                                        <td>
			                                            <a href="#" class="btn btn-info detail btn-sm" data-aidx="${ad.aidx }">보기</a>
			                                        </td>
			                                    </tr>
	                                		</c:forEach>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<tr>
		                                        <td colspan="7">내용이 없습니다.</td>
		                                    </tr>
	                                	</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->
                        
                        <div class="text-center paging">
                        	<p class="txt_count text-orange"><b>사용자 수 : ${totalCount }</b></p>
	                            <ul class="pagination pagination-sm">
	                                <!-- <li class="disabled"><a href="#">«</a></li>
	                                <li class="active"><a href="#">1</a></li>
	                                <li><a href="#">2</a></li>
	                                <li><a href="#">3</a></li>
	                                <li><a href="#">4</a></li>
	                                <li><a href="#">5</a></li>
	                                <li><a href="#">»</a></li> -->
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
    
    $(".search_form input").on("keydown", function(e){
    	if(event.keyCode ==13){
    		$('#btnSearch').click()
    	}
    });
    
    $("#btnDelete").on("click", function(){
    	var $del = $("#stList").find(".icheckbox_minimal.checked");
    	var len = $del.length;
    	
    	if(len == 0 ){
    		alert("선택하신 항목이 없습니다.");
    		return false;
    	}
    	
    	var aidxs = "";
    	for(var i = 0 ; i < len; i++){
    		if(i == (len-1)){
    			aidxs += $del.parents("tr").eq(i).data("aidx");
    		} else {
    			aidxs += $del.parents("tr").eq(i).data("aidx")+",";
    		}
    	}
    	
        if(confirm("삭제하시겠습니까?")){
        	var data = {"aidx" : aidxs};
        	//$("#mainForm").attr({"action":"msgStandardDetail.tsis"});
        	movePage(data , "agentDelete.tsis");
        }
    	
    });
    
    
    $(".detail").on("click",function(){
    	movePage({"aidx": $(this).data("aidx")},"agentInfoDetail.tsis");
    });
    
    $("#btnSearch").on('click',function(){
    	$("#mainForm").attr("action","agentInfo.tsis").submit();
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