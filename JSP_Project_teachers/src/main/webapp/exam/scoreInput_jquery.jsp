<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script>
//$(document).ready(function(){
$(function(){
	$("#btn").click(function(){
		if($("#name").val()==""){
			alert("이름입력")
			return;
		}
		if($("#kor").val()==""){  //국어
			alert("국어점수입력")
			return;
		}
		if($("#eng").val()==""){ //영어
			alert("영어점수입력")
			return;
		}
		if($("#math").val()==""){  //수학
			alert("수학점수입력")
			return;
		}
		$("#frm").submit()
	});  // btn click
}) //ready


</script>
</head>
<body>
<form action="scoreResult2.jsp" id="frm">
이름: <input type="text" name ="name"  id="name"><br/>
국어: <input type="number" name ="kor"      id="kor"><br/>
영어:<input type="number" name ="eng"      id="eng"><br/>
수학:<input type="number" name ="math"  id="math"><br/>
<button type="button" id="btn">jquery전송</button>
</form>

</body>
</html>