CREATE DATABASE IF NOT EXISTS Testing_System
    CHARACTER SET "utf8"
    COLLATE "utf8_unicode_ci";
USE Testing_System;



DROP TABLE IF EXISTS
	departments,
	positions,
    accounts,
    `groups`,
    group_accounts,
    type_questions,
    category_questions,
    questions,
    answers,
    exams,
    exam_questions;
    
-- tạo bảng departmens:

CREATE TABLE departments
(
	department_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	department_name 	NVARCHAR(100) NOT NULL
);
-- tạo bảng position :

CREATE TABLE positions
(
	 position_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	position_name 	ENUM("Dev","Test","Scrum Master", "PM") DEFAULT "Dev"
);

-- tạo bảng accounts :

CREATE TABLE accounts
(
	account_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email			NVARCHAR (50) UNIQUE NOT NULL,
    username 		NVARCHAR (100) UNIQUE NOT NULL,
    fullname		NVARCHAR (100) NOT NULL,
    gender 			BIT DEFAULT 1,
    department_id 	TINYINT UNSIGNED,
    position_id 	TINYINT UNSIGNED,
    create_date 	DATE,
    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(position_id) REFERENCES positions(position_id)
);


-- tạo bảng groups :


CREATE TABLE `groups`
(
	group_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	group_name 	NVARCHAR (100) NOT NULL,
    creator_id 	INT UNSIGNED NOT NULL,
    create_date DATE,
    FOREIGN KEY(creator_id) REFERENCES accounts(account_id)
);


-- tạo bảng group_accounts

CREATE TABLE group_accounts
(
	group_id 	TINYINT UNSIGNED NOT NULL,
	account_id 	INT UNSIGNED NOT NULL,
	join_date 	DATE,
    PRIMARY KEY(group_id, account_id),
    FOREIGN KEY(group_id) REFERENCES `groups`(group_id),
    FOREIGN KEY(account_id) REFERENCES accounts(account_id)
);

-- tạo bảng type_questions:

CREATE TABLE type_questions
(
	type_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type_name 	ENUM("essay","multiple_choice") DEFAULT "multiple_choice"
);

-- tạo bảng categoru_ questions:

CREATE TABLE category_questions
(
	category_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	category_name 	NVARCHAR(100) NOT NULL
);

-- tạo bảng questions :

CREATE TABLE questions
(
	question_id 	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	content			TEXT,
    category_id 	TINYINT UNSIGNED NOT NULL,
    type_id 		TINYINT UNSIGNED NOT NULL,
    creator_id 		INT UNSIGNED NOT NULL,
    create_date 	DATE,
    FOREIGN KEY(type_id) REFERENCES type_questions(type_id),
    FOREIGN KEY(category_id) REFERENCES category_questions(category_id),
    FOREIGN KEY(creator_id) REFERENCES accounts(account_id)
);


-- tạo bảng answers :

CREATE TABLE answers
(
	answer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content			TEXT,
    question_id 	INT UNSIGNED NOT NULL,
	iscorrect		BIT DEFAULT 1,
    FOREIGN KEY(question_id) REFERENCES questions(question_id)
);


-- tạo bảng exams : 


CREATE TABLE exams
(
	exam_id 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`code`				CHAR(10) UNIQUE NOT NULL,
    title 				NVARCHAR(200) NOT NULL,
    category_id 		TINYINT UNSIGNED NOT NULL,
    duration 			TINYINT UNSIGNED NOT NULL,
    creator_id 			INT UNSIGNED,
    createdate 			DATE,
    FOREIGN KEY(creator_id) REFERENCES accounts(account_id)
);

-- tạo bảng exam_ questions :


CREATE TABLE exam_questions
(
	exam_id 		INT UNSIGNED NOT NULL,
	question_id 	INT UNSIGNED NOT NULL,
	PRIMARY KEY(exam_id,question_id),
    FOREIGN KEY(question_id) REFERENCES questions(question_id),
    FOREIGN KEY(exam_id) REFERENCES exams(exam_id)
);



