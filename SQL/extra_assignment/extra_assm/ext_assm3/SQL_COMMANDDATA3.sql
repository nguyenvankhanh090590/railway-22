-- LẤY TẤT CẢ HỌC SINH VƯỢT QUA BÀI TEST NHÚNG THÀNH CÁC THÁNG SINH KHÁC NHAU

-- SELECT * 
-- FROM Trainee
-- WHERE ET_English>=45
-- ORDER BY Birth_Date;

-- VIẾT LÊNH ĐỂ LẤY RA THỰC TẬP SINH CÓ TÊN DÀI NHẤT (TÊN TUỔI )

-- SELECT Full_name,Birth_Date, length(Full_Name)
-- FROM Trainee
-- ORDER BY length(Full_Name) DESC
-- LIMIT 1;


-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- nhóm chúng thành các tháng sinh khác nhau

SELECT Full_Name, ET_IQ, ET_English ,ET_Gmath
FROM Trainee
ORDER BY Birth_Date;

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)

SELECT *
FROM Trainee
ORDER BY length(Full_Name) DESC
LIMIT 1;

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:

--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18

-- SELECT 
-- FROM Trainee
-- WHERE 




-- Question 5: xóa thực tập sinh có TraineeID = 3


DELETE	FROM Trainee WHERE Trainee_id = 3;


-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật


UPDATE Trainee SET Training_Class='2' WHERE Trainee_ID='5';



