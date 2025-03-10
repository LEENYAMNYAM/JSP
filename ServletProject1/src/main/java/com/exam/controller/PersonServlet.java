package com.exam.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet{
	
	// doPost를 입력후 ctrl+space로 가져오자!
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
	

//		String name = req.getParameter("name");
//		String id = req.getParameter("id");
//		String pwd = req.getParameter("pwd");
//		String phone = req.getParameter("phone");
//		String address = req.getParameter("address");

//		위처럼 쓰고 이런식으로 하나하나 넣어도 되는데, 더 간단한 방법으로 할거임
//		req.setAttribute("name", name);
		
		//person.java 생성
		Person p = new Person();
		p.setAddress(req.getParameter("address"));
		p.setId(req.getParameter("id"));
		p.setName(req.getParameter("name"));
		p.setPhone(req.getParameter("phone"));
		p.setPwd(req.getParameter("pwd"));
		
		req.setAttribute("person", p);
		RequestDispatcher rd = req.getRequestDispatcher("personResult.jsp");
		rd.forward(req, resp);
		//personResult.jsp 생성
	}

}
