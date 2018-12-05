$(document).ready(function(){
    // tab
	var send_type = $("#send_type").val();
	if (send_type == null || send_type == "") {
		send_type = "stats_today";
	}

	$("#" + send_type).addClass('active');
	$(".tab_con").css("visibility", "visible").hide();
	if (send_type == "stats_today") {
		$("#tab2, #tab3").css("visibility", "hidden").fadeOut();
		$("#tab1").removeClass("hide").fadeIn(300);
	} else if (send_type == "stats_day") {
		$("#tab1, #tab3").css("visibility", "hidden").fadeOut();
		$("#tab2").removeClass("hide").fadeIn(300);
	} else if (send_type == "stats_month") {
		$("#tab1, #tab2").css("visibility", "hidden").fadeOut();
		$("#tab3").removeClass("hide").fadeIn(300);
	}
	
    $("#tab_tit .btn").on('click', function(){
        $('.sort_list .btn').removeClass('active');
        $(this).addClass('active');
        
        var id_name = $(this).context.id;
        $("#send_type").val(id_name);
        
		$("#mainForm").submit();
    });

    // DatePicker
    // 일별
    $("#date_day").Zebra_DatePicker({
        direction: false,
        format: 'Y-m-d',
        onSelect: function() {
        	$(this).change();
        	$("#start_date").val($(this).context.value);
        	
        	$("#mainForm").submit();
        }
    });
    // 월별
    $("#date_month").Zebra_DatePicker({
        format: 'Y-m',
        first_day_of_week: 0,
        direction: false,
        onSelect: function() {
        	$(this).change();
        	$("#start_date").val($(this).context.value);
        	
        	$("#mainForm").submit();
        }
    });
});


// 옵션
var opts = {
    responsive : true,
    responsiveMinHeight: 350,
    responsiveMaxHeight: 450,
    animationEasing: "easeOutQuart",
    crossTextFontColor: ["#666"],
    crossTextFontSize: [14],
    animationSteps : 60,
    legend: true,
    legendFontSize: 14,
    legendPosX: 3,
    legendPosY: 4,
    legendBorders: false,
    legendXPadding: -5,
    legendYPadding: -5,
    maxLegendCols: 1,
    showSingleLegend: true,
    inGraphDataShow: true,
    inGraphDataFontColor: "#fff",
    inGraphDataFontSize: 22,
    inGraphDataFontStyle: "bold",
    inGraphDataRadiusPosition: 1,
    inGraphDataTmpl: "<%=v6 + '%'%>",
    startAngle : 180,
    annotateDisplay: true,
    detectMouseOnText : true
}

//금일 데이터
var todayData = [
    {
        value: $("#todayData_1").val(),
        color:"#4f81bd",
        title: "자동응답 상담 완료"
    },
    {
        value: $("#todayData_2").val(),
        color: "#376092",
        title: "문의하기 전환"
    },
    {
        value: $("#todayData_3").val(),
        color: "#c0504d",
        title: "상담 미완료(이탈)"
    }
];

//일간 데이터
var dayData = [
    {
        value: $("#dayData_1").val(),
        color:"#4f81bd",
        title: "자동응답 상담 완료"
    },
    {
        value: $("#dayData_2").val(),
        color: "#376092",
        title: "문의하기 전환"
    },
    {
        value: $("#dayData_3").val(),
        color: "#c0504d",
        title: "상담 미완료(이탈)"
    }
];

//월간 데이터
var monthData = [
    {
        value: $("#monthData_1").val(),
        color:"#4f81bd",
        title: "자동응답 상담 완료"
    },
    {
        value: $("#monthData_2").val(),
        color: "#376092",
        title: "문의하기 전환"
    },
    {
        value: $("#monthData_3").val(),
        color: "#c0504d",
        title: "상담 미완료(이탈)"
    }
];



//캔버스 생성
window.onload = function(){
    var ctx1 = document.getElementById("arschart1").getContext("2d");
    var ctx2 = document.getElementById("arschart2").getContext("2d");
    var ctx3 = document.getElementById("arschart3").getContext("2d");
    
    window.myDoughnut = new Chart(ctx1).Doughnut(todayData, opts);
    window.myDoughnut = new Chart(ctx2).Doughnut(dayData, opts);
    window.myDoughnut = new Chart(ctx3).Doughnut(monthData, opts);
};