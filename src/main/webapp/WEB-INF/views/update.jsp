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
<form action="/updateSruvey" name="survey" method="post"></form>
	<div class="wrap">
		<input type="hidden" name="sIdx" value="${survey.sIdx }">
		<div class="form" >
			<h1 style="text-align: center; font-size:20px;">설문조사</h1>
			<input type="text" class="sur" name="sTitle" value="${survey.sTitle }">
			<hr class="my-4">
			<p class="lead">
			<div class="button-container">
				<button type="button" class="addQuestion">질문 추가하기</button>
			</div>
		</div>
		<c:forEach items="${question }" var="question">
			<div class="form-box" >
				 <div class="question">
				 	<input type="hidden" name="qIdx" value="${question.qIdx}">
					<input type="text" class="input" name="qQuestion" value="${question.qQuestion }">
					<input type="text" class="input" name="qType" value="${question.qType }">
				</div>
				<hr>
				<div class="answerQuestion">
					<c:choose>
						<c:when test="${question.qType eq 3 }">
							<textarea rows="5" cols="50" class="output" name="aAnswer" style="width: 500px; height: 30px;" placeholder="100자 내외"></textarea>
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
								            <input type='checkbox'><input type="text" name="oOption" value="${option.oOption}"><br>
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
		<a id="update_survey" class="custom-button" type="button" href="/surveylist">설문지 수정하기</a>
	</div>
<a href="/surveylist" type="button">돌아가기</a>
<script>
$(document).on('click', '.delete', function() {
	$(this).parent().parent().toggle();
});
$(document).on('click', '.addQuestion', function() {
    var newFormBox = $('<div class="form-box"></div>');
    var newQuestion = $('<div class="question"></div>');
    var titleInput = $('<input class="input" type="text" name="qQuestion" placeholder="질문">');
    var selectBox = $('<select clsee="QuestionType" name="qType"><option value="none">== 선택 ==</option><option value="1">주관식</option><option value="2">객관식</option><option value="3">장문형</select>');
    var addButton = $('<hr><button type="button" class="addQuestion">질문 추가</button>');
    var deleteButton = $('<button type="button" class="delete">취소</button>');

    newQuestion.append(titleInput);
    newQuestion.append(selectBox);
    newQuestion.append(addButton);
    newQuestion.append(deleteButton);
    newFormBox.append(newQuestion);

    $('.wrap').append(newFormBox);
    selectBox.on('change', function() {
    	while (true) {
            if ($(this).next().next().hasClass("form2") == true || $(this).next().next().hasClass("addExample") == true) {
                $(this).next().next().remove();
            } else {
                break;
            }
        }
        
    	if ($(this).val() === '1') {
            $(this).next().after("<div class='form2'><input type='text' class='example' name='q_answer' placeholder='답변'></div>");
        }
        if ($(this).val() === '2') {
            $(this).next().after("<div class='form2'><input type='checkbox'><input type='text' class='example' name='q_ar[]' placeholder='옵션1'><br><input type='checkbox'><input type='text' class='example' name='q_ar[]' placeholder='옵션2'><br></div><button type='button' class='addExample'>보기 추가하기</button>");
        }
        if ($(this).val() === '3') {
            $(this).next().after("<div class='form2'><textarea placeholder='답변' class='example' style='width: 500px;' name='q_answer[]'></textarea></div>");
        }
    });
    selectBox.trigger('change');

});
$(document).on('change', '.QuestionType', function() {
	while (true) {
        if ($(this).next().next().hasClass("form2") == true || $(this).next().next().hasClass("addExample") == true) {
            $(this).next().next().remove();
        } else {
            break;
        }
    }
    
	if ($(this).val() === '1') {
        $(this).next().after("<div class='form2'><input type='text' class='example' name='q_answer' placeholder='답변'></div>");
    }
    if ($(this).val() === '2') {
        $(this).next().after("<div class='form2'><input type='checkbox'><input tpye='text' class='example' name='q_ar[]' placeholder='옵션1'><br><input type='checkbox'><input type='text' class='example' name='q_ar[]' placeholder='옵션2'><br></div><button type='button' class='addExample'>보기 추가하기</button>");
    }
    if ($(this).val() === '3') {
        $(this).next().after("<div class='form2'><textarea placeholder='답변' class='example' style='width: 500px;' name='q_answer'></textarea></div>");
    }

});
$(document).on('click', '.addExample', function () {
	var optionInput = $('<div class="form2"><input type="checkbox"><input type="text" placeholder="옵션 추가" class="example" name="q_ar[]">');
    var deleteButton = $('<button type="button" class="deleteExample">보기 삭제</button><br>');
    
    $(this).before(optionInput);
    $(this).before(deleteButton);
});

$(document).on('click', '.deleteExample', function () {
    $(this).prev().remove();
    $(this).remove()
});

$(document).on('click', '#update_survey', function () {
    let sTitle = $(this).parent().prev().find('input[name="sTitle"]').val();
    let sId = $(this).parent().prev().find('input[name="sIdx"]').val();
    let csrfToken = $("meta[name='_csrf']").attr("content");
    let questions = [];
   	let options = [];
    
    $('.form-box').each(function () {
        let q_idx = $(this).find('input[name="qIdx"]').val();
        let q_question = $(this).find('input[name="qQuestion"]').val();
        let q_type = $(this).find('input[name="qType"]').val();
        
        
        let o_option = [];
		
        if(q_type === '2') {
        	$(this).find('input[name="oOption"]').each(function () {
        		o_option.push($(this).val());
            });
        }
        
        questions.push({
            qIdx: q_idx,
            qQuestion: q_question,
            qType: Number(q_type),
            oOption: o_option    
        });
        

    });
    
    $.ajax({
		method: "POST",
		url: "aj-updatesurvey",
		headers: {
    		"X-CSRF-TOKEN": csrfToken
    	},
    	contentType: "application/json",
    	data: JSON.stringify({"sIdx":sId, "sTitle":sTitle, "qQuestionslist": questions})

    })
    .done(function(msg){
		$('.wrap').html(msg);
    });

    console.log(questions)
});
</script>
</body>
</html>