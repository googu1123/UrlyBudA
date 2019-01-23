<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
    
    <!-- datepicker -->
    <link rel="stylesheet" href="css/zebra_datepicker_metallic.css">
    
    <!-- Theme style -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layer.css">
    <!--[if lt IE 9]>
        <script src="/js/html5shiv.js"></script>
        <script src="/js/respond.min.js"></script>
    <![endif]-->
    	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/jquery-ui-1.10.3.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>
	<script src="js/zebra_datepicker.js"></script>
	<script src="js/common.js"></script>
	<script src="js/paging.js"></script>
	

    <script type="text/javascript" language="javascript">
	
	$(document).ready(function(){
	    boardMain.init();
	    
	    $("#expires").Zebra_DatePicker({
	        first_day_of_week: 0,
	        direction: true
	    });
	});
	
    var boardMain = {
		init : function(){ 
			var _this = this;
			_this.btnEvent();
			_this.getBoardList(); 
		} 
    	,btnEvent : function(){
    		//등록
    	    //$(document).on('click','#group_add',function(){
    	    $('#group_add').on('click',function(){
    	        layer_popup('#layer','#groupForm');
    		});
    	    
    		/* 상세보기 이동 */ 
    		//$('.campaign_tr').on('click',function(){
    		$(document).on('click','.campaign_tr',function(){
    			console.info($(this).attr('id'));
    		
    			//var url = "campaignDetail.do"; 
    			//location.href = url;
    			
    			var form = document.createElement("form");
    		    var element1 = document.createElement("input"); 

    		    form.method = "POST";
    		    form.action = "campaignDetail.do";   
    		 
    		    element1.name="gid";
    		    element1.value=$(this).attr('id');
    		    form.appendChild(element1);  

    		    /* element2.value=pw;
    		    element2.name="pw";
    		    form.appendChild(element2); */

    		    document.body.appendChild(form);

    		    form.submit();
    			 
    		}); 
    	}
    	,getBoardList : function(no){ 
    		var pageNo = (no || 1); 
    		var skip = 0;
    		
    		if (pageNo>1){
    			skip = (pageNo-1)*LIMIT;
    		}

    		$.ajax({ 
    			type:"POST",
    			url: 'campaignList.do', 
    			dataType: "json", 
    			//data : "uid="+UID+"&limit="+LIMIT+"&pageNo="+pageNo,
    			data :JSON.stringify({
    				uid: UID,
    				limit: LIMIT,
    				pageNo : pageNo,
    				skip : skip
    			}),
    			contentType:"application/json; charset=UTF-8", 
    			cache : false, 
    			success : function(resData){
    				var jsonObj = JSON.stringify(resData);
					var jsonData = JSON.parse(jsonObj);
					var item = resData.data;
					var selectHtml=[]; 
					var len = item.length;
					var totalCount = resData.count;
    				var page_boardList = Paging(totalCount, LIMIT, PAGEGROUPCNT ,pageNo, "boardList"); //공통 페이징 처리 함수 호출
    				
					//데이타 그리기 
    				if(len > 0){ 
    					$(item).each(function(i, item){
    						
							var expires = new Date(item.expire);
    	    				var idt = new Date(item.idt);
    	    				var authType = "";
    	    				
    	    				switch(item.authType)
    	    				{
    	    					case "0" : authType = "인증 제외"; 
    	    					break;
    	    					
    	    					case "1" : authType = "생년월일"; 
    	    					break;
    	    					
    	    					case "2" : authType = "핸드폰 끝 4자리"; 
    	    					break;
    	    					
    	    					case "3" : authType = "상담사(인증번호)"; 
    	    					break;
    	    					
    	    					case "4" : authType = "ARS(인증번호)"; 
    	    					break;
    	    					
    	    					default : authType = "-";
    	    					break;
    	    					
    	    				}
    	    				
    						selectHtml.push('<tr class="campaign_tr" id="'+item._id+'" style="cursor:pointer;">'); 
    						selectHtml.push('<td>'+item._id+'</td>'); 
    						selectHtml.push('<td class="boardTitle" id="'+item._id+'">'+(item.uid || "-")+'</td>'); 
    						selectHtml.push('<td>'+expires.toLocaleString()+'</td>'); 
    						selectHtml.push('<td>'+authType+'</td>');
    						selectHtml.push('<td>'+item.count+'</td>');
    						selectHtml.push('<td>'+idt.toLocaleString()+'</td>');
    						selectHtml.push('</tr>'); }); 
    				}else{ 
    						selectHtml.push('<tr>'); 
    						selectHtml.push('<td colspan="6">조회된 결과가 없습니다.</td>'); 
    						selectHtml.push('</tr>'); 
    				} 
    				
    				$("#boardList").empty().html(selectHtml.join('')); 
    				
    				//총카운트 표기
    				$("#totalCount").empty().html(totalCount);
    				
    				//페이징 그리기 
    				$("#paging").empty().html(page_boardList);
    				
    				
    			}, 
    				
    			/* ajax error 확인방법 */ 
   				error : function(request,status,error){ 
   					console.log(request); 
   					console.log(status); 
   					console.log(error); 
   				} 
    		});
    	} 
    } 
   
    var goPaging_boardList = function(cPage){
    	boardMain.getBoardList(cPage); // boardAdmin 개체의 getBoardList 함수를 다시 호출 
    };	
    
    $(document).on('click','.btn-layerSubmit',function(){
		
    	var f = document.groupForm;
    	if($('#gid').val()==""){
    		alert('그룹 ID를 입력해주세요.');	
    		$('#gid').focus();
    		return false;
    	}
    	
    	if($('#expires').val()==""){
    		alert('만료일을 입력해주세요.');	
    		$('#expires').focus();
    		return false;
    	}
    	
    	if($('#authType').val()==""){
    		alert('인증방식을 입력해주세요.');	
    		$('#authType').focus();
    		return false;
    	}
    	
    	if($('#counts').val()==""){
    		alert('Max Click 을 입력해주세요.');	
    		$('#counts').focus();
    		return false;
    	}
    	
		var gid = $('#gid').val();
		var uid = "tsis";
		var expires = $('#expires').val();
		var counts = $('#counts').val();
		var authType = $('#authType').val();
    	
    	$.ajax({ 
			type:"POST",
			url: 'campaignSave.do', 
			dataType: "json", 
			//data : "uid="+UID+"&limit="+LIMIT+"&pageNo="+pageNo,
			
			data :JSON.stringify({
				gid: gid,
				uid: uid,
				expires: expires,
				authType : authType,
				counts : counts
			}),
			contentType:"application/json; charset=UTF-8", 
			cache : false, 
			success : function(resData){
				var jsonObj = JSON.stringify(resData);
				var jsonData = JSON.parse(jsonObj);

				if(jsonData.result=='OK')
				{
					//alert('캠페인 등록 성공하였습니다.');
					$('.dim-layer').fadeOut();
					$('#groupForm')[0].reset();
					//location.href='campaign.do';
					boardMain.getBoardList(1);
					
					
				}else{
					alert('캠페인 등록에 실패하였습니다.\n관리자에게 문의하세요. ['+jsonData.result+']');
					//$('.dim-layer').fadeOut();
					return false;
				}
				
			}, 
			/* ajax error 확인방법 */ 
			error : function(request,status,error){ 
				console.log(request); 
				console.log(status); 
				console.log(error); 
			} 
		});
    	
    	/* 
    	f.action = "campaignSave.do";
    	f.submit();
    	
		return false; 
		*/
    });
    		
    
    </script>
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
                   캠페인 관리<br>
                    <small>캠페인을 관리 할수있습니다. </small>
                </h1>
                <ol class="breadcrumb">
                     <%@include file="./gnb/home.jsp" %>
                    <li class="active">캠페인 관리</li>
                    <li class="active">캠페인 목록</li>
                </ol>
            </section>

            <!-- Main content -->
            <form action="campaignList.do" method="post"  id="mainForm">
           	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }"/>
           	<input type="hidden" name="thisPage" id="thisPage" value="${nowPage}"/>
            <section class="content">
                <div class="list_bot">
					<div class="row">
						<div class="col-xs-6"></div>
                           <div class="col-xs-6 text-right">
                               <div class="form-inline">
                               <button type="button" id="group_add" class="btn btn-info btnDetail btn-sm">등록</button>
                                   <%-- <select class="form-control" id="recordCount" name="recordCount">
                                       <option value="5" <c:if test="${recordCount eq '5'}">selected</c:if>>5줄 보기</option>
									<option value="10" <c:if test="${recordCount eq '10'}">selected</c:if>>10줄 보기</option>
									<option value="20" <c:if test="${recordCount eq '20'}">selected</c:if>>20줄 보기</option>
									<option value="30" <c:if test="${recordCount eq '30'}">selected</c:if>>30줄 보기</option>
									<option value="40" <c:if test="${recordCount eq '40'}">selected</c:if>>40줄 보기</option>
									<option value="50" <c:if test="${recordCount eq '50'}">selected</c:if>>50줄 보기</option>
                                   </select> --%>
                               </div>
                           </div>
					</div>
                    <div class="table-responsive mart10">
                        <table class="table tbl_list tbl_fixed">
                        	<colgroup>
								<col style="width:150px;">
								<col style="width:200px;">
								<col style="width:200px;">
								<col style="width:200px;">
								<col style="width:100px;">
								<col style="*;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">그룹 ID</th>
                                    <th scope="col">사용자 ID</th>
                                    <th scope="col">만료일</th>
                                    <th scope="col">인증 방식</th>
                                    <th scope="col">Max Click</th>
                                    <th scope="col">등록일</th>
                                </tr>
                            </thead>
                            <!-- ************* 1번영역 ***************** -->
                            <tbody id="boardList"></tbody>
                        </table>
                    </div><!-- /.table-responsive -->
                    <div class="text-center paging"><p class="txt_count text-orange" style="margin-right:5px;"><b>총 캠페인 : <span id='totalCount'></span></b></p></div>
                    <br>
                    <div id="paging" class="text-center paging"></div>
				</div>	
			</section><!-- /.content -->
	        </form>
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->
    <div class="dim-layer">
		<div class="dimBg"></div>
	    <div id="layer" class="pop-layer">
			<div class="pop-container">
				<div><b>캠페인 등록</b></div>
				<div class="pop-conts">
					<!--content //-->
	                <p class="ctxt mb20">
						<form name="groupForm" id="groupForm" method="post">
						<div class="table-responsive">
                           <table class="table tbl_write">
                               <tbody>
                                   <tr>
                                       <th scope="row">그룹 ID</th>
                                       <td>
                                           <input type="text" class="form-control" name="gid" id="gid" placeholder="그룹ID" value="">
                                       </td>
                                   </tr>
                                   <!-- <tr>
                                       <th scope="row">사용자 ID</th>
                                       <td>
                                           <input type="text" class="form-control" name="uid" placeholder="사용자 ID" value="">
                                       </td>
                                   </tr> -->
                                   <tr>
                                       <th scope="row">만료일</th>
                                       <td>
                                           <input type="text" class="form-control input_datebox" name="expires" id="expires" placeholder="만료일" value="">
                                       </td>
                                   </tr>
                                   <tr>
                                       <th scope="row">인증방식</th>
                                       <td>
                                           <!-- <input type="text" class="form-control" name="authType" id="authType" placeholder="인증방식" value=""> -->
                                           <select name="authType" id="authType">
                                           	<option value="0">인증 제외</option>
                                           	<option value="1">생년월일</option>
                                           	<option value="2">핸드폰 끝 4자리</option>
                                           	<option value="3">상담사 (인증번호)</option>
                                           	<option value="4">ARS (인증번호)</option>
                                           </select>
                                       </td>
                                   </tr>
                                   <tr>
                                       <th scope="row">Max Click</th>
                                       <td>
                                           <input type="text" class="form-control" name="counts" id="counts" placeholder="Max Click" value="">
                                       </td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                       </form>
	                </p>
	
	                <div class="btn-r">
	                    <a href="#" class="btn-layerSubmit">Submit</a>
	                    <a href="#" class="btn-layerClose">Close</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>