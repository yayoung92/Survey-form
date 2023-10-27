<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


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

