<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORM EXAM</title>
<script>
function check(){
	//이름, 나이가 비어 있는 지 확인해서 비어있지 않으면 server로 전송
	if(document.getElementById("name").value==""){
		alert("이름 입력")
		return;
	}
	if(document.getElementById("age").value==""){
		alert("나이 입력")
		return;
	}
	
	//관심분야 선택을 안하면 선택메세지 alert
	
	var chk_ob = document.getElementsByName("hobby");
	var chk_flag = false;		//false 이면 취미가 하나도 선택안됨.

	//for문 사용
	/* 	for (i=0; i<chk_ob.length; i++){
		if(chk_ob[i].checked){
			chk_flag=true;  	//true 이면 취미가 1개이상 선택됨.
		}
	} */
	//for-each문 사용
	chk_ob.forEach(f=>{
		if(f.checked){
			chk_flag=true
		}
	});
	
	if(!chk_flag){
		alert("관심분야 선택")
		return;
	}
	
	document.getElementById("frm").submit();
	
}

</script>
</head>
<body>

<form action="formResult.jsp" method="get" id="frm">
이름 : <input type="text" id="name" name="name" placeholder="짱구"></br>
나이 : <input type="number" id="age" name="age"></br>
성별 : <label for="m">남자</label> 
	  <input type="radio" name="gender" id="m" value="남자" checked> 
	  <label for="w">여자</label> 
	  <input type="radio" name="gender" id="w" value="여자" ></br>
관심분야 : <label for="h1">운동</label> 
		 <input type="checkbox" name="hobby" id="h1" value="운동"> 
		 <label for="h2">게임</label>
		 <input type="checkbox" name="hobby" id="h2" value="게임"> 
		 <label for="h3">등산</label>
		 <input type="checkbox" name="hobby" id="h3" value="등산"> 
		 <label for="h4">영화</label>
		 <input type="checkbox" name="hobby" id="h4" value="영화"></br>
직업 : <select name="job" id="job">
	  	<option>학생</option>    <!-- value 지정안하면 입력한 값이 전달됨. -->
	  	<option value="공무원">공무원</option>
	  	<option value="회사원">회사원</option>
	  	<option value="기타">기타</option>
	  </select> </br>
	  
<input type="button" value="버튼전송" onclick="check()"/>



</form>

</body>
</html>