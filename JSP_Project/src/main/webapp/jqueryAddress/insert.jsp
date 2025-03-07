<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function zipfinder(){
	window.open("zipCheck.jsp", "", "width=700 height=400")
	// open(url주소, 새창이름, 새창의 속성들을 입력하면 됨,,,) 입력
}
</script>
</head>
<body>
<div align = "right">
	<a href= "list.jsp">JQUERY ADDRESS 전체보기</a>
</div>
<form action="insertProc.jsp">
	<table border=1>
		<tr>
			<td colspan="2"> 주소록 등록하기</td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td><input type='text' name="name" id="name"></td>
		</tr>
		<tr>
			<td> 우편번호 </td>
			<td><input type='text' size = 5 name="zipcode" id="zipcode" readonly="readonly">
				<button type="button" onclick="zipfinder()"> 검색 </button></td>
		</tr>		
		<tr>
			<td> 주소 </td>
			<td><input type='text' size = 50 name="addr" id="addr"></td>
		</tr>
		<tr>
			<td> 전화번호 </td>
			<td><input type="text" name="tel" id="tel"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" value="등록">
			                <input type="reset" value="취소"></td>
		</tr>
	</table>
</form>
</body>
</html>