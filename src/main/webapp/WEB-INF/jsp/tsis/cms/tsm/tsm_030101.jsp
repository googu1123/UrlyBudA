<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    관리자 등록/수정<br>
                    <small>관리자를 등록/수정/확인할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li><a href="agentInfo.tsis"><i class="fa fa-bars"></i> 관리자 현황</a></li>
                    <li class="active">관리자 등록/수정</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form action="#" method="post" id="mainForm">
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                	<c:choose>
                                		<c:when test="${fn:length(detail.aidx) == 0 }">
		                                    <tr>
		                                        <th scope="row">사용자 ID</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="text" class="form-control" name="aidx" id="aidx">
		                                                </div>
		                                                <button type="button" class="btn btn-sm  btn-warning" id="btnCheck">중복검사</button>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">사용자 접근</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <select class="form-control" id="auth" name="auth">
					                                        <option value="M">관리자</option>
					                                        <option value="A">준관리자</option>
					                                        <option value="W">사용자</option>
					                                        <option value="H" >현업담당자</option>					                                        
					                                    </select>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">에이전트 ID</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="text" class="form-control" id="cidx" name="cidx">
		                                                </div>
		                                                <span class="help">영문 8자리 이하</span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">비밀번호</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="password" class="form-control" id="passwd" name="passwd">
		                                                </div>
		                                                <span class="help">영문, 숫자 조합 8자리 이상</span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">비밀번호 확인</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="password" class="form-control" id="conPasswd">
		                                                </div>
		                                                <span class="help" id="conCheck"></span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">사용자 명</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="text" class="form-control" name="name" id="name">
		                                                </div>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">휴대전화</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="tel" class="form-control" id="phone" name="phone">
		                                                </div>
		                                                <span class="help">'-' 없이 입력</span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <th scope="row">등록일</th>
		                                        <td>${reg_date }</td>
		                                    </tr>
                                		</c:when>
                                		
                                	
                                		<c:otherwise>
                                		<!-- ---------------수정----------------- -->
                                			<c:if test="${sessionScope.admin_info.auth eq 'M' }">
												<tr>
			                                        <th scope="row">사용자 ID</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    <%-- <input type="text" class="form-control" name="aidx" value="${detail.aidx }" readonly="readonly"> --%>
			                                                    ${detail.aidx }
			                                                    <input type="hidden" name="aidx" value="${detail.aidx }" readonly="readonly">
			                                                </div>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">사용자 접근</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <select class="form-control" id="auth" name="auth">
						                                        <option value="M" <c:if test="${detail.auth eq 'M' }">selected="selected"</c:if>>관리자</option>
						                                        <option value="A" <c:if test="${detail.auth eq 'A' }">selected="selected"</c:if>>준관리자</option>
						                                        <option value="W" <c:if test="${detail.auth eq 'W' }">selected="selected"</c:if>>사용자</option>
						                                        <option value="H" <c:if test="${detail.auth eq 'H' }">selected="selected"</c:if>>현업담당자</option>
						                                    </select>
			                                            </div>
			                                        </td>
			                                    </tr>
		                                    <tr>
		                                        <th scope="row">에이전트 ID</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    <input type="text" class="form-control" value="${detail.cidx }" id="cidx" name="cidx">
		                                                </div>
		                                                <span class="help">영문 8자리 이하</span>
		                                            </div>
		                                        </td>
		                                    </tr>
			                                    <tr>
			                                        <th scope="row">비밀번호</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    <input type="password" class="form-control" id="passwd" name="passwd">
			                                                </div>
			                                                <span class="help">영문, 숫자 조합 8자리 이상</span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">비밀번호 확인</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    <input type="password" class="form-control" id="conPasswd">
			                                                </div>
			                                                <span class="help" id="conCheck"></span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">사용자 명</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    <input type="text" class="form-control" name="name" id="name" value="${detail.name }">
			                                                </div>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">휴대전화</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    <input type="tel" class="form-control" id="phone" name="phone" value="${detail.phone }">
			                                                </div>
			                                                <span class="help">'-' 없이 입력</span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">등록일</th>
			                                        <td>${detail.reg_date }</td>
			                                    </tr>
                                			</c:if>
                                			<c:if test="${sessionScope.admin_info.auth eq 'A' }">
                                				<tr>
			                                        <th scope="row">사용자 ID</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    <%-- <input type="text" class="form-control" name="aidx" value="${detail.aidx }" readonly="readonly"> --%>
			                                                    ${detail.aidx }
			                                                    <input type="hidden" name="aidx" value="${detail.aidx }" readonly="readonly">
			                                                </div>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">사용자 접근</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <select class="form-control" id="auth" name="auth" disabled="disabled">
						                                        <option value="M" <c:if test="${detail.auth eq 'M' }">selected="selected"</c:if>>관리자</option>
						                                        <option value="A" <c:if test="${detail.auth eq 'A' }">selected="selected"</c:if>>준관리자</option>
						                                        <option value="W" <c:if test="${detail.auth eq 'W' }">selected="selected"</c:if>>사용자</option>
						                                        <option value="H" <c:if test="${detail.auth eq 'H' }">selected="selected"</c:if>>현업담당자</option>
						                                    </select>
			                                            </div>
			                                        </td>
			                                    </tr>
		                                    <tr>
		                                        <th scope="row">에이전트 ID</th>
		                                        <td>
		                                            <div class="form-inline">
		                                                <div class="form-group">
		                                                    ${detail.cidx }
		                                                </div>
		                                            </div>
		                                        </td>
		                                    </tr>
			                                    <tr>
			                                        <th scope="row">사용자 명</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                    ${detail.name }
			                                                </div>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">휴대전화</th>
			                                        <td>
			                                            <div class="form-inline">
			                                                <div class="form-group">
			                                                   ${detail.phone }
			                                                </div>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">등록일</th>
			                                        <td>${detail.reg_date }</td>
			                                    </tr>
                                			</c:if>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->

                        <div class="search_btn">
                        	<c:choose>
                           		<c:when test="${fn:length(detail.aidx) > 0 }">
                           			<c:if test="${sessionScope.admin_info.auth eq 'M' }">
	                           			<button type="button" class="btn btn-sm  btn-danger pull-left" id="btnDelete">삭제</button>
	                           			<button type="button" class="btn btn-sm  btn-primary" id="btnUpdate">수정</button>
	                                </c:if>
                            		<button type="button" class="btn btn-sm  btn-default" id="btnCancel">취소</button>	
                           		</c:when>
                           		<c:otherwise>
                           			<c:if test="${sessionScope.admin_info.auth eq 'M' }">
                           				<button type="button" class="btn btn-sm  btn-primary" id="btnSave">등록</button>
                           			</c:if>
                            		<button type="button" class="btn btn-sm  btn-default" id="btnCancel">취소</button>	
                           		</c:otherwise>
                            </c:choose>
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
	var sw = true;
	 var check = /^[a-zA-Z0-9]{8,20}$/;
	
	$("#aidx").on("change",function(){
		sw = false;
	});
	
	$("#btnDelete").on("click",function(){
		if(confirm("삭제 하시겠습니까?")){
			$("#mainForm").attr({"action":"agentDelete.tsis"}).submit();
		}
	});
	
    $("#btnSave").on("click",function(){
    	if($("#aidx").val()==""){
    		alert("사용자 ID를 입력해주세요");
    		return false;
    	}
    	
    	if($("#passwd").val()==""){
    		alert("비밀번호를 입력해주세요");
    		return false;
    	}
    	
    	if(!check.test($("#passwd").val())){
     		alert("비밀번호 규격이 일치하지 않습니다.");
     		return false;
     	}
    	
    	if($("#passwd").val()!=$("#conPasswd").val()){
    		alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
    		return false;
    	}
    	
    	if(!sw){
    		alert("아이디 중복확인을 해주십시오.");
    		return false;
    	}
    	
    	if($("#name").val()==""){
    		alert("사용자 이름을 입력해주세요");
    		return false;
    	}
    	
    	if($("#phone").val()==""){
    		alert("휴대전화를 입력해주세요");
    		return false;
    	}
    	
    	$("#mainForm").attr({"action":"agentInsert.tsis"}).submit();
    	
    });
    
    
    $("#btnUpdate").on("click",function(){
       	 
    	if($("#passwd").val().length > 0 && !check.test($("#passwd").val())){
     		alert("비밀번호 규격이 일치하지 않습니다.");
     		return false;
     	} 
    	 
    	if($("#passwd").val().length > 0 && $("#passwd").val()!=$("#conPasswd").val()){
    		alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
    		return false;
    	}
    	
    	if($("#name").val()==""){
    		alert("사용자 이름을 입력해주세요");
    		return false;
    	}
    	
    	if($("#phone").val()==""){
    		alert("휴대전화를 입력해주세요");
    		return false;
    	}
    	
    	$("#mainForm").attr({"action":"agentUpdate.tsis"}).submit();
    });
    
    $("#btnCheck").on("click",function(){
    	if($("#aidx").val()==""){
    		alert("사용자 ID를 입력해주세요");
    		return false;
    	}
    	$.ajax({
    		url:"agentCheck.tsis",
    		data:"aidx="+$("#aidx").val(),
    		method:"post",
    		success : function(ch){
    			if(ch == 1){
    				alert("중복된 아이디입니다.");
    				sw = false;
    			} else {
    				alert("사용가능한 아이디입니다.");
    				sw = true;
    			}
    		}
    	});
    });
    
    $("#btnCancel").on("click",function(){
    	movePage({},"agentInfo.tsis");
    });
});

</script>
</body>
</html>