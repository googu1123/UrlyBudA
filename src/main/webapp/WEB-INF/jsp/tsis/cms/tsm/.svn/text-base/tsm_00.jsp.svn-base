<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html class="bg-black">
<head>
    <meta charset="UTF-8">
    <title>Login-Administrator</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <!-- bootstrap 3.0.2 -->
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    <!-- font Awesome -->
    <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <!--[if lt IE 9]>
        <script src="/js/html5shiv.js"></script>
        <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="bg-black">
    <div class="form-box" id="login-box">
        <div class="header">LOGIN</div>
        <form action="loginCheck.do" method="post">
            <div class="body bg-gray">
                <div class="form-group">
                    <input type="text" id="id" name="aidx" class="form-control" placeholder="아이디" value="${tsm_id }">
                </div>
                <div class="form-group">
                    <input type="password" id="passwd" name="passwd" class="form-control" placeholder="비밀번호">
                </div>          
                <div class="form-group">
                    <label><input type="checkbox" id="check_id" class="ichk" <c:if test="${ck eq 'Y' }"> checked="checked" </c:if>> 아이디 저장</label>
                    <input type="hidden" id="ck" name="check_id" value="${ck }" >
                </div>
            </div>
            <div class="footer">                                                               
                <button type="submit" class="btn btn-sm  bg-red btn-block">Login</button>
                <!-- <p><a href="#">아이디/비밀번호 찾기</a></p> -->
                <!-- <a href="register.html" class="text-center">회원가입</a> -->
            </div>
        </form>
    </div>

<script src="<c:url value="/js/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#check_id').on('ifChecked', function(event){
			$("#ck").val("Y");
		}).on('ifUnchecked', function(event){
			$("#ck").val("N");
		});
	});
</script>

</body>
</html>