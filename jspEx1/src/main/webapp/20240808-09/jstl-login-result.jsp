<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 파라미터 처리 -->
	<%@ include file="db2.jsp" %>
	<sql:query var="result" dataSource="${dataSource}">
		SELECT * FROM TBL_USER WHERE userId = ? AND pwd = ?
		<sql:param value="${param.id}" />
		<sql:param value="${param.pwd}" />
	</sql:query>
	<c:choose>
		<c:when test="${result.rows[0] != null}">
			<div>로그인 성공</div>
		</c:when>
		<c:otherwise>
			<div>로그인 실패</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
