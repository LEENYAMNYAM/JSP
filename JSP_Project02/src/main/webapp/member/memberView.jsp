<%@page import="com.member.dto.Member"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/JSP_Project02/js/member.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 
String sid=(String) session.getAttribute("sUserid");
MemberDAO dao = MemberDAOImpl.getInstance();
Member member = dao.findById(sid);
%>

<div class="container mt-5">
	<div align="right">
		<a href="memberView.jsp"><%=sid %></a>님 받갑습니다./
		
		<a href="logout.jsp">로그아웃</a>
	</div>

	<form action="memberUpdateProc.jsp" method="post" id="frm">
	 
	 <!-- memberView.jsp에 userid값이 없는데 불러와야 할때 방법2-->
	 <!--<input type="hidden" name= "userid" value="<%=member.getUserid()%>">    -->
	    <div class="mb-3 mt-3">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" value="<%=member.getName()%>">
	    </div>
	    
	    <div class="mb-3">
		  <label for="userid">UserID:</label>
		  <input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userid" value="<%=member.getUserid()%>" readonly="readonly">
		</div>
	    
	    <div class="mb-3">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" value="<%=member.getPwd()%>">
	    </div>   
	     
	    <div class="mb-3">
	      <label for="pwd_check">Password_check:</label>
	      <input type="text" class="form-control" id="pwd_check" placeholder="Enter password_check" name="pwd_chek">
	    </div> 
	     
	    <div class="mb-3">
	      <label for="">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" value="<%=member.getEmail()%>">
	    </div>	    
	    
	    <div class="mb-3">
	      <label for="phone">Phone:</label>
	      <input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone" value="<%=member.getPhone()%>">
	    </div>
	   
		<div class="form-check-inline">
	      <input type="radio" class="form-check-input" id="radio1" name="admin" value="0">
	      <label class="form-check-label" for="radio1">일반회원</label>
	    </div>
	    <div class="form-check-inline">
	      <input type="radio" class="form-check-input" id="radio2" name="admin" value="1">
	      <label class="form-check-label" for="radio2">관리자</label>
	    </div>
	    
	    <!-- 스크립트를 radio 밑에 줘야지 admin 변수를 인식할수 있게 됨. 일반회원인지 관리자인지 확인추 체크표시 되도록 함-->
	    <script>
	    /* 자바스트립트를 활용 */
<%-- 	    
		    if(document.getElementsByName('admin')[0].value == <%=member.getAdmin()%>){
		       document.getElementsByName('admin')[0].checked = true
		    }else{
		       document.getElementsByName('admin')[1].checked = true	
		    }
--%>
	    /* JSP활용 */
	    /* atte은 속성값을 물어보는 함수임 */
	    $("input:radio[value=<%=member.getAdmin()%>]").attr('checked', true);
	    
	    </script>
	    
	    <div class="mt-3">
	    	<button type="button" class="btn btn-primary" id="btnSend">수정하기</button>
	    	<button type="reset" class="btn btn-secondary">취소하기</button>
	    	<!--  location.href 속성을 사용해서 탈퇴하기 만듦-->
	    	<button type="button" class="btn btn-danger" onclick="location.href='userDeleteProc.jsp'">탈퇴하기</button>
	    </div>	
	  </form>


</div>
</body>
</html>