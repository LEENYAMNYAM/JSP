<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>   
 <%@ include file ="../includes/header.jsp" %>   

<div class="container mt-5">
	<h2>Board LIST(${count })</h2>
	
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
		  <c:forEach items="${barr }" var="board"  varStatus="st">
		  	<tr>
		  			<td>${board.num } </td>
		  			<td><a href="view.my?num=${board.num }">${board.subject }</a></td>
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