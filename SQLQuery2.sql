-- Câu lệnh truy vấn

USE BANHANGCAFE

-- 1 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc';

-- 2 In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP FROM SANPHAM	WHERE DVT IN ('cay', 'quyen');

-- 3 In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP FROM SANPHAM WHERE MASP LIKE 'B%01';

-- 4 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.

SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' 
AND GIA BETWEEN 30000 AND 40000;

-- 5 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP FROM	SANPHAM WHERE NUOCSX = 'Trung Quoc' 
OR NUOCSX = 'Thai Lan' AND GIA BETWEEN 30000 AND 40000;

-- 6 In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA FROM HOADON WHERE NGAYHD IN ('01/01/2007', '02/01/2007'); 

-- 7 In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA FROM HOADON WHERE MONTH(NGAYHD) = '01' AND YEAR(NGAYHD) = '2007'
ORDER BY (NGAYHD) ASC, TRIGIA DESC;

-- 8 In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT a.MAKH, a.HOTEN FROM	KHACHHANG a, HOADON b
WHERE a.MAKH = b.MAKH AND b.NGAYHD = '01/01/2007';

SELECT a.MAKH, a.HOTEN FROM	KHACHHANG a
JOIN HOADON b 
ON a.MAKH = b.MAKH 
WHERE b.NGAYHD = '01/01/2007';

-- 9 In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT a.SOHD, a.TRIGIA FROM HOADON a
JOIN NHANVIEN b
ON a.MANV = b.MANV 
WHERE b.HOTEN = 'Nguyen Van B' AND a.NGAYHD = '10/28/2006';

-- 10 -- In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có 
	  -- tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT a.MASP, a.TENSP FROM	SANPHAM a
JOIN CTHD b ON a.MASP = b.MASP 
JOIN HOADON c ON b.SOHD = c.SOHD
JOIN KHACHHANG d ON c.MAKH = d.MAKH 
WHERE d.HOTEN = 'Nguyen Van B' AND MONTH(c.NGAYHD) = '10' 
AND YEAR(c.NGAYHD) = '2006'

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
