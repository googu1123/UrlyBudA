$(document).ready(function(){

});

//차트 클릭 이벤트
function displayText(event,ctx,config,data,other){
    if(other != null) {
        if(typeof other.type !="undefined") {
    		var text;
    		var canvas_pos = getMousePos(ctx.canvas, event);
    		text="Area : "+other.values[0];
    		text=text+"\nText you click on : "+other.values[1];
    		text=text+"\n"+"Position where you click : ("+canvas_pos.x+","+canvas_pos.y+")";
    		text=text+"\nPosition of the corners of the text : ("+other.values[2].p1+","+other.values[3].p1+");("+other.values[2].p2+","+other.values[3].p2+");("+other.values[2].p3+","+other.values[3].p3+");("+other.values[2].p4+","+other.values[3].p4+")";
    		text=text+"\nText Rotation (in radian) : "+other.values[4];
    		text=text+"\nText Width : "+other.values[5];
    		text=text+"\nText Height : "+other.values[6];
    		switch(other.values[0]) {
    			case "CROSSTEXT_TEXTMOUSE" :
    				text=text+"\nCrossText Id : "+other.values[7];
    				text=text+"\nCrossText : "+config.crossText[other.values[7]];
    				break;
    			case "INGRAPHDATA_TEXTMOUSE":
    				if(ctx.tpdata==0){
    					text=text+"\nText Id : ("+other.values[7]+","+other.values[8]+")";
    					text=text+"\nData Value : "+data.datasets[other.values[7]].data[other.values[8]];
    					text=text+"\nData associated to : "+data.labels[other.values[8]]+data.datasets[other.values[7]].title;
    				} else if(ctx.tpdata==1) {
    					text=text+"\nText Id : "+other.values[7];
    					text=text+"\nData Value : "+data[other.values[7]].value;
    					text=text+"\nData associated to : "+data[other.values[7]].title;
    				}
    				break;
    			case "YLEFTAXIS_TEXTMOUSE" :
    				text=text+"\nLabel Id : "+other.values[8];
    				break;
    			case "YRIGHTAXIS_TEXTMOUSE" :
    				text=text+"\nLabel Id : "+other.values[8];
    				break;
    			case "XSCALE_TEXTMOUSE" :
    				text=text+"\nLabel Id : "+other.values[7];
    				text=text+"\nLabel Text : "+data.labels[other.values[7]];
    				break;
    			case "XAXIS_TEXTMOUSE" :
    				text=text+"\nLabel Id : "+other.values[7];
    				text=text+"\nLabel Text : "+data.labels[other.values[7]];
    				break;
    			case "SCALE_TEXTMOUSE" :
    				text=text+"\nLabel Id : "+other.values[7];
    				break;
    			case "LEGEND_TEXTMOUSE" :
    				text=text+"\nLegend Id : "+other.values[7];
    				if(ctx.tpdata==0){
    					text=text+"\nData associated to : "+data.datasets[other.values[7]].title;
    				} else if(ctx.tpdata==1) {
    					text=text+"\nData Value : "+data[other.values[7]].value;
    					text=text+"\nData associated to : "+data[other.values[7]].title;
    				}
    				break;
    			default: break;
    		};

    		window.alert(text);
        }
	}
}

//알림톡 옵션
var opts1 = {
    responsive : true,
    responsiveMaxWidth: 500,
    responsiveMinHeight: 300,
    responsiveMaxHeight: 400,
    animationEasing: "easeOutQuart",
    crossText: ["알림톡"],
    crossTextFontColor: ["#666"],
    crossTextFontSize: [14],
    animationSteps : 60,
    legend: true,
    legendBordersSpaceAfter: 15,
    showSingleLegend: true,
    inGraphDataShow: true,
    startAngle : 180,
    inGraphDataTmpl: "<%=v2 + ' (' + v6 + '%)'%>",
    annotateDisplay: true,
    detectMouseOnText : true/*,
    mouseDownLeft : displayText*/
};

//LMS 옵션
var opts2 = {
    responsive : true,
    responsiveMaxWidth: 500,
    responsiveMinHeight: 300,
    responsiveMaxHeight: 400,
    animationEasing: "easeOutQuart",
    crossText: ["LMS"],
    crossTextFontColor: ["#666"],
    crossTextFontSize: [14],
    animationSteps : 60,
    legend: true,
    legendBordersSpaceAfter: 15,
    showSingleLegend: true,
    inGraphDataShow: true,
    startAngle : 180,
    inGraphDataTmpl: "<%=v2 + ' (' + v6 + '%)'%>",
    annotateDisplay: true,
    detectMouseOnText : true/*,
    mouseDownLeft : displayText*/
};

//SMS 옵션
var opts3 = {
    responsive : true,
    responsiveMaxWidth: 500,
    responsiveMinHeight: 300,
    responsiveMaxHeight: 400,
    animationEasing: "easeOutQuart",
    crossText: ["SMS"],
    crossTextFontColor: ["#666"],
    crossTextFontSize: [14],
    animationSteps : 60,
    legend: true,
    legendBordersSpaceAfter: 15,
    showSingleLegend: true,
    inGraphDataShow: true,
    startAngle : 180,
    inGraphDataTmpl: "<%=v2 + ' (' + v6 + '%)'%>",
    annotateDisplay: true,
    detectMouseOnText : true/*,
    mouseDownLeft : displayText*/
};

//NMS 옵션
var opts4 = {
    responsive : true,
    responsiveMaxWidth: 500,
    responsiveMinHeight: 300,
    responsiveMaxHeight: 400,
    animationEasing: "easeOutQuart",
    crossText: ["NMS"],
    crossTextFontColor: ["#666"],
    crossTextFontSize: [14],
    animationSteps : 60,
    legend: true,
    legendBordersSpaceAfter: 15,
    showSingleLegend: true,
    inGraphDataShow: true,
    startAngle : 180,
    inGraphDataTmpl: "<%=v2 + ' (' + v6 + '%)'%>",
    annotateDisplay: true,
    detectMouseOnText : true/*,
    mouseDownLeft : displayText*/
};

//알림톡 데이터
var alimData = JSON.parse($("#alimData").val());

//LMS 데이터
var lmsData = JSON.parse($("#lmsData").val());

//SMS 데이터
var smsData = JSON.parse($("#smsData").val());

//NMS 데이터
var nmsData = JSON.parse($("#nmsData").val());

//캔버스 생성
window.onload = function(){
    var ctx1 = document.getElementById("chartVal1").getContext("2d");
    var ctx2 = document.getElementById("chartVal2").getContext("2d");
    var ctx3 = document.getElementById("chartVal3").getContext("2d");
    var ctx4 = document.getElementById("chartVal4").getContext("2d");

    window.myDoughnut = new Chart(ctx1).Doughnut(alimData, opts1);
    window.myDoughnut = new Chart(ctx2).Doughnut(lmsData, opts2);
    window.myDoughnut = new Chart(ctx3).Doughnut(smsData, opts3);
    window.myDoughnut = new Chart(ctx4).Doughnut(nmsData, opts4);
};