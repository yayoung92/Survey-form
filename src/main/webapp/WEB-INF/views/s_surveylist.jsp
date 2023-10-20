<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div id="s_surveylist">
	<h1>설문지 목록</h1>
      <table style="text-align:center;">
      	<col width="50px">
		<col width="150px">
		<col width="200px">
      	<tr>
      		<td style="background-color:#eeeeee; text-align:center;">번호</td>
      		<td style="background-color:#eeeeee; text-align:center;">제목</td>
      		<td style="background-color:#eeeeee; text-align:center;">등록일</td>

      	</tr>
      	<c:forEach var="list" items="${list }">
	      	<tr>
	      		<td><a href="/resultSurvey?sIdx=${list.sIdx}">${list.sIdx }</a></td>
	      		<td>${list.sTitle}</td>
	      		<td>${list.sDateTime}</td>
	      	</tr>
      	</c:forEach>
      </table>
    <div class="button-container">
    	<a class="custom-button" href="form-view" role="button">설문지 만들기</a>
    </div>
</div>