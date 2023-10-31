<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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

	let sss = ${resoponse};
	console.log(sss);

	console.log(${resoponse});
	
    var data = google.visualization.arrayToDataTable([
    	['aAnswer', 'count'],
        ['dd', 4]
      ]);

	console.log(data);
    var options = {
      title: 'My Daily Activities'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
  }

/*function drawChart() {
	var d = ${resoponse};
	console.dir(d);
	<c:forEach var="resoponse" items="${resoponse }" varStatus="loop">
		var d = ${resoponse};
		console.log(d);
	
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Task');
		data.addColumn('number', 'Hours per Day');
	
		<c:forEach items="${resoponse.aAnswers}" var="answer">
	    	data.addRow(['${answer.aAnswer}', ${answer.count}]);
		</c:forEach>
	    
	    var options = {
	    	title: '${resoponse.qQuestion}'
	    };
	    var chart = new google.visualization.PieChart(document.getElementById('piechart' +${loop.index}));
	    chart.draw(data, options);
    </c:forEach>	
} */

</script>