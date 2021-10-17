
USE Fresher_management;


-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- nhóm chúng thành các tháng sinh khác nhau

SELECT *
FROM Trainee
WHERE 
	ET_IQ + ET_Gmath>=20 AND 
    ET_IQ>=8			AND
    ET_Gmath>=8			AND
    ET_English>=18
GROUP BY month(Birth_Date); -- group theo tháng sinh


-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)

SELECT Full_Name,
		FLOOR(DATEDIFF(NOW(),Birth_Date/365.25)) age
FROM Trainee
WHERE length(Full_Name) = (
						SELECT MAX(length(Full_Name))
						FROM Trainee
);
SELECT Full_name, FLOOR(DATEDIFF(NOW(), Birth_Date)/365.25) age, Birth_Date, Gender,Training_Class
FROM Trainees


-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18

SELECT (Full_Name) AS ET
FROM Trainee
WHERE 
	ET_IQ + ET_Gmath>=20 AND 
    ET_IQ>=8			AND
    ET_Gmath>=8			AND
    ET_English>=18
;

-- Question 5: xóa thực tập sinh có TraineeID = 3

DELETE FROM	Trainee WHERE TraineeID=3;
-- Question 6: Thực tập sinh có TraineeID
-- DELETE FROM trainees
-- WHERE trainee_id = 11 OR trainee_id = 12; 
-- false OR true -> true
-- false OR true -> true