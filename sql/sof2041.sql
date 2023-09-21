Create database SOF2041_FALL2023

USE SOF2041_FALL2023

CREATE TABLE NHANVIEN
(
MANV NVARCHAR(20)  PRIMARY KEY,
MATKHAU NVARCHAR(50) NOT NULL,
HOTEN NVARCHAR(50) NOT NULL,
VAITRO BIT DEFAULT 0
)

CREATE TABLE KHOAHOC
(
MAKH INT IDENTITY(1,1) PRIMARY KEY,
MACD NCHAR(5) NOT NULL,
HOCPHI FLOAT NOT NULL,
THOILUONG INT NOT NULL,
NGAYKG DATE NOT NULL,
GHICHU NVARCHAR(255) NOT NULL,
MANV NVARCHAR(20) NOT NULL,
NGAYTAO DATE DEFAULT GETDATE()
)

CREATE TABLE CHUYENDE
(
MACD NCHAR(5) PRIMARY KEY,
TENCD NVARCHAR(50) NOT NULL,
HOCPHI FLOAT NOT NULL,
THOILUONG INT NOT NULL,
HINH NVARCHAR(50) NOT NULL,
MOTA NVARCHAR(255) NOT NULL,
)

CREATE TABLE NGUOIHOC
(
MANH NCHAR(7) PRIMARY KEY,
MATKHAU NVARCHAR(50) NOT NULL,
GIOITINH BIT DEFAULT 1,
NGAYSINH DATE NOT NULL,
DIENTHOAI NVARCHAR(24) NOT NULL,
EMAIL NVARCHAR(50) NOT NULL,
GHICHU NVARCHAR(255) NOT NULL,
MANV NVARCHAR(20) NOT NULL,
NGAYDK DATE DEFAULT GETDATE()
)

CREATE TABLE HOCVIEN
(
 MAHV INT IDENTITY(1,1) PRIMARY KEY,
 MAKH INT NOT NULL,
 MANH NCHAR(7) NOT NULL,
 DIEM FLOAT DEFAULT -1
)

ALTER TABLE NGUOIHOC
ADD CONSTRAINT FK_NGUOIHOC_MANV
FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);

ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HOCVIEN_MANH
FOREIGN KEY (MANH) REFERENCES NGUOIHOC(MANH);

ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HOCVIEN_MAKH
FOREIGN KEY (MAKH) REFERENCES KHOAHOC(MAKH)

ALTER TABLE KHOAHOC
ADD CONSTRAINT FK_KHOAHOC_MANV
FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);

ALTER TABLE KHOAHOC
ADD CONSTRAINT FK_KHOAHOC_MACD
FOREIGN KEY (MACD) REFERENCES CHUYENDE(MACD);