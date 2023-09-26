<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	background-color: lightgrey;
	width: 400px;
	height: 30px;
	font-size: 15px;
}
.sur {
	width: 500px;
	height: 50px;
	font-size: 20px;
	text-dexoration: underline;
	border: none;
	text-align: center;
}
</style>
<body>
	<div class="wrap">
		<div class="form" >
			<h1>설문조사</h1>
			<input type="text" placeholder="설문지 설명" class="sur">
			<hr class="my-4">
			<p class="lead">
			<button type="button" class="addQuestion">질문 시작하기</button>
		</div>
	 	<div class="form-box" >
			<div class="question">
				<input class="input" type="text" name="q_title" placeholder="질문">
				<select class="QuestionType" name="q_type">
					<option value="none">== 선택 ==</option>
					<option value="1">주관식</option>
					<option value="2">객관식</option>
					<option value="3">단답형</option>
					<option value="4">장문형</option>
				</select>
				<input type="text" name="q_anwser" placeholder="답변"><br>
				<hr>
				<button type="button" class="addQuestion">질문 추가</button>
				
			</div>
			<div style="display: none;">
				<button type="button" class="delete">취소</button>
			</div>
		</div>
	</div>
	<div class="button-container">
		<a class="custom-button" type="button" href="/">제출하기</a>
	</div>
	
<script>
$(document).on('click', '.delete', function() {
	$(this).parent().parent().toggle();
});
$(document).on('click', '.addQuestion', function() {
    var newFormBox = $('<div class="form-box"></div>');
    var newQuestion = $('<div class="question"></div>');
    var titleInput = $('<input class="input" type="text" name="q_title" placeholder="질문">');
    var selectBox = $('<select clsee="QuestionType" name="q_type"><option value="none">== 선택 ==</option><option value="1">주관식</option><option value="2">객관식</option><option value="3">단답형</option><option value="4">장문형</option></select>');
    var answerInput = $('<input type="text" name="q_answer" placeholder="답변"><br><hr>');
    var addButton = $('<button type="button" class="addQuestion">질문 추가</button>');
    var addButtonn = $('<button type="button" class="delete">취소</button>');

    newQuestion.append(titleInput);
    newQuestion.append(selectBox);
    newQuestion.append(answerInput);
    newQuestion.append(addButton);
    newQuestion.append(addButtonn);
    newFormBox.append(newQuestion);

    $('.wrap').append(newFormBox);
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
    if ($(this).val() === '2') {
        $(this).next().after("<div class='form2'><input type='text' placeholder='보기' class='example'> <button type='button' class='deleteExample'>보기 삭제</button></div><button type='button' class='addExample'>보기 추가하기</button>");
    } else {
        $(this).parent().find('.form2').remove();
    }
});

$(document).on('click', '.addExample', function () {
    $(this).prev().prev().children().last().after("<input type='text' placeholder='보기' class='example'> <button type='button' class='deleteExample'>보기 삭제</button>");
});

$(document).on('click', '.deleteExample', function () {
    $(this).prev().remove(); // Remove the input field
    $(this).remove(); // Remove the delete button
});
</script>
</body>
</html>