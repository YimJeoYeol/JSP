package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Fboard;

public class fboardDao {
	
	Connection conn;
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public List<Fboard> selectList() throws Exception{
		Statement stm = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "SELECT * FROM fboard ORDER BY ID DESC";
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			
			ArrayList<Fboard> list = new ArrayList<Fboard>();
			while(rs.next()) {
				Fboard tmp = new Fboard();
				tmp.setId(rs.getInt("id"));
				tmp.setSubject(rs.getString("Subject"));
				tmp.setName(rs.getString("name"));
				tmp.setInputdate(rs.getString("Inputdate"));
				tmp.setReadcount(rs.getInt("Readcount"));
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
	public int insert(Fboard one) throws Exception{
		PreparedStatement ps = null;
		String sql = null;
		
		try {
			
		}catch(Exception e) {
			sql = "insert into fboard values(seq_fboard.nextval,?,?,?,?,?, sysdate, 0,0,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, one.getName());
			ps.setString(1, one.getPassword());
			ps.setString(1, one.getEmail());
			ps.setString(1, one.getSubject());
			ps.setString(1, one.getContent());
			
			return  ps.executeUpdate();
			 
		}
		return 0;
	}

}
