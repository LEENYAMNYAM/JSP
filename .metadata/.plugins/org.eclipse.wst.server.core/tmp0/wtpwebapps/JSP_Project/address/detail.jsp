<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
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
<%
AddressDAO dao = new AddressDAO();
int num = Integer.parseInt( request.getParameter("num") );
Address address = dao.detail(num);
%>
<script>
	function del(){
		if(confirm("정말삭제할까요?")){
			location.href="deleteProcess.jsp?num=<%=num%>";	
		}
	}
</script>

</head>
<body>
<h3> 상세보기</h3>
<form action = "updateProcess.jsp" method= "post">
<input type="hidden" name="num" value="<%=address.getNum() %>">

	<table>
		<tr>
			<th> 번호 </th>
			<td>
			<%=address.getNum() %>
<!--
				아래와 같은 방법도 있음(단, disabled는 값 전달안되고, readonly는 값 전달됨)
	 			<input type ="text" value="<%=address.getNum() %>" readonly="readonly">			
				<input type ="text" value="<%=address.getNum() %>" disabled="disabled">	
 -->				
				</td>
			
		</tr>
		<tr>
			<th> 이름 </th>
			<td><input type ="text" name="name" value="<%=address.getName() %>"></td>
		</tr>
		<tr>
			<th> 우편번호 </th>
			<td><input type ="text" name="zipcode" id="zipcode" value="<%=address.getZipcode() %>" size=7, readonly="readonly">
				<button type="button" onclick="zipfinder()"> 검색</button>
			</td>
		</tr>
		<tr>
			<th> 주소 </th>
			<td><input type ="text" name="addr" id="addr" value="<%=address.getAddr() %>" size=50></td>
		</tr>
		<tr>
			<th> 전화번호 </th>
			<td><input type ="text" name="tel" value="<%=address.getTel() %>"></td>
		</tr>								
		<tr>
			<td colspan="2"><button>수정</button>
							<input type="reset" value="수정취소">
							<button type="button" onclick="del()">삭제</button>
							<button type="button" onclick="location.href='list.jsp'">전체보기</button></td>
		</tr>
	</table>
</form>

</body>
</html>