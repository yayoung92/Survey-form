<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="_csrf" content="${_csrf.token }">
</head>
<body>
<h1>설문조사 통계</h1>
	<form action="/showchart" name="survey">
		<div style="text-align: center; font-weight: bold; font-size: 30px;">${survey.sIdx}번 : < ${survey.sTitle } ></div>
		<div class="wrap">
		<input type="hidden" name="sIdx" value="${survey.sIdx}">
		</div>
		<!--<c:forEach items="${resoponse }" var="resoponse" varStatus="loop">
			<div id="piechart${loop.index }" style="width: 900px; height: 500px;"></div>
		</c:forEach> -->
		<div id="pie">
			<div id="piechart2" style="width: 900px; height: 500px;"></div>
			<div id="piechart3" style="width: 900px; height: 500px;"></div>
		</div>
	</form>
<script>
google.charts.load('current', {'packages': ['corechart']});
//google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart2);

/*function drawChart() {
	<c:forEach items="${resoponse }" var="resoponse" varStatus="loop">

		var data = new google.visualization.DataTable();
    	data.addColumn('string', 'Task');
    	data.addColumn('number', 'Hours per Day');

    	<c:forEach items="${resoponse.aAnswers}" var="answer">
        	data.addRow(['${answer.aAnswer}', ${answer.count}]);
		</c:forEach>

    	var options = {
        	title: '${resoponse.qQuestion}'
    	};

      	var chart = new google.visualization.PieChart(document.getElementById('piechart' + ${loop.index}));
      	chart.draw(data, options);

	</c:forEach>
} */
function drawChart2() {
	let csrfToken = $("meta[name='_csrf']").attr("content");
	let sId = [];
	
	$('.wrap').each(function () {
		sId = $(this).find('input[name="sIdx"]').val();
	});

    $.ajax({
		method: "POST",
		url: "aj-chart",
		headers: {
    		"X-CSRF-TOKEN": csrfToken
    	},
    	contentType: "application/json",
    	data: JSON.stringify({"sIdx":sId})

    })
    .done(function(msg){
		$('#pie').html(msg);
    });
}
</script>	
</body>
</html>