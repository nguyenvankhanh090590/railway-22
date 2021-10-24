USE Testing_System_Assignment_4;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS department_acount;
DELIMITER $$
CREATE PROCEDURE department_acount( IN IN_department_name VARCHAR(100))
	BEGIN	
		SELECT a.fullname
		FROM departments d
		INNER JOIN accounts a
			ON d.department_id= a.department_id
		WHERE LOWER(d.department_name) = LOWER(IN_department_name);
	END $$
DELIMITER ;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS COUNT_account_group;
DELIMITER $$
CREATE PROCEDURE COUNT_account_group ()
BEGIN
	SELECT gr.group_name,
			g.group_id,
			COUNT(g.group_id) ACC_TOTAL
	FROM group_accounts g
	RIGHT JOIN `groups` a
		ON g.group_id=a.group_id
	LEFT JOIN `groups`  gr
		ON g.group_id=gr.group_id
	GROUP BY g.group_id
    ORDER BY COUNT(g.group_id);
END$$
DELIMITER ;
CALL COUNT_account_group;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question trpng tháng hiện tại

DROP PROCEDURE IF EXISTS COUNT_type_question;
DELIMITER $$
CREATE PROCEDURE COUNT_type_question ()
	BEGIN 
		SELECT *
        FROM questions q
        LEFT JOIN type_questions t
			ON q.type_id=t.type_id
		WHERE month(create_date)= year(now) and month(now());

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS COUNT_type_question;
DELIMITER $$
CREATE PROCEDURE COUNT_type_question (OUT OUT_type_id INT)
	BEGIN 
		SELECT type_id INTO OUT_type_id
		FROM questions 
		GROUP BY type_id
		ORDER BY COUNT(type_id) DESC 
		LIMIT 1;
	END$$
DELIMITER ;


-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:

-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ

-- Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi
-- removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm
-- nay