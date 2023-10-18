<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);

    function drawChart() {
    	var data = google.visualization.arrayToDataTable([
        	['Task', 'Hours per Day'],
        	['Work',     11],
        	['Eat',      2],
        	['Commute',  2],
        	['Watch TV', 2],
        	['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    	chart.draw(data, options);
	}

    function drawChart2() {
    	var data = google.visualization.arrayToDataTable([
        	['Task', 'Hours per Day'],
        	['Eat',      2],
        	['Commute',  2],
        	['Watch TV', 2],
        	['Sleep',    7]
        ]);
		console.log(data);
        var options = {
          title: 'Freedom'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
    	chart.draw(data, options);
	}

    function drawChart3() {
        var chartData = ${chartData};
   		var ch = ${ch};
        
		console.log(chartData);
		console.log(ch);

    	var data = google.visualization.arrayToDataTable([
        	['Answer', 'count'],
        	[ch[0], chartData[0]],
        	[ch[1], chartData[1]],
        	[ch[2], chartData[2]]
        ]);

        console.log(data);
        var options = {
            title: '나의 설문조사'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart3'));
        chart.draw(data, options);
     }


	
</script>
<meta charset="UTF-8">
<title>pie chart</title>
</head>
<body>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	<div id="piechart2" style="width: 900px; height: 500px;"></div>
	<div id="piechart3" style="width: 900px; height: 500px;"></div>
</body>
</html>