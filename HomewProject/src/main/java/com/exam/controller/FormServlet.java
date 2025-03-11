package com.exam.controller;


import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
// tomcat9이하이면 JAVAX.로 시작하게 되고
// tomcat10이상이면 jakarta.로 시작하는 import가 되도록 되어 있음.


// 우리가 써왔던 getParameter가 이러한 방법을 이용한것임
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FormServlet extends HttpServlet{

	//지금은 get형식을 사용하므로 doget을쳐서 ctrl+space 해서 가져오자
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String job = req.getParameter("job");
		String[] hobby = req.getParameterValues("hobby");
		
//		Form f = new Form(name, age, gender, job, hobby);
		
		Form f = new Form();
		f.setAge(age);
		f.setGender(gender);
		f.setHobby(hobby);
		f.setJob(job);
		f.setName(name);
		
		req.setAttribute("form", f);
		
		//값을 보내주는 방법임
		RequestDispatcher rd = req.getRequestDispatcher("formResult.jsp");
		rd.forward(req, resp);
		//form.java 클래스 생성
	
	}
	
	
}
