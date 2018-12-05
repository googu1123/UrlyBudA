
function textCounter(field, countField, maxLimit){
	var temp_str = field.value;
	var temp_len = getByte_length(temp_str);
	
	var countFieldId = document.getElementById(countField);
	if (countFieldId != undefined) {
		document.getElementById(countField).innerHTML = "(" + temp_len + "/" + maxLimit + " Bytes)";
	}
	
	if (temp_len > maxLimit) {
		alert(maxLimit + " Bytes를 초과할 수 없습니다.");
		
		temp_str = textSubstringByte(temp_str, maxLimit);
		field.value = temp_str;
		
		if (countFieldId != undefined) {
			document.getElementById(countField).innerHTML = "(" + getByte_length(temp_str) + "/" + maxLimit + " Bytes)";
		}
		field.focus();
	}//if
}

function textSubstringByte(str, maxLimit) {
	var temp_str = str.substring(0, maxLimit);
	var temp_len = getByte_length(temp_str);
	if (temp_len > maxLimit) {
		temp_str = temp_str.substring(0, temp_str.length -2);
		return textSubstringByte(temp_str, maxLimit);
	}
	return temp_str;
}

function getByte_length(str){
	var resultSize = 0;
	if (str == null) {
		return 0;
	}
	for (var i = 0; i < str.length; i++){
		var c = escape(str.charAt(i));
		if (c.length == 1){
			resultSize ++;
		} else if (c.indexOf("%u") != -1) {
			resultSize += 2;
		} else if (c.indexOf("%") != -1) {
			resultSize += c.length/3;
		}
	}
	return resultSize;
}