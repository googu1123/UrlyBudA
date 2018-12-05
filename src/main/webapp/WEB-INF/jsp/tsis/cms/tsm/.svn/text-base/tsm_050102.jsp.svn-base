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
                    문의내역 관리<br>
                    <small>자동응답에 등록된 고객 문의사항을 확인하고 답변합니다.</small>
                </h1>
                <ol class="breadcrumb">
                	<%@include file="./gnb/home.jsp" %>
                    <li><a href="callCenterHelpList.tsis"><i class="fa fa-bars"></i> 문의내역 관리</a></li>
                    <li class="active">문의내역 상세</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post" id="mainForm" name="mainForm">
                    	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
		            	<input type="hidden" name="send_type" id="send_type" value="${send_type}"/>
		            	<input type="hidden" name="recordCount" id="recordCount" value="${recordCount}"/>
                    	<input type="hidden" id="status" name="status" value="${tmp.status }"/>
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">고객ID</th>
                                        <td>${tmp.cust_id}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">문의현황</th>
                                        <td>
                                        	<c:if test="${tmp.status eq 'STR' }">신규</c:if>
                                        	<c:if test="${tmp.status eq 'ING' }">답변중</c:if>
                                        	<c:if test="${tmp.status eq 'END' }">완료</c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">등록일시</th>
                                        <td>${tmp.reg_date}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">완료일시</th>
                                        <td>${tmp.mod_date}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">문의내용</th>
                                        <td>
                                           <div class="prebox">
                                           		${tmp.content}
                                           	</div>
                                           <!-- <div class="imgbox">
                                               <img src="http://hasegi.dothome.co.kr/BNL/img/img_evt_feb.png" alt="첨부이미지">
                                           </div> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">담당자</th>
                                        <td>${tmp.aidx}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">답변작성</th>
                                        <td>
                                        	${tmp.res_message}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                            <button type="button" id="btnFinish" class="btn btn-primary">확인</button>
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
<script type="text/javascript">
$(document).ready(function(){
	// 확인
	$("#btnFinish").on("click", function(){
		$("#mainForm").attr({"action":"callCenterHelpList.tsis","method":"post"}).submit();
	});
});
</script>
</body>

</html>