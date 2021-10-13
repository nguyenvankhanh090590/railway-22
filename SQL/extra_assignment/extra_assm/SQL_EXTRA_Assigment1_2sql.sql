-- LẤY TẤT CẢ HỌC SINH VƯỢT QUA BÀI TEST NHÚNG THÀNH CÁC THÁNG SINH KHÁC NHAU

SELECT * 
FROM Trainee
WHERE ET_English>=45
ORDER BY Birth_Date;

-- VIẾT LÊNH ĐỂ LẤY RA THỰC TẬP SINH CÓ TÊN DÀI NHẤT (TÊN TUỔI )

SELECT Full_name,Birth_Date, length(Full_Name)
FROM Trainee
ORDER BY length(Full_Name) DESC
LIMIT 1;

