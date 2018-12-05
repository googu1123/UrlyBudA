<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    발송 순서관리<br>
                    <small>메시지 발송 순서의 기본값을 설정합니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">발송 순서관리</li>
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
                                        <th scope="row">1순위</th>
                                        <td>
                                            <label class="fwn marr10"><input type="radio" name="send_priority1" class="ichk"> 알림톡</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority1" class="ichk" disabled="disabled"> NMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority1" class="ichk"> SMS</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2순위</th>
                                        <td>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk"> 알림톡</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk" disabled="disabled"> NMS</label>
                                            <label class="fwn marr10"><input type="radio" name="send_priority2" class="ichk"> SMS</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3순위</th>
                                        <td>자동 선택</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                            <button type="button" class="btn btn-sm  btn-primary">저장</button>
                            <button type="button" class="btn btn-sm  btn-default">취소</button>
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
    
});

</script>
</body>
</html>