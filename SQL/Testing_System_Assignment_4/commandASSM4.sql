USE Testing_System_Assignment_4;


-- EXERCISE1 --

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT 	a.fullname,
        d.department_name
FROM `accounts` a
LEFT JOIN departments d
ON d.department_id=a.department_id;


-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010



SELECT *
FROM `accounts`
WHERE create_date >'2010-12-20';


-- Question 3: Viết lệnh để lấy ra tất cả các developer


SELECT a.fullname,p.position_name
FROM `accounts` a
LEFT JOIN positions p
ON p.position_id=a.position_id
WHERE p.position_name="Dev";


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên


SELECT d.*
FROM departments d
RIGHT JOIN accounts a
ON a.department_id=d.department_id
GROUP BY a.department_id
HAVING COUNT(a.department_id)>=3;



SELECT p.department_name
FROM departments p
LEFT JOIN `accounts` a
ON p.department_id=a.department_id
GROUP BY p.department_id
HAVING COUNT(p.department_id)>=3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
-- nhất


SELECT q.content,
		e.question_id
FROM exam_questions e
LEFT JOIN questions q
ON q.question_id=e.question_id
GROUP BY e.question_id
ORDER BY COUNT(e.question_id) DESC
LIMIT 1;


SELECT q.content,
		e.question_id,
        COUNT(e.question_id)
FROM exam_questions e
LEFT JOIN questions q
ON q.question_id=e.question_id
GROUP BY e.question_id
HAVING COUNT(e.question_id)=(
							SELECT	COUNT(e.question_id)
                            FROM exam_questions e
							INNER JOIN questions q
								ON e.question_id=q.question_id
							GROUP BY q.question_id
                            ORDER BY COUNT(q.question_id) DESC
                            LIMIT 1
                            );
-- SELECT COUNT(question_id)
-- FROM exam_questions
-- GROUP BY question_id
-- ORDER BY COUNT(question_id) DESC
-- LIMIT 1;

        
        

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question


SELECT	c.category_name
FROM category_questions c
LEFT JOIN questions q
	ON c.category_id=q.category_id
GROUP BY q.category_id;


        
        
        
        
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT COUNT(e.question_id),
			q.content
FROM questions q
LEFT JOIN exam_questions e
	ON q.question_id=e.question_id
GROUP BY e.question_id
;




-- Question 8: Lấy ra Question có nhiều câu trả lời nhất


SELECT q.content
FROM questions q
INNER JOIN answers a
ON q.question_id=a.question_id
GROUP BY a.question_id
ORDER BY COUNT(a.question_id) DESC
LIMIT 1;


SELECT q.content,
		COUNT(a.question_id) total_answer
FROM questions q
INNER JOIN answers a
ON q.question_id=a.question_id
GROUP BY a.question_id
HAVING COUNT(a.question_id)=(
				SELECT COUNT(question_id)
				FROM answers
                GROUP BY question_id
                ORDER BY COUNT(question_id) DESC
                LIMIT 1)
                ;




-- Question 9: Thống kê số lượng account trong mỗi group


SELECT *,
	COUNT(g.account_id),
	gr.group_name
FROM accounts a
RIGHT JOIN group_accounts g
	ON a.account_id= g.account_id
RIGHT JOIN `groups` gr
	ON gr.group_id=g.group_id
GROUP BY g.group_id ;





-- SELECT 	g.*,
-- 		a.account_id
-- FROM group_accounts g
-- RIGHT JOIN accounts a
-- ON a.account_id=g.account_id
-- WHERE g.account_id IS NULL;

-- SELECT 	a.*,
-- 		g.group_name
-- FROM group_accounts a
-- RIGHT JOIN `groups` g
-- ON g.group_id=a.group_id
-- GROUP BY group_id
-- ORDER BY group_id;






-- Question 10: Tìm chức vụ có ít người nhất

SELECT d.*
FROM departments d
LEFT JOIN accounts a
ON a.department_id=d.department_id
GROUP BY d.department_id
ORDER BY COUNT(d.department_id)
LIMIT 1;



SELECT *
FROM positions p
LEFT JOIN accounts a
	ON p.position_id=a.position_id
GROUP BY a.position_id
ORDER BY COUNT(a.position_id)
LIMIT 1;

SELECT *,
COUNT(a.position_id)
FROM positions p
LEFT JOIN accounts a
	ON p.position_id=a.position_id
GROUP BY a.position_id
HAVING COUNT(a.position_id)=(
					SELECT position_id
                    FROM accounts
                    GROUP BY position_id
                    ORDER BY COUNT(position_id)
                    LIMIT 1)
                    ;



-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM



SELECT q.position_name,
		COUNT(a.position_id)
FROM accounts a
RIGHT JOIN departments d
	ON a.department_id=d.department_id
LEFT JOIN positions q
	ON q.position_id=a.position_id
GROUP BY a.department_id,a.position_id
ORDER BY COUNT(a.department_id);




-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...


SELECT 	
		a.content,
		a.question_id,
		t.type_id,
		q.category_id,
        e.creator_id
FROM	questions q
    LEFT JOIN answers a 
		ON a.question_id = q.question_id
    LEFT JOIN type_questions t 
		ON t.type_id=t.type_id
	LEFT JOIN category_questions c
		ON q.category_id=c.category_id
	LEFT JOIN exams e
		ON e.creator_id=q.creator_id;



-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT
		q.content,
		t.type_name
FROM questions q
INNER JOIN type_questions t
ON q.type_id=t.type_id
GROUP BY q.type_id;

-- Question 14:Lấy ra group không có account nào

SELECT g.group_name,					
		g.group_id
FROM `groups` g
LEFT JOIN `group_accounts` a
ON a.group_id=g.group_id
WHERE a.account_id IS NULL;



-- Question 15: Lấy ra group không có account nào -- ủa khác chi câu 14 ????

-- Question 16: Lấy ra question không có answer nào
SELECT q.content,
		q.question_id
FROM questions q
LEFT JOIN answers a
ON a.question_id=q.question_id
WHERE a.question_id IS NULL;


-- EXERCISE2 -- 

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1

SELECT a.fullname
FROM accounts a
INNER JOIN group_accounts g
ON a.account_id=g.account_id
WHERE g.account_id=1;


-- b) Lấy các account thuộc nhóm thứ 2
SELECT a.fullname
FROM accounts a
INNER JOIN group_accounts g
ON a.account_id=g.account_id
WHERE g.account_id=2;


-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau-- UINON

SELECT a.fullname
FROM accounts a
INNER JOIN group_accounts g
ON a.account_id=g.account_id
WHERE g.account_id=1
UNION
SELECT a.fullname
FROM accounts a
INNER JOIN group_accounts g
ON a.account_id=g.account_id
WHERE g.account_id=2;


-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên

SELECT COUNT(g.account_id)
FROM accounts a
INNER JOIN group_accounts g
	ON a.account_id=g.account_id
GROUP BY g.account_id
HAVING COUNT(g.account_id)>=5;
-- b) Lấy các group có nhỏ hơn 7 thành viên


SELECT COUNT(g.account_id)
FROM accounts a
INNER JOIN group_accounts g
	ON a.account_id=g.account_id
GROUP BY g.account_id
HAVING COUNT(g.account_id)<=7;
-- c) Ghép 2 kết quả từ câu a) và câu b)

SELECT COUNT(g.account_id)
FROM accounts a
INNER JOIN group_accounts g
	ON a.account_id=g.account_id
GROUP BY g.account_id
HAVING COUNT(g.account_id)>=5
UNION ALL
SELECT COUNT(g.account_id)
FROM accounts a
INNER JOIN group_accounts g
	ON a.account_id=g.account_id
GROUP BY g.account_id
HAVING COUNT(g.account_id)<=7;












