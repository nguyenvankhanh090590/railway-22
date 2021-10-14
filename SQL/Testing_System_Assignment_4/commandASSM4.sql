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

SELECT *
FROM `accounts` a
RIGHT JOIN positions p
ON p.position_id=a.position_id
WHERE p.position_name="Dev";


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT p.department_name
FROM departments p
LEFT JOIN `accounts` a
ON p.department_id=a.department_id
GROUP BY p.department_id
HAVING COUNT(p.department_id)>=3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
-- nhất

SELECT q.content
FROM questions q
RIGHT JOIN answers a
ON q.question_id=a.question_id
GROUP BY a.question_id
LIMIT 1;


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT category_name,
		content,
        c.category_id,
        type_id,
        creator_id,
        create_date
FROM category_questions c 
CROSS JOIN questions;
		
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT content,
		`code`,
		title,
        e.category_id,
        duration,
        e.creator_id,
        createdate
FROM questions
CROSS JOIN exams e;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT q.content
FROM questions q
RIGHT JOIN	answers a
ON q.question_id= a.question_id
GROUP BY a.question_id
ORDER BY COUNT(a.question_id) DESC
LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group

SELECT a.username,
		group_name,
        creator_id,
        g.create_date
FROM `groups` g
CROSS JOIN `accounts` a;

-- Question 10: Tìm chức vụ có ít người nhất

SELECT p.department_name
FROM departments p
LEFT JOIN `accounts` a
ON a.department_id=p.department_id
ORDER BY a.department_id
LIMIT 1;


-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM


SELECT p.position_name,
		a.position_id,
        d.department_name
FROM ( positions p,`accounts` a, departments d);



-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...


SELECT s.content,
		s.category_id,
        s.type_id,
        a.fullname,
       --  a.account_id,
--         s.creator_id,
        s.create_date
FROM questions s
RIGHT JOIN  `accounts` a
ON a.account_id=s.creator_id;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT q.content,
		t.type_name
FROM questions q
RIGHT JOIN type_questions t
ON q.type_id=t.type_id;


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
