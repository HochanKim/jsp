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
<style>
    table, th, tr, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
    }
    a:visited, a:link {
        color: black;
        text-decoration: none;
        font-weight: bold;
    }
</style>
</head>
<body>
	<div>
		<button onclick="location.href='list02.jsp'">게시판으로 이동</button>
	</div>
	<%@ include file="db2.jsp" %>
	<!-- 쿼리 불러오기 -->
	<sql:query var="result" dataSource="${dataSource}">
        SELECT * FROM TBL_USER
    </sql:query> <!-- 쿼리담은 객체 변수명 'result'  -->
	
	<!-- 테이블 생성  -->
	<table style="margin-top : 10px;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>권한</th>
			<th>비밀번호</th>
		</tr>
		<c:forEach var="rows" items="${result.rows}">
			<tr>
				<td>${rows.userId}</td>
				<td>${rows.name}</td>
				<td>
					<c:if test="${rows.status == 'A'}">관리자</c:if>
					<c:if test="${rows.status == 'C'}">일반회원</c:if>
					
				</td>
				<td>
					<c:if test="${rows.cnt >= 5}">
						<button onclick="fnReset('${rows.userId}')">초기화</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
<!-- <script>
	function fnReset(userId){
		/* location.href="pwd-reset.jsp?userId="+userId; */
		window.open(
			"pwd-reset.jsp?userId="+userId, "reset", "width=500, height=500");
	}
	
	function fnReload(){
		location.reload();
	}
</script> -->