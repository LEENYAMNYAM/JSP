<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
crossorigin="anonymous"></script>

<script>
//$는 jquery를 부를때 쓰는 기호
//$(document).ready(function(){
$(function(){	
	/* 윗부분이 있어야지 뒤에서 선언되는 변수값들을 문제없이 사용가능.
	   이부분을 쓰고 싶지 않으면 아래부분의 코드를 java코드보다 아랫부분(보통은 body태그 다음에)에 <script>로 감싸서 복붙하면 됨 */
	
	$("#btn").click( function(){
		if($("#name").val()==""){			// 제이쿼리를 통해 name값(value)불러옴
			alert("이름입력")
			return;
		}			
		if($("#kor").val()==""){
			alert("국어점수 입력")
			return;
		}
		if($("#eng").val()==""){
			alert("영어점수 입력")
			return;
		}
		if($("#math").val()==""){
			alert("수학점수 입력")
			return;
		}
		$("#frm").submit()
		
	});	

});


</script>

</head>
<body>

<form action='scoreResult2.jsp' id="frm">
	이름 : <input type='text' name='name' id="name"></br>
	국어 : <input type="number" name='kor' id="kor"></br>
	영어 : <input type="number" name='eng' id="eng"></br>
	수학 : <input type="number" name='math' id="math"></br>
	<button type="button" id="btn">jquery전송</button> 
	<!-- jquery는 검색해서 다운받거나 CDN 접속 중 선택해도 됨. 지금은 CDN버전으로 해봄.  -->

</form>

</body>
</html>