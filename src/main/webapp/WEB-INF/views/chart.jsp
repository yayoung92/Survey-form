<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div id="pie" style="text-align: center;">
	<c:forEach var="resoponse" items="${resoponse }" varStatus="loop">
		<div id="piechart${loop.index}" style="width: 900px; height: 500px; text-align: center;"></div>
	</c:forEach>
</div>

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);


function drawChart() {
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
}

</script>