--Câu 3

select DongXe from DONGXE where SoChoNgoi >5;

--Câu 4

select TenNhaCC from NHACUNGCAP where MaNhaCC in 
(select MaNhaCC from DANGKYCUNGCAP where DongXe in (select DongXe from DONGXE where HangXe like 'Yamaha') and MaMP in (select MaMP from MUCPHI where DonGia=15000)) or MaNhaCC in
(select MaNhaCC from DANGKYCUNGCAP where DongXe in (select DongXe from DONGXE where HangXe like 'Toyota') and MaMP in (select MaMP from MUCPHI where DonGia=25000))

--Câu 5

select * from NHACUNGCAP order by TenNhaCC asc, MaSoThue desc;

--Câu 6

select A.TenNhaCC,A.MaNhaCC,B.MaNhaCC,B.NgayBatDauCungCap from NHACUNGCAP A inner join DANGKYCUNGCAP B on A.MaNhaCC=B.MaNhaCC where B.NgayBatDauCungCap='2022-20-10';