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
    		
    		$('#btnClose').on('click',function(){
    			window.close();
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
    			url: 'logViewList.do', 
    			dataType: "json", 
    			data :JSON.stringify({
    				gid		: "${gid}",
    				uid		: UID,
    				limit	: LIMIT,
    				pageNo 	: pageNo,
    				skip 	: skip,
    				s    	: "${_id}"
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
    						
    	    				var idt = new Date(item.idt);
    	    				
    						selectHtml.push('<tr>'); 
    						selectHtml.push('<td>'+item._id+'</td>'); 
    						selectHtml.push('<td>'+(item.gid || "-")+'</td>');
    						selectHtml.push('<td>'+(item.s || "-")+'</td>');
    						selectHtml.push('<td>'+idt.toLocaleString()+'</td>'); 
    						selectHtml.push('<td>'+item.code+'</td>');
    						selectHtml.push('<td>'+item.ip+'</td>');
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
    </script>
</head>
<body class="skin-blue">
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <aside class="right-side">                
            <section class="content-header">
                <h1>
					<b>Click Log View 
					<span class="txt_count text-orange">
					<c:choose>
						
						<c:when test="${empty _id}">
                   		(${gid})
                   		</c:when>
                   		
                   		<c:otherwise>
                   		(${_id})
                   		</c:otherwise>
                   		
					</c:choose>
					</span>
					</b>
                </h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="list_bot">
                    <div class="table-responsive mart10">
                        <table class="table tbl_list tbl_fixed">
                        	<colgroup>
								<col style="width:150px;">
								<col style="width:100px;">
								<col style="width:100px;">
								<col style="width:140px;">
								<col style="width:100px;">
								<col style="width:100px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">Log ID</th>
                                    <th scope="col">그룹 ID</th>
                                    <th scope="col">Short URL</th>
                                    <th scope="col">접속일</th>
                                    <th scope="col">Code</th>
                                    <th scope="col">접속IP</th>
                                </tr>
                            </thead>
                            <!-- ************* 1번영역 ***************** -->
                            <tbody id="boardList"></tbody>
                        </table>
                    </div><!-- /.table-responsive -->
                    <div class="text-center paging"><p class="txt_count text-orange" style="margin-right:5px;"><b>총 클릭 카운트 : <span id='totalCount'></span></b></p></div>
                    <div id="paging" class="text-center paging"></div>
                    <div class="search_btn"  style="padding: 0px 0px 0px 0px;">
                    <button type="button" id="btnClose" class="btn btn-info btn-sm">Close</button>
                    </div>
				</div>	
			</section><!-- /.content -->
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->
</body>
</html>