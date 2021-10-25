USE test_1;
-- 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.


SELECT c.`Name`,
        SUM(ca.Amount)tong_so_xe_mua_cua_1Khach
FROM CUSTOMER c
RIGHT JOIN CAR_ORDER ca
	ON c.Customer_id=ca.Customer_id
    WHERE ca.Staus = "1"
    GROUP BY ca.Customer_id
    ORDER BY SUM(ca.Amount) ASC;



-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.

DROP PROCEDURE IF EXISTS CAR_firm_name;
DELIMITER $$
CREATE PROCEDURE CAR_firm_name()
	BEGIN	
		SELECT c.Maker,ca.Amount
		FROM CAR c
		RIGHT JOIN CAR_ORDER ca
			ON c.Car_id=ca.Car_id
            WHERE ca.Staus = "1"  AND YEAR(Delivery_Date)=(SELECT YEAR(NOW()))
		GROUP BY ca.Customer_id
        HAVING SUM(ca.Amount) = (SELECT COUNT(Amount)
									FROM CAR_ORDER
                                    GROUP BY Amount
                                    ORDER BY COUNT(Amount) DESC
                                    LIMIT 1
                                    );
	END $$
DELIMITER ;

CALL CAR_firm_name;

-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.

DROP PROCEDURE IF EXISTS DELET_LIST;
DELIMITER $$
CREATE PROCEDURE DELET_LIST()
	BEGIN	
		SELECT COUNT(*)
        FROM CAR_ORDER  WHERE year(Order_Date) <(SELECT year(NOW())) AND Staus = 2;
		DELETE FROM CAR_ORDER WHERE year(Order_Date) <(SELECT year(NOW())) AND Staus = 2;
	END $$
DELIMITER ;

        
-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.

DROP PROCEDURE IF EXISTS Customer_information;
DELIMITER $$
CREATE PROCEDURE Customer_information(IN IN_Customer_id INT )
BEGIN 
		SELECT	c.`Name`, 
				cr.Model,
				cr.Maker,
				ca.Amount,
				ca.Staus
        FROM CAR_ORDER ca
        RIGHT JOIN CUSTOMER c
			ON ca.Customer_id=c.Customer_id
		RIGHT JOIN CAR cr
			ON ca.Car_id=cr.Car_id
		WHERE ca.Staus = 1 AND c.Customer_id = IN_Customer_id;
END $$
DELIMITER ;

CALL Customer_information;




-- viết trigger tránh trường hơpk khách hàng 

DROP TRIGGER IF EXISTS cau_6;
DELIMITER $$

CREATE TRIGGER cau_6
BEFORE INSERT ON CAR_ORDER
FOR EACH ROW
BEGIN 
	IF NEW.Delivery_Date < ADDDATE(NEW.Order_Date,INTERVAL 15 DAY) THEN
		SIGNAL SQLSTATE "12345"
		SET MESSAGE_TEXT = 'FAIL INSERT Delivery_Date_Order_Date';
	-- ELSE 
-- 		SELECT CONCAT(NEW.Delivery_Date,' ',NEW.Order_Date);
	END IF;
END $$
DELIMITER ;

INSERT INTO CAR_ORDER ( Customer_id ,Car_id ,Amount ,Sale_Price ,Order_Date ,Delivery_Date ,Delivery_Address ,Staus, Note)
VALUES				(1, 5, 2, 100, '2020-03-05',  '2020-03-15','HANOI', '1' , NULL);



