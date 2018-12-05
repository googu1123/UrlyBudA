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
                    Meta Data 관리<br>
                    <small>Meta Data 설정 변경을 할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li><a href="campaignList.tsis"><i class="fa fa-bars"></i> Meta Data 관리</a></li>
                    <li class="active">Meta Data 설정 변경</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post" id="mainForm" name="mainForm">
                    	<input type="hidden" id="btch_key" name="btch_key" value="${view.btch_key}"/>
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">메세지 제목</th>
                                        <td colspan="3">
                                        ${view.mms_sbjt}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">메세지 내용</th>
                                        <td colspan="3">
                                        ${view.msg}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">BTCH_KEY </th>
                                        <td><b>${view.btch_key}</b></td>
                                        <th scope="row">VERSION</th>
                                        <td>${view.version }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">TOTAL_COUNT</th>
                                        <td>${view.total_count }</td>
                                        <th scope="row">FILE_SIZE</th>
                                        <td>${view.file_size } byte</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">RSV_DTM</th>
                                        <td>${view.rsv_dtm }</td>
                                        <th scope="row">CMPG_CD</th>
                                        <td>${view.cmpg_cd }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">MSG_CD</th>
                                        <td>${view.msg_cd }</td>
                                        <th scope="row">SEND_NO</th>
                                        <td>${view.send_no }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">DATA_FIELD_INFO</th>
                                        <td colspan="3">
                                            <div class="form-inline">
		                                        ${view.data_field_info }
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">전송 여부</th>
                                        <td colspan="3">
                                            <div class="form-inline">
		                                        <c:if test="${view.tran_status eq '1' }"><b>전송완료</b></c:if>
		                                        <c:if test="${view.tran_status eq '0' }"><b>미전송</b></c:if>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->
                        <!-- <div class="table-responsive mart10">
							<table class="table tbl_list tbl_fixed">
								<tr>
									<td>*dfldfjdlj </td>
								</tr>
							</table>
						</div> -->
						<div class="table-responsive mart10">
                            <table class="table tbl_list tbl_fixed">
                            	<colgroup>
                                   	<col style="width:200px;">
									<col style="width:200px;">
									<%-- <col style="width:100px;">
									<col style="width:100px;"> --%>
									<col style="width:200px;">
									<col style="width:200px;">
									<col style="width:*;">
                                </colgroup>
                                <thead>
                                    <tr>
                                    	<th scope="col">BTCH_KEY</th>
                                        <th scope="col">URL FIELD</th>
                                        <!-- 
                                        <th scope="col">AUTH_TYPE</th>
                                        <th scope="col">AUTH</th> 
                                        -->
                                        <th scope="col">LINK_LIMIT</th>
                                        <th scope="col">LINK_CNT</th>
                                        <th scope="col">수정</th>
                                    </tr>
                                </thead>
                                <tbody id="metaValidList">
                                	<c:choose>
                                		<c:when test="${fn:length(metaValidList) > 0 }">
                                			<c:forEach var="valid" items="${metaValidList }" varStatus="status">
                                				<tr data-code="${valid.seq}" data-pidx="${valid.seq }">
			                                        <td>${valid.btch_key }</td>
			                                        <td>${valid.link_field }</td>
			                                        <%--
			                                        <td><input type="text" style="width:40px" name="link_auth_type" id="link_auth_type" value="${valid.link_auth_type }" hname="" required="maxbyte" maxbyte="5"></td>
			                                        <td><input type="text" style="width:40px" name="link_auth" id="link_auth" value="${valid.link_auth }" hname="" required="maxbyte" maxbyte="5"></td>
			                                        --%>
			                                        <td><input type="text" style="width:60px" name="link_limit" id="link_cnt" value="${valid.link_limit }" hname="" required="maxbyte" maxbyte="5"></td> 
			                                        <td><input type="text" style="width:60px" name="link_cnt" id="link_cnt" value="${valid.link_cnt }" hname="최대 접속수" required="maxbyte" maxbyte="5"></td>
			                                        <td>
			                                            <a href="#" class="btn btn-info btnUpdate btn-sm" data-link_cnt="${valid.link_cnt}" data-link_field="${valid.link_field}" data-seq="${valid.seq}" data-btch_key="${valid.btch_key}">수정</a>
			                                        </td>
			                                    </tr>
                                			</c:forEach>
                                		</c:when>
                                		<c:otherwise>
		                                    <tr>
		                                        <td colspan="9">등록된 내용이 없습니다.</td>
		                                    </tr>	                                			                                		
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div>
                        <div class="search_btn">
                        	
	                        <c:if test="${view.tran_status eq '0' || view.tran_status eq null}">
	                        	    <button type="button" id="btnComp" class="btn btn-sm  btn-primary">파일 전송</button>
	                        </c:if>
                            <button type="button" id="btnCancel" class="btn btn-sm  btn-default">목록</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->
                
            </section><!-- /.content -->
            
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script>

$(document).ready(function(){
   
	$(".btnUpdate").on("click",function(){
		
		var $this = $(this);
		var myCol = $this.closest("td");
        var myRow = myCol.closest("tr");
        
        var link_limit = myRow.find("input[name='link_limit']").val();
        var link_cnt = myRow.find("input[name='link_cnt']").val();
		var data = {
    			"seq" :$(this).data("seq"),
    			"btch_key" :$(this).data("btch_key"),
    			"link_limit" :link_limit,
    			"link_cnt" :link_cnt
    	};
    	if(confirm($(this).data("link_field")+" 의 설정을 수정하시겠습니까?")){
    		movePage(data,"metaValidUpdate.do");	
    	}
    	
    });
	
	// 취소
	$("#btnCancel").on("click", function(){
		movePage({},"metaList.do");
	});
	
	//등록 요청처리
	$("#btnComp").on("click", function(){
		var btch_key = '<c:out value="${valid.btch_key}"/>';
		
		if(confirm(btch_key+"전송하시겠습니까?")){
			$("#mainForm").attr({"action":"metaFileTran.do","method":"post"}).submit();
		}
		
	});
});



</script>
</body>
</html>