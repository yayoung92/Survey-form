<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div id="piechart" style="width: 900px; height: 500px;"></div>

<script>
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    
	function drawChart() {

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


	
</script>