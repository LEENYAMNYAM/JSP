<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String field = request.getParameter("field");
	String word = request.getParameter("word");
	AddressDAO jdao = new AddressDAO();
	ArrayList<Address> sarr = jdao.list(field, word);
	int count = jdao.getCount(field, word);
	
	// JAVA zarr ==>> JSON 형태로 바꿔줄 라이브러리 다운로드
//	https://mvnrepository.com/ 에서 gson 검색&클릭 Files에 view all 클릭 2.11.0버전 다운로드 후 
//		web-inf 하위 lib 폴더에 다운로드
//(직접 다운로드하면 매번 버전업데이트를 해줘야하는데, JSON.simple 검색&클릭 후 아래에 maven/Gradle 등에 주소만 카피하면 
//자동으로 최신버전 업데이트 적용시켜줌) 이번에는 안할거임 나중에 할거임 

//아래방법으로 JSON형태로 바꿔주면 됨.(이번은 null처리 따로 할 필요 없어서 조금 편함)

	//gson.jar
	
	Gson gson = new Gson();
	Map<String, Object> hm = new HashMap<>();
	hm.put("jarr", sarr);
	hm.put("jcount",count);
	String jsonStr = gson.toJson(hm); // 스스로 hm(jarr와 jcount)을 json 형태로 바꿔줌 
	
	//화면에 출력
	out.println(jsonStr);

%>