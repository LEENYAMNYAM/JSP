<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORM RESULT</title>
</head>
<%
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String[] hobby = request.getParameterValues("hobby");
	String tmp="";
	if(hobby!=null){
		for (int i=0; i<hobby.length; i++){
			tmp +=hobby[i]+" ";
		}
	}

String job = request.getParameter("job");
%>
<body>

이    름 : <%=name %> <br/>
나    이 : <%=age %> <br/>	
성    별 : <%=gender %> <br/>
관심 분야 : <%=tmp %> <br/>
직    업 : <%=job %> <br/>
<hr/>
<!-- 굳이 여러번 사용안되면 위에 부분 작정할 필요없이 바로 request.getParameter 해도 됨. -->
이    름 : <%=request.getParameter("name") %> <br/>
나    이 : <%=request.getParameter("age") %> <br/>
성    별 : <%=request.getParameter("gender") %> <br/>
관심 분야 : <%=tmp %> <br/>
직    업 : <%=request.getParameter("job") %> <br/>
<hr/>

</body>
</html>