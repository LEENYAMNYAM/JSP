<%@page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="sb" class="com.exam.ScoreBean"></jsp:useBean>
<jsp:setProperty property="*" name="sb"/>
<body>
<h3>scoreResult3.jsp</h3>
이름:<jsp:getProperty property="name" name="sb"/><br/>
국어: <jsp:getProperty property="kor" name="sb"/> <br/>
영어:<jsp:getProperty property="eng" name="sb"/><br/>
수학:<jsp:getProperty property="math" name="sb"/><br/>

<hr/>
이름: <%= sb.getName() %><br/>
국어: <%= sb.getKor() %><br/>
영어: <%= sb.getEng() %><br/>
수학: <%= sb.getMath() %><br/>
총점: <%=sb.getTotal() %><br/>
평균 :<%=sb.getAvg() %><br/>
학점:<%=sb.getGrade() %>

</body>
</html>





