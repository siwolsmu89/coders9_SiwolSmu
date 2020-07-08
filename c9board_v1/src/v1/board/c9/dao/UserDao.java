package v1.board.c9.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import v1.board.c9.utils.ConnectionUtil;
import v1.board.c9.utils.QueryUtil;
import v1.board.c9.vo.User;

public class UserDao {
	
	/**
	 * After executing a prepared SQL statement, we need to get data from a ResultSet and set those data into Object User. 
	 * This work will be repeatedly done from many methods within UserDao. 
	 * Using this method will help it simpler.
	 * @param ResultSet rs is a Set holding data from Users table.
	 * @return User user is a new User Object holding data of a certain row from Users table.
	 * @throws SQLException 
	 * @author SiwolSmu
	 */
	private User resultSetToUser(ResultSet rs) throws SQLException {
		User user = new User();
		
		user.setNo(rs.getInt("user_no"));
		user.setId(rs.getString("user_id"));
		user.setName(rs.getString("user_name"));
		user.setNickname(rs.getString("user_nickname"));
		user.setPassword(rs.getString("user_password"));
		user.setContact(rs.getString("user_contact"));
		user.setRegisteredDate(rs.getDate("user_registered_date"));
		user.setQuit(rs.getString("user_quit_yn").equalsIgnoreCase("Y") ? true : false);
		
		return user;
	}

	/**
	 * Insert a new row into user table.
	 * 
	 * @param User user is a Value Object holding all data we need to set the INSERT statement.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
	public void insertUser(User user) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getNickname());
		pstmt.setString(4, user.getPassword());
		pstmt.setNString(5, user.getContact());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}
	
	public void updateUser(User user) {
		
	}
	
	public void deleteUser(int userNo) {
		
	}
	
	public User getUserByNo(int userNo) throws SQLException {
		User user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("user.getUserByNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = resultSetToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return user;
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setNString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = resultSetToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return user;
	}
	
	public List<User> getAllUserList() {
		List<User> userList = new ArrayList<User>();
		
		return userList;
	}
}
