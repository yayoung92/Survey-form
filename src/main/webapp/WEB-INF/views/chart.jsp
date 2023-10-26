<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div id="pie">
	<div id="piechart2" style="width: 900px; height: 500px;"></div>
	<div id="piechart3" style="width: 900px; height: 500px;"></div>
</div>

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart2);

function drawChart(resoponse) {

    var data2 = google.visualization.arrayToDataTable(${resoponse});
    var options2 = {
    	title: resoponse
    };
    console.log(data2);
    var chart2 = new google.visualization.PieChart(document.getElementById('piechart3'));
    chart2.draw(data2, options2);
}

function drawChart2() {
	var d = ${resoponse};

	var data = google.visualization.arrayToDataTable([
  		['aAnswer', 'count'],
        [d[0][1][0][0], d[0][1][0][1]],
        [d[0][1][1][0], d[0][1][1][1]],
        [d[0][1][2][0], d[0][1][2][1]]
    ]);
    var options = {
    	title: d[0][0]
    };
    var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
    chart.draw(data, options);
    console.log(data);	
}

/*function drawChart() {

    	let jsonString = '${answer}';
   	 	let dataArray = JSON.parse(jsonString);
   	 
   	 	console.log(dataArray);

   	 	let jsonString2 = '${question}';
	 	let dataArray2 = JSON.parse(jsonString2);
	 
	 	console.log(dataArray2);
   	 
   	 	let data = new google.visualization.DataTable();
   	 	data.addColumn('string', 'aAnswer');
   	 	data.addColumn('number', 'count');

   		for (let i = 0; i < dataArray.length; i++) {
        	let item = dataArray[i];
        	data.addRow([
            	item.aAnswer, item.count
            ]);
		}
       
   		var options = {
   			title: '${title}'
   		};

   		var chart = new google.visualization.PieChart(document.getElementById('piechart'));
   		chart.draw(data, options);
}
*/

	
</script>