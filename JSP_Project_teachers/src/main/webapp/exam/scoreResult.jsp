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
   String name = request.getParameter("name");
   int kor =Integer.parseInt(request.getParameter("kor"));
   int eng = Integer.parseInt(request.getParameter("eng"));
   int math =Integer.parseInt(request.getParameter("math"));
   int total = kor+eng+math;
   float avg = total/3.0f;
   //A,B,C,F
   //switch
   String grade = "";
/*    switch((int)avg/10){
	   	case 10 :
	   	case 9 : grade ="A"; break;
	   	case 8 : grade ="B"; break;
	   	case 7 :grade ="C"; break;
   		default: grade ="F"; 
   } */
	if(avg>=90) {
		grade ="A";
	}else if(avg>=80){
		grade ="B";
	}else if(avg>=70){
		grade ="C";
	}else{
		grade ="F";
	}
%>
<body>
이름  :<%= name  %> <br/>
국어 :<%= kor  %> <br/>
영어 :<%= eng  %> <br/>
수학 :<%= math  %> <br/>
총점 :<%=total %>  <br/>
평균: <%=avg %>  <br/>
학점:<%=grade %>







</body>
</html>