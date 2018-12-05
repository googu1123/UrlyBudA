<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@include file="stepHeader.jsp" %> --%>


<c:if test="${sessionScope.admin_info.auth eq 'W' }">
	<li><a href="msgStandard.tsis"><i class="fa fa-home"></i> Home</a></li>
</c:if>
<c:if test="${sessionScope.admin_info.auth eq 'H'}">
	<li><a href="msgHistory.tsis"><i class="fa fa-home"></i> Home</a></li>
</c:if>
<c:if test="${sessionScope.admin_info.auth eq 'A' || sessionScope.admin_info.auth eq 'M' }">
	<li><a href="msgStandard.tsis"><i class="fa fa-home"></i> Home</a></li>
</c:if>