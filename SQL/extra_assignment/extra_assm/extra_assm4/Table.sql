DROP DATABASE IF EXISTS extra_assm4;
CREATE DATABASE IF NOT EXISTS extra_assm4
	CHARACTER SET "utf8"
    COLLATE "utf8_unicode_ci";
USE extra_assm4;
DROP TABLE IF EXISTS  	departments,
						employees,
                        employee_skills;
CREATE TABLE departments (
department_number				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
department_name					NVARCHAR (100) UNIQUE NOT NULL
);


CREATE TABLE employees    (
employee_number					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
employess_name					NVARCHAR(100) UNIQUE NOT NULL,
department_number				TINYINT UNSIGNED,
FOREIGN KEY (department_number) REFERENCES departments(department_number)
);
	
    

CREATE TABLE employee_skills	(
employee_number				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
skill_code						CHAR(10),
date_registered					DATETIME DEFAULT NOW(),
FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);
