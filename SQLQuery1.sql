--1

CREATE DATABASE BANHANGCAFE

USE BANHANGCAFE

CREATE TABLE KHACHHANG (
	MAKH CHAR(4) NOT NULL PRIMARY KEY, 
	HOTEN VARCHAR(40), 
	DCHI VARCHAR(50), 
	SODT VARCHAR(20), 
	NGSINH SMALLDATETIME,
	NGDK SMALLDATETIME,
	DOANHSO MONEY, 
)

CREATE TABLE NHANVIEN (
	MANV CHAR(4) NOT NULL PRIMARY KEY,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGVL SMALLDATETIME
)

ALTER TABLE NHANVIEN 
ALTER COLUMN NGVL DATETIME

ALTER TABLE KHACHHANG
ALTER COLUMN NGSINH DATETIME 

ALTER TABLE KHACHHANG
ALTER COLUMN NGDK DATETIME 


CREATE TABLE SANPHAM (
	MASP CHAR(4) NOT NULL PRIMARY KEY,
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY
)

CREATE TABLE HOADON (
	SOHD INT NOT NULL PRIMARY KEY,
	NGAYHD SMALLDATETIME,
	MAKH CHAR(4) FOREIGN KEY REFERENCES KHACHHANG(MAKH),
	MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN(MANV),
	TRIGIA MONEY
)

CREATE TABLE CTHD (
	SOHD INT FOREIGN KEY REFERENCES HOADON(SOHD),
	MASP CHAR(4) FOREIGN KEY REFERENCES SANPHAM(MASP),
	SL INT
)

--Thêm dữ liệu vào bảng

-- Nhan vien
INSERT INTO NHANVIEN VALUES ('NV01','Nguyen Nhu Nhut','0927345678','04/13/2006')
INSERT INTO NHANVIEN VALUES ('NV02','Le Thi Phi Yen','0987567390','04/21/2006')
INSERT INTO NHANVIEN VALUES ('NV03','Nguyen Van B','0997047382','04/27/2006')
INSERT INTO NHANVIEN VALUES ('NV04','Ngo Thanh Tuan','0913758498','06/24/2006')
INSERT INTO NHANVIEN VALUES ('NV05','Nguyen Thi Truc Thanh','0918590387','07/20/2006')


-- Khach hang
INSERT INTO KHACHHANG VALUES ('KH01','Nguyen Van A','731,Tran Hung Dao, Q 5 ,Tp HCM','08823451','10/22/1960','10/22/2006',13000000)
INSERT INTO KHACHHANG VALUES ('KH02','Tran Ngoc Han','23/5, Nguyen Trai, Q 5, Tp HCM','0908256478','04/03/1974','07/30/2006',280000)
INSERT INTO KHACHHANG VALUES('KH03','Tran Ngoc Linh','45, Nguyen Canh Chan, Q 1, Tp HCM','0938776266','06/12/1980','05/08/2006',3860000)
INSERT INTO KHACHHANG VALUES ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q 10, Tp HCM','0917325476','09/03/1965','02/10/2006',250000)

INSERT INTO KHACHHANG VALUES ('KH05','Le Nhat Minh','34, Truong Dinh, Q 3, Tp HCM','08246108','03/10/1950','10/28/2006',21000)

INSERT INTO KHACHHANG VALUES ('KH06','Le Hoai Thuong','227, Nguyen Van Cu, Q 5, Tp HCM','08631738','12/31/1981','11/24/2006',915000)

INSERT INTO KHACHHANG VALUES ('KH07','Nguyen Van Tam','32/3, Tran Binh Trong, Q 5, Tp HCM','0916783565','04/06/1971','12/01/2006',12500)

INSERT INTO KHACHHANG VALUES ('KH08','Phan Thi Thanh','45/2, An Duong Vuong, Q 5, Tp HCM','0938435756','01/10/1971','12/13/2006',365000)

INSERT INTO KHACHHANG VALUES ('KH09','Le Ha Vinh','873, Le Hong Phong, Q 5, Tp HCM','08654763','09/09/1979','01/14/2007',70000)

INSERT INTO KHACHHANG VALUES ('KH10','Ha Duy Lap','34/34B, Nguyen Trai, Q 1, Tp HCM','08768904','05/02/1983','01/16/2007',67500)

-- San pham

INSERT INTO SANPHAM VALUES('BC01', 'But chi', 'cay', 'Singapore', 3000)
INSERT INTO SANPHAM VALUES('BC02', 'But chi', 'cay', 'Singapore', 5000)
INSERT INTO SANPHAM VALUES('BC03', 'But chi', 'cay', 'Viet Nam', 3500)
INSERT INTO SANPHAM VALUES('BC04', 'But chi', 'hop', 'Viet Nam', 30000)
INSERT INTO SANPHAM VALUES('BB01', 'But bi', 'cay', 'Viet Nam', 5000)
INSERT INTO SANPHAM VALUES('BB02', 'But bi', 'cay', 'Trung Quoc', 7000)
INSERT INTO SANPHAM VALUES('BB03', 'But bi', 'hop', 'Thai Lan', 100000)
INSERT INTO SANPHAM VALUES ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SANPHAM VALUES ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SANPHAM values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SANPHAM values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SANPHAM values ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SANPHAM values ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SANPHAM values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SANPHAM values ('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SANPHAM values ('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SANPHAM values ('ST04','So tay ','quyen','Thai Lan',55000)
INSERT INTO SANPHAM values ('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SANPHAM values ('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values ('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM values ('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values ('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values ('ST10','But long','cay','Trung Quoc',7000)

-- Hoa don

INSERT INTO HOADON VALUES(1001, '07/23/2006', 'KH01', 'NV01', 320000)
insert into HOADON values (1002,'08/12/2006','KH01','NV02',840000)
INSERT INTO HOADON VALUES (1003,'08/23/2006','KH02','NV01',100000)
INSERT into HOADON values (1004,'09/01/2006','KH02','NV01',180000)
insert into HOADON values (1005,'10/20/2006','KH01','NV02',3800000)
INSERT into HOADON values (1006,'10/16/2006','KH01','NV03',2430000)
insert into HOADON values (1007,'10/28/2006','KH03','NV03',510000)
insert into HOADON values (1008,'10/28/2006','KH01','NV03',440000)
insert into HOADON values (1009,'10/28/2006','KH03','NV04',200000)
insert into HOADON values (1010,'11/01/2006','KH01','NV01',5200000)
insert into HOADON values (1011,'11/04/2006','KH04','NV03',250000)
insert into HOADON values (1012,'11/30/2006','KH05','NV03',21000)
insert into HOADON values (1013,'12/12/2006','KH06','NV01',5000)
insert into HOADON values (1014,'12/31/2006','KH03','NV02',3150000)
insert into HOADON values (1015,'01/01/2007','KH06','NV01',910000)
insert into HOADON values (1016,'01/01/2007','KH07','NV02',12500)
insert into HOADON values (1017,'01/02/2007','KH08','NV03',35000)
insert into HOADON values (1018,'01/13/2007','KH08','NV03',330000)
insert into HOADON values (1019,'01/13/2007','KH01','NV03',30000)
insert into HOADON values (1020,'01/14/2007','KH09','NV04',70000)

insert into CTHD values (1001,'TV02',10)
insert into CTHD values (1001,'ST01',5)
insert into CTHD values (1001,'BC01',5)
insert into CTHD values (1001,'BC02',10)
insert into CTHD values (1001,'ST08',10)
insert into CTHD values (1002,'BC04',20)
insert into CTHD values (1002,'BB01',20)
insert into CTHD values (1002,'BB02',20)
insert into CTHD values (1003,'BB03',10)
insert into CTHD values (1004,'TV01',20)
insert into CTHD values (1004,'TV02',20)
insert into CTHD values (1004,'TV03',20)
insert into CTHD values (1004,'TV04',20)
insert into CTHD values (1005,'TV05',50)
insert into CTHD values (1005,'TV06',50)
insert into CTHD values (1006,'TV07',20)
insert into CTHD values (1006,'ST01',30)
insert into CTHD values (1006,'ST02',10)
insert into CTHD values (1007,'ST03',10)
insert into CTHD values (1008,'ST04',8)
insert into CTHD values (1009,'ST05',10)
insert into CTHD values (1010,'TV07',50)
insert into CTHD values (1010,'ST07',50)
insert into CTHD values (1010,'ST08',100)
insert into CTHD values (1010,'ST04',50)
insert into CTHD values (1010,'TV03',100)
insert into CTHD values (1011,'ST06',50)
insert into CTHD values (1012,'ST07',3)
insert into CTHD values (1013,'ST08',5)
insert into CTHD values (1014,'BC02',80)
insert into CTHD values (1014,'BB02',100)
insert into CTHD values (1014,'BC04',60)
insert into CTHD values (1014,'BB01',50)
insert into CTHD values (1015,'BB02',30)
insert into CTHD values (1015,'BB03',7)
insert into CTHD values (1016,'TV01',5)
insert into CTHD values (1017,'TV02',1)
insert into CTHD values (1017,'TV03',1)
insert into CTHD values (1017,'TV04',5)
insert into CTHD values (1018,'ST04',6)
insert into CTHD values (1019,'ST05',1)
insert into CTHD values (1019,'ST06',2)
insert into CTHD values (1020,'ST07',10)
insert into CTHD values (1021,'ST08',5)
insert into CTHD values (1021,'TV01',7)
insert into CTHD values (1021,'TV02',10)
insert into CTHD values (1022,'ST07',1)
insert into CTHD values (1023,'ST04',6)

-- 2
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)

-- 3
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT

-- 4
UPDATE KHACHHANG
SET	HOTEN = 'Nguyen Van B'
WHERE MAKH = 'KH01'

-- 5
UPDATE KHACHHANG
SET HOTEN = 'Nguyen Van Hoan'
WHERE MAKH = 'KH09' AND YEAR(NGDK) = '2007'

-- 6
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(100)

-- 7
ALTER TABLE SANPHAM
DROP COLUMN GHICHU

-- 8
DELETE FROM	KHACHHANG
WHERE YEAR(NGSINH) = '1971'

-- 9
DELETE FROM KHACHHANG
WHERE YEAR(NGSINH) = '1971' AND YEAR(NGDK) = '2006'

--10
DELETE FROM HOADON
WHERE MAKH = 'KH01'