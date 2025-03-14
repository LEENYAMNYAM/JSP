<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 여러가지 자카르타 가져와도 됨. 지금은 tags.core 가져왔고 걜 c라고 할거임  -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/List.do">BOARD</a>
      </li>      
      <li class="nav-item">
        <a class="nav-link" href="#">PRODUCT</a>
      </li>
    </ul>
    <ul class="navbar-nav">
    	<c:if test="${sessionScope.suser.admin==1}">
    		<span class="nav-link active">(${sessionScope.suser.name}관리자)님 반갑습니다.</span>
    	</c:if>
    	<c:if test="${sessionScope.suser.admin==0}">
    		<span class="nav-link active">(${sessionScope.suser.name})님 반갑습니다.</span>
    	</c:if>
    	<c:if test="${not empty sessionScope.suser}">
			<li class="nav-item">
	        	<a class="nav-link" href="/member/logout.do">로그아웃</a>
	      	</li>
	      	<li class="nav-item">
	        	<a class="nav-link" href="/member/join.do">회원변경</a>
	      	</li>
	     </c:if>
    	<c:if test="${empty sessionScope.suser}">   <!-- sessionScope에 들어있는 suser가 비어있다면이라는 의미 -->
			<li class="nav-item">
	        	<a class="nav-link" href="/member/login.do">로그인</a>
	      	</li>
	      	<li class="nav-item">
	        	<a class="nav-link" href="/member/join.do">회원가입</a>
	      	</li>
	     </c:if>	      
    </ul>
  </div>
</nav>

