<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th,  tr,  td{
		 border : 1px solid black ;
		 border-collapse: collapse;
		 padding: 10px;
	}
	.comment {
		width : 200px;
		height: 20px;
		margin-left: 20px;
	}
}
	
</style>

</head>
<body>
	<form action="board-delete.jsp" name="board">
	<%@include file="db2.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");	/* 파라미터로 보낸 'boardNo'의 값을 가져오기 */
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_BOARD WHERE boardNo = " + boardNo;
			rs = stmt.executeQuery(querytext);
			
			/* 데이터 유무의 판별(조건문) */
			if(rs.next()){
	%>			<!-- 'input'의 타입에 'hidden'을 적용하여 보이지 않게함. 하지만 'input'의 값은 그대로 존재함  -->
				<input type="hidden" 
						value="<%= rs.getString("boardNo") %>" 
						name="boardNo">
				<div>제목 : 
					<input type="text" value="<%= rs.getString("title") %>" name="title" readonly>	
				</div>	
				<div>내용 : 
					<textarea cols="50", rows="10" readonly><%= rs.getString("contents") %></textarea>
				</div>
				<hr>
				<span>댓글 <input class="comment" type="text" placeholder="댓글쓰셈" id="comment"></span>
				<button class="register" onclick="fnComment(#comment.value)">등록</button>
				<hr>
	<%
		String sessionId = (String) session.getAttribute("userId");
		String sessionStatus = (String) session.getAttribute("status");
		
		if(rs.getString("userId").equals(sessionId) || sessionStatus.equals("A")){
	%>		
			<button type="submit">삭제</button>
			<button type="button" onclick="fnNew('<%= rs.getString("boardNo") %>')">수정</button>
	<% 
		}
	%>
	<% 		
			} else {
				out.println("삭제된 게시글입니다.");
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	</form>
</body>
</html>
<script>
function fnNew(boardNo){
	location.href="board-update.jsp?boardNo=" + boardNo;
	/* 
	var form = document.board;			=> 'form'태그에서 설정한 name값('board')을 가져와 객체 생성
	form.action = "board-update.jsp";	=> 'form'태그로 생성한 객체에 'action' 재설정
	form.submit();
	
	*/
}

function fnComment(comment){
	location.href="comment.jsp?commentNo=&boardNo="+ boardNo +"&userId="+ userId +"&comment="+ comment;
}
</script>