package v1.board.c9.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import v1.board.c9.vo.User;

public class UserDao {
	
	private User resultSetToUser(ResultSet rs) {
		User user = new User();
		
		return user;
	}

	public void insertUser(User user) {
		
	}
	
	public void updateUser(User user) {
		
	}
	
	public void deleteUser(int userNo) {
		
	}
	
	public User getUserByNo(int userNo) {
		User user = null;
		
		return user;
	}
	
	public User getUserById(String userId) {
		User user = null;
		
		return user;
	}
	
	public List<User> getAllUserList() {
		List<User> userList = new ArrayList<User>();
		
		return userList;
	}
}
