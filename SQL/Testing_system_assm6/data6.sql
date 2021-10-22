

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



  --   Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS COUNT_account_group;
DELIMITER $$
CREATE PROCEDURE COUNT_account_group ()
BEGIN
	SELECT g.*,COUNT(g.group_id)
	FROM group_accounts g
	RIGHT JOIN `groups` a
		ON g.group_id=a.group_id
	GROUP BY g.group_id;
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


