package com.exam.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class personServlet2
 */


//web.xml을 한줄로 대신해줌
@WebServlet("/exam/person2.go")

public class personServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		Person p = new Person();
		p.setAddress(req.getParameter("address"));
		p.setId(req.getParameter("id"));
		p.setName(req.getParameter("name"));
		p.setPhone(req.getParameter("phone"));
		p.setPwd(req.getParameter("pwd"));
		
		req.setAttribute("person", p);
		RequestDispatcher rd = req.getRequestDispatcher("personResult2.jsp");
		rd.forward(req, resp);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
