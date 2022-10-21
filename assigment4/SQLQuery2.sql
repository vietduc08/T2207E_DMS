CREATE TABLE NHACUNGCAP(
	MaNhaCC VARCHAR(10) PRIMARY KEY check(MaNhaCC like 'NCC%'),
	TenNhaCC nVARCHAR(255) not null unique,
	DiaChi VARCHAR(100) not null ,
	SoDT varchar(20) not null unique,
	MaSoThue varchar (20) not null unique
);

CREATE TABLE LOAIDICHVU(
	MaLoaiDV varchar(10) primary key check(MaLoaiDV like 'DV%'),
	TenLoaiDV nvarchar(200) not null unique
);

CREATE TABLE MUCPHI(
	MaMP varchar(10) primary key check(MaMP like 'MP%'),
	DonGia decimal(16,0) not null check (DonGia>=0),
	MoTa nvarchar(255)
);
drop table MUCPHI;

CREATE TABLE DONGXE(
	DongXe varchar(30) primary key,
	HangXe varchar(30) not null,
	SoChoNgoi int not null
);
drop table DONGXE;

CREATE TABLE DANGKYCUNGCAP(
	MaDKCC varchar(15) primary key check(MaDKCC like 'CC%'),
	MaNhaCC varchar(10) not null foreign key references NHACUNGCAP(MaNhaCC),
	MaLoaiDV varchar(10) not null foreign key references LOAIDICHVU(MaLoaiDV),
	MaMP varchar(10) not null foreign key references MUCPHI(MaMP),
	DongXe varchar(30) not null foreign key references DONGXE(DongXe),
	NgayBatDauCungCap date not null,
	NgayKetThucCungCap date not null,
	SoLuongXeDangKy int not null
);
drop table DANGKYCUNGCAP;