DROP DATABASE IF EXISTS Fresher_management;
CREATE DATABASE Fresher_management;
USE Fresher_management;
/*================TẠO BẢNG=======================*/
/*===============================================*/
-- =Question1=
-- Tao bang Trainee
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
	TraineeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_Name			NVARCHAR(50),
    Birth_Date			DATE NOT NULL,
    Gender				ENUM('male','female','unknown'),
    ET_IQ				TINYINT UNSIGNED CHECK(ET_IQ<=20),
    ET_Gmath			TINYINT UNSIGNED CHECK(ET_Gmath<=20),
    ET_English			TINYINT UNSIGNED CHECK(ET_English<=20),
    Trainning_Class		CHAR(10),
    Evaluation_Notes	NVARCHAR(50) DEFAULT NULL,
    VTI_Account VARCHAR(30) NOT NULL UNIQUE KEY
);

-- ALTER TABLE Trainee ADD COLUMN VTI_Account VARCHAR(30) NOT NULL UNIQUE KEY;

