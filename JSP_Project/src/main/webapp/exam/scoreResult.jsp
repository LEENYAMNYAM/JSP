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
String name = request.getParameter("name");	
int kor = Integer.parseInt( request.getParameter("kor") );
int eng = Integer.parseInt( request.getParameter("eng") );
int math = Integer.parseInt( request.getParameter("math") );
int total = kor + eng + math;
//실수 기본값이 double이라서 3.0f라고 적어줘야 float형이 됨.
float avg = total / 3.0f;

//등급분류
String grade;
/*	//switch문 활용
switch((int)avg/10){
case 10:
case 9:	grade="A"; break;
case 8: grade="B"; break;
case 7: grade="C"; break;
default: grade="F";
}   */
	
	//if문 활용
if ((avg>=90) && (avg<=100)) grade = "A";
else if(avg>=80) grade = "B";
else if(avg>=70) grade = "C";
else if(avg>=0) grade = "F";
else grade = "입력오류";

%>

<body>
이름 : <%= name %><br/>
국어 : <%= kor %><br/>
영어 : <%= eng %><br/>
수학 : <%= math %><br/>
총점 : <%= total %><br/>
평균 : <%= avg %><br/>
학점 : <%= grade %><br/>

</body>
</html>