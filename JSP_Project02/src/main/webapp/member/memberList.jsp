<%@page import="com.member.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/JSP_Project02/js/member.js"></script>
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
MemberDAO dao = MemberDAOImpl.getInstance();
ArrayList<Member> arr = dao.memberList();
String sid = (String)session.getAttribute("sUserid");
int count = dao.getCount();
%>
</head>
<body>
<div class="container mt-5">
	<div align="right">
		<a href="memberView.jsp"><%=sid %></a>님 받갑습니다./
		
		<a href="logout.jsp">로그아웃</a>
	</div>
	<h2>회원리스트 (<span id="scount"><%=count %></span>명)</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>구분</th>
				<th>삭제</th>			
			</tr>
		</thead>
		<tbody>
			<% 
			for(Member m: arr){
				String mode = m.getAdmin() == 0? "일반회원" : "관리자";
			%>
				<tr>
					<td><%=m.getName() %></td>
					<td><%=m.getUserid() %></td>
					<td><%=m.getPhone() %></td>
					<td><%=m.getEmail() %></td>
					<td><%=mode%></td>
					<!-- 삭베버튼을 누르면 알림차이 뜨면서 삭제 확인 창이 뜨도록 -->
					<td><a href="javascript:del('<%=m.getUserid()%>','<%=mode%>')">삭제</a></td>
				</tr>
			<%
			}
			%>
		</tbody>
	</table>
</div>
</body>
</html>