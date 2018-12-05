<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TSM</title>
<meta name="Keywords" content="" />
<meta name="Description" content="CMS" />
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/cms/style.css'/>"/> --%>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	if($("#returnData").val()!=null){
		
		var data = $("#returnData").val().split("@#");
		for(var i = 0 ; i < data.length ; i++){
			var name = data[i].split("=")[0];
			var value = data[i].split("=")[1];
			$("#mainForm").append("<input type='hidden' name='"+name+"' value='"+value+"'/>");
		}
		
	}
	
	if($("#msg").val() != "success") {
		alert($("#msg").val());
		$("#mainForm").attr({"method":"post","action":$("#url").val()}).submit();
		//location.href = $("#url").val();
	}
	else {
		$("#mainForm").attr({"method":"post","action":$("#url").val()}).submit();
	}
	
});
 
</script>
</head>

<body>
<form name="cmsForm" id="mainForm">
<input type="hidden" id="returnData" value="<c:out value='${returnData}'/>" />
<input type="hidden" name="msg" id="msg" value="<c:out value='${returnMsg}'/>" />
<input type="hidden" name="url" id="url" value="<c:out value='${returnUrl}'/>" />

</form>
</body>
</html>
