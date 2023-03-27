package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import java.util.*;
import DTO.Woori;

public class WooriDao {
	//주입된 객체를 받아놓을 전역변수
	Connection conn;
	
	//AppInitServlet이 Connection 객체를 만들어두었지만, Class는 Servlet과 다르게 AppInitServlet에 접근할 수 없다.
	//객체 주입: Servlet에서 WooriDao클래스로 생성된 객체를 주입한다.
	public void setConnction(Connection conn) {
		this.conn = conn;
	}
	
	//혹시 오류가 발생하면 이 메소드를 실행한 곳에서 처리할 수 있도록 하기.
    //List 전체를 보여주는 메서드(알맞은 쿼리문을 수행하고, 해당 리스트를 반환하여 Servlet에서 사용함.)
	public List<Woori> selectList() throws Exception{
		Statement stm = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "SELECT * FROM woori ORDER BY id";
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			
			ArrayList<Woori> list = new ArrayList<Woori>();
			while(rs.next()) {
				Woori tmp = new Woori();
				tmp.setId(rs.getString("id"));
				tmp.setName(rs.getString("name"));
				tmp.setEmial(rs.getString("emial"));
				tmp.setPassword(rs.getInt("password"));
				
				list.add(tmp);
			}
			return list;
			
		}catch(Exception e) {
			throw e;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stm != null) stm.close();
			}catch(SQLException e) {}
		}
	}
	//insert하고 난 뒤에 숫자를 반환해서 반환값이 int이다.
	//DB에 사용자 추가하는 메서드(=쿼리문 작성 및 실행)
	public int insert(Woori one) throws Exception {
		PreparedStatement pst = null;
		String sql = null;
		
		try {
			sql="INSERT INTO woori values(?,?,?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, one.getId());
			pst.setString(2, one.getName());
			pst.setString(3, one.getEmial());
			pst.setInt(4, one.getPassword());
			
			return pst.executeUpdate();
		}catch(Exception e) {
			throw e;
		}finally {
			try {
				if(pst != null) pst.close();
			}catch(Exception e) {}
		}
	}
    public Woori SelectOne(String id) throws Exception {
    	//UpdateServlet에서 긁어와서 Woori 객체를 반환해야함, conn은 위에 전역으로 설정되어있으니까 상관없음.
    	PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "";
		Woori one = null;
		
		//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
		try {
			sql = "SELECT * FROM woori WHERE id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			
			//화면 위임 준비
			//DB에 id가 동일한 데이터는 하나 밖에 존재하지 않는다. 그래서 ArrayList 쓰지 않아도 된다.
			if(rs.next()) {
				one = new Woori();
				one.setId(rs.getString("id"));
				one.setName(rs.getString("name"));
				one.setEmial(rs.getString("emial"));
				one.setPassword(rs.getInt("password"));
			}
		} catch (Exception e){
			throw e;
		} finally{
			try {
				if(rs != null) rs.close();
				if(pst != null) pst.close();
			} catch (Exception e){
				System.out.print(e);
			}
		}
		return one;
    }

    //DB에 정보 업데이트
	public int update(Woori one) throws Exception {
		PreparedStatement pst = null;
		String sql = "";
		int result = 0;
		
		try {
			sql = "update woori set name=?, email=? where id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, one.getName());
			pst.setString(2, one.getEmial());
			pst.setString(3, one.getId());
			
			return pst.executeUpdate();
			
		} catch (SQLException e){
			throw e;
		} finally{
			try {
				if(pst != null) pst.close();
			} catch (SQLException e){
				throw e;
			}
		}
	}
	public int delete(String id) throws Exception {
		
		PreparedStatement pst = null;
		String sql = "";	

		//select.jsp에서 넘어온 id 받기
		Connection conn = null;
		
		//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
		try{
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			WooriDao dao = new WooriDao();
			dao.setConnction(conn);
			dao.delete(id);
			return 0;
		} catch (Exception e) {
			throw e;
		} finally {
		
			try {
				if(pst != null) pst.close();
			} catch (SQLException e){
				System.out.print(e);
			}
		}
		
		
	}

	private ServletContext getServletContext() {
		// TODO Auto-generated method stub
		return null;
	}
	public Woori login(String id, int password) throws Exception{
		PreparedStatement ps       = null;
		ResultSet 		  rs       = null;
		String 			  sql      = null;
		Woori			  loginOne = null;
		
		try {
			sql = "select * from woori where id=? and password=?";
			ps  = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, password);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				loginOne = new Woori();
				loginOne.setName(rs.getNString("name"));
				loginOne.setEmial(rs.getString("emial"));
			}
		}catch(Exception e) {
			throw e;
		}finally {
		
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e){
				System.out.print(e);
			}
		}
		return loginOne;
	}
}

