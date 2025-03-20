package com.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.address.config.MybatisManager;
import com.address.model.AddressDTO;

public class BoardDAO {

	//생성자
	SqlSession session;
	public BoardDAO() {
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSessionFactory();
		session = sqlSessionFactory.openSession();
	}
	
	//추가(글쓰기)
	public void boardInsert(BoardDTO adto) {
		session.insert("inserData", adto);
		session.commit();
	}
	
	//전체보기
	public List<BoardDTO> list(){
		List<BoardDTO> blist = session.selectList("BoardListData");
		return blist;
	}
	
	// 갯수
	public int getCount() {
		return session.selectOne("BoardCountData");
	}
	
	//상세보기
	
	//수정
	
	//삭제
}
