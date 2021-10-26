-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo
-- trước 1 năm trước

DROP TRIGGER IF EXISTS User_restrictions;
DELIMITER $$
CREATE TRIGGER User_restrictions
BEFORE INSERT ON `groups`
FOR EACH ROW
	BEGIN 
			IF NEW.create_date > Now() THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='field create_date must be less for future';
            END IF;
				
	END $$
DELIMITER ;

INSERT INTO `groups`(group_name,creator_id,create_date)
VALUES			( N'dunghoianhvisao',2,'2022-10-10');




-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"


DROP TRIGGER IF EXISTS Restrict_users_to_pen_accounts;
DELIMITER $$
CREATE TRIGGER Restrict_users_to_pen_accounts
BEFORE INSERT ON accounts
FOR EACH ROW
	BEGIN 	
			IF NEW.department_id = (
									SELECT department_id
									FROM departments
									WHERE department_name = 'Sale') THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='cannot add more user';
            END IF;
				
	END $$
DELIMITER ;

INSERT INTO `accounts`(email	, username			, fullname					, department_id	, position_id, create_date)
VALUES 				(N'haidsang29productions@gmail.com'	, N'dsangblack'		,N'Nguyedn hải Đăng','2',   '1'		,'2020-03-05');


-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user


DROP TRIGGER IF EXISTS GROUP_MAX_5USER;
DELIMITER $$
CREATE TRIGGER GROUP_MAX_5USER
BEFORE INSERT ON group_accounts
FOR EACH ROW
	BEGIN 
			IF NEW.COUNT(group_id)=(SELECT COUNT(group_id)
									FROM group_account) 	> 5 THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='cannot add to group_a group with a maximum of 5 members  ';
            END IF;
				
	END $$
DELIMITER ;



-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS exam_questions_MAX_10Question;
DELIMITER $$
CREATE TRIGGER exam_questions_MAX_10Question
BEFORE INSERT ON exam_questions
FOR EACH ROW
	BEGIN 
			IF NEW.COUNT(exam_id)=(SELECT COUNT(exam_id)
									FROM exam_questions) 	> 10 THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='cannot add to group_a group with a maximum of 10 question  ';
            END IF;
				
	END $$
DELIMITER ;

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó



DROP TRIGGER IF EXISTS dont_delete_gmail_adm;
DELIMITER $$
CREATE TRIGGER dont_delete_gmail_adm
BEFORE DELETE ON accounts
FOR EACH ROW
	BEGIN 	
			IF OLD.email LIKE '%admin@gmail.com%' THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='cannot delete email_adm  ';
            ELSE
				DELETE FROM accounts WHERE email = OLD.email;
            END IF;
	END $$
DELIMITER ;


-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

-- TRONG TABLE KO CÓ ĐỂ DEFAULT DEPARTMENTID???????

DROP TRIGGER IF EXISTS USER_NOT_DEPARTMET_ID_TO_WTDEP;
DELIMITER $$
CREATE TRIGGER USER_NOT_DEPARTMET_ID_TO_WTDEP
BEFORE UPDATE ON accounts
FOR EACH ROW
	BEGIN 
			IF NEW.department_id = '' THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='Cannot add to group';
            UPDATE departments SET department_name='waiting Department' WHERE department_id IS NULL;
            END IF;
	END $$
DELIMITER ;
INSERT INTO `accounts`(email							, username			, fullname					, department_id	, position_id, create_date)
VALUES 				(N'haidang29productions@gDmail.com'	, N'dangbFlack'		,N'NgSuyen hải Đăng'			,   NULL			,   '1'		,'2020-03-05');
		



-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS MAXIMUM_2answer;
DELIMITER $$
CREATE TRIGGER MAXIMUM_2answer
BEFORE INSERT ON exam_questions
FOR EACH ROW
	BEGIN 	
    
			DECLARE SL_cauhoi	INT;
            DECLARE cau_tl_dung INT;
		
			SELECT COUNT(question_id)  INTO SL_cauhoi
            FROM answers
            WHERE question_id= NEW.question_id
            GROUP BY question_id;
           
            SELECT COUNT(*)  INTO cau_tl_dung
            FROM answers a
            WHERE iscorrect =1 AND question_id= NEW.question_id AND iscorrect= NEW.iscorrect
            GROUP BY question_id;
				
			IF (NEW.SL_cauhoi > 4 OR NEW.cau_tl_dung >2)THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='Cannot add to answer';
            END IF;
	END $$
DELIMITER ;


-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database








-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày


DROP TRIGGER IF EXISTS Trigger_9;
DELIMITER $$
CREATE TRIGGER Trigger_9
BEFORE DELETE ON exams
FOR EACH ROW
	BEGIN 
			IF OLD.createdate < ADDDATE(NOW(),INTERVAL -2 DAY) THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='Cannot add to delete';
            END IF;
	END $$
DELIMITER ;



-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào


DROP TRIGGER IF EXISTS User_restrictions;
DELIMITER $$
CREATE TRIGGER User_restrictions
BEFORE DELETE ON exams. 
FOR EACH ROW
	BEGIN 
			IF NEW.create_date > Now() THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='field create_date must be less for future';
            ELSEIF
            DELETE FRO
				
	END $$
DELIMITER ;




-- Question 12: Lấy ra thông tin exam trong đó:

-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:

-- 2

-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"