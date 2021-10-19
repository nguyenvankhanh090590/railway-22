INSERT INTO departments(department_name)
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);

INSERT INTO positions(position_name)  
VALUES 					(N'Dev'			),
						(N'Test'			),
						(N'Scrum Master'	),
						(N'PM'			); 

INSERT INTO `accounts`(email							, username			, fullname					, department_id	, position_id, create_date)
VALUES 				(N'haidang29productions@gmail.com'	, N'dangblack'		,N'Nguyen hải Đăng'			,   '1'			,   '1'		,'2020-03-05'),
					(N'kimcong@gmail.com'				, N'quanganh'		,N'Nguyen hải Đăng'			,   '1'			,   '2'		,'2020-03-05'),
                    (N'anhtuyet@gmail.com'				, N'vanchien'		,N'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                    (N'KhangVTi1@gmail.com'				, N'cocoduongqua'	,N'Duong Do'				,   '5'			,   '4'		,'2020-03-08'),
                    (N'chahieurchi@gmail.com'			, N'doccocaubai'	,N'Nguyen Chien bai'		,   '4'			,   '4'		,'2020-03-10'),
                    (N'dapphatchetngay@gmail.com'		, N'khabanh'		,N'Ngo Ba Kha'				,   '6'			,   '3'		,'2020-04-05'),
                    (N'songcodaoly@gmail.com'			, N'huanhoahong'	,N'Bui Xuan Han'			,   '7'			,   '2'		, NULL		),
                    (N'sdoiesp@gmail.com'				, N'tungnui'		,N'Nguyen Thanh Trung'		,   '8'			,   '1'		,'2020-04-07'),
                    (N'duongghuu@gmail.com'				, N'duongghuu'		,N'Duong Van Huu dung'		,   '1'			,   '2'		,'2020-04-07'),
                    (N'vtiaccademy@gmail.com'			, N'vtiaccademy'	,N'Vi Ti Ai hieu'			,   '10'		,   '1'		,'2020-04-09'),
					(N'KhanhVTi@gmail.com'				,	N'KN_1'			,N'Nguyen Văn Khánh'		,	'5'			,	'3'		,'2021-10-10'),
                    (N'DangtheVIT@gamil.com'			,   N'DTV_1'        ,N'Đặng Thế Vinh'			,   '4'        	 ,   '2'     ,'2021-10-10'),
                    (N'Hoangthu@mail.com'				,   N'HTT_1'        ,N'Hoàng Thị Thu'			,   '3'        	 ,   '2'     ,'2021-10-10'),
                    (N'Hienvien@gmail.com'				,   N'Hien_1'       ,N'Nguyen Thu Hiền'			,   '2'        	 ,   '3'     ,'2021-10-10'),
                    (N'Hoangkimdat@mgail.com'			,   N'DAT09'        ,N'Hoàng Kim Đạt'			,   '1'        	 ,   '1'     ,'2021-10-10'),
                    (N'dapchetthedeonaodcy@gmail.com'	,	N'datpha'		,N'pha van dat kim'			,   '6'			,	'1'		,'2019-02-19'),
                    (N'kongcodaoly@gmail.com'			,	N'kongcoda'		,N'koi da ga'            	,   '7'			,   '2'		,'2019-02-19'),
                    (N'spoiesp@gmail.com'				,	N'spoiyeuem'	,N'spoi laki yen'           ,   '8'			,   '1'		,'2019-03-19'),
                    (N'cuongghuu@gmail.com'				,	N'cuongda'		,N'cuong da 123'            ,   '1'			,   '3'		,'2019-03-19'),
                    (N'vAntiaccademy@gmail.com'			,	N'vananh'		,N'nguyen thi van anh'      ,   '10'		,	'2'		,'2019-04-19'),
                    (N'KhangVTi@gmail.com'				,	N'khanhtv'		,N'khanh coi tv'            ,	'5'			,   '2'		,'2019-06-19'),
                    (N'DangthaiVIT@gamil.com'			,	N'dangthai'		,N'dang thai giam'          ,   '4'         ,   '3'		,'2019-05-19'),
                    (N'Hoanthuuong@mail.com'			,	N'hoalou'		,N'hoa lius ui'             ,   '3'         ,   '1'		,'2019-07-19'),
                    (N'Hienvinh@gmail.com'				,	N'hienvin'		,N' hoa van hien'			,   '4'         ,	'3'		,'2019-08-19'),
                    (N'Hoangdat@mgail.com'				,	N'hoangdat'		,N' hoang lao bo'           ,   '3'         ,   '1'		,'2019-08-19');
 
 
INSERT INTO `groups`	( group_name			, creator_id		, create_date)
VALUES 				(N'Testing System'			,   5			,'2019-03-05'),
					(N'Development'				,   1			,'2020-03-07'),
                    (N'VNTA Sale 01'			,   2			,'2020-03-09'),
                    (N'VNTA Sale 02'			,   3			,'2020-03-10'),
                    (N'VNTA Sale 03'			,   4			,'2020-03-28'),
                    (N'VNTA Creator'			,   6			,'2020-04-06'),
                    (N'VNTA Marketing 01'		,   7			,'2020-04-07'),
                    (N'Management'				,   8			,'2020-04-08'),
                    (N'Chat with love'			,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'				,   1			,'2020-04-10'),
                    (N'Management'				,	11			,'2019-06-19'),
                    (N'Sale_1'					,	2	        ,'2019-05-19'),
                    (N'Sale_2'		            ,	13          ,'2019-07-19'),
                    (N'Test_1'		            ,	4          ,'2019-08-19'),
                    (N'Test_2'		            ,	5	        ,'2019-08-19');
                    
                    
                    
                    
                    
                    
INSERT INTO `group_accounts`	(  group_id	, account_id	, join_date	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2019-03-10'),
							(	5		,    5		,'2019-03-28'),
							(	1		,    6		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    8		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10'),
							(	1		,	11		,'2021-10-10'),
                            (	3		,	12		,'2021-10-10'),
                            (	2		,	13		,'2021-10-10'),
                            (	4		,	14		,'2021-10-10'),
                            (	5		,	15		,'2021-10-10');



INSERT INTO type_questions (type_name			) 
VALUES 						('essay'			), 
							('multiple_choice'	); 

INSERT INTO category_questions (category_name)
VALUES 								(N'Java'			),
									(N'ASP.NET'		),
									(N'ADO.NET'		),
									(N'SQL'			),
									(N'Postman'		),
									(N'Ruby'			),
									(N'Python'		),
									(N'C++'			),
									(N'C Sharp'		),
									(N'PHP'			);


INSERT INTO questions	(content			, category_id, type_id		, creator_id	, create_date )
VALUES 					(N'Câu hỏi về Java '	,	1		,   '1'			,   '2'		,'2020-04-05'),
						(N'Câu Hỏi về PHP6'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#5'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby4'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman3'	,	5		,   '1'			,   '5'		,'2019-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2018-04-06'),
						(N'Hỏi về C++96'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL91'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python71'	,	7		,   '1'			,   '10'	,'2019-04-07'),
                        (N'Hỏi về DO.NET82'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về P.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C+0'		,	8		,   '1'			,   '8'		,'2010-04-07'),
						(N'Hỏi về SQLM89'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Pythonhg78'	,	7		,   '1'			,   '10'	,'2010-04-07');
                        
                        
                        
                        
                        
                        


INSERT INTO answers	(  content		, question_id	, iscorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		),
                    (N'Trả lời 11'	,   4			,	0		),
                    (N'Trả lời 12'	,   8			,	0		),
                    (N'Trả lời 13'	,   9			,	1		),
                    (N'Trả lời 14'	,   10			,	1		),
                    (N'Trả lời 15'	,   10			,	1		),
                    (N'Trả lời 16'	,   4			,	0		),
                    (N'Trả lời 17'	,   8			,	0		),
                    (N'Trả lời 18'	,   9			,	1		),
                    (N'Trả lời 19'	,   10			,	1		);
                    
                    

INSERT INTO exams	(`code`			, title					, category_id	, duration	, creator_id		, createdate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08'),
                    ('VTIQ011'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ012'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ013'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ014'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ015'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ016'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ017'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ018'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ019'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ020'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ021'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ022'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ023'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
 
 
INSERT INTO exam_questions	(exam_id	, question_id) 
VALUES 						(	1	,		5		),
							(	2	,		10		), 
							(	3	,		4		), 
							(	4	,		3		), 
							(	5	,		7		), 
							(	6	,		10		), 
							(	7	,		2		), 
							(	8	,		10		), 
							(	9	,		9		), 
							(	10	,		8		),
							(	11	,		5		),
							(	12	,		10		),
							(	13	,		4		),
							(	14	,		3		),
							(	15	,		7		),
							(	16	,		10		),
							(	17	,		2		),
							(	18	,		10		),
							(	19	,		9		);