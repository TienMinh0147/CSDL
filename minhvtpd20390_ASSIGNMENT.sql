create database QLNHATRO_minhvtpd02930
go
use QLNHATRO_minhvtpd02930
go
--y1
create table LOAINHA
(
 
 loaihinhnhatrochothue varchar(50) PRIMARY KEY
 )
 go
 create table NGUOIDUNG
 (
 manguoidung int primary key identity(1, 1),
 tennguoidung varchar(50) not null ,
 gioitinh varchar(5)not null,
 sodienthoai char(15) null,
 diachinguoidung varchar(150) null,
 quannguoidung varchar(20) not null,
 email varchar(50) null
 )
 go
  create table NHATRO
  (
   manhatro int  primary key identity(1, 1),
  loaihinhchothue varchar(50)foreign key references LOAINHA(loaihinhnhatrochothue) ,
  dientich FLOAT not null check(dientich>=10),
  giaphong money not null check(giaphong>=100000),
  diachinhatro varchar(150)not null,
  quannhatro varchar(20)not null,
  motaphongtro varchar(200)not null,
  ngaydangki date not null,
  nguoilienhe varchar(50)not null

  )
 go
 
 create table DANHGIA
 (
  manhatro int  foreign key references NHATRO(manhatro),
 nguoidanhgia varchar(50)not null,
 nhatroduocdanhgiachatluong varchar(10) not null,
 thichhoackthich varchar(10)not null,
 noidungdanhgia varchar(150)null
 )
 GO
 --y2
INSERT INTO  LOAINHA
VALUES
('Căn hộ trung cư'),
('Nhà riêng'),
('Phòng trọ khép kín')
GO
INSERT INTO  NGUOIDUNG
VALUES
('MINH','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','minhvtpd02930@fpt.edu.vn'),
('THiNH','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','thanhdvpd02759@fpt.edu.vn'),
('THU','nữ','0935299067','so 53 ap bac, hòa hải','dà nẵng','minhvtpd02930@fpt.edu.vn'),
('THAO','nữ','0935299067','so 53 ap bac, hòa hải','dà nẵng','thanhdvpd02759@fpt.edu.vn'),
('THA','nữ','0935299067','so 53 ap bac, hòa hải','dà nẵng','minhvtpd02930@fpt.edu.vn'),
('THAN','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','thanhdvpd02759@fpt.edu.vn'),
('HANH','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','thanhdvpd02759@fpt.edu.vn'),
('TRANH','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','minhvtpd02930@fpt.edu.vn'),
('TANH','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','thanhdvpd02759@fpt.edu.vn'),
('TAM','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','thanhdvpd02759@fpt.edu.vn')
GO
INSERT INTO NHATRO
VALUES
('Căn hộ trung cư',10,100000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/12/12','MINH'),
('Căn hộ trung cư',60,400000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/12/12','THINH'),
('Căn hộ trung cư',30,600000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/12/12','THU'),
('Nhà riêng',30,700000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/12/12','THAO'),
('Nhà riêng',30,800000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/2/12','THA'),
('Nhà riêng',30,1000000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/3/12','THAN'),
('Phòng trọ khép kín',30,320000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/3/12','HANH'),
('Phòng trọ khép kín',30,120000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/2/12','TRANH'),
('Phòng trọ khép kín',30,300000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/3/12','TANH'),
('Phòng trọ khép kín',30,1000000,'so 53 ap bac, hòa hải','dà nẵng','XẤU','2019/3/12','TAM')
GO
INSERT INTO DANHGIA
VALUES
('1','MINH','TỐT','thich','quá tốt'),
('2','THINH','TỐT','thich','quá tốt'),
('3','THU','TỐT','thich','quá tốt'),
('4','THAO','TỐT','thich','quá tốt'),
('5','THA','TỐT','thich','quá tốt'),
('6','THAN','TỐT','thich','quá tốt'),
('7','HANH','TỐT','thich','quá tốt'),
('8','TRANH','kTỐT','thich','quá tốt'),
('9','TANH','kTỐT','thich','quá tốt'),
('10','TAM','kTỐT','thich','quá tốt')


go
--y3 1
CREATE PROCEDURE NGUOIDUNG_instert
(

 @tennguoidung varchar(50),
 @gioitinh varchar(5),
 @sodienthoai char(15),
 @diachi varchar(150),
 @quan varchar(20) ,
 @email varchar(50) 
)
AS
IF(@tennguoidung is NOT NULL or  @gioitinh is NOT NULL or  @sodienthoai is NOT NULL or @diachi is NOT NULL or @quan is NOT NULL or @email is NOT NULL)
BEGIN
	 insert into NGUOIDUNG VALUES(@tennguoidung,@gioitinh, @sodienthoai,@diachi,@quan,@email)
	 print'đa chen du lieu vao bang NGUOIDUNG'
END

else
BEGIN
	 print 'chen du lieu vao bang NGUOIDUNG khong duoc'
END
GO
exec  NGUOIDUNG_instert 'TAM's,'nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','minhvtpd02930@fpt.edu.vn'
go

CREATE PROCEDURE NHATRO_INSERT
(
@loaihinhchothue varchar(50),
  @dientich FLOAT ,
  @giaphong money,
  @diachi varchar(150),
  @quan varchar(20),
  @motaphongtro varchar(200),
  @ngaydangki date ,
  @nguoilienhe varchar(50) 
)
AS
IF(@loaihinhchothue is NOT NULL or  @dientich is NOT NULL or  @giaphong is NOT NULL or @diachi is NOT NULL 
or @quan is NOT NULL or @motaphongtro is NOT NULL or @ngaydangki is NOT NULL or @nguoilienhe is NOT NULL)
BEGIN
	 insert into NHATRO VALUES(@loaihinhchothue,@dientich, @giaphong,@diachi,@quan,@motaphongtro,@ngaydangki,@nguoilienhe)
	 print'đa chen du lieu vao bang NHATRO'
END

else
BEGIN
	 print 'chen du lieu vao bang NHATRO khong duoc'
END
GO 
exec NHATRO_INSERT 'Căn hộ trung cư',20,100000,'so 55 ap bac, hòa hải','dà nẵng','XẤU','2019/12/12','MINH'
go
CREATE PROCEDURE DANHGIA_INSERT
 (
 @manhatro int,

 @nguoidanhgia varchar(50),
 @nhatroduocdanhgiachatluong varchar(10),
 @thichhoackthich varchar(10),
 @noidungdanhgia varchar(150)
 )
 AS
IF(@nguoidanhgia is NOT NULL or  @nhatroduocdanhgiachatluong is NOT NULL or  @thichhoackthich is NOT NULL or @noidungdanhgia is NOT NULL )
BEGIN
	 insert into DANHGIA VALUES(@manhatro,@nguoidanhgia,@nhatroduocdanhgiachatluong, @thichhoackthich,@noidungdanhgia)
	 print'đa chen du lieu vao bang DANGGIA'
END

else
BEGIN
	 print 'chen du lieu vao bang DANGGIA khong duoc'
END
GO
exec DANHGIA_INSERT '1','THANH','TỐT','kthich','quá tốt'
go
--y3 2a
CREATE PROCEDURE timkiemthongtin_phongtro
(
@quan varchar(20),
@dientinhnho float,
@dientichlon float,
@ngaydangkinho DATE,
@ngaydangkilon DATE,
@giaphongnho float,
@giaphonglon float,
@loaihinhnhatro varchar(50)
)
as
BEGIN
	 SELECT
	 (diachinhatro)+(quannhatro)as chothuephongtrotai,
	 REPLACE(dientich,'.',',')+( 'm2')as dientich,
	 REPLACE(giaphong,'.',',')as giaphong,

	  motaphongtro as motaphongtro,
	  CONVERT ( varchar ,ngaydangki, 105)as ngaydangki,
	    case gioitinh
	  when N'nam' then('A. ')+[nguoilienhe]
	  else ('C. ')+[nguoilienhe]
	  END  AS nguoilienhe,
	  sodienthoai as sodienthoailienhe,
	  (diachinguoidung) +(quannguoidung) as diachinguoidung
	   from NHATRO
 INNER JOIN NGUOIDUNG
 ON NHATRO.nguoilienhe=NGUOIDUNG.tennguoidung
	   where quannhatro= @quan
	   and dientich <=@dientichlon
	   AND dientich >=@dientinhnho
	   and ngaydangki >=@ngaydangkinho
	   and ngaydangki <=@ngaydangkilon
	   and giaphong>= @giaphongnho
	   and giaphong <=@giaphonglon
	   and loaihinhchothue=@loaihinhnhatro;
END
go
exec timkiemthongtin_phongtro 'da nẵng',10,1000,'2019/11/11','2020/11/12',10000,100000000,'Căn hộ trung cư'
go
--y3 2b
CREATE PROC NGUOIDUNG_SELECT_manguoidung
(
@tennguoidung varchar(50),
 @gioitinh varchar(5),
 @sodienthoai char(15),
 @diachinguoidung varchar(150),
 @quannguoidung varchar(20),
 @email varchar(50)
 )
 as
 BEGIN
 SELECT
  manguoidung
  from NGUOIDUNG
  WHERE tennguoidung =@tennguoidung
  and gioitinh =@gioitinh
  and sodienthoai = @sodienthoai
  and diachinguoidung = @diachinguoidung
  and email =@email
 END
 go
 exec NGUOIDUNG_SELECT_manguoidung 'THANH','nam','0935299067','so 53 ap bac, hòa hải','dà nẵng','minhvtpd02930@fpt.edu.vn'
 go

 --y3 2c
 CREATE PROCEDURE NHATRO_LIKE_DISLIKE
 
 @manhatro int
 as
 DECLARE @thich int, @kthich int

 
 select @thich = count(*) from DANHGIA where thichhoackthich = 'thich' AND manhatro=@manhatro
 select @kthich = count(*) from DANHGIA where thichhoackthich = 'kthich' AND manhatro=@manhatro
  select @thich as tongthich
 select @kthich as tongkhongthich
 GO
 exec NHATRO_LIKE_DISLIKE '1'
 go
 go
 --y3 2d
 CREATE PROCEDURE NHATRO_10_TOP
 AS
 CREATE TABLE LUOCTHICH
 (
 manhatro int identity(1, 1),
 THICH INT 
 ) 

  DECLARE @thich int,@t int 
  SET @t=1
  WHILE(@t<=50)
  BEGIN
 select @thich = count(*) from DANHGIA where thichhoackthich = 'thich' AND manhatro=@t
 SET @t=@t+1
INSERT INTO LUOCTHICH
VALUES
(@thich)
END
 select top 10
 dientich,
 giaphong,
 ngaydangki,
 nguoilienhe,
 diachinhatro,
 sodienthoai,
 email
from ((NHATRO
 INNER JOIN NGUOIDUNG
 ON NHATRO.nguoilienhe=NGUOIDUNG.tennguoidung)
 INNER JOIN LUOCTHICH ON NHATRO.manhatro=LUOCTHICH.manhatro)
 ORDER BY THICH DESC;
 drop table LUOCTHICH
  --y3 2e
  go
  exec NHATRO_10_TOP
  go
 
 CREATE PROCEDURE DANHGIA_SELECT
 @manhatro int
 AS
 begin
 select
 manhatro,
 nguoidanhgia,
 thichhoackthich,
 noidungdanhgia
 from DANHGIA
 where manhatro=@manhatro
 end
 GO
 exec DANHGIA_SELECT '1'
 go
 --y3 3 1
 create procedure DELETE_DISLIKE
 @DISLIKE INT
 AS 
 DECLARE @kthich int,@t int 
 select @kthich = count(*) from DANHGIA where thichhoackthich = 'kthich' 
 SET @t=@t+1
 delete from DANHGIA
 where       
 @kthich >@DISLIKE
 
 delete from NHATRO
 where       
 @kthich >@DISLIKE
 go
 exec DELETE_DISLIKE 10
 go
 --y3 3 2
 create procedure DELETE_NGAYDANGTIN
 @ngaydangtinnho date,
 @ngaydangtinlon date
 as
 begin
 delete top(10) from NHATRO
 where ngaydangki>= @ngaydangtinnho
 and ngaydangki<=@ngaydangtinlon;
 end
 go
 exec DELETE_NGAYDANGTIN '2018-3-12','2018-3-13'
 


  ---y4
  ---tài khoản 1

create login QLNHATRO_minhvtpd02930 with password ='123456',
default_database = QLNHATRO_minhvtpd02930
go
create user QLNHATRO_minhvtpd02930 for login QLNHATRO_minhvtpd02930

--tài khoản 2
go
drop login vtminh2000
create login vtminh2000 with password ='123456',
default_database = QLNHATRO_minhvtpd02930
drop user vtminh2000
create user vtminh2000 for login vtminh2000