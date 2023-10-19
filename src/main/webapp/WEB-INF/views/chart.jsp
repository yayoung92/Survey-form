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

    function drawChart() {
		let csrfToken = $("meta[name='_csrf']").attr("content");

		$('.wrap').each(function () {
			
			let all = [];
			let sId = $(this).find('input[name="sIdx"]').val();
			let qId = $(this).find('input[name="q_Idx"]').val();
			let oId = $(this).find('input[name="qIdx"]').val();
				
			if(qId == oId) {
	        	$(this).find('input[name="oOption"]').each(function () {
	        		all.push($(this).val());
	            });
	        		
	        };

			console.log(all);
		    var data = new google.visualization.DataTable();
		    data.addColumn('string', 'aAnswer');
		    data.addColumn('number', 'count');
	
		    data.addRows([
		    	  [all[0], 5],
		    	  [all[1], 10]
		    ]);
		    
		    console.log(data);
		
		    var options = {
		        title: $(this).find('input[name="sTitle"]').val()
		    };
		
		    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		    chart.draw(data, options);
     });
  }


	
</script>
<meta charset="UTF-8">
<title>pie chart</title>
</head>
<body>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>