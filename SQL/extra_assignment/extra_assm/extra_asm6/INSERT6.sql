
-- chèn dữ liệu bảng Employee
INSERT INTO Employee 	(Employee_LastName , Employee_FirstName , Employee_Hire_Date , Employee_Status , Supervisor_id , Social_Security_Number)
VALUES					(	N'Nguyễn văn'		,N'Khánh'			,'2019-06-06'		, 		1		,		1		,'ansxh1'				),
						(	N'Đào Thu'			,N'Coi'				,'2019-07-06'		, 		1		,		1		,'ansxh2'				),
						(	N'Nguyễn Hoàng'		,N'Phim'			,'2019-08-06'		, 		1		,		2		,'ansxh3'				),
						(	N'Doãn Văn'			,N'Hài'				,'2019-07-06'		, 		0		,		2		,'ansxh4'				);	
					
                    
-- chèn dữ liệu bảng Projects
INSERT INTO Projects (	Manager_id	, Project_Name 	, Project_Start_Date , Project_Description 		, Project_Detail		, 	Project_Completed_On)
VALUES 				(	1			,'prjt1'		,	'2019-06-06'	, ' làm nhanh 3'				,'project 1'		,	'2020-08-06'		),
					(	2			,'prjt2'		,	'2019-07-06'	, 'Làm nhanh 5'				,'project 1'		,	'2020-09-06'		),
					(	3			,'prjt3'		,	'2019-08-06'	, 'Nộp trước ngày 27/9'		,'project 2'		,	'2021-10-06'		),
					(	4			,'prjt4'		,	'2019-07-06'	, 'nộp trong ngày 29/10'	,'project 2'		,	'2022-11-06'		);
                    
-- chèn dữ liệu bản Project_Modules
INSERT INTO Project_Modules ( Project_id , Employee_id , Project_Modules_Date, Project_Modules_On, Project_Modules_Description)
VALUES 						(	1		,	1		,	'2020-06-06'	, '2019-06-06'		,	'Làm đúng hạn'			),
							(	2		,	2		,	'2020-07-06'	, '2019-06-06'		,	'Làm trước hạn'			),
                            (	3		,	3		,	'2020-08-06'	, '2019-09-06'		,	'Làm quá hạn'			),
                            (	4		,	1		,	'2020-07-06'	, '2019-06-06'		,	'Làm trước hạn'			);
						
                        
-- chèn dữ liệu bản Work_Done
INSERT INTO Work_Done 	( Employee_id 	, Module_id , Work_Done_Date , Work_Done_Description , Work_Done_Status)
VALUES 					(	1			,	1		,'2019-06-06'	, 'không biết viết gì vaò'		,		1			),
						(	2			,	2		,'2019-07-06'	, 'chỗ này nên để cả đoạn'		,		1			),
						(	3			,	3		,'2019-08-06'	, 'như này thì có sao không'	,		0			),
						(	1			,	4		,'2019-07-06'	, 'mà sao biết ko làm'			,		1			);				
                            

				                
