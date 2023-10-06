<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>설문조사 목록</h1>
      <table>
      	<tr>
      		<td>id</td>
      		<td>title</td>
      		<td>datetime</td>
      	</tr>
      	<c:forEach var="list" items="${list }">
	      	<tr>
	      		<td>${list.sIdx }</td>
	      		<td>${list.sTitle}</td>
	      		<td>${list.sDateTime}</td>
	      	</tr>
      	</c:forEach>
      </table>

	
</body>
</html>