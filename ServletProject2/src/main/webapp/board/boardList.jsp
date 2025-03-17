<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="jakarta.tags.core" %>
<%@ include file ="../includes/header.jsp" %>
<script>
$(function(){  
	$("#btnWrite").click(function(){
		if(${empty sessionScope.suser}){
			alert("로그인하세요")
			location.href ="/member/login.do"
			return false;
		}
		location.href="/board/write.do"
	})
})
</script>
	<div class="container mt-5">
		<H2> Board LIST ( ${count}개 ) </H2>
		<div class="mt-5 mb3">
			<button class="btn btn-secondary" id="btnWrite">글쓰기</button>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>			
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${barr}" var="board">
					<tr>
						<td>${board.num }</td>
						<td><a href="view.do?num=${board.num}"> ${board.subject }</a></td> 
						<td>${board.userid }</td>
						<td>${board.regdate }</td>
						<td>${board.readcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-between mt-3">
			<ul class="pagination">
				<!-- 이전 버튼이 나와야 하는 if문 -->
				<c:if test="${p.startPage > p.blockPage}">
				    <li class="page-item"><a class="page-link" href="List.do?pageNum=${p.startPage - p.blockPage}">Previous</a></li>
				</c:if>
				<!-- 페이지번호 -->
				<c:forEach begin="${p.startPage }" end="${p.endPage }" var="i">
					<c:if test="${p.currentPage!=i}">
				    	<li class="page-item"><a class="page-link" href="List.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${p.currentPage==i}">
				    	<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
					</c:if>
				</c:forEach>  
				<!-- 이후 버튼이 나와야 하는 if문 -->
				<c:if test="${p.endPage < p.totPage}">  
				    <li class="page-item"><a class="page-link" href="List.do?pageNum=${p.endPage+1}">Next</a></li>
				</c:if>  
			</ul>
			<form class="d-inline-flex input-group-sm">
				<select class ="form-select-sm" id="searchField" name="searchField">
					<option value="subject">제목</option>
					<option value="sontent">내용</option>
				</select>
				<input type='text' class="form-control" id="searchWord" name="searchWord">
				<button type="submit" class="btn btn-primary">Search</button>
			</form>
		</div>	
	</div>
</body>
</html>