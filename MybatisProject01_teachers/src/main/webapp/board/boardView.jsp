<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-5">
	<h2>Board VIEW</h2>
	<input type="hidden" name="num" id="num" value="${board.num }">
	<table class="table table-hover">
		<tr>
			<th>글번호</th>
			<td>${board.num }</td>
			<th>조회수</th>
			<td>${board.readcount }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.userid }</td>
			<th>작성일</th>
			<td>${board.regdate }</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${board.subject }</td>
		</tr>
		<tr>
			<th>내용</th>
		<td colspan="3">${board.content }</td>
		</tr>
	</table>

		<button type="button" class="btn btn-primary"
		 onclick="location.href='update.my?num=${board.num}'">수정</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='delete.my?num=${board.num}'">삭제</button>
</div>

</body>
</html>




