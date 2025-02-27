<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% // 스크립트릿(JSP를 해석하기위한 언어)

request.setCharacterEncoding("utf-8");	//10버전 이전에서는 이거 없으면 한글이 깨져서 나왔음

String name = request.getParameter("name");		// 주소의 파라미터에서 name값 가져와서 name에 저장
String addr = request.getParameter("addr");		// 주소의 파라미터에서 addr값 가져와서 addr에 저장
%>
<body>
이름 : <% out.println(name); %><br/>
주소 : <% out.println(addr); %><br/>
<hr/>
<!-- 간략화시켜서 아래와 같이 씀 -->

이름 : <%= name %><br/>
주소 : <%= addr %><br/>
</body>
</html>