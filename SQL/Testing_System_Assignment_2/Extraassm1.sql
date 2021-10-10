SHOW DATABASES;
DROP DATABASE database_name;
USE fresher_manager;


DROP TABLE IF EXISTS table_trainee;
CREATE TABLE table_trainee
(
Trainee_id				INT AUTO_INCREMENT PRIMARY KEY, 
Full_name				VARCHAR(100),
Birht_day				DATE,
Gender					ENUM('male','female','unknow') DEFAULT 'male',
ET_IQ					VARCHAR(20),
ET_Gmath				VARCHAR(20),
ET_English				VARCHAR(50),
Training_Class			VARCHAR(20),
Evaluation_Notes		TEXT,
VTI_Account				INT UNSIGNED NOT NULL UNIQUE
);


CREATE DATABASE MANAGER_TABLE;

DROP TABLE IF EXISTS MANAGER_TABLE;
CREATE TABLE MANAGER_TABLE
(
Table_id			INT AUTO_INCREMENT PRIMARY KEY,
`Table_name`		TEXT CHECK('ENG'),
`code`				INT UNSIGNED CHECK (length ( code) =5),
Modified_Data		TIMESTAMP -- THỜI GIAN GẦN NHẤT CẬP NHẬT 
-- DATETIME DEFAULT NOW()-- THƠI GIAN LÚC NÀY.
);

