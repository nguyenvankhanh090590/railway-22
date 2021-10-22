USE project_manage;


-- b) Viết stored procedure( thủ tục lưu trữ) (không có parameter) để Remove tất cả thông tin
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
-- remove từ các table liên quan trong khi removing (dùng lệnh print)
 

 DROP PROCEDURE IF EXISTS remove_project;
DELIMITER $$
CREATE PROCEDURE remove_project()
	BEGIN
		SELECT Project_Name,Manager_id
		FROM Projects
		WHERE DATEDIFF( NOW(),Project_Completed_On) >= (SELECT NOW()- INTERVAL 3 month);
        DELETE FROM remove_project;
	END$$
DELIMITER ;
CALL remove_project;







-- c) Viết stored procedure (có parameter) để in ra các module đang được thực
-- hiện)

DROP PROCEDURE Procesing_project;
DELIMITER $$
CREATE PROCEDURE Procesing_project (IN Project_Completed_On DATETIME, OUT OUT_Project_Name VARCHAR(50))
	BEGIN	
		SELECT * INTO OUT_Project_Name
		FROM Projects
		WHERE DATEDIFF(Project_Completed_On,NOW())>=0;
	END$$
DELIMITER ;

CALL Procesing_project(4);


-- d) Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc
-- dù không ai giao việc cho nhân viên đó (trong bảng Works)
