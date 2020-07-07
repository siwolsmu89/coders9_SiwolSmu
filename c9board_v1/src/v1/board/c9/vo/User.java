package v1.board.c9.vo;

import java.util.Date;

public class User {
	
	private int no;
	private String id;
	private String name;
	private String nickname;
	private String password;
	private String contact;
	private Date registeredDate;
	private boolean isQuit;
	
	public User() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	public boolean isQuit() {
		return isQuit;
	}

	public void setQuit(boolean isQuit) {
		this.isQuit = isQuit;
	}
	
}
