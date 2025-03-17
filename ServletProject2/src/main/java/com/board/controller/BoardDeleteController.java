package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.BoardDTO;
import com.utils.JSFunction;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/board/delete.do")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = new BoardDAOImpl();
		int result = dao.boardDelete(num);
		dao.close();
		//list.do로 이동 (jsp문법이라서 자바스크립트 문법을 통해서는 사용할 수 없음.(location.href=''로 설정해줘야함)
//		response.sendRedirect("List.do");
		
		// result를 사용하여 알림창 출력 위한 출력하기
		if(result ==1) {	//삭제 성공
			JSFunction.alertLocation("삭제 성공", "List.do", response);
		} else {			//삭제 실패
			JSFunction.alertBack(response, "삭제 실패");
		}
		
		// 자바스크립트 코드 추가(이거 말고 위에 JSFuntion.java 로 따로 함수를 만들자)
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//
//		if (result == 1) {
//			String str = "<script>";
//				str += "alert('게시글이 삭제 되었습니다.');";
//				str += "location.href='List.do'";
//				str += "</script>";
//				out.println(str);
//		} else {
//			String str = "<script>";
//			str += "alert('게시글이 삭제 중 오류 발생!!!!');";
//			str += "location.href='view.do?num=\'+${board.num }";
//			str += "</script>";
//			out.println(str);
//		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
