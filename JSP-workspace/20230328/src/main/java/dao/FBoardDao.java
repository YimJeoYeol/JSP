package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.FBoard;

public class FBoardDao {
	Connection conn;
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public List<FBoard> searchList(int stype, String sval) throws Exception{
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<FBoard> list = null;
		String cond = null;
		try {
			sql = "select * from fboard ";
			
			switch(stype) {
			case 1 : 
				cond = " where name like '%?" + sval + "%'";
				break;
			case 2 : 
				cond = " where subject like '%?" + sval + "%'";
				break;
			case 3 : 
				cond = " where content like '%?" + sval + "%'";
				break;
			case 4 : 
				cond = " where name like '%?" + sval + "%' or content like '%?" + sval + "%'";
				break;
			case 5 : 
				cond = " where name like '%?" + sval + "%' or content like '%?" + sval + "%'";
				break;
			case 6 : 
				cond = " where name like '%?" + sval + "%'";
				break;
			case 7 : cond = " where name like '%?" + sval + "%'";
				break;
			}
			
			sql = sql + cond;
			
			st = conn.createStatement();
			rs = st.executeQuery(sql);
		
		

		
	}
	
	//DB에 전체 정보 
	public List<FBoard> selectList() throws Exception{
		Statement stm = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "SELECT * FROM fboard ORDER BY masterid DESC, replynum, step, id";
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			
			ArrayList<FBoard> FBoardList = new ArrayList<FBoard>();
			while(rs.next()) {
				FBoard tmp = new FBoard();
				tmp.setId(rs.getInt("id"));
				tmp.setName(rs.getString("name"));
				tmp.setSubject(rs.getString("subject"));
				tmp.setInputdate(rs.getString("inputdate"));
				tmp.setReadcount(rs.getInt("readcount"));
				
				FBoardList.add(tmp);
			}
			
			return FBoardList;
		}catch(Exception e) {
			System.out.println("FBoardDao에 selectList() 오류");
			throw e;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stm != null) stm.close();
			}catch(SQLException e) {}
		}
	}
	//DB 정보 추가
	public int insert(FBoard one) throws Exception{
		PreparedStatement pst = null;
		String sql = null;
		
		try {
			sql="INSERT INTO fboard values"+
			    "(seq_fboard.nextval,?,?,?,?,?, sysdate, seq_fboard.nextval,0,0,0)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, one.getName());
			pst.setString(2, one.getPassword());
			pst.setString(3, one.getEmail());
			pst.setString(4, one.getSubject());
			pst.setString(5, one.getPassword());
			
			return pst.executeUpdate();
		}catch(Exception e) {
			throw e;
		}finally {
			try {
				if(pst != null) pst.close();
			}catch(Exception e) {}
		}
	}
	//DB정보 한개 찾기
	public FBoard selectOne(int id) throws Exception{
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "";
	
		FBoard one = null;
		
		try {
			//조회수 +1
			sql = "update fboard set readcount=readcount+1 where id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			
			sql = "SELECT * FROM fboard WHERE id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			//화면 위임 준비
			//DB에 id가 동일한 데이터는 하나 밖에 존재하지 않는다. 그래서 ArrayList 쓰지 않아도 된다.
			if(rs.next()) {
				one = new FBoard();
				one.setId(rs.getInt("id"));
				one.setName(rs.getString("name"));
				one.setEmail(rs.getString("email"));
				one.setSubject(rs.getString("subject"));
				one.setContent(rs.getString("content"));
				one.setPassword(rs.getString("password"));
				
			}
		} catch (Exception e){
			System.out.println("FBoardDAO selectOne()오류");
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
	//수정
	public int update(FBoard one) throws Exception{
		PreparedStatement pst = null;
		String sql = "";
		
		try {
			sql = "UPDATE fboard SET name=?, email=?, subject=?, content=?,inputdate=sysdate readcount=readcount+1  WHERE id=? and password=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, one.getName());
			pst.setString(2, one.getEmail());
			pst.setString(3, one.getSubject());
			pst.setString(4, one.getContent());
			pst.setInt(5, one.getId());
			pst.setString(6, one.getPassword());
			
			return pst.executeUpdate();
			
		} catch (SQLException e){
			System.out.println("FBoardDao update()오류");
			throw e;
		} finally{
			try {
				if(pst != null) pst.close();
			} catch (SQLException e){
				throw e;
			}
		}
	}
	//삭제
	public int delete(int id) throws Exception {
		//필요한 변수 선언
		PreparedStatement pst = null;
		String sql = "";	

		//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
		try{
			sql = "DELETE FROM fboard WHERE id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			return pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("FBoardDao delete() 오류");
			throw e;
		} finally {
			try {
				if(pst != null) pst.close();
			} catch (SQLException e){
				System.out.print(e);
			}
		}
	}
	public int rinsert(FBoard one) throws Exception{
		PreparedStatement pst = null;
		ResultSet 		  rs  = null;
		String 			  sql = null;
		
		
		try {
			int step = one.getStep() + 1;
			int replynum = 0;
			if(step == 1) {
				sql = "select max(replynum) from where masterid=?";
				pst = conn.prepareStatement(sql);
				pst.setInt(1, one.getMasterid());
				rs = pst.executeQuery();
				
				if(!rs.next()) replynum = 1; 	  //max(replynum) 없으면
				else replynum = rs.getInt(1) + 1; //max(replynum) 있으면
			
			}
			sql="INSERT INTO fboard values"+
			    "(seq_fboard.nextval, ?, ?, ?, ?, ?, sysdate, ?, 0, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, one.getName());
			pst.setString(2, one.getPassword());
			pst.setString(3, one.getEmail());
			pst.setString(4, one.getSubject());
			pst.setString(5, one.getContent());
			pst.setInt(6, one.getMasterid());
			pst.setInt(7, replynum);
			pst.setInt(7, step);
			
			
			return pst.executeUpdate();
			
			
		}catch(Exception e) {
			throw e;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pst != null) pst.close();
			}catch(Exception e) {}
		}
	}
	
}
