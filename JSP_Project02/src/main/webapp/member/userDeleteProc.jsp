<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("utf-8");
String sid = (String)session.getAttribute("sUserid");
MemberDAO dao = MemberDAOImpl.getInstance();
dao.memberDelete(sid);
session.invalidate();
response.sendRedirect("loginForm.jsp");

%>