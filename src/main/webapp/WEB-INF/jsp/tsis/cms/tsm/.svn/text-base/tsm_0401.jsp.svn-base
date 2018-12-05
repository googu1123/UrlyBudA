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
                    수신거부 현황<br>
                    <small>스마트 메시지 서비스를 수신거부 신청한 이용자 정보를 확인할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                     <%@include file="./gnb/home.jsp" %>
                    <li class="active">수신거부 현황</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="search_form">
                    <form action="#" method="post" id="mainForm">
                    	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
	            		<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
                        <div class="dis_table">
                            <dl class="dis_tr">
                                <dt>서비스 구분</dt>
                                <dd>
                                    <div class="form-inline">
                                        <select class="form-control" id="search_mtype" name="search_mtype">
                                            <option value="AL" <c:if test="${search_mtype eq 'AL'}">selected="selected"</c:if>>전체</option>
                                            <option value="N" <c:if test="${search_mtype eq 'N'}">selected="selected"</c:if>>NMS</option>
                                            <option value="A" <c:if test="${search_mtype eq 'A'}">selected="selected"</c:if>>알림톡</option>
                                            <option value="S" <c:if test="${search_mtype eq 'S'}">selected="selected"</c:if>>SMS</option>
                                        </select>
                                    </div>
                                </dd>
                                <dt>수신여부</dt>
                                <dd>
                                    <div class="form-inline">
                                        <select class="form-control" name="search_refuse" id="search_refuse">
                                            <option value="" <c:if test="${search_refuse eq 'AL'}">selected="selected"</c:if>>전체</option>
                                            <option value="Y" <c:if test="${search_refuse eq 'Y'}">selected="selected"</c:if>>거부</option>
                                            <option value="N" <c:if test="${search_refuse eq 'N'}">selected="selected"</c:if>>허용</option>
                                        </select>
                                    </div>
                                </dd>
                            </dl>
                        </div><!-- //dis_table -->

                        <div class="dis_table">
                            <dl class="dis_tr">
                                <dt>요청자</dt>
                                <dd>
                                    <input type="text" class="form-control" placeholder="검색어 입력" name="search_aidx" id="search_aidx" value="${search_aidx }">
                                </dd>
                                <dt>거부 요청처</dt>
                                <dd>
                                    <div class="form-inline">
                                        <select class="form-control" name="src_table" id="src_table">
                                            <option value="ALL" <c:if test="${search_src_table eq 'ALL'}">selected="selected"</c:if>>전체</option>
                                            <option value="ARS" <c:if test="${search_src_table eq 'ARS'}">selected="selected"</c:if>>ARS</option>
                                            <option value="DNC" <c:if test="${search_src_table eq 'DNC'}">selected="selected"</c:if>>DNC</option>
                                            <option value="CALL" <c:if test="${search_src_table eq 'CALL'}">selected="selected"</c:if>>콜센터</option>
                                            <option value="ETC" <c:if test="${search_src_table eq 'ETC'}">selected="selected"</c:if>>기타</option>
                                        </select>
                                    </div>
                                </dd>
                            </dl>
                        </div><!-- //dis_table -->
                        <div class="dis_table">
                            <dl class="dis_ftr">
                                <dt>수신번호</dt>
                                <dd>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <input type="tel" class="form-control" placeholder="검색어 입력" name="search_receive_num" value="${search_receive_num}">
                                        </div>
                                        <span class="txt_help">'-' 없이 입력</span>
                                    </div>
                                </dd>
                            </di>
                        </div><!-- //dis_table -->

                        <div class="dis_table">
                            <dl class="dis_ftr">
                                <dt>등록일</dt>
                                <dd>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <input type="text" class="form-control input_datebox" id="start_date" name="start_date" value="${start_date }">
                                        </div>
                                        ~
                                        <div class="form-group">
                                            <input type="text" class="form-control input_datebox" id="last_date" name="last_date" value="${last_date }">
                                        </div>
                                    </div>
                                </dd>
                            </dl>
                        </div><!-- //dis_table -->

                        <div class="search_btn">
                            <button type="button" class="btn btn-primary btn-sm" id="btnSearch">검색</button>
                        </div>
                </div><!-- /.search_form -->

                <div class="list_bot">
                        <div class="row">
                            <div class="col-xs-8">
                                <a href="refuseRegi.tsis" class="btn btn-success btn-sm" id="btnRegi">등록</a>
                                <a href="#" class="btn btn-danger btn-sm" id="btn_listDel" data-toggle="modal" data-target=".pop_reason">삭제</a>
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
                                <%-- <colgroup>
                                    <col style="width:35px;">
                                    <col style="width:90px;">
                                    <col style="width: *;">
                                    <col style="width:100px;">
                                    <col style="width:90px;">
                                    <col style="width:90px;">
                                    <col style="width:90px;">
                                    <col style="width:90px;">
                                </colgroup> --%>
                                <thead>
                                    <tr>
                                        <th scope="col"><input type="checkbox" id="chkAll" class="ichk"></th>
                                        <th scope="col">No</th>
                                        <th scope="col">수신번호</th>
                                        <th scope="col">요청자</th>
                                        <th scope="col">요청일자</th>
                                        <th scope="col">수신여부</th>
                                        <th scope="col">등록일</th>
                                        <th scope="col">상세</th>
                                    </tr>
                                </thead>
                                <tbody id="reList">
                                	<c:choose>
                                		<c:when test="${fn:length(refuseList) > 0 }">
                                			<c:forEach var="re" items="${refuseList }" varStatus="status">
												<tr data-pidx="${re.pidx }">
			                                        <td><input type="checkbox" class="ichk" id="listChk1" data-pidx="${re.pidx }"></td>
			                                        <td>${re.idx }</td>
			                                        <td>${fn:substring(re.receive_num, 0, 7) }****</td>
			                                        <td>${re.aidx }</td>
			                                        <td>${re.reg_date }</td>
			                                        <td>
			                                        	<c:if test="${re.refuse eq 'Y' }">거부</c:if>
			                                        	<c:if test="${re.refuse eq 'N' }">허용</c:if>
			                                        </td>
			                                        <td>${re.reg_date }</td>
			                                        <td>
			                                            <a href="#" class="btn btn-info btn-sm btnDetail" data-pidx="${re.pidx }">보기</a>
			                                        </td>
			                                    </tr>                                			
                                			</c:forEach>
                                		</c:when>
                                		<c:otherwise>
                                			<tr>
		                                        <td colspan="8">내용이 없습니다.</td>
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
                    </form>
                </div>

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
                                <input type="text" class="form-control" placeholder="사유를 입력하세요." required name="del_desc"  id="del_desc">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary btn-sm" id="btnDelete">삭제</button>
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
<script>
$(document).ready(function(){
	
	$("#btnSearch").on("click", function(){
		$("#mainForm").attr({"action" : "refuseList.tsis"}).submit();		
	});
	
	
	$("#btnDelete").on("click", function(){
    	var $del = $("#reList").find(".icheckbox_minimal.checked");
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
        	var data = {"pidx":pidxs, "del_desc":$("#del_desc").val()};
        	//$("#mainForm").attr({"action":"msgStandardDetail.tsis"});
        	movePage(data , "refuseDelete.tsis");
        }
    	
    });
	
    //DatePicker
    $("#start_date").Zebra_DatePicker({
        first_day_of_week: 0,
        direction: false,
        pair: $("#date_end")
    });
    $("#last_date").Zebra_DatePicker({
        first_day_of_week: 0,
        direction: true
    });
    
    $(".btnDetail").on("click",function(){
    	movePage({"pidx": $(this).data("pidx")},"refuseDetail.tsis");
    });
    
    $(".goPage").on("click", function() {
		$("#nowPage").val($(this).data("page"));
		$("#mainForm").submit();
	});
    iCheckAll();

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
</html>