<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
	/* 	if(document.frm.name.value==""){
			alert("이름을 입력하세요")
		} */
	 	if(document.getElementById("name").value ==""){
			alert("이름을 입력하세요!!")
			return;
		} 
		if(document.getElementById("kor").value ==""){
			alert("국어점수을 입력하세요!!")
			return;
		}
		if(document.getElementById("eng").value ==""){
			alert("영어점수 입력하세요!!")
			return;
		}
		if(document.getElementById("math").value ==""){
			alert("수학점수 입력하세요!!")
			return;
		}
		document.getElementById("frm").submit();

	}
</script>
</head>
<body>
<form action="scoreResult.jsp"  id="frm">
	이름: <input type="text" name ="name"  id="name"><br/>
	국어: <input type="number" name ="kor"      id="kor"><br/>
	영어:<input type="number" name ="eng"      id="eng"><br/>
	수학:<input type="number" name ="math"   id="math"><br/>
	<input type="button" value="button전송"  onclick = "check()"/>
</form>
</body>
</html>