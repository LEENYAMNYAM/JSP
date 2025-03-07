package com.address;

import java.lang.reflect.Executable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AddressDAO {
	String url, user, pwd;
	
	public AddressDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url="jdbc:oracle:thin:@localhost:1521:xe";
			user="scott";
			pwd="tiger";
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//추가 : insert into address~~~
	public void insert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			String sql = "insert into address(num, name, zipcode, addr, tel) "
				    + "values(address_seq.nextval, ?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,ad.getName());
			ps.setString(2,ad.getZipcode());
			ps.setString(3,ad.getAddr());
			ps.setString(4,ad.getTel());
			
			// 실행
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, ps, null, null);
		}

	}
	
	//수정
	public void update(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DriverManager.getConnection(url, user,pwd);
			String sql="update address "
					+ "set name=?, zipcode=?, tel=?, addr=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getZipcode());
			ps.setString(3, ad.getTel());
			ps.setString(4, ad.getAddr());
			ps.setInt(5, ad.getNum());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	
	}
		
	//전체보기
	public ArrayList<Address> list() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> alist = new ArrayList<Address>();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from address order by num";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Address ad = new Address();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getInt("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
				alist.add(ad);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return alist;
	}
	
	
	// 검색 포함한 전체보기
	public ArrayList<Address> list(String field, String word){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> alist = new ArrayList<Address>();
		String sql = "";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			st = con.createStatement();
			if(word.equals("")) {//검색아님
				sql = "select * from address";
			}else {//검색
				sql = "select * from address where "+field+" like '%"+word+"%'";
			}
			rs=st.executeQuery(sql);
			
			while(rs.next()) {
				Address ad = new Address();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getInt("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
				alist.add(ad);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con,null, st, rs);
		}
		
		return alist;
	}
	// 검색 포함한 개수
	public int getCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "";
		int count=0;
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			st = con.createStatement();
			if(word.equals("")) {
				sql = "select count(*) from address";
			}else {//검색
				sql = "select count(*) from address where "+ field+" like '%" + word + "%'";
			}
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// 개수
	public int getCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			String sql = "select count(*) from address";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	//삭제
	public void delete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			String sql = "delete from address where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, null);
		}

	}
	
	//상세보기
	public Address detail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address address = new Address();
		
		try {
			con = DriverManager.getConnection(url, user,pwd);
			String sql ="select * from address where num=" +num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				address.setAddr(rs.getString("addr"));
				address.setName(rs.getString("name"));		
				address.setNum(rs.getInt("num"));
				address.setTel(rs.getString("tel"));
				address.setZipcode(rs.getString("zipcode"));
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}

		return address;

	}
	
	// 우편번호 검색
	public ArrayList<ZipCode> zipcodeRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCode> zarr = new ArrayList<ZipCode>();
		
		try {
			con = DriverManager.getConnection(url, user,pwd);
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCode z = new ZipCode();
				z.setBunji(rs.getString("bunji"));
				z.setDong(rs.getString("dong"));
				z.setGugun(rs.getString("gugun"));
				z.setSeq(rs.getInt("seq"));
				z.setSido(rs.getString("sido"));
				z.setZipcode(rs.getString("zipcode"));
				zarr.add(z);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		};
		return zarr;
	}
	
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
		
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();
			if(st!=null) st.close();
			if(rs!=null) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
