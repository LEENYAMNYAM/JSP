<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/JSP_Project02/js/member.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container mt-5">
	<H2> 회원가입 </H2>
	<form action="memberjoinProc.jsp" method="post" id="frm">
	    <div class="mb-3 mt-3">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
	    </div>
	    
	    <div class="row">
		    <div class="col mb-3">
		      <label for="userid">UserID:</label>
		      <input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userid">
		    </div>
		    <div class="col mb-3 align-self-end">
		    	<button type="button" class="btn btn-secondary" id="btnIdCheck">중복확인</button>
		    </div>
	    </div>
	    
	    <div class="mb-3">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
	    </div>   
	     
	    <div class="mb-3">
	      <label for="pwd_check">Password_check:</label>
	      <input type="text" class="form-control" id="pwd_check" placeholder="Enter password_check" name="pwd_chek">
	    </div> 
	     
	    <div class="mb-3">
	      <label for="">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
	    </div>	    
	    
	    <div class="mb-3">
	      <label for="phone">Phone:</label>
	      <input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
	    </div>
	    
		<div class="form-check-inline">
	      <input type="radio" class="form-check-input" id="radio1" name="admin" value="0" checked>
	      <label class="form-check-label" for="radio1">일반회원</label>
	    </div>
	    <div class="form-check-inline">
	      <input type="radio" class="form-check-input" id="radio2" name="admin" value="1">
	      <label class="form-check-label" for="radio2">관리자</label>
	    </div>
	    <div class="mt-3">
	    	<button type="submit" class="btn btn-primary">Submit</button>
	    </div>	
	  </form>

</div>
</body>
</html>