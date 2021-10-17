
USE Fresher_management;


-- question 2 
 SELECT * 
 FROM trainees
 WHERE et_iq + et_gmath >=20 AND et_iq>=8 AND et_gmath>=8 AND  et_english>=18
 GROUP BY Month(birth_date);

SELECT Birth_Date, Month(Birth_date) AS 'Month' 
FROM trainees
GROUP BY Month(birth_date) ;


-- question 3 -- 

SELECT Full_name, FLOOR(DATEDIFF(NOW(), Birth_Date)/365.25) age, Birth_Date, Gender,Training_Class
FROM Trainees
WHERE LENGTH(Full_name) = (SELECT LENGTH(Full_name) length
FROM Trainees
ORDER BY LENGTH(Full_name) DESC
LIMIT 1)
;

SELECT MAX(LENGTH(fullname)) length
FROM trainees;

-- Lay ra tat ca thong tin cua thuc tap sinh lon tuoi nhat
SELECT *
FROM  trainees
GROUP BY YEAR(birth_date)
ORDER BY birth_date ASC
LIMIT 1;

SELECT *
FROM trainees
WHERE YEAR(birth_date) = (SELECT MIN(YEAR(birth_date))
							FROM trainees); # 1997

SELECT MIN(YEAR(birth_date))
FROM trainees;

-- q5 --
DELETE FROM trainees
WHERE trainee_id = 3; 

-- q6 --

UPDATE trainees
SET training_class = 'VTI002' 
WHERE trainee_id = 5;



-- Question 1: Thêm ít nhất 10 bản ghi vào table
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- nhóm chúng thành các tháng sinh khác nhau
-- SELECT *
-- FROM Trainee
-- WHERE ET_IQ + ET_Gmath >=20 AND ET_IQ >=8 AND ET_English>=18
-- GROUP BY Birth_Date;


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

--  ET_IQ + ET_Gmath>=20
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
-- Question 6: Thực tập sinh có TraineeID
-- DELETE FROM trainees
-- WHERE trainee_id = 11 OR trainee_id = 12; 
-- false OR true -> true
-- false OR true -> true