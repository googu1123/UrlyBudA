<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@include file="stepHeader.jsp" %> --%>


<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
        <div class="pull-left image">
            <img src="img/ico_admin.png" class="img-circle" alt="User Image" />
        </div>
        <div class="pull-left info">
            <p>안녕하세요<br>${sessionScope.aidx} 님</p>

            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
    </div>
    
    <ul class="sidebar-menu">
        <li class="treeview <c:if test="${navi eq 1 }"> active </c:if>">
            <a href="#">
                <i class="fa fa-envelope-o"></i>
                <span>Meta Data 관리</span>
                <i class="fa fa-angle-down pull-right"></i>
            </a>
            <ul class="treeview-menu">
            	<c:if test="${sessionScope.admin_info.auth eq 'A' || sessionScope.admin_info.auth eq 'M' }">
                	<li><a href="metaList.do"><i class="fa fa-angle-double-right"></i>Meta Data 관리</a></li>
<!--                 	<li><a href="msgBatchReg.tsis"><i class="fa fa-angle-double-right"></i> 메시지일괄등록</a></li> -->
                </c:if>
            </ul>
        </li>
    </ul>
</section>
  <!-- /.sidebar -->