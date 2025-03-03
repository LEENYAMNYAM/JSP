<%@ page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreResult</title>
</head>
<% // 스크립트릿(JSP를 해석하기위한 언어)
request.setCharacterEncoding("utf-8");
%>

<!-- jsp 액션태그 -->
<!-- 자바에서 String name = request.getParameter("name"); 와 같은 역할을 함   -->
<jsp:useBean id ="sb" class="com.exam.ScoreBean"></jsp:useBean>

<!-- sb의 모든 필드를 가져옴 -->
<jsp:setProperty property="*" name="sb"/>

<body>
<!-- jsp setProperty 활용 -->
<h3>scoreResult3.jsp</h3>
이름 : <jsp:getProperty property="name" name="sb"/><br/>
국어 : <jsp:getProperty property="kor" name="sb"/><br/>
영어 : <jsp:getProperty property="eng" name="sb"/><br/>
수학 : <jsp:getProperty property="math" name="sb"/><br/>

<!-- 이부분은 원래대로 하는게 더 간단함. -->
<hr>
이름 : <%= sb.getName() %><br/>
국어 : <%= sb.getKor() %><br/>
영어 : <%= sb.getEng() %><br/>
수학 : <%= sb.getMath() %><br/>
총점 : <%= sb.getTotal() %><br/>
평균 : <%= sb.getAvg() %><br/>
학점 : <%= sb.getGrade() %>

</body>
</html>