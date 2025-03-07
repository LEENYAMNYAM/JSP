<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORM EXAM_jqeury</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script>
$(function(){
	$("#btn").click(function(){
		//이름, 나이 체크
		if($("#name").val()==""){
			alert("이름입력!!!")
			return;
		}
		if($("#age").val()==""){
			alert("나이입력!!!")
			return;
		}
		//관심분야
	//  alert($("input:checkbox[name='hobby']:checked").length)
	if($("input:checkbox[name='hobby']:checked").length == 0 ){
		alert("관심분야선택!!!")
		return;
	}
	$("#frm").submit();
	}) //btn

}) // ready

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
 <input type=button value="jquery전송"  id="btn"/>
 </form>
</body>
</html>