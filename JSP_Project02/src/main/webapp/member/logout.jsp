<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>    <!-- 참고로 session은 default값이 true임 -->
<%
session.invalidate();		
/* session.removeAttribute(arg0);   이렇게 하면 원하는것만 지울수도 있음*/
response.sendRedirect("loginForm.jsp");
%>