<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="_csrf" content="${_csrf.token }">

	<div id="pie" style="text-align: center;">
		<c:forEach var="question" items="${question}">
			
				<c:choose>
					<c:when test="${question.qType eq 2 }">
						<div id="piechart" style="width: 900px; height: 500px; text-align: center;">
							<input type="hidden" name="qQuestion" value="${question.qQuestion }">
							<input type="hidden" name="qIdx" value="${question.qIdx }">
						</div>
					</c:when>
				</c:choose>
			
		</c:forEach>
	</div>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	
	let csrfToken = $("meta[name='_csrf']").attr("content");

	console.log(${s});
	var data = google.visualization.arrayToDataTable([
    	['oOption', 'count'],
        [oOption, count]
      ]);

    var options = {
      title: 'My Daily Activities'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
}
</script>