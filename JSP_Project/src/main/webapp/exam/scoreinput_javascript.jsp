<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
	/*	if(document.frm.name.value==""){
			alert("이름을 입력하세요")
		}	*/
		if(document.getElementById("name").value==""){
			alert("이름을 입력하세요!!")
			return;
		}
		if(document.getElementById("kor").value==""){
			alert("국어점수 입력하세요!!")
			return;
		}
		if(document.getElementById("eng").value==""){
			alert("영어점수 입력하세요!!")
			return;
		}
		if(document.getElementById("math").value==""){
			alert("수학점수 입력하세요!!")
			return;
		}
		
		// form의 action을 실행시키려면
		document.getElementById("frm").submit();
		
	}

</script>
</head>
<body>

<form action='scoreResult.jsp' id="frm" name="frm">
	이름 : <input type='text' id="name" name='name'></br>
	국어 : <input type="text" id="kor" name='kor'></br>
	영어 : <input type="text" id="eng" name='eng'></br>
	수학 : <input type="text" id="math" name='math'></br>
	<input type='button' value='버튼전송' onclick="check()"/>

</form>

</body>
</html>