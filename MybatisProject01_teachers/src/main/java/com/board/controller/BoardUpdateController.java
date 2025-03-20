package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.board.model.BoardDAO;

import com.board.model.BoardDTO;


/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/board/update.my")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = new BoardDAO();
		BoardDTO board = dao.view(num);
		request.setAttribute("board", board);
		request.getRequestDispatcher("boardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BoardDTO board = new BoardDTO();
        board.setNum(Integer.parseInt(request.getParameter("num")));
        board.setUserid(request.getParameter("userid"));
        board.setSubject(request.getParameter("subject"));
        board.setEmail(request.getParameter("email"));
        board.setContent(request.getParameter("content"));
        
        BoardDAO dao = new BoardDAO();
         dao.update(board);
         response.sendRedirect("list.my");
       
        
	}

}











