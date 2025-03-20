package com.address.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.address.config.MybatisManager;

public class AddressDAO {
	SqlSession  session ;
	
	public AddressDAO() {
		SqlSessionFactory sqlSessionFactory
		   = 	MybatisManager.getSessionFactory();
		session  = sqlSessionFactory.openSession();
	}
	
	//추가
	public void insert(AddressDTO adto) {
		session.insert("com.address.config.AddressMapper.insertData", adto);
		session.commit();
	}

	// 전체보기
	public List<AddressDTO> list(){
	  List<AddressDTO> alist = 	session.selectList("com.address.config.AddressMapper.listData");
		return alist;
	}
	//개수
	public int getCount() {
		return session.selectOne("com.address.config.AddressMapper.countData");
	}
	
	//상세보기
	public AddressDTO view(int num) {
	  AddressDTO adto = session.selectOne("com.address.config.AddressMapper.viewData", num)	;
	  return adto;
	}
	//삭제
	public void delete(int num) {
		session.delete("com.address.config.AddressMapper.deleteData", num);
		session.commit();
		
	}
	
	
	//수정
	public void update(AddressDTO adto) {
		session.update("com.address.config.AddressMapper.updateData", adto);
		session.commit();
	}
	
	
	
	
	
	
	
	

}
