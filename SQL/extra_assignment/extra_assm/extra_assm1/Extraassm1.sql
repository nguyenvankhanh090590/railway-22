DROP DATABASE database_name;
CREATE DATABASE IF NOT EXISTS database_name;

USE fresher_manager;


DROP TABLE IF EXISTS table_trainee;
CREATE TABLE table_trainee
(
Trainee_id				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
Full_name				VARCHAR(100),
Birht_day				DATE,
Gender					BIT DEFAULT 1,
ET_iq					TINYINT UNSIGNED CHECK( ET_iq >= 0 AND ET_iq <= 20),
ET_gmath				TINYINT UNSIGNED CHECK( ET_iq >= 0 AND ET_ <= 20),
ET_english				TINYINT UNSIGNED CHECK( ET_iq >= 0 AND ET_iq <= 50),
Training_class			CHAR(10),
Evaluation_notes		TEXT,
VTI_account				VARCHAR(100) NOT NULL UNIQUE
);


CREATE DATABASE MANAGER_TABLE;

DROP TABLE IF EXISTS MANAGER_TABLE;
CREATE TABLE MANAGER_TABLE
(
Table_id			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Table_name`		TEXT CHECK('ENG'),
`code`				INT UNSIGNED CHECK (length ( code) =5),
Modified_Data		TIMESTAMP -- THỜI GIAN GẦN NHẤT CẬP NHẬT 
-- DATETIME DEFAULT NOW()-- THƠI GIAN LÚC NÀY.
);
