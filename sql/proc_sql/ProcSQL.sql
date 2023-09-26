create proc sp_ThongKeNguoiHoc
as begin
select
YEAR(ngaydk) Nam,
COUNT(*) SoLuong,
MIN(ngaydk) DauTien,
MAX(Ngaydk) CuoiCung

from NGUOIHOC
group by YEAR(NGAYDK)
end
go

create proc ThongKeDoanhThu(@Year int)
as begin
select
	TENCD ChuyenDe,
	COUNT(distinct kh.MAKH) SoKH,
	COUNT(hv.MAHV) SoHV,
	SUM(kh.HocPhi) DoanhThu,
	MIN(kh.HOCPHI) ThapNhat,
	MAX(kh.HOCPHI) CaoNhat,
	AVG(kh.HOCPHI) TrungBinh

from KHOAHOC kh join HOCVIEN hv on kh.MAKH = hv.MAKH
		join CHUYENDE cd on cd.MACD = kh.MACD
		where YEAR(ngaykg) = @Year
		group by TENCD
end
go

create proc sp_ThongKeDiem
as begin
select
	TENCD ChuyenDe,
	COUNT(MAHV) SoHv,
	MIN(DIEM) ThapNhat,
	Max(DIEM) CaoNhat,
	AVG(DIEM) TrungBinh
from KHOAHOC kh join HOCVIEN hv on kh.MAKH = hv.MAKH
		join CHUYENDE cd on cd.MACD = kh.MACD
		group by TENCD
		end
		go

create proc sp_BangDiem(@MaKH int)
as begin
	select
		nh.MANH,
		nh.Hoten,

	from HOCVIEN hv 
		join NGUOIHOC nh on hv.MANH = nh.MANH
		where hv.MAKH = @MaKH
		order by hv.DIEM desc
end
go

create proc sp_BangDiem(@MaKH int)
as begin
	select

	from HOCVIEN hv 
		join NGUOIHOC nh on hv.MANH = nh.MANH
		where hv.MAKH = @MaKH
		order by hv.DIEM desc
end
go

create proc sp_BangDiem(@MaKH int)
as begin
	select

	from HOCVIEN hv 
		join NGUOIHOC nh on hv.MANH = nh.MANH
		where hv.MAKH = @MaKH
		order by hv.DIEM desc
end
go

create proc sp_BangDiem(@MaKH int)
as begin
	select

	from HOCVIEN hv 
		join NGUOIHOC nh on hv.MANH = nh.MANH
		where hv.MAKH = @MaKH
		order by hv.DIEM desc
end
go