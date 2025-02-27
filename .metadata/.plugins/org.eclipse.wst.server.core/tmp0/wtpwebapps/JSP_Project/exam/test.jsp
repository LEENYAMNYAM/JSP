<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 테스트 : 서버 </h3>
<!-- html 복습 : method='get' 헤더에 담아서 전달, method='post' 헤더에서 담지 않고 전달  -->
<form action='testResult.jsp' method='get'>
이름 : <input type='text' name ='name'></br>
주소 : <input type='text' name = 'addr'></br>
<input type='button' value='button전송'/>
<input type='submit' value='submit전송'>
</form>

</body>
</html>
