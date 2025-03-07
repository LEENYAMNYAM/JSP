<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.address.ZipCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String dong = request.getParameter("dong");
AddressDAO jdao = new AddressDAO();
ArrayList<ZipCode> zarr = jdao.zipcodeRead(dong);

// JAVA zarr ==>> JSON 형태로 바꿔줄 라이브러리 다운로드
//  	https://mvnrepository.com/ 에서 JSON.simple 검색&클릭 Files에 view all 클릭 1.1.1버전 다운로드 후 
// 		web-inf 하위 lib 폴더에 다운로드
// (직접 다운로드하면 매번 버전업데이트를 해줘야하는데, JSON.simple 검색&클릭 후 아래에 maven/Gradle 등에 주소만 카피하면 
//  자동으로 최신버전 업데이트 적용시켜줌) 이번에는 안할거임 나중에 할거임 

// 아래방법으로 JSON형태로 바꿔주면 됨.(한번에 받아도 되지만, 널값처리가 아직 안되므로 지금은 하나씩 처리할 예정)
JSONArray jsonarr = new JSONArray();
for(ZipCode z :zarr){
	JSONObject obj = new JSONObject();
	obj.put("zipcode", z.getZipcode());
	obj.put("sido", z.getSido());
	obj.put("gugun", z.getGugun());
	obj.put("dong", z.getDong());
	obj.put("bunji", z.getBunji());
	jsonarr.add(obj);	
}
out.println(jsonarr.toString());

%>

