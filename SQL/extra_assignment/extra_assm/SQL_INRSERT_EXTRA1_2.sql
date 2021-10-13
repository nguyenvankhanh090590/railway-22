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
 Trainee_ID					INT AUTO_INCREMENT PRIMARY KEY,
 Full_Name					NVARCHAR(100),
 Birth_Date					DATE,
 Gender						ENUM('male','female','unknow'),
 ET_IQ						TINYINT,
 ET_English					TINYINT,
 Training_Class				CHAR(20),
 Evalution_Notes			TEXT,
 VTI_Account				VARCHAR(100) NOT NULL UNIQUE
 );

CREATE TABLE Colum
(
Colum_id					INT AUTO_INCREMENT PRIMARY KEY,
Colum_Name					VARCHAR(100),
Colum_code					CHAR(5),
Modifed_Data				TIMESTAMP

);

CREATE TABLE Colum_2
(
colum_id					INT AUTO_INCREMENT PRIMARY KEY,
Birthdate					DATE,
`Name`						NVARCHAR(100),
Gender						ENUM('0','1','unkown'),
Is_DeletedFlag				BIT 
);

				###############

