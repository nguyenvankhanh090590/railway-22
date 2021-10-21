DROP DATABASE IF EXISTS project_manage;
CREATE DATABASE IF NOT EXISTS project_manage
CHARACTER SET 'utf8'
COLLATE "utf8_unicode_ci";

DROP TABLE IF EXISTS project_modules;--  projects, employees,work_done;
CREATE TABLE project_modules(
module_id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
project_id						TINYINT UNSIGNED NOT NULL,
employee_id						TINYINT UNSIGNED NOT NULL,
project_modules_compled_on 		DATETIME DEFAULT NOW(),
project_modules_description		NVARCHAR(100) NOT NULL,
FOREIGN KEY (module_id) REFERENCES projects(project_id),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

DROP TABLE IF EXISTS projects;
CREATE TABLE projects(
project_id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
manager_id						TINYINT UNSIGNED NOT NULL,
project_name					NVARCHAR(50) NOT NULL,
project_start_date				DATETIME DEFAULT NOW(),
project_description				NVARCHAR(100) NOT NULL ,
project_detail					NVARCHAR(100) NOT NULL ,
project_completed_on			DATE DEFAULT NOW(),
FOREIGN KEY (manager_id) REFERENCES employees(employee_id)

);
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
employee_id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
employee_lastname				NVARCHAR (50),
employee_fisrtname				NVARCHAR (50),
employee_hire_date				DATE DEFAULT NOW(),
employee_status					BIT NOT NULL , -- 1 : đang làm  0: nghỉ việc
supervisior_id					TINYINT UNSIGNED NOT NULL,
social_security_number			CHAR(10) NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees(supervisior_id)
);

CREATE TABLE work_done(
worrk_done_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
employee_id						TINYINT UNSIGNED NOT NULL,
module_id						TINYINT UNSIGNED NOT NULL,
work_done_date					DATE DEFAULT NOW(),
work_done_description			NVARCHAR(100) NOT NULL,
work_done_status				BIT NOT NULL, -- ('1-work done','2-working'),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
FOREIGN KEY (module_id)		REFERENCES project_modules(module_id)
);
