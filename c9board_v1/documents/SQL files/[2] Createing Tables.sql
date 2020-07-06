-- Connected with User siwolsmu@coders9_v1

CREATE TABLE v1_users (
	user_no INT PRIMARY KEY AUTO_INCREMENT,
	user_id VARCHAR(15) NOT NULL UNIQUE,
	user_name VARCHAR(15) NOT NULL,
	user_nickname VARCHAR(15) NOT NULL,
	user_password VARCHAR(15) NOT NULL,
	user_contact VARCHAR(45),
	user_registered_date DATE DEFAULT SYSDATE(),
	user_quit_yn CHAR(1) DEFAULT 'N'
);

CREATE TABLE v1_boards (
	board_no INT PRIMARY KEY AUTO_INCREMENT,
	board_title VARCHAR(90) NOT NULL,
	board_content VARCHAR(3000) NOT NULL,
	board_created_date DATE DEFAULT SYSDATE(),
	board_deleted_yn CHAR(1) DEFAULT 'N',
	user_no INT REFERENCES v1_users (user_no)
);