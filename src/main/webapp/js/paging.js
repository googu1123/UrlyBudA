
var UID = 'tsis';
var LIMIT = '10';
var PAGEGROUPCNT = '5';
	
Paging = function(totalCnt, dataSize, pageSize, pageNo, token)
{ 
	totalCnt = parseInt(totalCnt);	// 전체레코드수 
	dataSize = parseInt(dataSize); // 페이지당 보여줄 데이타수 
	pageSize = parseInt(pageSize); // 페이지 그룹 범위 1 2 3 5 6 7 8 9 10 
	pageNo = parseInt(pageNo); // 현재페이지 
	
	var html = new Array(); 
	if(totalCnt == 0){ 
		return ""; 
	}
	
	// 페이지 카운트 
	var pageCnt = totalCnt % dataSize;
	
	if(pageCnt == 0){ 
		pageCnt = parseInt(totalCnt / dataSize); 
	}else{ 
		pageCnt = parseInt(totalCnt / dataSize) + 1; 
	}
	
	var pRCnt = parseInt(pageNo / pageSize); 
	if(pageNo % pageSize == 0){ 
		pRCnt = parseInt(pageNo / pageSize) - 1; 
	} 
	
	html.push('<ul class="pagination pagination-sm">');
	
	//이전 화살표 
	if(pageNo > pageSize){ 
		var s2; 
		if(pageNo % pageSize == 0){ 
			s2 = pageNo - pageSize; 
		}else{ 
			s2 = pageNo - pageNo % pageSize; 
		} 
		html.push('<li><a href=javascript:goPaging_' + token + '("'); html.push(s2); html.push('");>'); 
		html.push('◀ '); html.push("</a></li>"); 
	}else{ 
		html.push('<li class="disabled"><a href="#">\n'); 
		html.push('◀ '); 
		html.push('</a></li>'); 
	} 
	
	//paging Bar 
	for(var index=pRCnt * pageSize + 1;index<(pRCnt + 1)*pageSize + 1;index++){ 
		if(index == pageNo)
		{ 
			html.push('<li class="active"><a href="#">'); 
			html.push(index); 
			html.push('</a></li>'); 
		}else{ 
			html.push('<li><a class="goPage" href=javascript:goPaging_' + token + '("'); 
			html.push(index); html.push('");>'); 
			html.push(index); html.push('</a></li>'); 
		} 
		
		if(index == pageCnt){
			break; 
		}//else html.push(' | '); 
	} 
	
	//다음 화살표 
	if(pageCnt > (pRCnt + 1) * pageSize){ 
		html.push('<li><a href=javascript:goPaging_' + token + '("'); 
		html.push((pRCnt + 1)*pageSize+1); 
		html.push('");>'); 
		html.push(' ▶'); 
		html.push('</a></li>'); 
	}else{ 
		html.push('<li class="disabled"><a href="#">'); 
		html.push(' ▶'); 
		html.push('</a></li>'); 
	}
	
	html.push('</ul>');
	
	return html.join(""); 
}