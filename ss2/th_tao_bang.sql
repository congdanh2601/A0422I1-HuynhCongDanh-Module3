CREATE DATABASE IF NOT EXISTS QuanLyDiemThi;
use QuanLyDiemThi;

create table HocSinh (
MaHS int primary key auto_increment,
TenHS varchar(20),
NgaySinh date,
Lop varchar(20),
GioiTinh varchar(10)
);

create table MonHoc (
MaMH int primary key auto_increment,
TenMH varchar(20)
);

create table BangDiem (
MaHS int,
MaMH int,
DiemThi float,
NgayKT date,
primary key (MaHS, MaMH),
foreign key (MaHS) references HocSinh(MaHS),
foreign key (MaMH) references MonHoc(MaMH)
);

create table GiaoVien (
MaGV int primary key auto_increment,
TenGV varchar(20),
SDT varchar(10)
);

alter table MonHoc add MaGV int;
alter table MonHoc add foreign key (MaGV) references GiaoVien(MaGV);