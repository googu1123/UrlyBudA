<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-1.8.3.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		alert("ERR_CODE : ERR_NPE\n이전페이지로 이동합니다.");
		history.back(-1);		
	});
</script>
<title>CMS</title>
</head>
<body>
<table>
  <tr>
    <td><table>
	  <tr>
		<td>
			ERROR CODE : ERR_NPE
		</td>
	  </tr>
	</table></td>
  </tr>
</table>
</body>
</html>