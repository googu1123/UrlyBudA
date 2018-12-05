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
                    발송실패 상세통계<br>
                    <small>발송자 별 발송 건 수를 확인하실 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">발송실패상세통계</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="chart_container">
                    <p class="text-right text-light-blue">기준 시 : ${curDate }</p>
                    <div class="row">
                        <div class="col-md-6 col-bb-3 text-center">
                            <h5>알림톡</h5>
                            <div class="chartbox">
                                <canvas id="chartVal1"></canvas>
                                <input type="hidden" id="alimData" value='${alimData }'/>
                    		</div>
                        </div>
                        <div class="col-md-6 col-bb-3 text-center">
                            <h5>LMS</h5>
                            <div class="chartbox">
                                <canvas id="chartVal2"></canvas>
                                <input type="hidden" id="lmsData" value='${lmsData }'/>
                    		</div>
                        </div>
                        <div class="clearfix visible-md"></div>
                        <div class="col-md-6 col-bb-3 text-center">
                            <h5>SMS</h5>
                            <div class="chartbox">
                    			<canvas id="chartVal3"></canvas>
                    			<input type="hidden" id="smsData" value='${smsData }'/>
                    		</div>
                        </div>
                        <div class="col-md-6 col-bb-3 text-center">
                            <h5>NMS</h5>
                            <div class="chartbox">
                                <canvas id="chartVal4"></canvas>
                                <input type="hidden" id="nmsData" value='${nmsData }'/>
                    		</div>
                        </div>
                    </div>
                    <p class="text-orange">※ 당일기준 금일 00시 ~ 현재(성공 건 제외)</p>
                </div>
                <!-- //tab_container -->
            </section><!-- /.content -->

        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ChartNew.js"></script>
<script src="js/common.js"></script>
<script src="js/tsm_020301.js"></script>
</body>
</html>