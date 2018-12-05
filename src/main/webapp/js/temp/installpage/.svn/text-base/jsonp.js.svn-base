/**
*   
*	tMP HybridPlatform Common Javascript Function
*   
*
*	http://tMP.tsis.co.kr/
*
*	Copyright 2012.12.10, tsis Mobile Platform Project
*	 - prousers
*	
*   http://tMP.tsis.co.kr/license
*
**/

//var JSONP = { }
var JSONP={};
JSONP.get = function(url, callback) {
    var scriptTag = document.createElement('script');
    var callbackName = '_' + new Date().getTime();
    
	JSONP[callbackName] = function() {
		callback.apply(null, arguments);
		delete JSONP[callbackName];
		document.head.removeChild(scriptTag);
    }
    
    if (url.indexOf('?') != -1) {
		url += '&CBFN=JSONP.' + callbackName;
    } else {
		url += '?CBFN=JSONP.' + callbackName;
    }
	scriptTag.src = url;
	document.head.appendChild(scriptTag);
}


/**
* 	Example 	
*   (Callback Function Parameter name = CBFN

бс Client
JSONP.get('http://59.12.238.133/HybridPlatform/src/test.jsp?CBFN=fnJsonpSuccess', 
	function(data) {
		alert(data.RESULT);
	}
);*
	
бс Server(JSP)
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");
	response.setContentType("text/javascript");
	
	String CallBack = (String)request.getParameter("CBFN");
	
	if(CallBack == null || CallBack.length() == 0) {
		out.write("{\"RESULT\":\"FAIL\",\"DESCRIPTION\":\"PARAMETER\"}");
		return;
	}
	
	// Return Value
	out.write(CallBack+"( {\"RESULT\":\"SUCCESS\"} );");
%>

**/