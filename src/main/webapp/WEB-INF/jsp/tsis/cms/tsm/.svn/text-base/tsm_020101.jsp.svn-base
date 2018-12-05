<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    이력 보기<br>
                    <small>보낸 메시지 정보를 확인할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li><a href="msgHistory.tsis"><i class="fa fa-bars"></i> 발송 이력</a></li>
                    <li class="active">이력 보기</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post">
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">발송타입</th>
                                        <td>
                                        	<c:if test="${hist.mtype eq 'A' }">알림톡</c:if>
				                            <c:if test="${hist.mtype eq 'N' }">NMS</c:if>
				                            <c:if test="${hist.mtype eq 'S'}">SMS</c:if>
				                            <c:if test="${hist.mtype eq 'L'}">LMS</c:if>
				                            <c:if test="${hist.mtype eq 'D'}">미등록문구</c:if>
			                            </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발신자</th>
                                        <td>${hist.sender }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수신자</th>
                                        <td>${hist.receive_num }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발송코드</th>
                                        <td>${hist.code }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">결과</th>
                                        <td>
                                        	<c:choose>
                                        		<c:when test="${hist.req_result eq '1000' || hist.req_result eq '6600' || hist.req_result eq '4100' }">
                                        			성공
                                        		</c:when>
                                        		<c:otherwise>
                                        			실패 / ${hist.req_result } / ${hist.description }
                                        		</c:otherwise>
                                        	</c:choose>
                                        </td>
                                    </tr>
                                    <c:if test="${hist.fax_file ne ''}">
                                    <tr>
                                    	<th>파일명</th>
                                    	<td>${hist.fax_file}</td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                        <th scope="row">발송일</th>
                                        <td>${hist.report_date }</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">LONG LINK</th>
                                        <td>${hist.long_link}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">SHORT LINK</th>
                                        <td>${hist.short_link }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발송 기한(일)</th>
                                        <td>${hist.link_limit }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">접근 제한 횟수</th>
                                        <td>${hist.link_cnt }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">인증정보</th>
                                        <td>${hist.link_auth }</td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <th scope="row">내용</th>
                                        <td>
                                            <pre class="pure_pre">${hist.message }</pre>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                            <a href="msgHistory.tsis" class="btn btn-sm  btn-primary">확인</a>
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
    //발송순서 숨김
    hideSendCon();
    
});
function hideSendCon(){
    var sendTarget = $("#send_way_default");
    var hideCon = $(".cus_send_way");
    sendTarget.on("ifChecked", function(){
        hideCon.css("display", "none");
    });
    sendTarget.on("ifUnchecked", function(){
        hideCon.css("display", "table-row");
    });
};
</script>
</body>
</html>