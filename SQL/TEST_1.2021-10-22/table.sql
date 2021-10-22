-- tạo database test_1

DROP DATABASE IF EXISTS test_1;
CREATE DATABASE IF NOT EXISTS test_1
    CHARACTER SET "utf8"
    COLLATE "utf8_unicode_ci";
USE test_1;

-- tạo bảng CUSTOMER
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER (
Customer_id					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Name`						NVARCHAR(50) NOT NULL,
Phone						CHAR(11) NOT NULL,
Email						VARCHAR(20) NOT NULL,
Address						NVARCHAR(100) NOT NULL,
Note						TEXT
);

-- tạo bảng CAR
DROP TABLE IF EXISTS CAR;
CREATE TABLE CAR (
Car_id						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Maker						ENUM('HONDA','TOYOTA','NISSAN'),
Model						VARCHAR(50) NOT NULL,
`Year`						DATE,
Color						ENUM('black', 'white', 'yellow'),
Note						TEXT
);

-- tạo bảng CAR_ORDER

DROP TABLE IF EXISTS CAR_ORDER;
CREATE TABLE CAR_ORDER (
Order_id					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Customer_id					INT UNSIGNED NOT NULL,
Car_id						INT UNSIGNED,
Amount						INT DEFAULT "1",
Sale_Price					INT UNSIGNED NOT NULL,
Order_Date					DATE,
Delivery_Date				DATE,
Delivery_Address				NVARCHAR(100),
Staus						ENUM ("0","1","2") DEFAULT "0", -- 0 : đã đặt hàng 1: đã giao hàng 2:đã huỷ
Note						TEXT,
FOREIGN KEY (Customer_id) REFERENCES CUSTOMER (Customer_id),
FOREIGN KEY (Car_id) REFERENCES CAR(Car_id)
);
