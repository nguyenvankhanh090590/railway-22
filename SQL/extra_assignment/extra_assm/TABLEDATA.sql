######## TẠO DATABASE ĐỂ QUẢN LÝ FRESHER ########
			################################
DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE IF NOT EXISTS Fresher;


USE Fresher;


				######## Tạo Bảng Trainee ########
				################################
 
 DROP TABLE IF EXISTS Trainee, Colum,Colum_2;
 CREATE TABLE Trainee
 (
 Trainee_ID					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Full_Name					NVARCHAR(100),
 Birth_Date					INT,
 Gender						ENUM('male','female','unknow'),
 ET_IQ						TINYINT UNSIGNED,
 ET_English					TINYINT UNSIGNED,
 ET_Gmath					TINYINT UNSIGNED,
 Training_Class				CHAR(20),
 Evalution_Notes			TEXT,
 VTI_Account				NVARCHAR(100) NOT NULL UNIQUE
 );

CREATE TABLE Colum
(
Colum_id					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Colum_Name					VARCHAR(100),
Colum_code					CHAR(5),
Modifed_Data				TIMESTAMP

);

CREATE TABLE Colum_2
(
colum_id					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
colum2_name					VARCHAR(100),
Birthdate					TINYINT,
Gender						ENUM('0','1','2'), -- 0: male 	1: female	2: unkown
Is_DeletedFlag				ENUM('0','1')
);

				###############

