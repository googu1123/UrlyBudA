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
    <script type="text/javascript" src="js/validate.js"></script>
	<script type="text/javascript" src="js/textUtil.js"></script>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/jquery-ui-1.10.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script src="js/zebra_datepicker.js"></script>
	<script src="js/common.js"></script>
	<script src="js/paging.js"></script>
	
	<script type="text/javascript" language="javascript">
	$(document).ready(function()
	{
		var g_expires = ${group.expire};
		document.groupForm.expires.value = formatDate(g_expires);
		
		var g_idt = ${group.idt};
		var gIdt = new Date(g_idt);
		$("#g_idt").empty().html(gIdt.toLocaleString());

		boardMain.init();
	});
	
	
	function LogViewPop(gid, _id)
	{
		var popupX = (window.screen.width / 2) - (800 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height /2) - (500 / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		
		window.open('about:blank','logview','width=800,height=500, left='+ popupX + ',top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+'');
		
		
		var form = document.createElement("form");
	    var element1 = document.createElement("input");
	    var element2 = document.createElement("input");

	    form.method = "POST";
	    form.action = "logView.do";   
	 
	    element1.type="hidden";
	    element1.name="gid";
	    element1.value=gid;
	    form.appendChild(element1);  
		
	    element2.type="hidden";
	    element2.name="_id";
	    element2.value=_id;
	    form.appendChild(element2);

	    document.body.appendChild(form);
	    
	    form.target = "logview";
	    form.submit();
	    
	   	form.remove();
		
	}
	var boardMain = {
			init : function(){ 
				var _this = this;
				_this.btnEvent();
				_this.getBoardList(); 
			} 
	    	,btnEvent : function(){
	    		
	    		//Short URL 등록
	    		$('#shorturl_add').on('click',function(){
	    			$("#shortUrl_title").empty().html("생성");
	    			$("#_id").val('');
	    	        layer_popup('#layer','#urlForm');
	    		});
	    		
	    		$(document).on('click','.btnLog',function(){
	    			
	    			LogViewPop($(this).data("gid"), $(this).data("id"));
	    			
	    			/*
	    			var popupX = (window.screen.width / 2) - (800 / 2);
	    			// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	    			var popupY= (window.screen.height /2) - (500 / 2);
	    			// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
					
 					window.open('about:blank','logview','width=800,height=500, left='+ popupX + ',top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+'');
	    			
	    			
	    			var form = document.createElement("form");
	    		    var element1 = document.createElement("input");
	    		    var element2 = document.createElement("input");

	    		    form.method = "POST";
	    		    form.action = "logView.do";   
	    		 
	    		    element1.type="hidden";
	    		    element1.name="gid";
	    		    element1.value=$(this).data("gid");
	    		    form.appendChild(element1);  
					
	    		    element2.type="hidden";
	    		    element2.name="_id";
	    		    element2.value=$(this).data("id");
	    		    form.appendChild(element2);

	    		    document.body.appendChild(form);
	    		    
	    		    form.target = "logview";
	    		    form.submit();
	    		    
	    		   	form.remove();
	    		    */
	    		});
	    		
				$(document).on('click','#btnLogView',function(){
					LogViewPop("${group._id}","");
	    		});
				
				$(document).on('click','#btnStat',function(){

					var popupX = (window.screen.width / 2) - (800 / 2);
					// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

					var popupY= (window.screen.height /2) - (400 / 2);
					// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
					
					window.open('about:blank','statView','width=800,height=450, left='+ popupX + ',top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+'');
					
					var form = document.createElement("form");
				    var element1 = document.createElement("input");

				    form.method = "POST";
				    form.action = "statView.do";   
				 
				    element1.type="hidden";
				    element1.name="gid";
				    element1.value="${group._id}";
				    form.appendChild(element1);  
				    
				    document.body.appendChild(form);
				    
				    form.target = "statView";
				    form.submit();
				    
				   	form.remove();
	    		});
	    		
	    		//Short url 수정
	    		$(document).on('click','.btnDetail',function(){
	    	    	//console.info($(this).attr('id'));
	    	    	
	    	    	var url_id = $(this).attr('id');
	    	    	
	    	    	$.ajax({ 
	    				type:"POST",
	    				url: 'urls.do', 
	    				dataType: "json", 
	    				//data : "uid="+UID+"&limit="+LIMIT+"&pageNo="+pageNo,
	    				
	    				data :JSON.stringify({
	    					_id: url_id,
	    					limit : "1"
	    				}),
	    				contentType:"application/json; charset=UTF-8", 
	    				cache : false, 
	    				success : function(resData){
	    					var jsonObj = JSON.stringify(resData);
	    					var jsonData = JSON.parse(jsonObj);
	    					
	    					if(jsonData._id == url_id)
	    					{
	    						$("#shortUrl_title").empty().html("수정");
	    						
	    						$("#_id").val(jsonData._id);
	    						$("#longurl").val(jsonData.l);
	    						$("#expires").val(formatDate(jsonData.e));
	    						$("#authType").val(jsonData.a);
	    						$("#authKey").val(jsonData.p);
	    						$("#counts").val(jsonData.c);
	    						
	    						layer_popup('#layer','#urlForm');
	    					}else{
	    						alert('데이터 조회에 실패 하였습니다.\n관리자에게 문의하세요. ['+jsonData.result+']');
	    					}
	    						
	    				}, 
	    				/* ajax error 확인방법 */ 
	    				error : function(request,status,error){ 
	    					console.log(request); 
	    					console.log(status); 
	    					console.log(error); 
	    				} 
	    			});
	    	    	
	    	    });
	    		
	    		/* Short URL 클릭 */ 
	    		$(document).on('click','.url_td',function(){
	    			//console.info($(this).attr('id'));
	    			var sUrl = $(this).attr('id');
	    			window.open('http://tbroad.ecstel.co.kr/'+sUrl);
	    			
	    		}); 
	    		
	    		//달력
	    		$("#expires").Zebra_DatePicker({
	    	        first_day_of_week: 0,
	    	        direction: true
	    	    });
	    		
	    		$("#g_expires").Zebra_DatePicker({
	    	        first_day_of_week: 0,
	    	        direction: true
	    	    });
	    	    
	
	    		// 목록
	    		$("#btnList").on("click", function(){
	    			movePage({},"campaign.do");
	    		});
	    		
	    		// 캠페인 수정
	    		$("#btnUpdate").on("click",function(){

	   				var f = document.groupForm;
	   		    	
	   				/* if(f.authType.value==""){
	   		    		alert('인증방식을 입력해주세요.');	
	   		    		f.authType.focus();
	   		    		return false;
	   		    	} */
	   				
	   				if(f.counts.value==""){
	   		    		alert('Max Click 을 입력해주세요.');
	   		    		f.counts.focus();
	   		    		return false;
	   		    	}
	   				
	   				if(f.expires.value==""){
	   					alert('만료일을 입력해주세요.');	
	   		    		f.expires.focus();
	   		    		return false;
	   		    	}
	    			
	   				if(confirm('해당 캠페인을 수정하시겠습니까?'))
	    			{	    				
	   					//f.action = "campaignUpdate.do";
	   					//f.submit();
	   					
	   					$.ajax({ 
	   						type:"POST",
	   						url: 'campaignUpdate.do', 
	   						dataType: "json", 
	   						//data : "uid="+UID+"&limit="+LIMIT+"&pageNo="+pageNo,
	   						
	   						/* 
	   						var gid = f.gid.value;
	   						var uid = f.uid.value;
	   						var authType = f.authType.value;
	   						var counts = f.counts.value;
	   						var expires = f.expires.value;
	   						 */
	   						 
	   						data :JSON.stringify({
	   							gid: f.gid.value,
	   							uid: f.uid.value,
	   							expires: f.expires.value,
	   							authType : '${group.authType}',
	   							counts : f.counts.value
	   						}),
	   						contentType:"application/json; charset=UTF-8", 
	   						cache : false, 
	   						success : function(resData){
	   							var jsonObj = JSON.stringify(resData);
	   							var jsonData = JSON.parse(jsonObj);

	   							if(jsonData.result=='ok')
	   							{
	   								alert('캠페인정보 수정 하였습니다.');
	   								
	   							}else{
	   								alert('캠페인 수정에 실패하였습니다.\n관리자에게 문의하세요. ['+jsonData.result+']');
	   								//$('.dim-layer').fadeOut();
	   								return false;
	   							}
	   							
	   						}, 
	   						//ajax error 확인방법 
	   						error : function(request,status,error){ 
	   							console.log(request); 
	   							console.log(status); 
	   							console.log(error); 
	   						} 
	   					});
	   				}
	    			
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
	    			url: 'urlList.do', 
	    			dataType: "json", 
	    			//data : "uid="+UID+"&limit="+LIMIT+"&pageNo="+pageNo,
	    			data :JSON.stringify({
	    				uid: UID,
	    				limit: LIMIT,
	    				pageNo : pageNo,
	    				skip : skip,
	    				gid : "${group._id}"
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
	    						    	    				
	    	    				var expires = new Date(item.e);
	    	    				var idt = new Date(item.idt);
	    	    				
	    	    				var authType = "";
	    	    				
	    	    				switch(item.a)
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
	    	    				
	    						selectHtml.push('<tr>'); 
	    						selectHtml.push('<td class="url_td" id="'+item._id+'" style="cursor:pointer"><a href="#">'+item._id+'</a></td>'); 
	    						selectHtml.push('<td>'+item.l+'</td>'); 
	    						selectHtml.push('<td>'+authType+'</td>');
	    						selectHtml.push('<td>'+item.p+'</td>');
	    						selectHtml.push('<td>'+item.c+'</td>');
	    						selectHtml.push('<td>'+expires.toLocaleString()+'</td>'); 
	    						selectHtml.push('<td>'+idt.toLocaleString()+'</td>');
	    						selectHtml.push('<td><a id="'+item._id+'" class="btn btn-info btnLog btn-sm"  data-id="'+item._id+'" data-gid="'+item.gid+'">view</a></td>');
	    						selectHtml.push('<td><a id="'+item._id+'" class="btn btn-info btnDetail btn-sm" data-code="${item._id}" data-pidx="${item._id}">update</a></td>');
	    						selectHtml.push('</tr>'); }); 
	    				}else{ 
	    						selectHtml.push('<tr>'); 
	    						selectHtml.push('<td colspan="9">조회된 결과가 없습니다.</td>'); 
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
			
	    	if($('#longurl').val()==""){
	    		alert('원본 URL을 입력해주세요.');	
	    		$('#longurl').focus();
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
	    	
	    	if($('#authKey').val()==""){
	    		alert('인증키를 입력해주세요.');	
	    		$('#authKey').focus();
	    		return false;
	    	}
	    	
	    	if($('#counts').val()==""){
	    		alert('Max Click 을 입력해주세요.');	
	    		$('#counts').focus();
	    		return false;
	    	}
	    	
			var gid = $('#gid').val();
			var uid = "tsis";
			var longurl = $('#longurl').val();
			var expires = $('#expires').val();
			var counts = $('#counts').val();
			var authType = $('#authType').val();
			var authKey = $('#authKey').val();
			var _id = $('#_id').val();
	    	
	    	$.ajax({ 
				type:"POST",
				url: 'shortUrlSave.do', 
				dataType: "json", 
				//data : "uid="+UID+"&limit="+LIMIT+"&pageNo="+pageNo,
				
				data :JSON.stringify({
					gid: gid,
					uid: uid,
					longurl : longurl,
					expires: expires,
					authType : authType,
					authKey : authKey,
					counts : counts,
					_id : _id
				}),
				contentType:"application/json; charset=UTF-8", 
				cache : false, 
				success : function(resData){
					var jsonObj = JSON.stringify(resData);
					var jsonData = JSON.parse(jsonObj);

					if(jsonData.result=='400' || jsonData.result=='500')
					{
					
						alert('Short URL 등록(수정)에 실패하였습니다.\n관리자에게 문의하세요. ['+jsonData.result+']');
						//$('.dim-layer').fadeOut();
						return false;
						
					}else{
						//alert('Short URL 등록 성공하였습니다.');
						$('.dim-layer').fadeOut();
						$('#urlForm')[0].reset();
						boardMain.getBoardList(1);						
					}
					
				}, 
				/* ajax error 확인방법 */ 
				error : function(request,status,error){ 
					console.log(request); 
					console.log(status); 
					console.log(error); 
				} 
			});
	    	
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
                    <small>캠페인 설정 변경을 할 수 있습니다.</small>
                </h1>
                <ol class="breadcrumb">
                    <%@include file="./gnb/home.jsp" %>
                    <li><a href="campaignList.do"><i class="fa fa-bars"></i> 캠페인 관리</a></li>
                    <li class="active">캠페인 설정 변경</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="tbl_view">
                    <form name="groupForm">
                    	<input type="hidden" name="gid" value="${group._id}"/>
                    	<input type="hidden" name="uid" value="${group.uid}"/>
                        <div class="table-responsive">
                            <table class="table tbl_write">
                                <tbody>
                                    <tr>
                                        <th scope="row">그룹 ID</th>
                                        <td colspan="3">
                                        ${group._id}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">사용자 ID</th>
                                        <td colspan="3">
                                        ${group.uid}
                                        </td>
                                    </tr>
                                    <tr>
										<th scope="row">인증방식</th>
                                        <td>
                                        <%-- ${group.authType} --%>
                                        <%-- <input type="text" readonly name='authType' value='${group.authType}'> --%>
                                         <c:choose>
									         <c:when test = "${group.authType ==0}">
									            인증 제외
									         </c:when>
									         
									         <c:when test = "${group.authType ==1}">
									           생년월일
									         </c:when>
									         
									         <c:when test = "${group.authType ==2}">
									            핸드폰 끝 4자리
									         </c:when>
									         
									         <c:when test = "${group.authType ==3}">
									            상담사 (인증번호)
									         </c:when>
									         
									         <c:when test = "${group.authType ==4}">
									            ARS (인증번호)
									         </c:when>
									         
									         <c:otherwise>
									            -
									         </c:otherwise>
									      </c:choose>
                                        </td>                                        
                                        <th scope="row">Max Click</th>
                                        <td><input type="text" name='counts' value='${group.count}'></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">만료일 </th>
                                        <td><input type="text" id='g_expires' name='expires'></td>
                                        <th scope="row">등록일</th>
                                        <td><span id='g_idt'></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->
                        <div class="search_btn">
                        	<div style="float:left;margin: 10px 0px 30px;">
                            	<button type="button" id="btnLogView" class="btn btn-info  btn-sm"> Click Log </button>
                            	<button type="button" id="btnStat" class="btn btn-info  btn-sm"> 통 계</button>
                            </div>
                            <div style="float:right;margin: 10px 0px 30px;">
                            	<button type="button" id="btnUpdate" class="btn btn-info  btn-sm"> 캠페인 수정</button>
                            </div>
                        </div>
                        
                        <!-- <div class="table-responsive mart10">
							<table class="table tbl_list tbl_fixed">
								<tr>
									<td>*dfldfjdlj </td>
								</tr>
							</table>
						</div> -->
						<div class="table-responsive mart10" style="padding: 20px 0px 0px 0px;">
                            <table class="table tbl_list tbl_fixed">
                            	<colgroup>
                                   	<col style="width:100px;">
									<col style="width:*;">
									<col style="width:100px;">
									<col style="width:100px;">
									<col style="width:80px;">
									<col style="width:150px;">
									<col style="width:150px;">
									<col style="width:80px;">
									<col style="width:80px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                    	<th scope="col">Short URL</th>
                                        <th scope="col">Long URL</th>
                                        <th scope="col">인증 방식</th>
                                        <th scope="col">인증키</th>
                                        <th scope="col">Max Click</th> 
                                        <th scope="col">만료일</th>
                                        <th scope="col">등록일</th>
                                        <th scope="col">Log</th>
                                        <th scope="col">수정</th>
                                    </tr>
                                </thead>
                                <tbody id="boardList">
                                	<%-- <c:choose>
                                		<c:when test="${fn:length(metaValidList) > 0 }">
                                			<c:forEach var="valid" items="${metaValidList }" varStatus="status">
                                				<tr data-code="${valid.seq}" data-pidx="${valid.seq }">
			                                        <td>${valid.btch_key }</td>
			                                        <td>${valid.link_field }</td>
			                                        <td><input type="text" style="width:60px" name="link_limit" id="link_cnt" value="${valid.link_limit }" hname="" required="maxbyte" maxbyte="5"></td> 
			                                        <td><input type="text" style="width:60px" name="link_cnt" id="link_cnt" value="${valid.link_cnt }" hname="최대 접속수" required="maxbyte" maxbyte="5"></td>
			                                        <td>
			                                            <a href="#" class="btn btn-info btnUpdate btn-sm" data-link_cnt="${valid.link_cnt}" data-link_field="${valid.link_field}" data-seq="${valid.seq}" data-btch_key="${valid.btch_key}">수정</a>
			                                        </td>
			                                    </tr>
                                			</c:forEach>
                                		</c:when>
                                		<c:otherwise>
		                                    <tr>
		                                        <td colspan="5">등록된 내용이 없습니다.</td>
		                                    </tr>	                                			                                		
                                		</c:otherwise>
                                	</c:choose> --%>
                                </tbody>
                            </table>
                        </div>
                        <div class="text-center paging"><p class="txt_count text-orange" style="margin-right:5px;"><b>총 URL 수 : <span id='totalCount'></span></b></p></div>
                        <br>
                        <div id="paging" class="text-center paging"></div>
                        <div class="search_btn"  style="padding: 10px 0px 0px 0px;">
                            <button type="button" id="btnList" class="btn btn-info btn-sm">목록</button>
                            <button type="button" id="shorturl_add" class="btn btn-info  btn-sm">Short URL 등록</button>
                        </div>
                    </form>
                </div><!-- /.tbl_view -->
                
            </section><!-- /.content -->
            
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->
    
    <!-- URL 등록 BEGIN -->
    <div class="dim-layer">
		<div class="dimBg"></div>
	    <div id="layer" class="pop-layer">
			<div class="pop-container">
				<div><b>Short URL <span id='shortUrl_title'>생성</span></b></div>
				<div class="pop-conts">
					<!--content //-->
	                <p class="ctxt mb20">
						<form name="urlForm" id="urlForm" method="post">
						<input type="hidden" name="gid" id="gid" value="${group._id}">
						<input type="hidden" name="_id" id="_id">
						<div class="table-responsive">
                           <table class="table tbl_write">
                               <tbody>
                                   <tr>
                                       <th scope="row">원본 URL</th>
                                       <td>
                                           <input type="text" class="form-control" name="longurl" id="longurl" placeholder="원본 URL" value="">
                                       </td>
                                   </tr>
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
                                       <th scope="row">인증키</th>
                                       <td>
                                           <input type="text" class="form-control" name="authKey" id="authKey" placeholder="인증키" value="">
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
	<!-- URL 등록 END -->
	
</body>
</html>