<%@page import="com.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
</head>
<script>
$(document).ready(function(){
	$("#btnSearch").click(function(){
		$.ajax({
			type : "get",
			url : "searchProc.jsp",
			data: {
				"field"  :  $("#field").val(),
				"word" : $("#word").val()
			},
			success: function(resp){
			//	alert(resp)
				const  d = JSON.parse(resp)
				let str =""
				$.each(d.jarr, function(key, val){
					str +="<tr>"
					str +="<td>"+val.num +"</td>"
					str +="<td>"+val.name +"</td>"
					str +="<td>"+val.addr +"</td>"
					str +="<td>"+val.tel +"</td>"
					str +="</tr>"
				})
			$("table tbody").html(str);
			$("#spanCnt").text(d.jcount)
			},
			error:function(e){
				alert(e +" : error");
			}
		}) //ajax
	})  //btnSearch
})  //document ready
</script>
<%
  AddressDAO jdao = new AddressDAO();
  ArrayList<Address> arr = jdao.list();
  int count = jdao.getCount();
%>
<body>
<div align="right">
	<a href="insert.jsp">추가하기</a>
</div>
<h3>JQUERY ADDRESS LIST(<span id="spanCnt"><%=count %></span>)</h3>
<table>
	<thead>
		<tr>
			<th> 번호</th>
			<th> 이름</th>
			<th> 주소</th>
			<th> 전화번호</th>
		</tr>
	</thead>
	<tbody>
	<%
		for(Address ad : arr){
	%>		
			<tr>
				<td><%=ad.getNum() %></td>
				<td><%=ad.getName() %></td>
				<td><%=ad.getAddr() %></td>
				<td><%=ad.getTel() %></td>
			</tr>
	<%		
		}
	%>
	
	</tbody>
</table>
	<select name="field" id="field">
		<option value="name"> 이름</option>
		<option value="addr"> 주소</option>
	</select>
	<input type="text" name="word" id="word">
	<input type="button" value="검색" id="btnSearch">

</body>
</html>







