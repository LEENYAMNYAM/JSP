<%@page import="com.member.dto.Member"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="com.member.dto.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"></jsp:setProperty>
<%
MemberDAO dao = MemberDAOImpl.getInstance();

/* memberView.jsp에 userid값이 없는데 불러와야 할때*/
String sid = (String)session.getAttribute("sUserid");
member.setUserid(sid);

dao.memberUpdate(member);
session.invalidate();
response.sendRedirect("loginForm.jsp");
%>