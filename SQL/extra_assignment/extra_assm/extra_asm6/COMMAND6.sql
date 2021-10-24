USE project_manage;


-- b) Viết stored procedure( thủ tục lưu trữ) (không có parameter) để Remove tất cả thông tin
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
-- remove từ các table liên quan trong khi removing (dùng lệnh print)
 

 DROP PROCEDURE IF EXISTS remove_project;
DELIMITER $$
CREATE PROCEDURE remove_project()
	BEGIN
		DELETE FROM remove_project
		WHERE month(Project_Completed_On) >= (SELECT NOW()- INTERVAL 3 month);
	END $$
DELIMITER ;
CALL remove_project;





-- c) Viết stored procedure (có parameter) để in ra các module đang được thực
-- hiện)

DROP PROCEDURE Procesing_project;
DELIMITER $$
CREATE PROCEDURE Procesing_project( IN IN_Work_Done_Status BIT, OUT V_Module_id TINYINT)
	BEGIN	
		SELECT Module_id  INTO V_Module_id
        FROM Work_Done
        WHERE Work_Done_Status = '0' AND Work_Done_Status = IN_Work_Done_Status;
	END $$
DELIMITER ;
SET @V_Work_Done_Status='0';
CALL Procesing_project('0',@V_Work_Done_Status);
SELECT @V_Work_Done_Status;


-- d) Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc
-- dù không ai giao việc cho nhân viên đó (trong bảng Works)

DROP PROCEDURE worker_id;
DELIMITER $$
CREATE PROCEDURE worker_id( IN IN_Employee_FirstName NVARCHAR(30), OUT Employee_id TINYINT)
	BEGIN	
		SELECT q.Employee_id
        FROM Work_Done a
        RIGHT JOIN Employee q
			ON a.Employee_id=q.Employee_id
        WHERE a.Employee_id IS NULL AND q.Employee_FirstName = IN_Employee_FirstName;
	END $$
DELIMITER ;


