package ecars;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ECarsDAO {
	private DataSource datasource = null;
	private Connection conn = null;
	private PreparedStatement stmt = null;
	
	public ECarsDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			datasource = (DataSource)env.lookup("jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addcar(ECarsVO ecarVO) {
		String sql = "INSERT INTO ecar VALUES (Ecar_SEQUENCE.nextval, ?, ?, ?, ?)";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, ecarVO.getVar());
			stmt.setString(2, ecarVO.getColor());
			stmt.setInt(3, ecarVO.getPrice());
			stmt.setInt(4, ecarVO.getQty());
			
			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ECarsVO> getcars() {
		List<ECarsVO> listcars = new ArrayList<ECarsVO>();
		
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM ecar ORDER BY ec_serial desc";
			
			conn = datasource.getConnection();
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Integer serial = rs.getInt("ec_serial");
				String title   = rs.getString("ec_var");
				String author  = rs.getString("ec_color");
				Integer price  = rs.getInt("ec_price");
				Integer qty    = rs.getInt("ec_qty");
				
				ECarsVO ecar = new ECarsVO(serial, title, author, price, qty);
				listcars.add(ecar);
			}
		}
		catch(SQLException e) {
			System.out.println("[getcars] SQLException: " + e.toString());
		}
		finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				
				conn.close();
			}
			catch(Exception e) {
				System.out.println("[getcars] finally SQLException: " + e.toString());
			}
		}	
		return listcars;
	}
	
	public void delcar(String serial) {
		String sql = "DELETE FROM ecar WHERE ec_serial = ?";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(serial));
			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void updatecar(ECarsVO ecarVO) {
		String sql = "UPDATE ecar SET ec_var=?, ec_color=?, ec_price=?, ec_qty=? WHERE ec_serial=?";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, ecarVO.getVar());
			stmt.setString(2, ecarVO.getColor());
			stmt.setInt(3, ecarVO.getPrice());
			stmt.setInt(4, ecarVO.getQty());
			stmt.setInt(5, ecarVO.getSerial());

			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ECarsVO getcar(String no) {
		String sql = "SELECT * FROM ecar WHERE ec_serial=?";
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(no));

			rs = stmt.executeQuery();
			
			if(rs.next()) {
				Integer serial = rs.getInt("ec_serial");
				String title   = rs.getString("ec_var");
				String author  = rs.getString("ec_color");
				Integer price  = rs.getInt("ec_price");
				Integer qty    = rs.getInt("ec_qty");
				
				ECarsVO ecar = new ECarsVO(serial, title, author, price, qty);
				return ecar;
			}
		}
		catch(SQLException e) {
			System.out.println("[getcar] SQLException: " + e.toString());
		}
		finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				
				conn.close();
			}
			catch(Exception e) {
				System.out.println("[getcar] finally SQLException: " + e.toString());
			}
		}	
		return null;
	}
	
	public boolean iscar(Integer serial) {
		String sql = "SELECT decode(count(*),1,'true','false') AS cared FROM ecar WHERE ec_serial=?";

		boolean cared = false;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, serial);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				cared = Boolean.parseBoolean(rs.getString("cared"));
			}
			System.out.println("cared=" + cared);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return cared;
	}	
}
