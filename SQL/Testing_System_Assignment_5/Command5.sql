USE Testing_System_Assignment_4;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)


-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS DS_NV;
CREATE VIEW  DS_NV AS
SELECT d.*,a.fullname
FROM departments d
RIGHT JOIN accounts a
	ON d.department_id=a.department_id
WHERE department_name= 'Sale' ;


SELECT * FROM DS_NV;

-- CTE 

WITH 
list_staff_sale 
AS (
SELECT a.*,d.department_name
FROM accounts a
INNER JOIN departments d
	ON d.department_id=a.department_id
WHERE department_name= 'Sale'
	)
SELECT *
FROM list_staff_sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

WITH
infomation_account
AS			(
SELECT a.*
FROM accounts a
INNER JOIN departments d
	ON a.department_id=d.department_id
GROUP BY a.department_id
HAVING COUNT(a.department_id)= (
								SELECT COUNT(a.department_id)
                                FROM accounts
                                GROUP BY a.department_id
                                ORDER BY COUNT(a.department_id)
                                LIMIT 1)
)
SELECT * 
FROM infomation_account;



 
CREATE VIEW tt_accounts AS
SELECT a.*
FROM accounts a
INNER JOIN departments d
	ON a.department_id=d.department_id
GROUP BY a.department_id
HAVING COUNT(a.department_id)= (
								SELECT COUNT(a.department_id)
                                FROM accounts
                                GROUP BY a.department_id
                                ORDER BY COUNT(a.department_id)
                                LIMIT 1 );
DROP VIEW IF EXISTS TT_ACCOUNT;


-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi

CREATE VIEW content_length_15 
AS
	SELECT length(content)
	FROM questions
	WHERE length(content) >15;
DELETE FROM content_length_15;

    
    

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

-- CTE 
WITH dep_most
AS (
SELECT a.*
FROM accounts a
INNER JOIN departments d
	ON a.department_id=d.department_id
GROUP BY a.department_id
HAVING COUNT(a.department_id)=(
								SELECT COUNT(department_id)
                                FROM accounts
                                GROUP BY department_id
                                ORDER BY COUNT(department_id) DESC
                                LIMIT 1)
)
SELECT *
FROM dep_most;



CREATE VIEW dep_most
AS
SELECT d.department_name,COUNT(a.department_id)
FROM accounts a
INNER JOIN departments d
	ON a.department_id= d.department_id
GROUP BY (a.department_id)
HAVING COUNT(a.department_id) = (
									SELECT COUNT(department_id)
                                    FROM accounts 
                                    GROUP BY (department_id) 
                                    ORDER BY COUNT(department_id) DESC
                                    LIMIT 1);
DROP VIEW content_length_15;


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo

-- CTE 
WITH use_nguyen
AS (
SELECT IFNULL(q.content,0)content_question,
		a.fullname
FROM accounts a
LEFT JOIN questions q
	ON q.creator_id = a.account_id
	WHERE fullname LIKE "Nguyen%"
    ORDER BY q.content
)
SELECT *
FROM use_nguyen;




CREATE VIEW use_nguyen 
AS
SELECT IFNULL(q.content,0)content,
		a.fullname,
        a.account_id
FROM accounts a
LEFT JOIN questions q
	ON q.creator_id = a.account_id
WHERE fullname LIKE "NGUYEN%"
ORDER BY q.content;

SELECT *
FROM use_nguyen;

DROP VIEW use_nguyen;

