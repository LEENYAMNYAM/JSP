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
	 ArrayList<Address> sarr =  jdao.list(field, word);
	 int count = jdao.getCount(field, word);
	 //gson.jar
	 Gson gson = new Gson();
	 Map<String, Object> hm = new HashMap<>();
	 hm.put("jarr", sarr);
	 hm.put("jcount", count);
	 String jsonStr = gson.toJson(hm);
	 //화면에 출력
	 out.println(jsonStr);
%>




