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
	google.charts.load('current', {'packages': ['corechart']});
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

		    $.ajax({
			    url: 'aj-viewAnswer',
			    method: 'POST',
			    headers: {
		    		"X-CSRF-TOKEN": csrfToken
		    	},
		    	contentType: "application/json",
		    	data: JSON.stringify({"sIdx":sId, "aAnswerlist":all})
		    
			})
			.done(function(msg) {
				$('#piechart').html(msg);
			});
		});
		
	};


    
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
					<input class="sur" name="sTitle" value="${survey.sTitle}" readonly>
					<hr class="my-4">
					<p class="lead">
					<div class="button-container">
						<button type="button" class="startSurvey">설문지 작성 시작</button>
					</div>
				</div>
				<c:forEach items="${question }" var="question">
				 <div class="form-box" >
				 	<div class="question">
						<input class="input" name="qQuestion" value="${question.qQuestion }" readonly>
					</div>
					<hr>
					<div class="answerQuestion">
						<c:choose>
							<c:when test="${question.qType eq 3 }">
								<input type="hidden" name="qIdx" value="${question.qIdx}">
							    <input type="hidden" name="q_type" value="${question.qType}">
								<textarea class="output" name="aAnswer" style="width: 500px; height: 30px;" placeholder="100자 내외"></textarea>
							</c:when>
							<c:when test="${question.qType eq 1 }">
								<input type="hidden" name="qIdx" value="${question.qIdx}">
							    <input type="hidden" name="q_type" value="${question.qType}">
								<input class="output" type="text" name="aAnswer" >
							</c:when>
						</c:choose>
					</div>
					<div id="optionlist">
						<c:choose>
							   <c:when test="${question.qType eq 2 }">
							    	
							    <input type="hidden" name="q_type" value="${question.qType}">
							       	
							       		<c:forEach items="${option}" var="option">
							            	<c:choose>
							        			<c:when test="${question.qIdx eq option.qIdx}">	
							        				<input type="hidden" name="q_Idx" value="${question.qIdx}">
							                    	<input type="hidden" name="qIdx" value="${option.qIdx}">
							                    	<input type="hidden" name="oIdx" value="${option.oIdx}">
								                   	<input type='checkbox' name="oOption" value="${option.oOption}">${option.oOption}<br>
								            	</c:when>
								        	</c:choose>
								    	</c:forEach>
									
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
    let answer = [];
    
    $('.answerQuestion').each(function () {
        let qId = $(this).find('input[name="qIdx"]').val();
        let oId = $(this).find('input[name="oIdx"]').val();
        let alls = $(this).find('input[name="aAnswer"], textarea[name="aAnswer"], input[name="oOption"]').val();
        
        let a_answer = $(this).find('input[name="oOption"]').val();
        
        let o_option = $(this).find('input[name="aAnswer"], textarea[name="aAnswer"]').val();
        let q_type = $(this).find('input[name="q_type"]').val();
        let all = [];
        
       if(q_type === '2') {
        	$(this).find('input[name="oOption"]').each(function () {
        		all.push($(this).val());
            });
        } else {
        	$(this).find('input[name="aAnswer"], textarea[name="aAnswer"]').each(function () {
        		all.push($(this).val());
            });
        }
            
        questions.push({
        	qIdx: qId,
            oIdx: oId,
            aAnswer: a_answer,
            all: all,
            oOption: o_option    //주관식 답변 가져옴.   
        });

        answer.push({ allAnswer: alls});
    });

    $.ajax({
		method: "POST",
	//	url: "aj-insertanswer",
		headers: {
    		"X-CSRF-TOKEN": csrfToken
    	},
    	contentType: "application/json",
    	data: JSON.stringify({"sIdx":sId, "aAnswerlist":questions})

    });

    console.log(sId, answer, questions)
});
</script>
</body>
</html>