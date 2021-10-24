-- tạo data project_manage
DROP DATABASE IF EXISTS project_manage;
CREATE DATABASE project_manage;
USE project_manage;


-- tạo bảng  Employee
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
	Employee_id 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_LastName				NVARCHAR(30) NOT NULL,
    Employee_FirstName				NVARCHAR(30) NOT NULL,
    Employee_Hire_Date				DATE,
    Employee_Status					BIT NOT NULL, -- 1 : tot 0 : k tot
    Supervisor_id					TINYINT UNSIGNED NOT NULL,
    Social_Security_Number			CHAR(20),
    FOREIGN KEY (Supervisor_id)		REFERENCES Employee (Employee_id)
);
-- tạo bảng  Projects
DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects(
	Project_id 						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Manager_id						TINYINT	UNSIGNED NOT NULL,
    Project_Name 					NVARCHAR(50) NOT NULL,
    Project_Start_Date				DATE,
    Project_Description				NVARCHAR(50) NOT NULL,
    Project_Detail					NVARCHAR(50) NOT NULL,
    Project_Completed_On			DATE,
		FOREIGN KEY (Manager_id)	REFERENCES Employee(Employee_id)
);

-- tạo bảng  Project_Modules
DROP TABLE IF EXISTS Project_Modules;
CREATE TABLE Project_Modules
(
	Module_id 						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Project_id						TINYINT UNSIGNED NOT NULL,
    Employee_id						TINYINT UNSIGNED NOT NULL,
    Project_Modules_Date			DATE,
    Project_Modules_On				DATE,
    Project_Modules_Description		NVARCHAR(100),
		FOREIGN KEY (Project_id) 	REFERENCES Projects (Project_id),
        FOREIGN KEY (Employee_id) 	REFERENCES Employee (Employee_id)
);
-- tạo bảng  Work_Done
DROP TABLE IF EXISTS Work_Done;
CREATE TABLE Work_Done(
	Work_Done_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_id						TINYINT UNSIGNED NOT NULL,
    Module_id						TINYINT UNSIGNED NOT NULL,
    Work_Done_Date					DATE,
    Work_Done_Description			NVARCHAR(100) NOT NULL,
    Work_Done_Status				BIT NOT NULL, -- 1: done, 0: processing
		FOREIGN KEY (Module_id)		REFERENCES Project_Modules (Module_id),
		FOREIGN KEY (Employee_id)	REFERENCES Employee(Employee_id)
);



