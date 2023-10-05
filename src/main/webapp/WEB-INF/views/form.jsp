<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	font-weight: bold;
}
</style>
<body>
	<div class="wrap">
		<div class="form" >
			<h1>설문조사</h1>
			<input type="text" placeholder="설문지 설명" class="sur" name="survey">
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
					<option value="3">장문형</option>
				</select>
	<!--  			<input type="text" name="q_anwser" placeholder="답변"><br>-->
				<hr>
				<button type="button" class="addQuestion">질문 추가</button>
				
			</div>
			<div style="display: none;">
				<button type="button" class="delete">취소</button>
			</div>
		</div>
	</div>
	<div class="button-container">
		<a id="btn_survey" class="custom-button" type="button">설문지 만들기</a>
	</div>
	
<script>
$(document).on('click', '.delete', function() {
	$(this).parent().parent().toggle();
});
$(document).on('click', '.addQuestion', function() {
    var newFormBox = $('<div class="form-box"></div>');
    var newQuestion = $('<div class="question"></div>');
    var titleInput = $('<input class="input" type="text" name="q_title" placeholder="질문">');
    var selectBox = $('<select clsee="QuestionType" name="q_type"><option value="none">== 선택 ==</option><option value="1">주관식</option><option value="2">객관식</option><option value="3">장문형</select>');
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
$(document).on('click', '#btn_survey', function () {
    let questions = [];
    let name = $(this).parent().prev().find('input[name="survey"]').val();
    let title = $(this).parent().prev().find('input[name="q_title"]').val();
    let type = $(this).parent().prev().find('select[name="q_type"]').val();
    let csrfToken = $("meta[name='_csrf']").attr("content");
    
    $('.question').each(function () {
        let q_title = $(this).find('input[name="q_title"]').val();
        let q_type = $(this).find('select[name="q_type"]').val();
        let q_items = [];
		
        if(q_type === '2') {
        	$(this).find('input[name="q_ar[]"]').each(function() {

				let option = {
			        OPTION: $(this).val()
			    };
	
				q_items.push(option);
        	});
        }
        
        let question = {
            title: q_title,
            type: Number(q_type),
            items: q_items
        }
        questions.push(question);
    });

	console.log(name, questions);
	
	$.ajax({
		method: "POST",
		url: "aj-insert",
		headers: {
			"X-CSRF-TOKEN": csrfToken
		},
		contentType: "application/json",
		data: JSON.stringify({
			sTitle: name,
		    qQueation: title,
		    qType: type
		}),
	})
	.done(function(msg) {
		$('#surveyList').html(msg);
	});

});
</script>
</body>
</html>