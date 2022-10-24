-- Tao bang

CREATE TABLE Customers(
    Id int PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) not null,
    Address NVARCHAR(100) not null,
    Birthday DATE check(Birthday <getdate()) not null
);
CREATE TABLE PhoneNumbers(
    Id int PRIMARY KEY IDENTITY(1,1),
    Phone VARCHAR(15) not null UNIQUE,
    CustomerId INT FOREIGN KEY REFERENCES Customers(Id)
);

-- Nhap du lieu 

INSERT into Customers(Name, Address, Birthday)
    values(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18'),
    (N'Nguyễn Văn Hoàng',N'112 Hà Đông, Hà Nội','1993-10-20'),
    (N'Nguyễn Việt Đức',N'113 Cầu Giấy, Hà Nội','1987-12-12');

select * from Customers;

INSERT into PhoneNumbers(Phone,CustomerId)
    VALUES('987654321',1),('09873452',1),('09832323',1),('09434343',1),
    ('0999888777',2),('034567891',2),('0123456789',3),('0998877665',3);

select * from PhoneNumbers;

-- Cau 4

select Name from Customers;
select Phone from PhoneNumbers;

-- Cau 5

select * from Customers ORDER by Name ASC;
select Phone from PhoneNumbers where CustomerId in (select Id from Customers where Name like N'Nguyễn Văn An');
select Name from Customers where Birthday like '2009-12-12';

-- Cau 6

Select count(Phone) as SoLuong from PhoneNumbers group by CustomerId;
select count(Id) as TongSo from Customers where Birthday like '%-12-%';

select * from PhoneNumbers A
left join Customers B on A.CustomerId = B.Id;

select * from PhoneNumbers A
left join Customers B on A.CustomerId = B.Id
where A.Phone like '123456789';

-- Cau 7

alter TABLE Customers add check(Birthday < getdate());

alter TABLE Customers add NgayBatDauLienLac date;

-- Cau 8

CREATE INDEX IX_HoTen on Customers(Name);
CREATE INDEX IX_SoDienThoai on PhoneNumbers(Phone);