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
		if(document.querySelector("#name").value==""){		// querySelector로도 가능하고 다른if처럼 getElementById도 가능
			alert("이름을 입력하세요!!")
			return false;
		}
		if(document.getElementById("kor").value==""){		
			alert("국어점수 입력하세요!!")
			return false;
		}
		if(document.getElementById("eng").value==""){
			alert("영어점수 입력하세요!!")
			return false;
		}
		if(document.getElementById("math").value==""){
			alert("수학점수 입력하세요!!")
			return false;
		}
		return true;
		
		// form의 action을 실행시키려면
		document.getElementById("frm").submit();
		
	}

</script>
</head>
<body>

<!-- onsubmit을 활용하면 submit타입도 사용가능 -->
<form action='scoreResult.jsp' id="frm" onsubmit="return check()">
	이름 : <input type='text' id="name" name='name'></br>
	국어 : <input type="text" id="kor" name='kor'></br>
	영어 : <input type="text" id="eng" name='eng'></br>
	수학 : <input type="text" id="math" name='math'></br>
	<input type='submit' value='submit전송' />
<!-- 	
	<button>버튼태그전송</button>
	<input type="submit" value = "전송">
-->
</form>

</body>
</html>