<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@include file="stepHeader.jsp" %> --%>

<a href="metaList.do" class="logo">
    <!-- <img src="img/logo.png" alt="ICMS 관리"> -->
    URLyBudA CMS
</a>
<nav class="navbar navbar-static-top" role="navigation">
    <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </a>
    <div class="navbar-right">
        <ul class="nav navbar-nav">
            <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i>
                    <span>${sessionScope.aidx }<i class="caret"></i></span>
                </a>
                <ul class="dropdown-menu">
                    <!-- User image -->
                    <li class="user-header">
                        <img src="img/ico_admin.png" class="img-circle" alt="User Image" />
                        <p>
                            ${sessionScope.aidx }
                            <small>${sessionScope.admin_info.name }</small>
                        </p>
                    </li>
                    <li class="user-footer">
                        <div class="pull-left">
                            <!-- <a href="#" class="btn btn-default btn-flat">프로필</a> -->
                        </div>
                        <div class="pull-right">
                            <a href="logout.do" class="btn btn-default btn-flat">로그아웃</a>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>