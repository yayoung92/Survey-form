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
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function getDataAndDrawChart() {
    	  var xhttp = new XMLHttpRequest();
    	  
    	  xhttp.onreadystatechange = function() {
    	    
    	      var result = JSON.parse(this.responseText);
    	      drawChart(result);
    	    
    	  };

    	  xhttp.open("GET", "/aj-viewAnswer", true);
    	  xhttp.send();
    	}

    	function drawChart(result) {
    	  var data = google.visualization.arrayToDataTable([
    	    ['답변', '수'],
    	    ['Work',     result],
    	    ['Eat',      2],
    	    ['Commute',  5],
    	    ['Watch TV', 7],
    	    ['Sleep',    9]
    	  ]);
			console.log(result);
    	  var options = {
    	    title: 'My Daily Activities'
    	  };

    	  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    	  chart.draw(data, options);
    	}
    
    </script>
<meta name="_csrf" content="${_csrf.token }">
</head>
<style>
.form {
	width: 500px;
	margin: 20px auto;
	padding: 50px;
	border: black solid;
	board-raduis: 5px;
}
.wrap {
	width: 900px;
	margin: auto;
}
.form-box {
	width: 500px;
	margin: 20px auto;
	padding: 50px;
	border: black solid 2px;
	border-radius: 5px;
}
.button-container {
	text-align: center;
}
.custom-button {
	padding: 10px 10px;
	background-color: #007bff;
	color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}
.input {
	border: none;
	width: 400px;
	height: 30px;
	font-size: 15px;
}
.output {
	border: none;
	text-background: lightgray;
	width: 400px;
	height: 30px;
	font-size: 15px;
}
.sur {
	width: 500px;
	height: 50px;
	font-size: 30px;
	text-dexoration: underline;
	border: none;
	text-align: center;
	font-weight: bold;
}
</style>
<body>
<div id="piechart" style="width: 900px; height: 500px;"></div>
	<form action="/resultSurvey" name="survey" method="post">
		<div class="wrap">
			<input type="hidden" name="sIdx" value="${survey.sIdx }">
				<div class="form" >
					<h1 style="text-align: center; font-size:20px;">설문조사</h1>
					<span class="sur">${survey.sTitle}</span>
					<hr class="my-4">
					<p class="lead">
					<div class="button-container">
						<button type="button" class="startSurvey">설문지 작성 시작</button>
					</div>
				</div>
				<c:forEach items="${question }" var="question">
				 	<div class="form-box" >
				 		<div class="question">
							<span class="input">${question.qQuestion }</span>
						</div>
						<hr>
						<div class="answerQuestion">
							<c:choose>
								<c:when test="${question.qType eq 3 }">
									<input type="hidden" name="qIdx" value="${question.qIdx}">
							        <input type="hidden" name="q_type" value="${question.qType}">
									<textarea class="output" style="width: 500px; height: 30px;" placeholder="100자 내외"></textarea>
								</c:when>
								<c:when test="${question.qType eq 1 }">
									<input type="hidden" name="qIdx" value="${question.qIdx}">
							        <input type="hidden" name="q_type" value="${question.qType}">
									<input class="output" type="text" name="aAnswer" >
								</c:when>
							    <c:when test="${question.qType eq 2 }">
							    	<input type="hidden" name="q_type" value="${question.qType}">
							       	<div id="optionlist">
							       		<c:forEach items="${option}" var="option">
							            	<c:choose>
							        			<c:when test="${question.qIdx eq option.qIdx}">	
							                    	<input type="hidden" name="qIdx" value="${option.qIdx}">
							                    	<input type="hidden" name="oIdx" value="${option.oIdx}">
								                   	<input type='checkbox' name="oOption" value="${option.oOption}">${option.oOption}<br>
								            	</c:when>
								        	</c:choose>
								    	</c:forEach>
									</div>
								</c:when>
						   	</c:choose>
						</div>
					</div>
				</c:forEach>
		</div>
		<div class="button-container">
			<a id="b_survey" class="custom-button" type="button">설문지 제출하기</a>
		</div>
	</form>
<script>
$(document).on('click', '#b_survey', function () {
    let questions = [];
    let sId = $(this).parent().prev().find('input[name="sIdx"]').val();
    let csrfToken = $("meta[name='_csrf']").attr("content");

    $('.answerQuestion').each(function () {
        let qId = $(this).find('input[name="qIdx"]').val();
        let oId = $(this).find('input[name="oIdx"]').val();
        let a_a = $(this).find('input[name="aAnswer"]').val();
        let a_answer = $(this).find('input[name="oOption"]').val();
        let o_option = [];
        let q_type = $(this).find('input[name="q_type"]').val();
        

        if(q_type === '2') {
        	$(this).find('input[name="oOption"]').each(function () {
        		o_option.push($(this).val());
            });
        }
            
        questions.push({
        	qIdx: qId,
            oIdx: oId,
            aAnsw: a_a,
            aAnswer: a_answer,
            oOption: o_option       
        });

    });


    console.log(sId, questions)
});
</script>
</body>
</html>