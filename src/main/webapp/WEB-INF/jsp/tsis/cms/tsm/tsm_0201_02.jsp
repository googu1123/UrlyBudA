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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- datepicker -->
    <link rel="stylesheet" href="css/zebra_datepicker_metallic.css">
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
                    실시간 현황<br>
                    <small>실시간 현황</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li class="active">실시간 현황</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="search_form">
<%--                 	<div class="dis_table">
                        <dl class="dis_tr">
                            <dt></dt>
                            <dt>미처리 건</dt>
                            <dt>응답대기</dt>
                        </dl>
					</div>
					<div class="dis_table">
						<dl class="dis_tr">
                            <dt>SMS</dt>
                            <c:set var = "ums_sms_1"/>
                            <c:set var = "ums_sms_2"/>
							<c:forEach var="item" items="${ums}">
								<c:if test="${item.realtime_type eq 'SMS'}">
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "ums_sms_1" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '2'}">
										<c:set var = "ums_sms_2" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${ums_sms_1 eq null || ums_sms_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_sms_1}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${ums_sms_2 eq null || ums_sms_2 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_sms_2}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
                    <div class="dis_table">
                        <dl class="dis_ftr">
                            <dt>LMS</dt>
                            <c:set var = "ums_lms_1"/>
                            <c:set var = "ums_lms_2"/>
							<c:forEach var="item" items="${ums}">
								<c:if test="${item.realtime_type eq 'LMS'}">
									<c:if test="${item.realtime_status eq '0'}">
										<c:set var = "ums_lms_1" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "ums_lms_2" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${ums_lms_1 eq null || ums_lms_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_lms_1}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${ums_lms_2 eq null || ums_lms_2 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_lms_2}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
                </div> --%>
                	<div class="dis_table">
                        <dl class="dis_tr">
                            <dt></dt>
                            <dt>미처리 건</dt>
                            <dt>응답대기</dt>
                        </dl>
					</div>
					<div class="dis_table">
						<dl class="dis_tr">
                            <dt>SNT_REAL</dt>
                            <c:set var = "ums_sms_1"/>
                            <c:set var = "ums_sms_2"/>
							<c:forEach var="item" items="${ums}">
								<c:if test="${item.realtime_type eq 'SNT_REAL'}">
									<c:if test="${item.realtime_status eq '0'}">
										<c:set var = "ums_sms_1" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "ums_sms_2" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${ums_sms_1 eq null || ums_sms_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_sms_1}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${ums_sms_2 eq null || ums_sms_2 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_sms_2}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
                    <div class="dis_table">
                        <dl class="dis_ftr">
                            <dt>SNT_BATCH</dt>
                            <c:set var = "ums_lms_1"/>
                            <c:set var = "ums_lms_2"/>
							<c:forEach var="item" items="${ums}">
								<c:if test="${item.realtime_type eq 'SNT_BATCH'}">
									<c:if test="${item.realtime_status eq '0'}">
										<c:set var = "ums_lms_1" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "ums_lms_2" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${ums_lms_1 eq null || ums_lms_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_lms_1}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${ums_lms_2 eq null || ums_lms_2 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${ums_lms_2}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
                </div>
                <!-- /.tbl_view -->
              <br/> <br/>
               <div class="search_form">
                	<div class="dis_table">
                        <dl class="dis_tr">
                        	<dt></dt>
                       		<dt></dt>
                            <dt>상태</dt>
                            <dt></dt>
                            <dt></dt>
                        </dl>
					</div>
					<div class="dis_table">
						<dl class="dis_tr">
                            <dt></dt>
                            <dt>미처리 건</dt>
                             <dt>SMS 응답대기</dt>
                            <dt>LMS 응답대기</dt>
                            <dt>알림톡 응답대기</dt>
                        </dl>
					</div>
					<div class="dis_table">
						<dl class="dis_tr">
                            <dt>TOTAL</dt>
                            <c:set var = "ready_0"/>
                            <c:set var = "ready_1"/>
                            <c:set var = "sms"/>
                            <c:set var = "lms"/>
                            <c:set var = "kakao"/>
							<c:forEach var="item" items="${total}">
								<c:if test="${item.realtime_type eq 'R'}">
									<c:if test="${item.realtime_status eq 'P'}">
										<c:set var = "ready_0" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq 'I'}">
										<c:set var = "ready_1" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
								<c:if test="${item.realtime_type eq 'S'}">
									<c:set var = "sms" value = "${item.realtime_cnt}" />
								</c:if>
								<c:if test="${item.realtime_type eq 'L'}">
									<c:set var = "lms" value = "${item.realtime_cnt}" />
								</c:if>
								<c:if test="${item.realtime_type eq 'A'}">
									<c:set var = "kakao" value = "${item.realtime_cnt}" />
								</c:if>
							</c:forEach>
							<c:if test="${ready_0 eq null || ready_0 eq ''}">
								<c:set var = "ready_0" value="0"/>
							</c:if>
							<c:if test="${ready_1 eq null || ready_1 eq ''}">
								<c:set var = "ready_1" value="0"/>
							</c:if>
					        <dt>${ready_0 + ready_1}</dt>
                            <c:choose>
                          		<c:when test="${sms eq null || sms eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${sms}</dt>
							    </c:otherwise>
                          	</c:choose>
                            <c:choose>
                          		<c:when test="${lms eq null || lms eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${lms}</dt>
							    </c:otherwise>
                          	</c:choose>
                            <c:choose>
                          		<c:when test="${kakao eq null || kakao eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${kakao}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
					 <br/> <br/>
					 <div class="dis_table">
                        <dl class="dis_ftr">
                            <dt></dt>
                            <dt>미처리 건</dt>
                            <dt>응답대기</dt>
                        </dl>
					</div>
                    <div class="dis_table">
                        <dl class="dis_ftr">
                            <dt>SMS</dt>
                            <c:set var = "sum_0"/>
                            <c:set var = "sum_1"/>
							<c:forEach var="item" items="${search}">
								<c:if test="${item.realtime_type eq 'SMS'}">
									<c:if test="${item.realtime_status eq '0'}">
										<c:set var = "sum_0" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "sum_1" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${sum_0 eq null || sum_0 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${sum_0}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${sum_1 eq null || sum_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${sum_1}</dt>
							    </c:otherwise>
                          	</c:choose>
						</dl>
					</div>
					<div class="dis_table">
                        <dl class="dis_ftr">
                            <dt>LMS</dt>
                            <c:set var = "lms_0"/>
                            <c:set var = "lms_1"/>
							<c:forEach var="item" items="${search}">
								<c:if test="${item.realtime_type eq 'LMS'}">
									<c:if test="${item.realtime_status eq '0'}">
										<c:set var = "lms_0" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "lms_1" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${lms_0 eq null || lms_0 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${lms_0}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${lms_1 eq null || lms_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${lms_1}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
					<div class="dis_table">
                        <dl class="dis_ftr">
                            <dt>알림톡</dt>
                            <c:set var = "kakao_0"/>
                            <c:set var = "kakao_1"/>
							<c:forEach var="item" items="${search}">
								<c:if test="${item.realtime_type eq 'KAKAO'}">
									<c:if test="${item.realtime_status eq '1'}">
										<c:set var = "kakao_0" value = "${item.realtime_cnt}" />
									</c:if>
									<c:if test="${item.realtime_status eq '2'}">
										<c:set var = "kakao_1" value = "${item.realtime_cnt}" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:choose>
                          		<c:when test="${kakao_0 eq null || kakao_0 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${kakao_0}</dt>
							    </c:otherwise>
                          	</c:choose>
                          	<c:choose>
                          		<c:when test="${kakao_1 eq null || kakao_1 eq ''}">
							        <dt>0</dt>
							    </c:when>
							    <c:otherwise>
							        <dt>${kakao_1}</dt>
							    </c:otherwise>
                          	</c:choose>
                        </dl>
					</div>
                </div><!-- /.tbl_view -->
                
           	</section><!-- /.content -->
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/zebra_datepicker.js"></script>
<script src="js/common.js"></script>
<script>
$(document).ready(function(){
	
	
    
});

</script>
</body>
</html>