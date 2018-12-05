
/**
* project: lib.validate.js ver 0.7.0
* description: 폼 체크, 값 표준화
*/

String.prototype.hasFinalConsonant = function(str) {
	str = this != window ? this : str;
	var strTemp = str.substr(str.length-1);
	return ((strTemp.charCodeAt(0)-16)%28!=0);
};

function validate(form, fields) {
	var lah = new FormChecker(form);
	if (fields) lah.setCheckFields(fields);
	var wmf = lah.go();
	if(wmf == true) {
		return true;
	} else {
		if (wmf.replace(/^\s+/, "").replace(/\s+$/, "")) alert(lah.getErrorMessage());
		var fn = eval("form."+wmf);
		if(fn.name != undefined) {
			try {
				fn.focus();
			} catch(e) {}
		}
		return false;
	}
};

function josa(str,tail) {
	return (str.hasFinalConsonant()) ? tail.substring(0,1) : tail.substring(1,2);
};

FormChecker = function(form) {
	this.FUNC_MAP = {
		email	 : "this.func_email",
		emailprefix	 : "this.func_email_prefix",
		hangul	: "this.func_hangul",
		engonly   : "this.func_engonly",
		number	: "this.func_number",
		numeng   : "this.func_numeng",
		userid	: "this.func_userid",
		passwd	: "this.func_passwd",
		residentno: "this.func_residentno",
		jumin	 : "this.func_jumin",
		juminfore : "this.func_juminforeignernoAge",
		foreignerno:"this.func_foreignerno",
		bizno	 : "this.func_bizno",
		phone	 : "this.func_phone",
		homephone : "this.func_homephone",
		handphone : "this.func_handphone",
		yyyymmdd  : "this.func_date",
		url 	  : "this.func_url"
	};
	this.ERR_MSG = {
		system   : "FormChecker Error: ",
		required : "반드시 입력하셔야 합니다.",
		requirenum:"이 항목들 중에 {requirenum}개 이상의 항목을 입력하셔야  합니다.",
		notequal : "입력된 내용이 서로 일치하지 않습니다.",
		invalid  : "입력된 내용이 형식에 올바르지 않습니다.",
		minbyte  : "입력된 내용의 길이가 {minbyte}자 이상이어야 합니다.",
		fixbyte  : "입력된 내용의 길이가 {fixbyte}자이어야 합니다.",
		maxbyte  : "입력된 내용의 길이가 {maxbyte}자를 초과할 수 없습니다.",
		mincheck : "{mincheck}개의 항목이상으로 선택하세요.",
		maxcheck : "{maxcheck}개의 항목이하로 선택하세요.",
		minselect: "{minselect}개의 항목이상으로 선택하세요.",
		maxselect: "{maxselect}개의 항목이하로 선택하세요.",
		imageonly: "이미지 파일만 첨부할 수 있습니다.",
		excelonly: "엑셀 파일만 첨부할 수 있습니다.",
		checkfile: "업로드할 수 없는 파일형식입니다.",
		inputtag : "중에 허용되지 않는 태그가 있습니다.\n\n허용하지 않는 태그 : script,a,frame,iframe,object,\napplet,param,embed,input,xml,bgsound,area,link"
	};
	this.ERR_DO = {
		text   : "select focus",
		select : "focus",
		check  : "focus",
		radio  : "focus",
		file   : "focus",
		hidden : ""
	};
	this.ERR_SYS = '_SYSERR_';
	this.fields = form.elements;
	this.form = form;
	this.errMsg = "";
};

FormChecker.prototype.setForm = function(form) {
	this.form = form;
};

FormChecker.prototype.setFunc = function(map, func) {
	if (typeof(this.FUNC_MAP[map]) == "string") return;
	this.FUNC_MAP[map] = func;
};

FormChecker.prototype.setCheckFields = function(fields) {
	this.fields = [];
	// 2015-10-20 필드 지정시 중복된 네임이 배열로 들어와 처리 안되는 문제 수정
	if(typeof(fields) == 'string'){
		var fields = this.form.elements[fields];
		if(fields && (fields.constructor == Array || fields.constructor == window.RadioNodeList || fields.constructor == window.HTMLCollection)){
			this.fields = fields;
		}
		else
			this.fields = [fields];
	}
	// if(typeof(fields) == 'string')
	//	 this.fields = [this.form.elements[fields]];
	else
		for(var i=0, s=fields.length; i<s; i++)
			this.fields[this.fields.length] = this.form.elements[fields[i]];
};

FormChecker.prototype.setUnCheckFields = function(fields) {
	this.fields = [];
	var _isUnCheckEl;

	if(typeof(fields) == 'string')
		fields = [fields];
	for (var i=0, s=this.form.elements.length; i<s; i++) {
		_isUnCheckEl = false;
		for (var j=0, t=fields.length; j<t; j++) {
			if (this.form.elements[i] == this.form.elements[fields[j]]) {
				_isUnCheckEl = true;
				break;
			}
		}
		if (!_isUnCheckEl) this.fields[this.fields.length] = this.form.elements[i];
	}
};

FormChecker.prototype.setParam = function(el, name, value) {
	el.setAttribute(name, value);
};

FormChecker.prototype.delParam = function(el, name) {
	el.removeAttribute(name);
};

FormChecker.prototype.go = function() {
	for (var i=0,s=this.fields.length; i<s; i++) {
		var el = this.fields[i];

		if (!this.isValidElement(el)) continue;

		var elType = this.getType(el);
		var trim = el.getAttribute("TRIM");
		var required = el.getAttribute("REQUIRED");
		if(el.required)
			required = "required";
		else
			required = null;
		var requirenum = el.getAttribute("REQUIRENUM");
		var minbyte = parseInt(el.getAttribute("MINBYTE"),10);
		var fixbyte = parseInt(el.getAttribute("FIXBYTE"),10);
		var maxbyte = parseInt(el.getAttribute("MAXBYTE"),10);
		var mincheck = parseInt(el.getAttribute("MINCHECK"),10);
		var maxcheck = parseInt(el.getAttribute("MAXCHECK"),10);
		var minselect = parseInt(el.getAttribute("MINSELECT"),10);
		var maxselect = parseInt(el.getAttribute("MAXSELECT"),10);
		var option = el.getAttribute("OPTION");
		var match = el.getAttribute("MATCH");
		var span = el.getAttribute("SPAN");
		var glue = el.getAttribute("GLUE");
		var pattern = el.getAttribute("PATTERN");
		var imageonly = el.getAttribute("IMAGEONLY");
		var excelonly = el.getAttribute("EXCELONLY");
		var checkfile = el.getAttribute("CHECKFILE");

		if (trim != null && (elType == "text" || elType == "hidden")) {
			switch (trim) {
			case "trim":
				el.value = el.value.replace(/^\s+/, "").replace(/\s+$/, "");
				break;
			case "compress":
				el.value = el.value.replace(/\s+/, "");
				break;
			case "ltrim":
				el.value = el.value.replace(/^\s+/, "");
				break;
			case "rtrim":
				el.value = el.value.replace(/\s+$/, "");
				break;
			}
		}

		if (el.tagName == "TEXTAREA") {
			if (this.checkHtmlTag(el,elType)) {
				return this.raiseError(el, "inputtag", this.getName(el));
			}
		}
		var elEmpty = this.isEmpty(el, elType);

		if (required != null) {
			if (required == "required") {
				if (elEmpty) {
					return this.raiseError(el, "required");
				}
			} else {
				requirenum = parseInt(requirenum, 10);
				var _num = 0;
				var _name = [];
				if (requirenum > 0) {
					for (var j=0; j<this.form.elements.length; j++) {
						var _el = this.form.elements[j];
						if (required == _el.getAttribute("REQUIRED")) {
							if(!this.isEmpty(_el, this.getType(_el))) _num++;
							_name[_name.length] = this.getName(_el);
						}
					}
					if(_num < requirenum)
						return this.raiseError(el, "requirenum", _name.join(", "));
				}
			}
		}
		if(fixbyte > 0 && elType == "text") {
			var _fixtmp = el.value;
			var _fixbyte = el.value.length;
			if(_fixbyte > 0) {
				for (j=0; j<_fixtmp.length; j++) {
					if (_fixtmp.charCodeAt(j) > 128) _fixbyte++;
				}
				if (_fixbyte != fixbyte) return this.raiseError(el, "fixbyte");
			}
		}
		if ((minbyte > 0 || maxbyte > 0) && (elType == "text" || elType == "hidden")) {
			var _tmp = el.value;
			var _len = el.value.length;
			for (j=0; j<_tmp.length; j++) {
				if (_tmp.charCodeAt(j) > 128) _len++;
				// 한글 3바이트로 처리
				//if (_tmp.charCodeAt(j) > 128) _len += 2;
			}
			if (minbyte > 0 && _len < minbyte) return this.raiseError(el, "minbyte");
			if (maxbyte > 0 && _len > maxbyte) return this.raiseError(el, "maxbyte");
		}
		if (option != null && !elEmpty && elType != "file") {
			var _options = option.split(" ");
			for (var j in _options) {
				/* CrossEditor 생성자 호출시 option에 아래 내역 주입으로 인한 소스 추가 : 2013.09.26(목) */
				if( j == "ce_adG" || j == "ce_atE" ) continue;
				if(isNaN(Number(j))) continue;
				var _func = eval(this.FUNC_MAP[_options[j]]);
				if (span != null) {
					var _value = [];
					for (var k=0; k<parseInt(span,10); k++) {
						try {
							_value[k] = this.fields[i+k].value;
						} catch (e) {
							return this.raiseError(this.ERR_SYS,  (i+k) +"th Element is not found.");
						}
					}
					try {
						var _result = _func(el, _value.join(glue == null ? "" : glue));
					} catch (e) {
						return this.raiseError(this.ERR_SYS,  "function map '"+ _options[j] +"' is not exist.");
					}
					if (_result !== true) return this.raiseError(el, _result);
				} else {
					try {
						var _result = _func(el);
					} catch (e) {
						return this.raiseError(this.ERR_SYS,  "function map '"+ _options[j] +"' is not exist.");
					}
					if (_result !== true) return this.raiseError(el, _result);
				}
			}
		}
		if (match != null && elType != "file") {
			if (typeof this.form.elements[match] == "undefined")
				return this.raiseError(this.ERR_SYS, "Element '"+ match +"' is not found.");
			else if (el.value != this.form.elements[match].value)
				return this.raiseError(el, "notequal");
		}
		if (pattern != null && !elEmpty && elType != "file") {
			try {
				pattern = new RegExp(pattern);
			} catch (e) {
				return this.raiseError(this.ERR_SYS, "Invalid Regular Expression '"+ pattern +"'");
			}
			if (!pattern.test(el.value)) return this.raiseError(el, "invalid");
		}
		if ((mincheck > 0 || maxcheck > 0) && elType == "check") {
			var _checks = this.form.elements[(el.name||el.id)];
			var _num = 0;
			if (typeof _checks.length != "undefined") {
				for (var j=0; j<_checks.length; j++) {
					if (_checks[j].checked) _num++;
				}
			} else {
				if (_checks.checked) _num++;
			}
			if (mincheck > 0 && _num < mincheck) return this.raiseError(el, "mincheck");
			if (maxcheck > 0 && _num > maxcheck) return this.raiseError(el, "maxcheck");
		}
		if ((minselect > 0 || maxselect > 0) && elType == "multiselect") {
			var _num = 0;
			for (var j=0; j<el.options.length; j++) {
				if (el.options[j].selected) _num++;
			}
			if (minselect > 0 && _num < minselect) return this.raiseError(el, "minselect");
			if (maxselect > 0 && _num > maxselect) return this.raiseError(el, "maxselect");
		}
		if (imageonly != null && elType == "file") {
			var fn = el.value;
			if (fn != "") {
				var dotIndex = fn.lastIndexOf(".");
				var ext = fn.substring(dotIndex+1).toLowerCase();
				if(ext != "jpg" && ext != "jpeg" && ext != "gif" && ext != "png")
					return this.raiseError(el, "imageonly");
			}
		}
		if (excelonly != null && elType == "file") {
			var fn = el.value;
			if (fn != "") {
				var dotIndex = fn.lastIndexOf(".");
				var ext = fn.substring(dotIndex+1).toLowerCase();
				if(ext != "xlsx" && ext != "xls")
					return this.raiseError(el, "excelonly");
			}
		}

		if (checkfile != null && elType == "file") {
			var fn = el.value;
			if (fn != "") {
				var dotIndex = fn.lastIndexOf(".");
				var ext = fn.substring(dotIndex+1).toLowerCase();
				if(ext == "java" || ext == "jsp" || ext == "class" || ext == "asp" || ext == "php" || ext == "php3" || ext == "inc" || ext == "js" || ext == "htc")
					return this.raiseError(el, "checkfile");
			}
		}
	}
	return true;
};

FormChecker.prototype.isValidElement = function(el) {
	return (el.name||el.id) && el.tagName.match(/^input|select|textarea$/i) && !el.disabled;
};

FormChecker.prototype.isEmpty = function(el, type) {
	switch (type) {
	case "file": case "text": case "hidden":
		if (el.value == null || el.value == "") return true;
		break;
	case "select": case "multiselect":
		if (el.selectedIndex == -1 || el[el.selectedIndex].value == null ||
				el[el.selectedIndex].value == "")
			return true;
		break;
	case "check": case "radio":
		var elCheck = this.form.elements[(el.name||el.id)];
		var elChecked = false;
		if (typeof elCheck.length != "undefined") {
			for (var j=0; j<elCheck.length; j++) {
				if (elCheck[j].checked == true) elChecked = true;
			}
		} else {
			if (elCheck.checked == true) elChecked = true;
		}
		if (elChecked == false) return true;
		break;
	}
	return false;
};

FormChecker.prototype.getType = function(el) {
	switch (el.tagName.toLowerCase()) {
	case "select":
		return el.multiple == true ? "multiselect" : "select";
	case "textarea": return "text";
	case "input":
		switch (el.type.toLowerCase()) {
		case "radio": return "radio";
		case "checkbox": return "check";
		case "file": return "file";
		case "text": case "password": case "number": return "text";
		case "hidden": return "hidden";
		}
		break;
	}
};

FormChecker.prototype.checkHtmlTag = function(el, elType) {
	var regex = /<(?=script|a|frame|iframe|object|applet|param|embed|input|xml|bgsound|area|link)/i;
	var regex2 = /<img.+\son.+\=.+>/i;
	
	if (el.value.match(regex) != null || el.value.match(regex2) != null) {
		return true;
	}
	return false;
};

FormChecker.prototype.raiseError = function(el, type, elName) {
	if (el == this.ERR_SYS) {
		this.errMsg = this.ERR_MSG["system"] + type;
		return false;
	}
	var pattern = /\{([a-zA-Z0-9_]+)\}/i;
	var msg = this.ERR_MSG[type] ? this.ERR_MSG[type] : type;
	var elType = this.getType(el);
	var elNamex = elName ? elName : this.getName(el);
	var errDo = el.getAttribute("ERRDO") ? el.getAttribute("ERRDO") : this.ERR_DO[elType];
	var _errDos = errDo ? errDo.split(" ") : [];

	if (el.getAttribute("ERRMSG") != null) msg = el.getAttribute("ERRMSG");
	if (pattern.test(msg) == true) {
		while (pattern.exec(msg)) msg = msg.replace(pattern, el.getAttribute(RegExp.$1));
	}
	this.errMsg = elNamex + josa(elNamex,"은는")+" "+ msg +"\n";
/*
	for (var i in _errDos) {
		switch (_errDos[i]) {
		case "delete": el.value = ""; break;
		case "select": el.select(); break;
		case "focus":  el.focus(); break;
		}
	}
	*/
	// $(el).invalid();
	return (el.name||el.id);
};

FormChecker.prototype.getErrorMessage = function() {
	return this.errMsg;
};

FormChecker.prototype.getName = function(el) {
	return el.getAttribute("HNAME") || el.title || el.name || el.id;
	// return el.getAttribute("HNAME") == null || el.getAttribute("HNAME") == ""
	//	 ? el.name : el.getAttribute("HNAME");
};
/**
* validate functions
*/
FormChecker.prototype.func_email = function(el,value) {
	var valuex = value ? value : el.value;
	var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
	return pattern.test(valuex) ? true : "invalid";
};

FormChecker.prototype.func_email_prefix = function(el,value) {
	var valuex = value ? value : el.value;
	var pattern = /^[_a-zA-Z0-9-\.]+$/;
	return pattern.test(valuex) ? true : "invalid";
};

FormChecker.prototype.func_hangul = function(el) {
	var pattern = /[가-힝]/;
	return pattern.test(el.value) ? true : "반드시 한글을 포함해야 합니다";
};

FormChecker.prototype.func_engonly = function(el) {
	var pattern = /^[a-zA-Z]+$/;
	return pattern.test(el.value) ? true : "invalid";
};

FormChecker.prototype.func_number = function(el) {
	var pattern = /^[0-9]+$/;
	return pattern.test(el.value) ? true : "반드시 숫자로만 입력해야 합니다";
};

FormChecker.prototype.func_numeng = function(el) {
	var pattern = /^[a-zA-Z0-9]+$/;
	return pattern.test(el.value) ? true : "반드시 숫자 또는 영문으로 입력해야 합니다";
};

FormChecker.prototype.func_userid = function(el) {
	var pattern = /^[a-zA-Z]{1,1}[a-zA-Z0-9_]{4,15}$/;

	return pattern.test(el.value) ? true : "영문자로 시작하여 영문, 숫자, _ 혼용 5자 이상 15자 이하로 입력하셔야 합니다";
};

FormChecker.prototype.func_passwd = function(el) {
   	var pattern = /^[a-zA-Z0-9!@#$%^&*()-_()]{6,12}$/;

	return pattern.test(el.value) ? true : "영문, 숫자, 특수문자 혼용 6자 이상 12자 이하로 입력하셔야 합니다";
};

FormChecker.prototype.func_residentno = function(el,value) {
	var pattern = /^(\d{6})-?(\d{5}(\d{1})\d{1})$/;
	var num = value ? value : el.value;
	if (!pattern.test(num)) return "invalid";
	num = RegExp.$1 + RegExp.$2;
	if (RegExp.$3 == 7 || RegExp.$3 == 8 || RegExp.$4 == 9)
		if ((num[7]*10 + num[8]) %2) return "invalid";

	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (var i=0; i<12; i++) {
		if (isNaN(num.substring(i,i+1))) return "invalid";
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	if(RegExp.$3 == 7 || RegExp.$3 == 8 || RegExp.$4 == 9)
		return (11 - mod + 2) % 10 == last ? true : "invalid";
	else
		return (11 - mod) % 10 == last ? true : "invalid";
};

FormChecker.prototype.func_jumin = function(el,value) {
	var pattern = /^([0-9]{6})-?([0-9]{7})$/;
	var num = value ? value : el.value;
	if (!pattern.test(num)) return "invalid";
	num = RegExp.$1 + RegExp.$2;

	if(num.substring(2,3) > 1) return "invalid";
	if(num.substring(4,5) > 3) return "invalid";
	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;

	var bases = "234567892345";
	for (var i=0; i<12; i++) {
		if (isNaN(num.substring(i,i+1))) return "invalid";
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return (11 - mod) % 10 == last ? true : "invalid";

};

FormChecker.prototype.func_juminforeignernoAge = function(el,value) {	//주민번호와 외국인번호 체크및 14세 미만 체크
	var pattern = /^([0-9]{6})-?([0-9]{7})$/;
	var num = value ? value : el.value;
	if (!pattern.test(num)) return "invalid";
		var year = num.substring(0 ,2);
		var yearGubun = num.substring(6, 7);
		var fullYear = "";
		if(yearGubun == 3 || yearGubun == 4) {
			fullYear = "20" + year;
		} else {
			fullYear = "19" + year;
		}
		if (fullYear >= 1994) return "만 14세 미만 고객님은 가입이 불가능합니다.";
		num = RegExp.$1 + RegExp.$2;

		if(num.substring(2,3) > 1) return "invalid";
		if(num.substring(4,5) > 3) return "invalid";
		var sum = 0;
		var last = num.charCodeAt(12) - 0x30;
		var bases = "234567892345";
		for (var i=0; i<12; i++) {
			if (isNaN(num.substring(i,i+1))) return "invalid";
			sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
		}
		var mod = sum % 11;
		return (11 - mod) % 10 == last ? true : (11 - mod + 2) % 10 == last? true : "invalid"; //주민번호도 체크하고 외국인번호도 체크함
};

FormChecker.prototype.func_foreignerno = function(el,value) {
	var pattern = /^(\d{6})-?(\d{5}[7-9]\d{1})$/;
	var num = value ? value : el.value;
	if (!pattern.test(num)) return "invalid";
	num = RegExp.$1 + RegExp.$2;
	if ((num[7]*10 + num[8]) %2) return "invalid";

	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (var i=0; i<12; i++) {
		if (isNaN(num.substring(i,i+1))) return "invalid";
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return (11 - mod + 2) % 10 == last ? true : "invalid";
};

FormChecker.prototype.func_bizno = function(el,value) {
	var pattern = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
	var num = value ? value : el.value;
	if (!pattern.test(num)) return "invalid";
		return pattern.test(num) ?true:"invalid";
};

FormChecker.prototype.func_phone = function(el,value) {
	var pattern = /^(0[2-8][0-5]?|01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/;
	var pattern15xx = /^(1544|1566|1577|1588|1644|1688)-?([0-9]{4})$/;
	var num = value ? value : el.value;
	return pattern.exec(num) || pattern15xx.exec(num) ? true : "invalid";
};

FormChecker.prototype.func_homephone = function(el,value) {
	var pattern = /^(0[2-8][0-5]?)-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/;
	var pattern15xx = /^(1544|1566|1577|1588|1644|1688)-?([0-9]{4})$/;
	var num = value ? value : el.value;
	return pattern.exec(num) || pattern15xx.exec(num) ? true : "invalid";
};

FormChecker.prototype.func_handphone = function(el,value) {
	var pattern = /^(01[016-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/;
	var num = value ? value : el.value;
	return pattern.exec(num) ? true : "invalid";
};


FormChecker.prototype.func_date = function(el,value) {
	var str = value ? value : el.value;

	if(str.length != 8) return 'invalid';
	
	try{
		var yyyy = str.substr(0,4);
		var mm   = str.substr(4,2);
		var dd   = str.substr(6,2);

		if(yyyy < 1900 || 2200 < yyyy) return 'invalid';
		if(12 < mm) return 'invalid';
		if(31 < dd) return 'invalid';
	}
	catch(e){
		 return 'invalid';
	}
	return true;
};

FormChecker.prototype.func_url = function(el,value) {
	var pattern = /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,}))\.?)(?::\d{2,5})?(?:[/?#]\S*)?$/;
	var num = value ? value : el.value;
	return pattern.exec(num) ? true : "invalid";
};
