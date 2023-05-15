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
SELECT SOHD FROM CTHD WHERE MASP = 'BB01' OR MASP = 'BB02' 

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD FROM CTHD WHERE	MASP = 'BB01' 
OR MASP = 'BB02' AND SL BETWEEN 10 AND 20 

--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm 
-- có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

SELECT SOHD, SL, MASP FROM CTHD WHERE	MASP IN ('BB01', 'BB02') 
AND SL BETWEEN 10 AND 20 

--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” 
--sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.

SELECT a.MASP, a.TENSP FROM SANPHAM a  
JOIN CTHD b ON a.MASP = b.MASP 
JOIN HOADON	c ON b.SOHD = c.SOHD
WHERE a.NUOCSX = 'Trung Quoc' AND c.NGAYHD = '1/1/2007'

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.

SELECT a.MASP, a.TENSP FROM	SANPHAM a
WHERE NOT EXISTS(SELECT * FROM CTHD b WHERE a.MASP = b.MASP)

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được 
-- trong năm 2006.

SELECT a.MASP, a.TENSP FROM	SANPHAM a WHERE 
NOT EXISTS(SELECT * FROM CTHD b JOIN HOADON c ON b.SOHD = c.SOHD 
WHERE a.MASP = b.MASP AND YEAR(c.NGAYHD) = '2006')

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất 
-- không bán được trong năm 2006.

SELECT a.MASP, a.TENSP FROM	SANPHAM a WHERE a.NUOCSX = 'Trung Quoc' 
AND NOT EXISTS(SELECT * FROM CTHD b JOIN HOADON c ON b.SOHD = c.SOHD 
WHERE a.MASP = b.MASP AND YEAR(c.NGAYHD) = '2006')

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất
SELECT a.SOHD, a.MASP FROM CTHD a WHERE EXISTS
(SELECT * FROM SANPHAM b WHERE a.MASP = b.MASP 
AND b.NUOCSX = 'Singapore')

-- 19. Có bao nhiêu hóa đơn không phải của khách hàng 
-- đăng ký thành viên mua?

SELECT COUNT(SOHD) AS SL_HD
FROM HOADON
WHERE MAKH IS NULL	

-- 20 Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT a.SOHD) AS SL_KN
FROM CTHD a LEFT JOIN HOADON b
ON a.SOHD = b.SOHD
WHERE YEAR(b.NGAYHD) = '2006'


-- 21. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS TG_CN, MIN(TRIGIA) AS TG_TN
FROM HOADON

-- 22. Trị giá trung bình của tất cả các hóa đơn được bán 
-- ra trong năm 2006 là bao nhiêu?

SELECT AVG(TRIGIA) AS TG_TB
FROM HOADON 
WHERE YEAR(NGAYHD) = '2006'

-- 23. Tính doanh thu bán hàng trong năm 2006
SELECT SUM(TRIGIA) AS TONG_DT
FROM HOADON
WHERE YEAR(NGAYHD) = '2006'

--24. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD, MAX(TRIGIA) AS TG_CN FROM HOADON
WHERE YEAR(NGAYHD) = '2006' 
AND TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON)
GROUP BY SOHD

--25. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.

SELECT a.HOTEN, MAX(b.TRIGIA) AS TG_CN 
FROM KHACHHANG a JOIN HOADON b 
ON a.MAKH = b.MAKH
WHERE YEAR(NGAYHD) = '2006' 
AND TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON)
GROUP BY a.HOTEN

-- 26. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.

SELECT TOP 3 a.MAKH, a.HOTEN
FROM KHACHHANG a
ORDER BY DOANHSO DESC 

-- 27. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 
-- 1 trong 3 mức giá cao nhất.

SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (
	SELECT TOP 3 GIA
	FROM SANPHAM
	ORDER BY GIA DESC
)


-- 28. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất 
-- có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).

SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' AND GIA IN (
	SELECT TOP 3 GIA
	FROM SANPHAM
	ORDER BY GIA DESC
)

-- 29.In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có 
-- giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).

SELECT MASP, TENSP, GIA
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA IN (
	SELECT TOP 3 GIA
	FROM SANPHAM
	WHERE NUOCSX = 'Trung Quoc'
	ORDER BY GIA DESC
)

-- 30 In ra danh sách 3 khách hàng có doanh số cao nhất 
-- (sắp xếp theo kiểu xếp hạng).

SELECT TOP 3 MAKH, HOTEN, DOANHSO, 
RANK() OVER(ORDER BY DOANHSO DESC) AS THUHANG
FROM KHACHHANG
ORDER BY DOANHSO DESC 

-- 31. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.

SELECT NUOCSX, COUNT(MASP) AS TONG_SP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' 
GROUP BY NUOCSX

-- 32. Tính tổng số sản phẩm của từng nước sản xuất.

SELECT NUOCSX, COUNT(MASP) AS TONG_SP
FROM SANPHAM
GROUP BY NUOCSX

-- 33. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.

SELECT NUOCSX, MAX(GIA) AS GIA_CN, 
MIN(GIA) AS GIA_TN, AVG(GIA) AS GIA_TB
FROM SANPHAM
GROUP BY NUOCSX

-- 34. Tính doanh thu bán hàng mỗi ngày.

SELECT NGAYHD, SUM(TRIGIA) AS TONG_DT
FROM HOADON
GROUP BY NGAYHD

-- 35. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.

SELECT b.MASP, SUM(b.SL) AS TONG_SL
FROM HOADON a
FULL JOIN CTHD b ON a.SOHD = b.SOHD
WHERE MONTH(a.NGAYHD) = '10' AND YEAR(a.NGAYHD) = '2006'
GROUP BY b.MASP

-- OR --

SELECT b.MASP, SUM(b.SL) AS TONG_SL
FROM HOADON a, CTHD b
WHERE a.SOHD = b.SOHD AND MONTH(a.NGAYHD) = '10' 
AND YEAR(a.NGAYHD) = '2006'
GROUP BY b.MASP

-- 36. Tính doanh thu bán hàng của từng tháng trong năm 2006.

SELECT MONTH(NGAYHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGAYHD) = '2006'
GROUP BY MONTH(NGAYHD)

-- 37. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.

SELECT SOHD, COUNT(MASP) AS SL_SP
FROM CTHD
GROUP BY SOHD
HAVING COUNT(MASP) >= 4

-- 38. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).

SELECT a.SOHD, COUNT(DISTINCT a.MASP) AS SL_SP
FROM CTHD a JOIN SANPHAM b
ON a.MASP = b.MASP
WHERE b.NUOCSX = 'Viet Nam'
GROUP BY a.SOHD
HAVING COUNT(a.MASP) = 3

-- 39. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.

SELECT TOP 1 b.MAKH, a.HOTEN
FROM KHACHHANG a JOIN HOADON b
ON a.MAKH = b.MAKH
GROUP BY b.MAKH, a.HOTEN
ORDER BY COUNT(b.MAKH) DESC

-- 40. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?

SELECT TOP 1 MONTH(NGAYHD) AS THANG, SUM(TRIGIA) AS DOANHSO
FROM dbo.HOADON
WHERE YEAR(NGAYHD) = '2006'
GROUP BY MONTH(NGAYHD)
ORDER BY SUM(TRIGIA) DESC


-- 41. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.

SELECT a.MASP, a.TENSP
FROM SANPHAM a JOIN	CTHD b
ON a.MASP = b.MASP
WHERE b.SL = (
	SELECT TOP 1 SUM(b.SL) AS TONGSL_TN
	FROM CTHD b JOIN HOADON c 
	ON c.SOHD = b.SOHD
	WHERE YEAR(c.NGAYHD) = 2006
	ORDER BY SUM(b.SL) asc
)

--42. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.

SELECT MASP, TENSP
FROM SANPHAM 
WHERE GIA = (
SELECT MAX(GIA) AS GIA_CN, NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
) 


-- 43. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.

SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

-- 44. *Trong 10 khách hàng có doanh số cao nhất, 
-- tìm khách hàng có số lần mua hàng nhiều nhất.

SELECT TOP 10 DOANHSO, MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH =(
	SELECT COUNT(b.MAKH) AS SL_MH 
	FROM KHACHHANG a
	JOIN HOADON b
	ON a.MAKH = b.MAKH
	GROUP BY b.MAKH 
	HAVING COUNT(b.MAKH) >= ALL
)
ORDER BY DOANHSO DESC


