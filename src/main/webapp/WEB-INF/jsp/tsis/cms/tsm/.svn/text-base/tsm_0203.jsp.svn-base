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
    <link rel="stylesheet" href="<c:url value="css/bootstrap.min.css"/>">
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
                    발송실패 통계<br>
                    <small>발송자 별 발송 건 수를 확인하실 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">발송실패 통계</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <p class="text-right text-light-blue">기준 시 : ${curDate }</p>
                <div class="row">
                    <div class="col-xs-6 text-center">
                        <div id="g0"></div>
                        <input type="hidden" id="all_per" value="${all_per }"/>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-xs-6">
                            <div id="g1"></div>
                            <input type="hidden" id="a_per" value="${a_per }"/>
                        </div>
                        <div class="col-xs-6">
                            <div id="g2"></div>
                            <input type="hidden" id="l_per" value="${l_per }"/>
                        </div>
                        <div class="col-xs-6">
                            <div id="g3"></div>
                            <input type="hidden" id="s_per" value="${s_per }"/>
                        </div>
                        <div class="col-xs-6">
                            <div id="g4"></div>
                            <input type="hidden" id="n_per" value="${n_per }"/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <p class="text-orange">※ 당일기준 금일 00시 ~ 현재(성공 건 제외)</p>
                <div class="marb20 text-center"><a href="msgChartGraphDetail.tsis" class="btn btn-info">상세보기</a></div>
            </section><!-- /.content -->

        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/raphael-2.1.4.min.js"></script>
<script src="js/justgage.js"></script>
<script src="js/common.js"></script>
<script>
$(document).ready(function(){
    var g0 = new JustGage({
        id: "g0",
        value: $("#all_per").val(),
        min: 0,
        max: 100,
        relativeGaugeSize: true,
        title: "전체 실패 율",
        label: "%"
    });

    var g1 = new JustGage({
        id: "g1",
        value: $("#a_per").val(),
        min: 0,
        max: 100,
        relativeGaugeSize: true,
        title: "알림톡",
        label: "%"
    });

    var g2 = new JustGage({
        id: "g2",
        value: $("#l_per").val(),
        min: 0,
        max: 100,
        relativeGaugeSize: true,
        title: "LMS",
        label: "%"
    });

    var g3 = new JustGage({
        id: "g3",
        value: $("#s_per").val(),
        min: 0,
        max: 100,
        relativeGaugeSize: true,
        title: "SMS",
        label: "%"
    });

    var g4 = new JustGage({
        id: "g4",
        value: $("#n_per").val(),
        min: 0,
        max: 100,
        relativeGaugeSize: true,
        title: "NMS",
        label: "%"
    });

   /*  setInterval(function() {
        g0.refresh(getRandomInt(0, 100));
        g1.refresh(getRandomInt(0, 100));
        g2.refresh(getRandomInt(80, 100));
        g3.refresh(getRandomInt(40, 70));
        g4.refresh(getRandomInt(0, 30));
        }, 2500); */
});
</script>
</body>
</html>