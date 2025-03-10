<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  톰캣 10이상버전일때 -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- 톰캣 9버전이하일때 -->
<%--  <%@ taglib prefix="c" uri="jakarta.tags.core" %>   --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 여기서 $는 EL언어임 -->
이    름 : ${form.name}  ////  <c:out value="${form.name}" /><br/>                <!--  -->
나    이 : ${form.age}<br/>
성    별 : ${form.gender}<br/>
직    업 : ${form.job}<br/>
<!-- jstl을 통해서 for문을 돌려야함 p343, p379참고-->
<!-- 라이브러리 2개 추가함 자카르타로 시작하는거 주개 -->
취    미 : ${form.hobby}
<hr/>
<!-- 아이템은 저장소를 가르킴  -->
<c:forEach items="${form.hobby}" var="h">
${h}
</c:forEach>
</body>
</html>