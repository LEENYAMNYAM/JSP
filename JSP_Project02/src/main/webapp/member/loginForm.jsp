<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
crossorigin="anonymous"></script>


<title>Insert title here</title>
</head>
<body>
<div>
<div class="container mt-5">
	<div align="right">
		<a href="memberjoin.jsp"> 회원가입</a>
	</div>
	<H2> 로그인 </H2>
	    <div class="mb-3">
	      <label for="userid">UserID:</label>
	      <input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userid">
	    </div>
	   
	    <div class="mb-3">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
	    </div>   
	    
	    <div class="mt-3">
	    	<button type="submit" class="btn btn-primary" id="btnLogin">로그인</button>
	    </div>	
	  </form>

</div>
<script>
$("#btnLogin").click(function(){
	if($("#userid").val()==""){
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false;
	}//userid
	if($("#pwd").val()==""){
		alert("비밀번호를 입력하세요.");
		$("#pwd").focus();
		return false;
	}
	$.ajax({
		type : "post",
		url : "loginProc.jsp",
		data : {
			userid:$("#userid").val(),
			pwd:$("#pwd").val()
		},
		success : function(resp){
			if(resp==1){
				alert("로그인성공")
				$(location).attr("href","memberList.jsp");
			}else if(resp==-1){
				alert("회원이 아닙니다. 회원가입하세요")
			}else if(resp==2){
				alert("비밀번호가 틀립니다. 비번을 확인하세요")
			}
		},
		error : function(e){
			alert(e + "error")
		}
	}) //ajax
	
	
})


</script>

</div>
</body>
</html>