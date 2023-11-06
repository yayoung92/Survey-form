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
	display: block;
	text-align: center;
	font-weight: bold;
}
</style>
<body>
	<div class="wrap">
		<input type="hidden" name="sIdx" value="${survey.sIdx }">
		<input type="hidden" name="sTitle" value="${survey.sTitle }">
		<div class="form" >
			<h1 style="text-align: center; font-size:20px;">설문조사</h1>
			<span class="sur">${survey.sTitle }</span>
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
					<input type="hidden" name="qIdx" value="${question.qIdx}">
				</div>
				<hr>
				<div class="answerQuestion">
					<c:choose>
						<c:when test="${question.qType eq 3 }">
							<textarea class="output" name="aAnswer" style="width: 500px; height: 30px;" placeholder="100자 내외"></textarea>
						</c:when>
						<c:when test="${question.qType eq 1 }">
							<input class="output" type="text" name="aAnswer" >
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${question.qType eq 2 }">	 
							<div class="optionlist">
							    <c:forEach items="${option}" var="option">
							    	<c:choose>
							        	<c:when test="${question.qIdx eq option.qIdx}">	
							        		<input type="hidden" name="qQueation" value="${question.qQuestion }">
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
		<a id="b_survey" class="custom-button" type="button" href="/surveylist">설문지 제출하기</a>
	</div>
<a href="/surveylist" type="button">돌아가기</a>
<a href="/surveyupdate?sIdx=${survey.sIdx }" type="button">수정하기</a>
<a href="/surveydelete?sIdx=${survey.sIdx }" type="button">삭제하기</a>
<script>

$(document).on('click', '#b_survey', function () {
    let sTitle = $(this).parent().prev().find('input[name="sTitle"]').val();
    let sId = $(this).parent().prev().find('input[name="sIdx"]').val();
    let csrfToken = $("meta[name='_csrf']").attr("content");
    let check = [];
    
    $('.optionlist').each(function () {	
    	let qId = $(this).find('input[name="qIdx"]').val();
    	let a_answer = [];
    	a_answer = $(this).find('input[name="oOption"]:checked').val();

		check.push({	
			qIdx: qId,
			aAnswer: a_answer 
		});
		
    });

    $.ajax({
		method: "POST",
		url: "aj-insertanswer",
		headers: {
    		"X-CSRF-TOKEN": csrfToken
    	},
    	contentType: "application/json",
    	data: JSON.stringify({"sIdx":sId, "sTitle":sTitle,"aAnswerlist":check})

    })
    .done(function(msg){
		$('#s_survey').html(msg);
    });

    console.log(sId, check)
});
</script>
</body>
</html>