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
	<div id="pie" style="text-align: center;">
		<c:forEach var="question" items="${question}">
			
				<c:choose>
					<c:when test="${question.qType eq 2 }">
						
						<div id="piechart${question.qIdx }" style="width: 900px; height: 500px; text-align: center;">
							<input type="hidden" name="qQuestion" value="${question.qQuestion }">
							<input type="hidden" name="qIdx" value="${question.qIdx }">
						</div>
						
					</c:when>
				</c:choose>
		
		</c:forEach>
		
	</div>
</form>
<a href="/surveylist" type="button">돌아가기</a>
<script>
google.charts.load('current', {'packages': ['corechart']});
google.charts.setOnLoadCallback(function(data) {
	(drawChart);
});


let csrfToken = $("meta[name='_csrf']").attr("content");
let sId = $('input[name="sIdx"]').val();

function drawChart(chartData) {
	
	chartData.forEach(function(item){

		var data = new google.visualization.DataTable();
	    data.addColumn('string', 'aAnswer');
	    data.addColumn('number', 'count');

		item.answers.forEach(function(ans){
			data.addRow( [ans[0], ans[1]]);
		})
		
		var options = {
			title: item.question
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart' + item.qIdx));
		chart.draw(data, options);
		
	});
  
}

$.ajax({
	method: "POST",
	url: "aj-chart",
	headers: {
		"X-CSRF-TOKEN": csrfToken
	},
	contentType: "application/json",
	data: JSON.stringify({ "sIdx": sId})
})
.done(function(data){
	drawChart(data);
	
});

</script>	
</body>
</html>