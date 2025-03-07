package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.member.dto.Member;

public class MemberDAOImpl implements MemberDAO{

	// db셋팅(p200)
	private static MemberDAO instance = new MemberDAOImpl();
	public static MemberDAO getInstance() throws Exception{
		return instance;
	}
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	//추가
	@Override
	public void memberInsert(Member member) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into member values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserid());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getPhone());
			ps.setString(5,  member.getEmail());
			ps.setInt(6,  member.getAdmin());
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
		}
		
	}

	@Override
	public ArrayList<Member> memberList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Member> arr = new ArrayList<Member>();
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select * from member";
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Member m = new Member();
				m.setAdmin(rs.getInt("admin"));
				m.setEmail(rs.getString("email"));
				m.setName(rs.getString("name"));
				m.setPhone(rs.getString("Phone"));
				m.setPwd(rs.getString("pwd"));
				m.setUserid(rs.getString("userid"));
				arr.add(m);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
		}			
		return arr;
	}

	@Override
	public void memberUpdat(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memeberDelete(String userid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member findById(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String idCheck(String userid) {

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes"; //아이디가 없음(아이디 사용가능)
		
		try {
			con = getConnection();
			String sql = "select * from member where userid = '" + userid + "'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {//아이디 존재(사용불가능)
				flag="no";
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int loginCheck(String userid, String pwd) {
		// 회원아님 : -1, 회원:1, 비번오류:2 리턴
		int flag = -1; //회원아님
		String sql = "select pwd from member where userid ='" + userid + "'";
		try( Connection con = getConnection();
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery(sql))
		{
			if(rs.next()) {//userid 맞음(회원은 맞지만 비번 검사는 안함)
				if(rs.getString("pwd").equals(pwd)) {//비번맞음 rs.getString("pwd"): 진짜비번 /// pwd:입력한 비번
				
					flag=1;
				}else {//비번오류
					flag=2;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
