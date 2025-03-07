<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORM EXAM_javascript</title>
<script>
function check(){
	// 이름, 나이가 비어 있나 검사해서 비어있지 않으면  서버로 전송
	if(document.querySelector("#name").value==""){
		alert("이름입력")
		return;
	}
	if(document.getElementById("age").value ==""){
		alert("나이입력")
		return;
	}
	//관심분야 선택은 안하면 선택메세지 alert
	
	var chk_ob = document.getElementsByName("hobby");
	var chk_flag = false;   // 선택이 하나라도 안됨
/* 	for(i=0; i<chk_ob.length;i++){
		if(chk_ob[i].checked){
			chk_flag = true;   //  chk_flag 가 true 면 선택된 게 있음
		}
	} */
	chk_ob.forEach(f => {
		if(f.checked){
			chk_flag = true
		}
	});
	
	
	if(chk_flag == false){
		alert("관심분야 선택")
		return;
	}
	
	
	document.getElementById("frm").submit()
	
}
</script>
</head>
<body>
<form action="formResult.jsp" method="get" id="frm">
 이름 : <input type="text" name="name" id="name"><br/>
나이 : <input type="text" name="age" id="age"><br/>
성별:
  <label for="m">남자</label>
 <input type="radio" name="gender" id="m"  value="남자" checked>
 <label for="f">여자</label>
 <input type="radio" name="gender" id="f"  value="여자"><br/>
 관심분야:
  <label for="h1">운동</label>
  <input type="checkbox" name="hobby"  value="운동"  id="h1">
  <label for="h2">게임 </label>
  <input type="checkbox" name="hobby"   value="게임"  id="h2">
  <label for="h3">등산 </label>
  <input type="checkbox" name="hobby" value="등산"   id="h3">
  <label for="h4">영화 </label>
  <input type="checkbox" name="hobby"  value="영화"  id="h4"><br/>
 직업:
 <select name="job">
	 <option value="student"> 학생</option>
	 <option  value="공무원"> 공무원</option>
	 <option> 회사원</option>
     <option> 기타</option>
 </select><br/>
 <input type=button value="button전송"  onclick ="check()"/>
 </form>
</body>
</html>