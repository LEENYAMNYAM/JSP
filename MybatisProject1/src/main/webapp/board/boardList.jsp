<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<c:forEach items="${blist}" var="board" varStatus="st">
					<tr>
					<!-- .index는 인덱스니까 0부터 시작하고, .count는 1부터 시작함 -->
						<td>${rowNo-st.index }</td>
						<td><a href="view.do?num=${board.num}"> ${board.subject }</a></td> 
						<td>${board.userid }</td>
						<td>${board.regdate }</td>
						<td>${board.readcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>