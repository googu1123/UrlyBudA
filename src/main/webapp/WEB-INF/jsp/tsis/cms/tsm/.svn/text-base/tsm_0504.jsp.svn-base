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
                    자동응답 통계<br>
                    <small>자동응답 통계 내역을 확인 합니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">자동응답 통계</li>
                </ol>
            </section>

            <!-- Main content -->
			<form action="callCenterHelpStats.tsis" method="post" id="mainForm">
            	<input type="hidden" name="send_type" id="send_type" value="${send_type}"/>
            	<input type="hidden" name="start_date" id="start_date" value="${start_date}"/>
	            <section class="content">
	                <div class="arschartbox">
	
	                    <ul class="sort_list" id="tab_tit">
	                        <li><a href="#tab1" class="btn" id="stats_today">금일 통계 조회</a></li>
	                        <li><a href="#tab2" class="btn" id="stats_day">일간 통계 조회</a></li>
	                        <li><a href="#tab3" class="btn" id="stats_month">월간 통계 조회</a></li>
	                    </ul>
	                    
	                    <div class="tab_list">
	                        <div class="tab_con" id="tab1">
	                            <div class="form-inline tab_control">
	                                <div class="form-group">
	                                    <p class="text-right text-light-blue">기준 시 : ${start_date}</p>
	                                </div>
	                            </div>
	                            
	                            <div class="chart_container">
	                                <div class="chartbox">
	                                    <canvas id="arschart1"></canvas>
	                                </div>
	                            </div>
	
	                            <div class="tbl_view">
		                            <div class="table-responsive">
		                                <table class="table tbl_write">
		                                    <tbody>
		                                        <tr>
		                                            <th scope="row">자동응답 이용 고객 수</th>
		                                            <td>${statsData.stats_total_cnt }</td>
		                							<input type="hidden" id="todayData_cnt" value="${statsData.stats_total_cnt }"/>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row">자동응답 상담 완료 건수</th>
		                                            <td>${statsData.stats_finish_cnt }</td>
		                							<input type="hidden" id="todayData_1" value="${statsData.stats_finish_cnt }"/>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row">문의하기 입력 건수</th>
		                                            <td>${statsData.stats_question_cnt }</td>
		                                            <input type="hidden" id="todayData_2" value="${statsData.stats_question_cnt }"/>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row">상담 미완료 건수</th>
		                                            <td>${statsData.stats_wait_cnt }</td>
		                                            <input type="hidden" id="todayData_3" value="${statsData.stats_wait_cnt }"/>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div><!-- /.table-responsive -->
	                                <p class="text-yellow">※ 당일기준 금일 00시 ~ 현재(성공 건 제외)</p>
	                            </div><!-- /.tbl_view -->
	                        </div>
	
	                        <div class="tab_con" id="tab2">
	                            <div class="form-inline tab_control">
	                                <div class="form-group">
	                                    <input type="text" class="form-control input_datebox" id="date_day" name="date_day" value="${start_date }">
	                                </div>
	                            </div>
	                            
	                            <div class="chart_container">
	                                <div class="chartbox">
	                                    <canvas id="arschart2"></canvas>
	                                </div>
	                            </div>
	
	                            <div class="tbl_view">
	                                <form action="#" method="post">
	                                    <div class="table-responsive">
	                                        <table class="table tbl_write">
	                                            <tbody>
	                                                <tr>
	                                                    <th scope="row">자동응답 이용 고객 수</th>
	                                                    <td>${statsData.stats_total_cnt }</td>
	                                                    <input type="hidden" id="dayData_cnt" value="${statsData.stats_total_cnt }"/>
	                                                </tr>
	                                                <tr>
	                                                    <th scope="row">자동응답 상담 완료 건수</th>
	                                                    <td>${statsData.stats_finish_cnt }</td>
	                                                    <input type="hidden" id="dayData_1" value="${statsData.stats_finish_cnt }"/>
	                                                </tr>
	                                                <tr>
	                                                    <th scope="row">문의하기 입력 건수</th>
	                                                    <td>${statsData.stats_question_cnt }</td>
	                                                    <input type="hidden" id="dayData_2" value="${statsData.stats_question_cnt }"/>
	                                                </tr>
	                                                <tr>
	                                                    <th scope="row">상담 미완료 건수</th>
	                                                    <td>${statsData.stats_wait_cnt }</td>
	                                                    <input type="hidden" id="dayData_3" value="${statsData.stats_wait_cnt }"/>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div><!-- /.table-responsive -->
	                                </form>
	                            </div><!-- /.tbl_view -->
	                        </div>
	
	                        <div class="tab_con" id="tab3">
	                            <div class="form-inline tab_control">
	                                <div class="form-group">
	                                    <input type="text" class="form-control input_datebox" id="date_month" name="date_month" value="${start_date }">
	                                </div>
	                            </div>
	                            
	                            <div class="chart_container">
	                                <div class="chartbox">
	                                    <canvas id="arschart3"></canvas>
	                                </div>
	                            </div>
	
	                            <div class="tbl_view">
	                                <form action="#" method="post">
	                                    <div class="table-responsive">
	                                        <table class="table tbl_write">
	                                            <tbody>
	                                                <tr>
	                                                    <th scope="row">자동응답 이용 고객 수</th>
	                                                    <td>${statsData.stats_total_cnt }</td>
	                                                    <input type="hidden" id="monthData_cnt" value="${statsData.stats_total_cnt }"/>
	                                                </tr>
	                                                <tr>
	                                                    <th scope="row">자동응답 상담 완료 건수</th>
	                                                    <td>${statsData.stats_finish_cnt }</td>
	                                                    <input type="hidden" id="monthData_1" value="${statsData.stats_finish_cnt }"/>
	                                                </tr>
	                                                <tr>
	                                                    <th scope="row">문의하기 입력 건수</th>
	                                                    <td>${statsData.stats_question_cnt }</td>
	                                                    <input type="hidden" id="monthData_2" value="${statsData.stats_question_cnt }"/>
	                                                </tr>
	                                                <tr>
	                                                    <th scope="row">상담 미완료 건수</th>
	                                                    <td>${statsData.stats_wait_cnt }</td>
	                                                    <input type="hidden" id="monthData_3" value="${statsData.stats_wait_cnt }"/>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div><!-- /.table-responsive -->
	                                </form>
	                            </div><!-- /.tbl_view -->
	                        </div>
	                    </div>
	                </div>
	                <!-- //arschartbox -->
	            </section><!-- /.content -->
			</form>
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/zebra_datepicker.js"></script>
<script src="js/ChartNew.js"></script>
<script src="js/common.js"></script>
<script src="js/tsm_0504.js"></script>
</body>

</html>