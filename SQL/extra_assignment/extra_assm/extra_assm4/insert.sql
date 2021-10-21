SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


INSERT INTO departments ( department_name)
VALUES 
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);



INSERT INTO employees	 (employess_name 	, department_number)
VALUES					(N'Nguyễn Hải Đăng'	,		1			),
						(N'Dương Văn Quá'	,		1			),
						(N'Tiểu Long Nữ'	,		2			),
						(N'Chu Chỉ Nhược'	,		5			),
						(N'Trương Vô Kị'	,		6			),
						(N'Hoàng Dược Sư'	,		5			),
						(N'Lý Mạc Sầu'		,		5			),
						(N'Quách Tĩnh'		,		1			),
						(N'Hoàng Dung'		,		9			),
						(N'Chu Bá Thông'	,		9		);
                        
                        
INSERT INTO employee_skills (	skill_code , date_registered)
VALUES 						(	'Java'		, '2020-03-15'		),
							(	'Android'	, '2020-03-16'		),
							(	'C#'		, '2020-03-17'		),
							(	'SQL'		, '2020-03-20'		),
							(	'Postman'	, '2020-03-21'		),
							(	'Ruby'		, '2020-04-22'		),
							(	'Java'		, '2020-04-24'		),
							(	'C++'		, '2020-04-27'		),
							(	'C Sharp'	, '2020-04-04'		);


