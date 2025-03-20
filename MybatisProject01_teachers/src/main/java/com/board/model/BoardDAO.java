package com.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.address.config.MybatisManager;



public class BoardDAO {
	SqlSession  session ;
	
	public BoardDAO() {
		SqlSessionFactory sqlSessionFactory
		   = 	MybatisManager.getSessionFactory();
		session  = sqlSessionFactory.openSession();
	}
	//추가
		public void insert(BoardDTO board) {
			session.insert("com.address.config.BoardMapper.insertData", board);
			session.commit();
		}

		// 전체보기
		public List<BoardDTO> list(){
		  List<BoardDTO> alist = 	session.selectList("com.address.config.BoardMapper.listData");
			return alist;
		}
		//개수
		public int getCount() {
			return session.selectOne("com.address.config.BoardMapper.countData");
		}
		
		//상세보기
		public BoardDTO view(int num) {
			BoardDTO adto = session.selectOne("com.address.config.BoardMapper.viewData", num)	;
		  return adto;
		}
		//삭제
		public void delete(int num) {
			session.delete("com.address.config.BoardMapper.deleteData", num);
			session.commit();
			
		}
		
		
		//수정
		public void update(BoardDTO adto) {
			session.update("com.address.config.BoardMapper.updateData", adto);
			session.commit();
		}
		

}
