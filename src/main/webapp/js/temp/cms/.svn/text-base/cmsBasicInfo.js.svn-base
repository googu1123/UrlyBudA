$(document).ready(function(){
	
	$("#cmsInfoUpdate").on("click", function() {
		if(confirm("CMS 기본정보를 저장하시겠습니까?")) {
			$("form").attr({action:"/CMS/main/"+$(this).data("url"), method:"post"}).submit();
		}
	});
	

});



function imageCheck(obj) {
	// 선택파일의 경로를 분리하여 확장자를 구합니다.
	var pathPoint = obj.lastIndexOf('.'); // lastIndexOf : 검색한 문자열이 처음으로 나타나는 위치를 반환
	var filePoint = obj.substring(pathPoint+1,obj.length);
	var fileType = filePoint.toLowerCase();

	// 확장자가 이미지 파일이면 preview에 보여줍니다.
	if(fileType=='jpg' || fileType=='gif' || fileType=='png' || fileType=='jpeg' || fileType=='bmp') {
		//console.log(fileType);
		if(fileType=='bmp') {
			alert("BMP 파일은 업로드 할 수 없습니다.");
			return false;
		}
	}
	else {
		alert("이미지 파일만 업로드 하실수 있습니다.");
		return false;
	}
	
	$("form").attr({action:"/CMS/main/cmsImageUpload.tsis", method:"post"}).submit();

}
