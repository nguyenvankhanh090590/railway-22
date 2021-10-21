-- thêm data department
INSERT INTO departments(department_id, department_name)
VALUES					( 	1		,  N'Marketing'),
						(	2		,  N'Sale'),
                        (	3		,  N'Kỹ Thuật'),
                        (	4		,  N'Nhân Sự'),
                        (	5		,  N'Giám Đốc');


-- thêm data Positions
INSERT INTO Positions (Position_id, Position_name)
VALUES					(	1		,	N'DEV'	),
						(	2		,	N'TEST'	),
                        (	3		,	N'Scrum Master'),
                        (	4		,	N'PM'	);


-- thêm data Accounts
INSERT INTO Accounts (Account_id , gender ,			 Email , 				Use_name , 		Full_name , 		department_id , Position_id , 	Create_Date)
VALUES					(	1		,	1	,	N'KhanhVTi@gmail.com'	,	'KN_1'		,	N'Nguyễn Văn Khánh'	,	5		,		3		,	'2021-10-10'),
						(	2		,	1	,	N'DangtheVIT@gamil.com'	,	'DTV_1'		,	N'Đặng Thế Vinh'	,	4		,		2		,	'2021-10-10'),
                        (	3		,	0	,	N'Hoangthu@mail.com'	,	'HTT_1'		,	N'Hoàng Thị Thu'	,	3		,		2		,	'2021-10-10'),
                        (	4		,	0 	,	N'Hienvinh@gmail.com'	,	'Hien_1'	,	N'Nguyễn Thu Hiền'	,	2		,		3		,	'2021-10-10'),
                        (	5		,	1	,	N'Hoangkimdat@mgail.com',	'DAT09'		,	N'Hoàng Kim Đạt'	,	1		,		1		,	'2021-10-10');
                        
-- thêm data `Groups`
INSERT INTO `Groups`(Group_id , Group_name   , 	Creator_id , Create_Date)
VALUES				(	1		,N'Management'	,1			,'2021-10-10'),
					(	2		,N'Sale_1'		,3			,'2021-10-10'),
                    (	3		,N'Sale_2'		,2			,'2021-10-10'),
                    (	4		,N'Test_1'		,4			,'2021-10-10'),
                    (	5		,N'Test_2'		,5			,'2021-10-10');

-- thêm data Group_Accounts
INSERT INTO Group_Accounts (Group_id , Account_id , Join_Date)
VALUES					   	(	1		,	1		,'2021-10-10'),
							(	3		,	2		,'2021-10-10'),
                            (	2		,	3		,'2021-10-10'),
                            (	4		,	4		,'2021-10-10'),
                            (	5		,	5		,'2021-10-10');
                            
-- thêm data Type_Questions
INSERT INTO Type_Questions (Type_id , Type_name)
VALUES						(	1	,	N'essay'),
							(	2	,	N'mutiple-Choice');
                            
-- thêm data Category_Questions
INSERT INTO Category_Questions  ( Category_id   , Category_Name)
VALUES							(	1			,		N'SQL_1'),
								(	2			,		N'SQL_2'),
                                (	3			,		N'SQL_3'),
                                (	4			,		N'SQL_4'),
                                (	5			,		N'SQL_5');

-- thêm data Questions
INSERT INTO Questions ( Question_id , Content , 												Category_id ,		 Type_id , Creator_id , Creator_Date)
VALUES				 	(		1		,N'VARCHAR la constraints'							,		5	  	,			1	,		1		,'2021-10-10'),
						(		2		,N'ENUM sử dụng chuỗi kí tự biến đổi dạng tring'	,		4		,			1	,		1		,'2021-10-10'),
                        (		3		,N'DECIMAL là datatype nhập số theo mẫu đặt ra'		,		3		,			1	,		1		,'2021-10-10'),
                        (		4		,N'PRIMARY KEY là khoá phụ '						,		2		,			1	,		1		,'2021-10-10'),
                        (		5		,N'PRIMARY KEY là khoá chính của trường'			,		1		,			1	,		1		,'2021-10-10');

-- thêm data Answers
INSERT INTO Answers ( Answer_id , Content , 																			Question_id , 	is_Correct )
VALUES				(	1		,N'VARCHAR là datatype sử dụng chuỗi kí tự biến đổi dạng string',							 '1'	,		1),
					(	2		,N'ENUM là datatype dạng string sử dụng để áp đặt nguời dùng sử dụng giá trị cho trước',	 '2'	,		1),
					(	3		,N'DECIMAL là datatype nhập số có phần sau dấu phấy được đặt trước số kí tự',				 '3'	,		1),
                    (	4		,N'PRIMARY KEY là khoá phụ',																 '4'	,		0),
                    (	5		,N'PRIMARY KEY là khoá chính của trường',													 '5'	,		1);

-- thêm data Exams
INSERT INTO Exams ( Exam_id , 		`Code` 	,	 Title , 			Category_id , 	Duration 	,	 Creator_id ,	 Creator_Date)
VALUES				( 	1	,	N'VTI_001'	,	N'BÀI TẬP_1'	,		1		,		5		,		1		,	'2021-10-10'),
					(	2	,	N'VTI_002'	,	N'BÀI TẬP_2'	,		3		,		5		,		1		,	'2021-10-10'),
                    (	3	,	N'VTI_003'	,	N'BÀI TẬP_3'	,		4		,		5		,		1		,	'2021-10-10'),
					(	4	,	N'VTI_004'	,	N'BÀI TẬP_4'	,		1		,		5		,		1		,	'2021-10-10'),
                    (	5	,	N'VTI_005'	,	N'BÀI TẬP_5'	,		2		,		5		,		1		,	'2021-10-10');
                    
-- thêm data Exam_Questions
INSERT INTO Exam_Questions ( Exam_id , Question_id)
VALUES						(	1	,	1		),
							(	2	,	1		),
                            (	3 	,	3		),
                            (	4	,	3		),
                            (	5	,	2		);
                            
	INSERT INTO departments( department_name)
    VALUES					( 'Kế toán');