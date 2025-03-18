package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.BoardDTO;
import com.comm.PageUtil;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/board/List.do")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//boardList.jsp에서 보내준 값을 두개 받아옴
			// Map형 변수였기에 받기위해 Map형을 선언하고 불러옴
		Map<String, Object> map = new HashMap<String, Object>();
			//boardList.jsp에서 보내준 값을 두개 받아옴
		String searchWord = request.getParameter("searchWord")==null?"":request.getParameter("searchWord");		
		String searchField = request.getParameter("searchField");
		if(!searchWord.equals("")) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
			
		//교재(p506)에서는 이렇게 되어 있는데 이러면 null값과 ""의 차이에 의해 에러가 발생함.
//		String searchField = request.getParameter("searchField");
//		String searchWord = request.getParameter("searchWord");		
		
//		if(searchWord!=null) {
//			map.put("searchField", searchField);
//			map.put("searchWord", searchWord);
//		}
		
		BoardDAO dao = new BoardDAOImpl();
		//검색 포함 게시글 갯수 
		int count = dao.selectCount(map);
		
		//페이징 관련내용
		String pageNum = request.getParameter("pageNum")==null?"1":request.getParameter("pageNum");
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 5; // 한 화면에 보여지는 게시글 수
		int startRow = (currentPage - 1)*pageSize +1;
		int endRow = currentPage*pageSize;
		
		map.put("start", startRow);
		map.put("end", endRow);
		List<BoardDTO> blist = dao.selectListPage(map);
		
		int rowNo = count - (currentPage-1)*pageSize;
//		ArrayList<BoardDTO> blist = dao.boardList(startRow, endRow);	// 검색후 페이지 표시줄 설정이 달라지기 때문에 위에처럼 바꿔야함
//		int count = dao.boardCount();		//검색안된 전체 개수라서 검색코드 넣을때는 안넣음
		// 총 페이지 수
		int totPage = count / pageSize + (count%pageSize==0?0:1);
		int blockPage = 3;
		int startPage = ((currentPage-1)/blockPage)*blockPage + 1;
		int endPage = startPage + blockPage-1;
		if(endPage > totPage) endPage = totPage; // 페이지수가 3개 이하일때 값처리
		
		PageUtil page = new PageUtil();
		page.setBlockPage(blockPage);
		page.setStartPage(startPage);
		page.setEndPage(endPage);
		page.setCurrentPage(currentPage);
		page.setTotPage(totPage);
		page.setSearchField(searchField);
		page.setSearchWord(searchWord);
		request.setAttribute("p", page);
		
		dao.close();
		request.setAttribute("rowNo", rowNo);
		request.setAttribute("barr", blist);
		request.setAttribute("count", count);
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
