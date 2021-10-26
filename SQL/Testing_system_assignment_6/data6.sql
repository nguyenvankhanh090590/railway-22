USE Testing_System_Assignment_4;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó



DROP PROCEDURE IF EXISTS department_acount;
DELIMITER $$
CREATE PROCEDURE department_acount( IN IN_department_name VARCHAR(100))
	BEGIN	
		SELECT a.fullname, a.username,a.email
		FROM departments d
		RIGHT JOIN accounts a
			ON d.department_id= a.department_id 
		WHERE LOWER(d.department_name) = LOWER(IN_department_name); -- chỉ chữ thường 
	END $$
DELIMITER ;
-- SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
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
CALL COUNT_account_group();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question trOng tháng hiện tại

DELIMITER $$
CREATE PROCEDURE TYPE_TOTAL()
BEGIN
		SELECT q.content,COUNT(q.type_id)
        FROM questions q
        RIGHT JOIN type_questions t
			ON q.type_id=t.type_id
		WHERE month(q.create_date) = month(adddate(now(), interval -18 month))-- month(now()) AND YEAR(NOW())
		GROUP BY q.type_id
        ORDER BY COUNT(q.type_id) DESC;

END $$
DELIMITER ;


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất





DROP PROCEDURE IF EXISTS sp_GetCountQuesFromType;
DELIMITER $$
CREATE PROCEDURE sp_GetCountQuesFromType()
BEGIN
WITH CTE_MaxType_id AS(
SELECT count(q.Type_id) AS SL FROM question q
GROUP BY q.TypeID
)
SELECT tq.TypeName, count(q.TypeID) AS SL FROM question q
INNER JOIN typequestion tq ON tq.TypeID = q.TypeID
GROUP BY q.TypeID

HAVING count(q.TypeID) = (SELECT MAX(SL) FROM CTE_MaxTypeID);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS type_max;
DELIMITER $$
CREATE PROCEDURE type_max ()
BEGIN	
		WITH CTE_SLTYPE_ID
        AS (
									SELECT COUNT(type_id)
                                    FROM questions
                                    GROUP BY type_id
                                    ORDER BY COUNT(type_id) DESC
                                    LIMIT 1)
		SELECT COUNT(a.type_id),t.type_name
        FROM CTE_SLTYPE_ID;
		SELECT t.type_id,COUNT(q.type_id)
		FROM questions a
        INNER JOIN type_questions t
			ON a.type_id=t.type_id
		GROUP BY q.type_id
        HAVING COUNT(a.type_id)= CTE_SLTYPE_ID;
END $$
DELIIMITER ;








DROP PROCEDURE IF EXISTS COUNT_type_question;
DELIMITER $$
CREATE PROCEDURE COUNT_type_question (OUT OUT_type_id INT)
	BEGIN 
		SELECT type_id  INTO OUT_type_id
		FROM questions 
		GROUP BY type_id
		ORDER BY COUNT(type_id) DESC 
		LIMIT 1;
	END$$
DELIMITER ;
CALL COUNT_type_question();


-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS TYPE_NAME;
DELIMITER $$
CREATE PROCEDURE TYPE_NAME (IN OUT_type_id INT, OUT V_type_name ENUM("essay","multiple_choice"))
BEGIN 
			SELECT t.type_name INTO V_type_name
			FROM questions q
            RIGHT JOIN type_questions t
				ON t.type_id=q.type_id
			WHERE q.type_id = OUT_type_id
            GROUP BY t.type_name;
END $$
DELEMITER ;

CALL TYPE_NAME ();





-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào
DROP PROCEDURE Sort_group;
DELIMITER $$
CREATE PROCEDURE Sort_group(IN IN_account_id INT , OUT V_username VARCHAR (100))
BEGIN
		SELECT A.username INTO V_username
		FROM accounts A
        INNER JOIN group_accounts G
			ON A.account_id=G.account_id
        WHERE G.account_id  =  IN_account_id;
END $$
DELIMITER ;
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:

-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DROP PROCEDURE infom_customer;
DELIMITER $$
CREATE PROCEDURE infom_customer(IN IN_full_name NVARCHAR(100), IN IN_email_name NVARCHAR(100))
BEGIN 
		UPDATE accounts
        SET 
        username = SUBSTRING_INDEX(email, '@', 1),
        position_id = '1',
        department_id = NULL
        WHERE
        fullname = IN_full_name AND
        email = IN_email_name;
        SELECT *
        FROM accounts
        WHERE 	LOWER(fullname)=IN_full_name AND
				LOWER(email)=IN_email_name;
END$$
DELIMITER ;





-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS TOTAL_TYPE_QUES;
DELIMITER $$
CREATE PROCEDURE TOTAL_TYPE_QUES( IN IN_Es_Mul ENUM("essay","multiple_choice"))
BEGIN 
			SELECT *
            FROM type_questions t
            LEFT JOIN questions q
				ON t.type_id=q.type_id
			WHERE t.type_name = IN_Es_Mul
			GROUP BY length(q.content)
            HAVING length(q.content) = ( SELECT MAX(length(content))
										FROM questions
										);
									
END $$
DELIMITER ;


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DELIMITER $$
CREATE PROCEDURE EX_ID_DELETE (IN IN_exam_id INT)
BEGIN
	DELETE FROM exams WHERE exam_id= IN_exam_id;
            
END $$
DELIMITER ;


-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
DROP PROCEDURE IF EXISTS EX_ID_3Y_DELETE;
DELIMITER $$
CREATE PROCEDURE EX_ID_3Y_DELETE (IN IN_exam_id INT)
BEGIN
	SELECT *
    FROM exams
    WHERE YEAR(createdate) > YEAR(ADDDATE(NOW(), INTERVAL -3 YEAR));
	DELETE FROM exams 
    WHERE YEAR(createdate) > YEAR(ADDDATE(NOW(), INTERVAL -3 YEAR)) 
    AND exam_id=IN_exam_id;
END $$
DELIMITER ;

-- Sau đó in số lượng record đã remove từ các table liên quan trong khi
-- removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
DELIMITER $$
CREATE PROCEDURE DEP_DELETE (IN IN_DEP_NAME VARCHAR(100))
BEGIN
	WITH DEP_ACC AS(
	SELECT d.department_name,a.account_id
    FROM departments d
    INNER JOIN accounts a
		ON d.department_id=a.department_id
    )
    SELECT *
    FROM DEP_ACC 
    REMOVE TO `default` AS ;
            
END $$
DELIMITER ;


-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm
-- nay


DELIMITER $$
CREATE PROCEDURE QUES_YE ()
BEGIN
	SELECT create_date, COUNT(MONTH(create_date))SL_CAU_HOI
    FROM questions
    WHERE YEAR(create_date)= YEAR(ADDDATE(NOW(), INTERVAL -1 YEAR))
	GROUP BY MONTH(create_date)
    ;
END $$
DELIMITER ;


