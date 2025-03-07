<%@page import="com.address.ZipCode"%>
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
<script>
$(function(){
	$("#send").click(function(){  //검색버튼 클릭
		sendIt()
	})
	$("#dong").keydown(function(e){  // 동이름 입력하고 엔터키 
		if(e.keyCode == 13){
			sendIt()
		}
	})      
	
	$("#result").on("click","tr",function(){
			const address = $("td:eq(1)", this).text()+" " +
											$("td:eq(2)", this).text()+" "+
											$("td:eq(3)", this).text()+" "+
											$("td:eq(4)", this).text()
			$(opener.document).find("#zipcode").val($("td:eq(0)", this).text());
			$(opener.document).find("#addr").val(address);
			self.close()
		})
})  //document

var sendIt = function(){
	if($("#dong").val()  == ""){
		alert("동이름을 입력하세요");
		return false;
	}
	$.getJSON("zipProc.jsp",
			             {"dong" : $("#dong").val()},
			             function(resp){
			            	var str ="<table>"
			            	$.each(resp, function(key, val){
			            		str +="<tr>"
			            		str +="<td>"+val.zipcode+"</td>"
			            		str +="<td>"+val.sido+"</td>"
			            		str +="<td>"+val.gugun+"</td>"
			            		str +="<td>"+val.dong+"</td>"
			            		str +="<td>"+val.bunji+"</td>"
			            		str +="</tr>"
			            	})
				            	str +="</table>"
				            	$("#result").html(str)
			             }  //콜백함수  function
	                  )  // getJSON
} //sendIt




</script>
</head>
<body>
<table>
	<tr>
	<td>동이름 입력
	<input type="text" id="dong" name="dong"> 
		<button type="button"  id="send">검색</button></td>
	</tr>
	<tr>
</table>
<div id="result"></div>
</body>
</html>




