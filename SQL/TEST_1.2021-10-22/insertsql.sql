-- chèn dữ liệu vào các bảng 

INSERT INTO CUSTOMER 	( `Name`				, Phone 		, Email 			, 	Address		,		 Note)
VALUES					( 'Nguyễn văn khánh'	, '01083011179'	, 'Khanh@nacer.com'	, 'jeonju'		,	'KTS'		),
						( 'Hoàng văn Tiệp'		, '01383511179'	, 'Tiep@nacer.com'	, 'Chongup'		,	'BS'		),
                        ( 'Lương Tứ Trụ'		, '01283311179'	, 'Luong@nacer.com'	, 'woanju'		,	'KS'		),
                        ( 'Nguyễn thị Hảo'		, '01063011179'	, 'Hao@nacer.com'	, 'joenbuk'		,	'NVVP'		),
                        ( 'Cường văn Thế'		, '01183011179'	, 'Cuong@nacer.com'	, 'kimje'		,	'TUDO'		);
                        



INSERT INTO CAR ( Maker			,	Model 	, `Year`	 , Color 	, Note )
VALUES			(	 'HONDA'	,	'HONDAXN1'		, '2020-01-01'	,'black'	, 'UNIKE'),
				(	'TOYOTA'	,	'OTYTASA'		, '2019-09-09'	,'white'	,'BliNK'),
                (	'NISSAN'	,	'NISAH9'		, '2021-10-10'	,'yellow'	,'BINGBAG'),
                (	'HONDA'		,	'HONDAXN2'		, '2018-11-11'	,'black'	,'DBSKF'),
				(	'TOYOTA'	,	'TOYOTAPRo1'	, '2020-12-12'	,'black'	,'GDNUM1');
                
                
INSERT INTO CAR_ORDER 		( Customer_id , Car_id , Amount , Sale_Price , Order_Date , Delivery_Date , Delivery_Address 	,Staus 			, Note)
VALUES		           		( 	'1'		,	'2'	,  	'1'		,15000		,'2021-01-01','2021-01-02',	'jeonju'				, '1'			,'VIP1'),
							( 	'2'		,	'1'	,  	'3'		,25000		,'2021-08-11','2021-08-21',	'jeonju'				, '1'			,'VIP2'),
							( 	'5'		,	'4'	,  	'2'		,45000		,'2021-09-21','2021-09-22',	'jeonju'				, '0'			,'VIP4'),
							( 	'3'		,	'3'	,  	'1'		,5000		,'2021-10-14','2021-11-02',	'jeonju'				, '0'			,'VIP5'),
							( 	'4'		,	'5'	,  	'1'		,45000		,'2011-01-01','2011-01-22',	'jeonju'				, '2'			,'VIP3');