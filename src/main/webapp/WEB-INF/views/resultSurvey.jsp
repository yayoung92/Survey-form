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
	<h1>설문조사</h1>
	<div class="wrap">
		<div class="form" >
		<div id="surveyList">
			<c:forEach items="${survey }" var="survey">
			<div class="surveyList" class="sur">
				${survey.sTitle }
			</div>
			</c:forEach>
		</div>
		<hr class="my-4">
		</div>
	</div>
	<div class="button-container">
		<a id="btn_survey" class="custom-button" type="button">제출하기</a>
	</div>
</body>
</html>