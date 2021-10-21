-- Exercise 1:
-- Cho table sau:
-- Department (Department_Number, Department_Name)
-- Employee_Table (Employee_Number, Employee_Name,
-- Department_Number)
-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
-- Question 2: Thêm ít nhất 10 bản ghi vào table
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT es.employee_number AS NV,
		es.employess_name,
		e.skill_code,
        e.employee_number AS TEN
FROM employees es
LEFT JOIN  employee_skills e
	ON es.employee_number=e.employee_number
WHERE e.skill_code = "Java";
    

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có nhân viên lớn nhất.
SELECT *
FROM departments d
LEFT JOIN employees e
	ON e.department_number=d.department_number
GROUP BY e.department_number
HAVING COUNT(e.department_number) = (SELECT COUNT(department_number)
									FROM employees
                                    GROUP BY department_number
                                    ORDER BY COUNT(department_number)DESC
                                    LIMIT 1);



-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
-- Hướng dẫn: sử dụng GROUP BY

SELECT e.employess_name,
		d.department_name
FROM employees e
LEFT JOIN departments d
	ON e.department_number=d.department_number;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
-- Hướng dẫn: sử dụng DISTINCT

SELECT DISTINCT e.employess_name, -- ai coi baì giải thích dùm distinct ử đây để lam gì và đề có nghĩa là gì? ko hiểu
				k.skill_code
FROM employees e
LEFT JOIN employee_skills k
	ON e.employee_number=k.employee_number
WHERE (k.skill_code) > '1';