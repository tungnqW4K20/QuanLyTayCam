USE [master]
GO
/****** Object:  Database [ShopTayCam]    Script Date: 01-11-2024 8:00:58 PM ******/
CREATE DATABASE [ShopTayCam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopTayCam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL\MSSQL\DATA\ShopTayCam.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopTayCam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL\MSSQL\DATA\ShopTayCam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopTayCam] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopTayCam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopTayCam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopTayCam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopTayCam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopTayCam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopTayCam] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopTayCam] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopTayCam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopTayCam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopTayCam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopTayCam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopTayCam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopTayCam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopTayCam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopTayCam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopTayCam] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopTayCam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopTayCam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopTayCam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopTayCam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopTayCam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopTayCam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopTayCam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopTayCam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopTayCam] SET  MULTI_USER 
GO
ALTER DATABASE [ShopTayCam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopTayCam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopTayCam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopTayCam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopTayCam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopTayCam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopTayCam] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopTayCam] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopTayCam]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonBan]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonBan](
	[MaHoaDonBan] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuongBan] [int] NULL,
	[DonGiaBan] [decimal](10, 2) NULL,
	[MaChiTietHoaDonBan] [int] IDENTITY(1,1) NOT NULL,
	[HinhAnh] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDonBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDonNhap] [int] NOT NULL,
	[MaSanPham] [int] NULL,
	[SoLuongNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NULL,
	[NoiDungChiTiet] [nvarchar](500) NULL,
	[Video] [varchar](300) NULL,
	[Anh1] [varchar](300) NULL,
	[Anh2] [varchar](300) NULL,
	[Anh3] [varchar](300) NULL,
	[Anh4] [varchar](300) NULL,
	[CPU] [nvarchar](100) NULL,
	[GPU] [nvarchar](100) NULL,
	[RAM] [nvarchar](100) NULL,
	[Storage] [nvarchar](100) NULL,
	[HienThi] [nvarchar](100) NULL,
	[TrongLuong] [nvarchar](100) NULL,
	[KichThuoc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaNhap]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaNhap](
	[MaSanPham] [int] NOT NULL,
	[GiaNhap] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGH] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [int] NOT NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](10, 2) NULL,
	[ThanhTien] [decimal](15, 2) NULL,
	[HinhAnh] [varchar](100) NULL,
	[TenSanPham] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC,
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHoaDonBan] [int] IDENTITY(1,1) NOT NULL,
	[NgayBan] [datetime] NOT NULL,
	[TrangThai] [nvarchar](100) NOT NULL,
	[MaKhachHang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDonBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDonNhap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[TrangThai] [nvarchar](100) NULL,
	[MaNhaCungCap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](200) NULL,
	[SDTKH] [varchar](10) NULL,
	[Email] [varchar](200) NULL,
	[DiaChiKH] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](500) NULL,
	[DiaChiNhaCungCap] [nvarchar](500) NULL,
	[SDTNhaCungCap] [varchar](10) NULL,
	[EmailNhaCungCap] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] NOT NULL,
	[MaDanhMuc] [int] NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](200) NULL,
	[Gia] [decimal](10, 2) NULL,
	[HinhAnh] [varchar](200) NULL,
	[SanPhamTop] [bit] NULL,
	[SanPhamUuDai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoLuong]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuong](
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanKH]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanKH](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TenTK] [varchar](100) NULL,
	[MatKhau] [varchar](100) NULL,
	[MaKhachHang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [varchar](50) NOT NULL,
	[hoten] [nvarchar](150) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](250) NULL,
	[gioitinh] [nvarchar](30) NULL,
	[email] [varchar](150) NULL,
	[taikhoan] [varchar](30) NULL,
	[matkhau] [varchar](60) NULL,
	[role] [varchar](30) NULL,
	[image_url] [varchar](300) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonBan] ON 

INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (1, 1, 2, CAST(4000000.00 AS Decimal(10, 2)), 1, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (1, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 2, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (1, 2, 3, CAST(17000000.00 AS Decimal(10, 2)), 3, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (3, 1, 5, CAST(4000000.00 AS Decimal(10, 2)), 4, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (4, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 5, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (4, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 6, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (7, 1, 1, CAST(100000.00 AS Decimal(10, 2)), 7, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (7, 1, 3, CAST(4000000.00 AS Decimal(10, 2)), 8, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (7, 2, 2, CAST(17000000.00 AS Decimal(10, 2)), 9, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (7, 0, 3, CAST(12000000.00 AS Decimal(10, 2)), 10, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (10, 1, 3, CAST(4000000.00 AS Decimal(10, 2)), 14, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (10, 2, 2, CAST(17000000.00 AS Decimal(10, 2)), 15, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (10, 0, 3, CAST(12000000.00 AS Decimal(10, 2)), 16, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (11, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 17, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (12, 1, 3, CAST(4000000.00 AS Decimal(10, 2)), 18, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (12, 2, 2, CAST(17000000.00 AS Decimal(10, 2)), 19, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (12, 0, 3, CAST(12000000.00 AS Decimal(10, 2)), 20, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (13, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 21, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (13, 2, 2, CAST(17000000.00 AS Decimal(10, 2)), 22, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (14, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 23, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (14, 2, 1, CAST(17000000.00 AS Decimal(10, 2)), 24, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (15, 1, 2, CAST(4000000.00 AS Decimal(10, 2)), 25, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (15, 0, 3, CAST(12000000.00 AS Decimal(10, 2)), 26, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (16, 0, 3, CAST(12000000.00 AS Decimal(10, 2)), 27, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (16, 1, 2, CAST(4000000.00 AS Decimal(10, 2)), 28, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (17, 1, 4, CAST(4000000.00 AS Decimal(10, 2)), 29, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (17, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 30, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (18, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 31, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (18, 2, 3, CAST(17000000.00 AS Decimal(10, 2)), 32, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (20, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 33, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (20, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 34, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (21, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 35, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (22, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 36, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (23, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 37, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (24, 1, 3, CAST(4000000.00 AS Decimal(10, 2)), 38, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (24, 2, 4, CAST(17000000.00 AS Decimal(10, 2)), 39, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (25, 0, 5, CAST(12000000.00 AS Decimal(10, 2)), 40, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (26, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 41, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (27, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 42, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (28, 2, 5, CAST(17000000.00 AS Decimal(10, 2)), 43, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (28, 3, 1, CAST(17000000.00 AS Decimal(10, 2)), 44, N'rogallyx_24_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (29, 1, 3, CAST(4000000.00 AS Decimal(10, 2)), 45, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (29, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 46, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (30, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 47, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (31, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 48, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (31, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 49, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (32, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 50, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (32, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 51, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (33, 0, 1, CAST(12000000.00 AS Decimal(10, 2)), 52, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (34, 0, 2, CAST(12000000.00 AS Decimal(10, 2)), 53, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (34, 3, 4, CAST(17000000.00 AS Decimal(10, 2)), 54, N'rogallyx_24_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (35, 2, 2, CAST(17000000.00 AS Decimal(10, 2)), 55, N'ps52_9_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (35, 0, 3, CAST(12000000.00 AS Decimal(10, 2)), 56, N'ps5spider_1_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (36, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 57, N'ps41_5_11zon.png')
INSERT [dbo].[ChiTietHoaDonBan] ([MaHoaDonBan], [MaSanPham], [SoLuongBan], [DonGiaBan], [MaChiTietHoaDonBan], [HinhAnh]) VALUES (37, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), 58, N'ps41_5_11zon.png')
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (1, 0, N'Phiên bản đặc biệt của PS5 với chủ đề Spiderman 2, đi kèm các tính năng độc quyền và hiệu năng cao, hoàn hảo cho các fan của Spiderman', N'ps5spiderreview.mp4', N'ps5spider_1_11zon.png', N'ps5spider1_2_11zon.png', N'ps5spider3_4_11zon.png', N'pssspider.jpg', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aaa', N'aaa')
INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (2, 1, N'PS4 Slim 1TB với thiết kế nhỏ gọn, dung lượng lưu trữ lớn, và nhiều tựa game hấp dẫn, phù hợp với mọi đối tượng người chơi.', N'ps4slimreview.mp4', N'ps41_5_11zon.png', N'ps42_6_11zon.png', N'ps4new_11zon.png', N'ps43_7_11zon.png', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aa', N'aa')
INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (3, 2, N'Sony PlayStation 5 Slim (PS5 Slim) là phiên bản mới nhất của dòng máy chơi game PlayStation từ Sony. Với thiết kế mỏng nhẹ, hiệu năng mạnh mẽ và khả năng chơi game ở độ phân giải 4K, đây là lựa chọn tuyệt vời cho các game thủ.', N'ps5review.mp4', N'ps52_9_11zon.png', N'ps53_11zon.png', N'ps54_10_11zon.png', N'ps55_11_11zon.png', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aa', N'aa')
INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (4, 3, N'Phiên bản giới hạn của Asus Rog Ally X với cấu hình mạnh mẽ, thiết kế vô cùng độc đáo, và trải nghiệm chơi game tuyệt vời.', N'', N'rogallyx_24_11zon.png', N'rogallyx1.png', N'rogallyx2.png', N'rogallyx3.png', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aa', N'aa')
INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (5, 4, N'ASUS ROG Ally Z1 Extreme với hiệu năng mạnh mẽ, thiết kế đẹp mắt, và khả năng xử lý đồ họa tuyệt vời', N'string', N'rogally_20_11zon.png', N'rogally2_21_11zon.png', N'rogally3_22_11zon.png', N'rogally4_23_11zon.png', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aa', N'aa')
INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (6, 5, N'MSI Claw là máy chơi game với hiệu năng đỉnh cao, thiết kế sang trọng, và nhiều tính năng hiện đại.', N'string', N'msi_11zon.png', N'msi1.webp', N'msi2.webp', N'msi3.webp', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aa', N'aa')
INSERT [dbo].[ChiTietSanPham] ([MaChiTiet], [MaSanPham], [NoiDungChiTiet], [Video], [Anh1], [Anh2], [Anh3], [Anh4], [CPU], [GPU], [RAM], [Storage], [HienThi], [TrongLuong], [KichThuoc]) VALUES (7, 6, N'Tay cầm Dualsense cho PS5 với thiết kế hiện đại, cảm giác cầm nắm thoải mái, và tính năng phản hồi xúc giác độc đáo', N'string', N'taycamps5_25_11zon.png', N'taycamps51_26_11zon.png', N'taycamps52_27_11zon.png', N'taycamps53_28_11zon.png', N'8GB', N'8GB', N'8GB', N'8GB', N'aa', N'aa', N'aa')
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'MayChoiGame')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'TayCam')
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGH], [MaKhachHang], [MaSP], [SoLuong], [DonGia], [ThanhTien], [HinhAnh], [TenSanPham]) VALUES (43, 1, 1, 1, CAST(4000000.00 AS Decimal(10, 2)), CAST(4000000.00 AS Decimal(15, 2)), N'ps41_5_11zon.png', N'Sony Playstation 4 Slim 1TB Limit')
INSERT [dbo].[GioHang] ([MaGH], [MaKhachHang], [MaSP], [SoLuong], [DonGia], [ThanhTien], [HinhAnh], [TenSanPham]) VALUES (44, 1, 2, 1, CAST(17000000.00 AS Decimal(10, 2)), CAST(17000000.00 AS Decimal(15, 2)), N'ps52_9_11zon.png', N'Sony PlayStation 5 Slim (PS5 Slim)')
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] ON 

INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (1, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (3, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'Mua Hàng', 2)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (4, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'Chờ xử lý', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (7, CAST(N'2024-10-03T21:09:28.527' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (10, CAST(N'2024-10-04T20:14:07.170' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (11, CAST(N'2024-10-04T20:38:13.037' AS DateTime), N'Mua Hàng', 6)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (12, CAST(N'2024-10-05T08:07:16.093' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (13, CAST(N'2024-10-05T08:38:43.330' AS DateTime), N'Mua Hàng', 7)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (14, CAST(N'2024-10-05T13:42:54.230' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (15, CAST(N'2024-10-05T13:46:11.790' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (16, CAST(N'2024-10-05T14:48:39.660' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (17, CAST(N'2024-10-05T16:45:19.693' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (18, CAST(N'2024-10-07T13:56:26.270' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (20, CAST(N'2024-10-10T21:20:19.017' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (21, CAST(N'2024-10-10T21:25:01.993' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (22, CAST(N'2024-10-11T09:14:19.697' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (23, CAST(N'2024-10-12T14:08:39.310' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (24, CAST(N'2024-10-12T16:18:46.897' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (25, CAST(N'2024-10-12T16:50:34.007' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (26, CAST(N'2024-10-13T14:05:01.087' AS DateTime), N'Mua Hàng', 8)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (27, CAST(N'2024-10-13T14:48:48.610' AS DateTime), N'Mua Hàng', 9)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (28, CAST(N'2024-10-13T15:01:35.423' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (29, CAST(N'2024-10-13T19:33:44.803' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (30, CAST(N'2024-10-14T14:30:49.127' AS DateTime), N'Mua Hàng', 10)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (31, CAST(N'2024-10-15T20:14:59.837' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (32, CAST(N'2024-10-20T22:41:42.950' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (33, CAST(N'2024-10-21T14:59:38.850' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (34, CAST(N'2024-10-25T19:55:41.770' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (35, CAST(N'2024-10-25T19:58:59.993' AS DateTime), N'Mua Hàng', 11)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (36, CAST(N'2024-10-26T13:45:40.250' AS DateTime), N'Mua Hàng', 1)
INSERT [dbo].[HoaDonBan] ([MaHoaDonBan], [NgayBan], [TrangThai], [MaKhachHang]) VALUES (37, CAST(N'2024-10-26T15:25:12.880' AS DateTime), N'Mua Hàng', 1)
SET IDENTITY_INSERT [dbo].[HoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (1, N'test1111', N'0868109193', N'123@gmail.com', N'Hưng Yên Vip123456')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (2, N'string', N'string', N'string', N'string')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (3, N'string', N'string', N'string', N'string')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (4, N'tùng', N'0868109193', N'sextoy1102@gmail.com', N'aaaa')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (5, N'tùng', N'0868109193', N'sextoy1102@gmail.com', N'aaaa')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (6, N'Trần Hà Thanh Tùng', N'0398508203', N'123@gmail.com', N'aaaaaaaaaaaaaaa')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (7, N'qWert', N'0123456789', N'111@gmail.com', N'Hunascas')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (8, N'Trần Hà Thanh Tùng', N'0868109193', N'a@gmail.com', N'aaaa')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (9, N'tùng', N'0868109193', N'123@gmail.com', N'123123')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (10, N'tùng', N'1111111111', N'123@gmail.com', N'12333333')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (11, N'KHach hang moi', N'123123', N'aaa@gmail.com', N'aaaaaaaaaaaaaaaa')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [SDTKH], [Email], [DiaChiKH]) VALUES (14, N'moinhat', N'011111111', N'1234567@gmail.com', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SDTNhaCungCap], [EmailNhaCungCap]) VALUES (1, N'string', N'string', N'string', N'string')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SDTNhaCungCap], [EmailNhaCungCap]) VALUES (2, N'aaa', N'string', N'string', N'string')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SDTNhaCungCap], [EmailNhaCungCap]) VALUES (3, N'bbb', N'string', N'string', N'string')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SDTNhaCungCap], [EmailNhaCungCap]) VALUES (4, N'abccc', N'string', N'string', N'string')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SDTNhaCungCap], [EmailNhaCungCap]) VALUES (5, N'abc123', N'TPHCM', N'123123123', N'a@gmail.com')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (0, 1, N'Sony Playstation 5 Spiderman 2', N'Sony Playstation 5 Spiderman 2 Limited', CAST(12000000.00 AS Decimal(10, 2)), N'ps5spider_1_11zon.png', 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (1, 1, N'Sony Playstation 4 Slim 1TB Limit', N'Sony Playstation 4 Slim 1TB Limit', CAST(4000000.00 AS Decimal(10, 2)), N'ps41_5_11zon.png', 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (2, 1, N'Sony PlayStation 5 Slim (PS5 Slim)', N'Sony PlayStation 5 Slim PS5 Slim', CAST(17000000.00 AS Decimal(10, 2)), N'ps52_9_11zon.png', 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (3, 1, N'Asus Rog Ally X Limited Edition', N'Asus Rog Ally X Limited Edition', CAST(17000000.00 AS Decimal(10, 2)), N'rogallyx_24_11zon.png', 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (4, 1, N'ASUS ROG Ally Z1 Extreme', N'ASUS ROG Ally Z1 Extreme với hiệu năng mạnh mẽ, thiết kế đẹp mắt, và khả năng xử lý đồ họa tuyệt vời', CAST(15990000.00 AS Decimal(10, 2)), N'rogally_20_11zon.png', 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (5, 1, N'Máy chơi game MSI Claw', N'MSI Claw là máy chơi game với hiệu năng đỉnh cao, thiết kế sang trọng, và nhiều tính năng hiện đại', CAST(21490000.00 AS Decimal(10, 2)), N'msi_11zon.png', 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (6, 2, N'Tay cầm PS5 Dualsense', N'Tay cầm Dualsense cho PS5 với thiết kế hiện đại, cảm giác cầm nắm thoải mái, và tính năng phản hồi xúc giác tốt', CAST(1890000.00 AS Decimal(10, 2)), N'taycamps5_25_11zon.png', 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [NoiDung], [Gia], [HinhAnh], [SanPhamTop], [SanPhamUuDai]) VALUES (7, 1, N'7777', N'7777', CAST(11111.00 AS Decimal(10, 2)), N'', 0, 0)
GO
INSERT [dbo].[SoLuong] ([MaSanPham], [SoLuong]) VALUES (0, 65)
INSERT [dbo].[SoLuong] ([MaSanPham], [SoLuong]) VALUES (1, 67)
INSERT [dbo].[SoLuong] ([MaSanPham], [SoLuong]) VALUES (2, 81)
INSERT [dbo].[SoLuong] ([MaSanPham], [SoLuong]) VALUES (3, 95)
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanKH] ON 

INSERT [dbo].[TaiKhoanKH] ([MaTK], [TenTK], [MatKhau], [MaKhachHang]) VALUES (1, N'test', N'123', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoanKH] OFF
GO
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'14ff5489-9b84-4bd4-801d-55374bdbe15b', N'Tùng', CAST(N'2020-10-12' AS Date), N'hưngyene', N'Nam', N'khoi@gmail.com', N'ad', N'1', N'Admin', N'')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'1bfa414d-fef5-446c-b095-5acc73625724', N'Nguyễn A33336666', NULL, NULL, NULL, NULL, N'a1', N'1', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'20398c78-0d7a-4d61-ba45-414ba9ad8923', N'1112', NULL, NULL, NULL, NULL, N'1112', N'1112', NULL, N'upload/background-slider-1.jpg')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'2aeef659-0861-4f33-b6f7-c58de246431a', N'Nguyễn A66666', NULL, NULL, NULL, NULL, N'a1', N'1', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'3d5111a9-6ff0-45c7-89c6-cbc68c7f8744', N'Trần Thị Hoa', CAST(N'2020-10-09' AS Date), N'Hà Nội', N'Nam', N'hoa@gmail.com', N'hoa', N'hoa@123', N'Admin', N'upload/anhnen2.jpg')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'400a70e3-242e-46a2-b3a1-3ae7f6d73638', N'Nguyễn A22222222222999', NULL, NULL, NULL, NULL, N'a2222', N'1', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'531ecaad-c81d-4407-ae8f-e01efb36d2b5', N'nguyễn thanh huệ', CAST(N'2020-10-13' AS Date), N'hưng yên', N'Nam', N'hue@gmail.com', N'huentt', N'123@123', N'User', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'58a87bf7-2487-48e2-8514-f2336085607a', N'555', NULL, NULL, NULL, NULL, N'555', N'5', NULL, N'upload/anhnen.jpg')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'709eb390-f6c7-4327-bb5d-978ce552b031', N'Nguyễn A3333', NULL, NULL, NULL, NULL, N'a1', N'1', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'76deb917-68ff-4407-a569-eea900b7d0aa', N'9', NULL, NULL, NULL, NULL, N'9999999', N'9', NULL, N'upload/people-avatar-1.jpg')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'885f03ad-46dc-442a-be3a-29f264496409', N'Nguyễn Hữu Hùng', CAST(N'2020-10-11' AS Date), N'Hà Nội', N'Nam', N'hung@gamil.com', N'hung', N'123@123', N'Admin', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'9fb4c17a-cfbd-41da-9e02-f3acfcfa2ab6', N'Nguyễn A3', NULL, NULL, NULL, NULL, N'a3', N'1', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'af426114-a97e-4c86-a157-82fb62003585', N'111', NULL, NULL, NULL, NULL, N'111', N'111', NULL, N'upload/people-avatar-2.jpg')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'cc49bfa6-ebde-484b-abad-5ae180a64567', N'Admin', CAST(N'1977-01-08' AS Date), N'Hưng Yên', N'Nam', N'admin@gmail.com', N'admin', N'admin', N'Admin', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'dee4cc01-e11a-4119-979d-d89495fd934f', N'444444', NULL, NULL, NULL, NULL, N'4444', N'333', NULL, NULL)
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaHoaDonBan])
REFERENCES [dbo].[HoaDonBan] ([MaHoaDonBan])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaHoaDonBan])
REFERENCES [dbo].[HoaDonBan] ([MaHoaDonBan])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDonNhap])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDonNhap])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[GiaNhap]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[GiaNhap]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SoLuong]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[SoLuong]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[TaiKhoanKH]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[TaiKhoanKH]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiet_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_chitiet_create]

       @MaSanPham int,
				@NoiDungChiTiet nvarchar(500),
				@Video varchar(100),
				@Anh1 varchar(100),
				@Anh2 varchar(100),
				@Anh3 varchar(100),
				@Anh4 varchar(100),
				
				@CPU nvarchar(100),
				@GPU nvarchar(100),
				@RAM nvarchar(100),
				@Storage nvarchar(100),
				@HienThi nvarchar(100),
				@TrongLuong nvarchar(100),
				@KichThuoc nvarchar(100)    

as
	begin

	insert into ChiTietSanPham values(@MaSanPham, @NoiDungChiTiet, @Video ,@Anh1, @Anh2, @Anh3, @Anh4,@CPU,@GPU, @RAM, @Storage,@HienThi ,@TrongLuong,@KichThuoc)
	if exists(select * from SanPham where MaSanPham=@MaSanPham)
	begin
			SELECT ''
	end
	else
	begin
		SELECT N'Mã Danh M?c không t?n t?i'
	end
	

end
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiet_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_chitiet_update]

       @MaSanPham int,
				@NoiDungChiTiet nvarchar(500),
				@Video varchar(100),
				@Anh1 varchar(100),
				@Anh2 varchar(100),
				@Anh3 varchar(100),
				@Anh4 varchar(100),
				
				@CPU nvarchar(100),
				@GPU nvarchar(100),
				@RAM nvarchar(100),
				@Storage nvarchar(100),
				@HienThi nvarchar(100),
				@TrongLuong nvarchar(100),
				@KichThuoc nvarchar(100)    

as
	begin

	update ChiTietSanPham set NoiDungChiTiet = @NoiDungChiTiet, Video = @Video, Anh1=@Anh1, Anh2 = @Anh2, Anh3 = @Anh3, Anh4 = @ANh4, CPU = @CPU, GPU= @GPU,
	RAM = @RAM, Storage = @Storage, HienThi =@HienThi, TrongLuong =@TrongLuong, KichThuoc = @KichThuoc
	
	if exists(select * from SanPham where MaSanPham=@MaSanPham)
	begin
			SELECT ''
	end
	else
	begin
		SELECT N'Mã SP không t?n t?i'
	end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonban_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonban_create] 
    @MaHoaDonBan INT,
    @MaSanPham INT
AS
BEGIN
    DECLARE @DonGiaBan DECIMAL(10, 2)
    DECLARE @SoLuongKho INT
    DECLARE @AnhSanPham NVARCHAR(255) -- Giả sử cột AnhSanPham có kiểu dữ liệu nvarchar(255)
    DECLARE @SoLuongBan INT = 1 -- Mặc định số lượng bán là 1

    -- Kiểm tra mã hóa đơn có tồn tại trong bảng HoaDonBan hay không
    IF NOT EXISTS (SELECT 1 FROM HoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan)
    BEGIN
        RAISERROR('Mã hóa đơn %d không tồn tại.', 16, 1, @MaHoaDonBan)
        RETURN
    END

    -- Lấy đơn giá bán và ảnh sản phẩm từ bảng SanPham
    SELECT @DonGiaBan = Gia, @AnhSanPham = HinhAnh
    FROM SanPham
    WHERE MaSanPham = @MaSanPham

    -- Kiểm tra sản phẩm có tồn tại không và lấy số lượng trong kho
    SELECT @SoLuongKho = SoLuong
    FROM SoLuong
    WHERE MaSanPham = @MaSanPham

    IF @SoLuongKho IS NULL
    BEGIN
        RAISERROR(N'Sản phẩm %d không tồn tại.', 16, 1, @MaSanPham)
        RETURN
    END

    -- Kiểm tra số lượng hàng trong kho có đủ không
    IF @SoLuongKho < @SoLuongBan
    BEGIN
        RAISERROR(N'Không đủ số lượng sản phẩm %d trong kho. Chỉ còn %d sản phẩm.', 16, 1, @MaSanPham, @SoLuongKho)
        RETURN
    END

    -- Nếu số lượng đủ, trừ số lượng trong kho
    UPDATE SoLuong
    SET SoLuong = SoLuong - @SoLuongBan
    WHERE MaSanPham = @MaSanPham

    -- Kiểm tra xem sản phẩm đã có trong chi tiết hóa đơn hay chưa
    IF EXISTS (SELECT 1 FROM ChiTietHoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan AND MaSanPham = @MaSanPham)
    BEGIN
        -- Nếu có, cập nhật số lượng bán
        UPDATE ChiTietHoaDonBan
        SET SoLuongBan = SoLuongBan + @SoLuongBan
        WHERE MaHoaDonBan = @MaHoaDonBan AND MaSanPham = @MaSanPham

        PRINT N'Chi tiết hóa đơn đã được cập nhật. Số lượng bán tăng thêm.'
    END
    ELSE
    BEGIN
        -- Nếu chưa có, thêm mới chi tiết hóa đơn
        INSERT INTO ChiTietHoaDonBan (MaHoaDonBan, MaSanPham, SoLuongBan, DonGiaBan, HinhAnh)
        VALUES (@MaHoaDonBan, @MaSanPham, @SoLuongBan, @DonGiaBan, @AnhSanPham)

        PRINT N'Chi tiết hóa đơn được tạo mới thành công.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonban_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonban_delete] 
    @MaChiTietHoaDonBan INT
AS
BEGIN
    -- Kiểm tra xem chi tiết hóa đơn có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM ChiTietHoaDonBan WHERE MaChiTietHoaDonBan = @MaChiTietHoaDonBan)
    BEGIN
        RAISERROR(N'Chi tiết hóa đơn không tồn tại cho mã chi tiết hóa đơn %d.', 16, 1, @MaChiTietHoaDonBan)
        RETURN
    END

    -- Xóa chi tiết hóa đơn
    DELETE FROM ChiTietHoaDonBan 
    WHERE MaChiTietHoaDonBan = @MaChiTietHoaDonBan

    PRINT N'Chi tiết hóa đơn đã được xóa thành công.'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonban_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonban_getall]
AS
BEGIN
    -- Lấy toàn bộ thông tin từ bảng ChiTietHoaDonBan
    SELECT *
    FROM ChiTietHoaDonBan
END

GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonban_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonban_getallbyid]
    @MaChiTietHoaDonBan INT
AS
BEGIN
    -- Kiểm tra xem mã chi tiết hóa đơn có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM ChiTietHoaDonBan WHERE MaChiTietHoaDonBan = @MaChiTietHoaDonBan)
    BEGIN
        RAISERROR('Chi tiết hóa đơn không tồn tại cho mã chi tiết hóa đơn %d.', 16, 1, @MaChiTietHoaDonBan)
        RETURN
    END

    -- Lấy thông tin chi tiết hóa đơn theo mã chi tiết hóa đơn
    SELECT *
    FROM ChiTietHoaDonBan
    WHERE MaChiTietHoaDonBan = @MaChiTietHoaDonBan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonban_getallbyidmahd]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_chitiethoadonban_getallbyidmahd]  
    @MaHoaDonBan INT  
AS  
BEGIN  

  
    -- Lấy thông tin chi tiết hóa đơn theo mã chi tiết hóa đơn  
    SELECT a.MaHoaDonBan,b.NgayBan,b.TrangThai,c.TenSanPham
	,C1.TongTien,a.SoLuongBan,a.DonGiaBan

    FROM ChiTietHoaDonBan a
	inner join  HOaDonBan b on a.MaHoaDonBan=b.MaHoaDonBan
	inner join  SanPham c on a.MaSanPham=c.MaSanPham
	outer apply(

		select MaHoaDonBan,SUM(SoLuongBan*DonGiaBan) as TongTien from ChiTietHoaDonBan where MaHoaDonBan = @MaHoaDonBan 
		group by MaHoaDonBan

	)C1
    WHERE a.MaHoaDonBan = @MaHoaDonBan  



END  

GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonban_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonban_update]
    @MaHoaDonBan INT,
    @MaSanPham INT
AS
BEGIN
    DECLARE @SoLuongBan INT
    DECLARE @SoLuongKho INT

    -- Kiểm tra xem chi tiết hóa đơn có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM ChiTietHoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan AND MaSanPham = @MaSanPham)
    BEGIN
        RAISERROR(N'Chi tiết hóa đơn không tồn tại cho mã hóa đơn %d và mã sản phẩm %d.', 16, 1, @MaHoaDonBan, @MaSanPham)
        RETURN
    END

    -- Lấy số lượng bán hiện tại
    SELECT @SoLuongBan = SoLuongBan 
    FROM ChiTietHoaDonBan 
    WHERE MaHoaDonBan = @MaHoaDonBan AND MaSanPham = @MaSanPham

    -- Lấy số lượng trong kho
    SELECT @SoLuongKho = SoLuong 
    FROM SoLuong 
    WHERE MaSanPham = @MaSanPham

    -- Kiểm tra xem có đủ số lượng trong kho không để tăng thêm
    IF @SoLuongKho <= 0
    BEGIN
        RAISERROR(N'Không còn sản phẩm %d trong kho.', 16, 1, @MaSanPham)
        RETURN
    END

    -- Cập nhật số lượng bán
    UPDATE ChiTietHoaDonBan
    SET SoLuongBan = SoLuongBan + 1
    WHERE MaHoaDonBan = @MaHoaDonBan AND MaSanPham = @MaSanPham

    -- Giảm số lượng trong kho
    UPDATE SoLuong
    SET SoLuong = SoLuong - 1
    WHERE MaSanPham = @MaSanPham

    PRINT N'Số lượng sản phẩm đã được tăng thêm 1 trong chi tiết hóa đơn.'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonnhap_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonnhap_create]
    @MaHoaDonNhap INT,
    @MaSanPham INT,
    @SoLuongNhap INT,
    @GiaNhapMoi DECIMAL(10, 2) -- Giá nhập cho sản phẩm mới nếu không tồn tại
AS
BEGIN
    -- Bắt đầu một giao dịch
    BEGIN TRANSACTION;

    -- Kiểm tra xem sản phẩm đã tồn tại trong bảng SoLuong hay chưa
    IF EXISTS (SELECT 1 FROM SoLuong WHERE MaSanPham = @MaSanPham)
    BEGIN
        -- Lấy giá nhập từ bảng GiaNhap
        DECLARE @GiaNhap DECIMAL(10, 2);
        SELECT @GiaNhap = GiaNhap FROM GiaNhap WHERE MaSanPham = @MaSanPham;

        -- Nếu không có giá nhập, rollback và dừng quá trình
        IF @GiaNhap IS NULL
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR(N'Giá nhập không tồn tại cho sản phẩm này.', 16, 1);
            RETURN;
        END

        -- Cập nhật số lượng trong bảng SoLuong
        UPDATE SoLuong
        SET SoLuong = SoLuong + @SoLuongNhap
        WHERE MaSanPham = @MaSanPham;

        -- Thêm chi tiết hóa đơn nhập mới
        INSERT INTO ChiTietHoaDonNhap (MaHoaDonNhap, MaSanPham, SoLuongNhap)
        VALUES (@MaHoaDonNhap, @MaSanPham, @SoLuongNhap);
    END
    ELSE
    BEGIN
        -- Nếu sản phẩm chưa tồn tại trong bảng SoLuong và GiaNhap
        -- Thêm sản phẩm mới vào bảng GiaNhap với giá mới
        INSERT INTO GiaNhap (MaSanPham, GiaNhap)
        VALUES (@MaSanPham, @GiaNhapMoi);

        -- Thêm sản phẩm mới vào bảng SoLuong
        INSERT INTO SoLuong (MaSanPham, SoLuong)
        VALUES (@MaSanPham, @SoLuongNhap);

        -- Thêm chi tiết hóa đơn nhập mới
        INSERT INTO ChiTietHoaDonNhap (MaHoaDonNhap, MaSanPham, SoLuongNhap)
        VALUES (@MaHoaDonNhap, @MaSanPham, @SoLuongNhap);
    END

    -- Commit giao dịch sau khi hoàn tất
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonnhap_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonnhap_delete]
    @MaChiTietHoaDon INT   -- Mã chi tiết hóa đơn cần xóa
AS
BEGIN
    -- Bắt đầu một giao dịch
    BEGIN TRANSACTION;

    -- Khai báo các biến để lưu trữ thông tin
    DECLARE @MaSanPham INT;
    DECLARE @SoLuongNhap INT;
    DECLARE @SoLuongHienTai INT;

    -- Lấy thông tin sản phẩm và số lượng nhập từ bảng ChiTietHoaDonNhap
    SELECT @MaSanPham = MaSanPham, @SoLuongNhap = SoLuongNhap
    FROM ChiTietHoaDonNhap
    WHERE MaChiTietHoaDon = @MaChiTietHoaDon;

    -- Kiểm tra nếu không tìm thấy mã chi tiết hóa đơn, rollback và dừng quá trình
    IF @MaSanPham IS NULL OR @SoLuongNhap IS NULL
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR(N'Không tìm thấy chi tiết hóa đơn nhập.', 16, 1);
        RETURN;
    END

    -- Lấy số lượng hiện tại của sản phẩm trong bảng SoLuong
    SELECT @SoLuongHienTai = SoLuong
    FROM SoLuong
    WHERE MaSanPham = @MaSanPham;

    -- Kiểm tra nếu không tìm thấy sản phẩm trong bảng SoLuong, rollback và dừng quá trình
    IF @SoLuongHienTai IS NULL
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR(N'Không tìm thấy sản phẩm trong kho.', 16, 1);
        RETURN;
    END

    -- Tính toán số lượng mới sau khi xóa chi tiết hóa đơn nhập
    DECLARE @SoLuongMoi INT = @SoLuongHienTai - @SoLuongNhap;

    -- Cập nhật số lượng trong bảng SoLuong
    UPDATE SoLuong
    SET SoLuong = @SoLuongMoi
    WHERE MaSanPham = @MaSanPham;

    -- Xóa chi tiết hóa đơn nhập khỏi bảng ChiTietHoaDonNhap
    DELETE FROM ChiTietHoaDonNhap
    WHERE MaChiTietHoaDon = @MaChiTietHoaDon;

    -- Commit giao dịch sau khi hoàn tất
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonnhap_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonnhap_getall]
AS
BEGIN
    -- Truy vấn lấy toàn bộ chi tiết hóa đơn nhập
    SELECT 
        CT.MaChiTietHoaDon, 
        CT.MaHoaDonNhap, 
        CT.MaSanPham, 
        CT.SoLuongNhap,
        HD.NgayNhap,
        SP.TenSanPham,
        SP.Gia
    FROM ChiTietHoaDonNhap CT
    JOIN HoaDonNhap HD ON CT.MaHoaDonNhap = HD.MaHoaDonNhap
    JOIN SanPham SP ON CT.MaSanPham = SP.MaSanPham
    ORDER BY CT.MaChiTietHoaDon ASC;
END


GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonnhap_getallbyidhoadonnhap]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonnhap_getallbyidhoadonnhap]
    @MaHoaDonNhap INT  -- Mã hóa đơn nhập để lọc kết quả
AS
BEGIN
    -- Truy vấn lấy toàn bộ chi tiết hóa đơn nhập dựa trên mã hóa đơn nhập
    SELECT 
        CT.MaChiTietHoaDon, 
        CT.MaHoaDonNhap, 
        CT.MaSanPham, 
        CT.SoLuongNhap,
        HD.NgayNhap,
        SP.TenSanPham,
        SP.Gia
    FROM ChiTietHoaDonNhap CT
    JOIN HoaDonNhap HD ON CT.MaHoaDonNhap = HD.MaHoaDonNhap
    JOIN SanPham SP ON CT.MaSanPham = SP.MaSanPham
    WHERE CT.MaHoaDonNhap = @MaHoaDonNhap  -- Lọc theo mã hóa đơn nhập
    ORDER BY CT.MaChiTietHoaDon ASC;
END


GO
/****** Object:  StoredProcedure [dbo].[sp_chitiethoadonnhap_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chitiethoadonnhap_update]
    @MaChiTietHoaDon INT,       -- Mã chi tiết hóa đơn cần cập nhật
    @MaSanPham INT,             -- Mã sản phẩm
    @SoLuongNhapMoi INT         -- Số lượng nhập mới
AS
BEGIN
    -- Bắt đầu một giao dịch
    BEGIN TRANSACTION;

    -- Khai báo các biến để lưu trữ thông tin
    DECLARE @SoLuongCu INT;
    DECLARE @SoLuongHienTai INT;

    -- Lấy số lượng nhập cũ từ bảng ChiTietHoaDonNhap
    SELECT @SoLuongCu = SoLuongNhap
    FROM ChiTietHoaDonNhap
    WHERE MaChiTietHoaDon = @MaChiTietHoaDon;

    -- Nếu không tìm thấy mã chi tiết hóa đơn, dừng và rollback
    IF @SoLuongCu IS NULL
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR(N'Không tìm thấy chi tiết hóa đơn nhập.', 16, 1);
        RETURN;
    END

    -- Lấy số lượng hiện tại của sản phẩm trong bảng SoLuong
    SELECT @SoLuongHienTai = SoLuong
    FROM SoLuong
    WHERE MaSanPham = @MaSanPham;

    -- Nếu không tìm thấy sản phẩm, dừng và rollback
    IF @SoLuongHienTai IS NULL
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR(N'Không tìm thấy sản phẩm trong kho.', 16, 1);
        RETURN;
    END

    -- Tính toán số lượng mới sau khi cập nhật
    DECLARE @SoLuongChenhLech INT = @SoLuongNhapMoi - @SoLuongCu;
    DECLARE @SoLuongMoi INT = @SoLuongHienTai + @SoLuongChenhLech;

    -- Cập nhật số lượng trong bảng SoLuong
    UPDATE SoLuong
    SET SoLuong = @SoLuongMoi
    WHERE MaSanPham = @MaSanPham;

    -- Cập nhật số lượng mới trong bảng ChiTietHoaDonNhap
    UPDATE ChiTietHoaDonNhap
    SET SoLuongNhap = @SoLuongNhapMoi
    WHERE MaChiTietHoaDon = @MaChiTietHoaDon;

    -- Commit giao dịch sau khi hoàn tất
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_chitietsanpham_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_chitietsanpham_delete]
                @MaSanPham int 
                

as
	begin
	delete SanPham where MaSanPham = @MaSanPham
	if exists (select * from SanPham where MaSanPham= @MaSanPham)
	begin
		select''
	end

	else
	begin
		select N'Mã s?n ph?m không t?n t?i'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_chitietsanpham_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_chitietsanpham_getallbyid]
@MaSanPham int
as
begin
	select a.*,b.TenSanPham,b.Gia from ChiTietSanPham a
	inner join SanPham b on a.MaSanPham=b.MaSanPham
	
	where a.MaSanPham = @MaSanPham
	if exists (select * from SanPham where MaSanPham = @MaSanPham)
	begin
		select '';
	end
	else 
	begin
		select N'Mã s?n ph?m không t?n t?i'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_danhmuc_create]
@MaDanhMuc int,@TenDanhMuc nvarchar(500)
as
begin
	
	insert into DanhMuc values(@MaDanhMuc,@TenDanhMuc)
	 SELECT '';

end
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhmuc_delete]
@MaDanhMuc int

as
begin 
 delete DanhMuc where MaDanhMuc=@MaDanhMuc
 select'';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhmuc_getall]
as
begin
select * from danhmuc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_gianhap_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_gianhap_create]
    @MaSanPham INT,
    @GiaNhap DECIMAL(10,2)
AS
BEGIN
    -- Kiểm tra sản phẩm có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM SanPham WHERE MaSanPham = @MaSanPham)
    BEGIN
        RAISERROR(N'Sản phẩm không tồn tại.', 16, 1);
        RETURN;
    END

    -- Kiểm tra sản phẩm đã có giá nhập hay chưa
    IF EXISTS (SELECT 1 FROM GiaNhap WHERE MaSanPham = @MaSanPham)
    BEGIN
        RAISERROR(N'Sản phẩm đã có giá nhập, không thể thêm nữa.', 16, 1);
        RETURN;
    END

    -- Nếu sản phẩm tồn tại và chưa có giá nhập, thì cho phép nhập giá nhập
    INSERT INTO GiaNhap (MaSanPham, GiaNhap)
    VALUES (@MaSanPham, @GiaNhap);

    PRINT N'Thêm giá nhập thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_gianhap_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_gianhap_getall]
AS
BEGIN
    SELECT 
        sp.MaSanPham,
        sp.TenSanPham,
        gn.GiaNhap
    FROM 
        SanPham sp
    LEFT JOIN 
        GiaNhap gn ON sp.MaSanPham = gn.MaSanPham;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_gianhap_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_gianhap_update]
    @MaSanPham INT,
    @GiaNhapMoi DECIMAL(10, 2)
AS
BEGIN
    -- Kiểm tra sản phẩm có tồn tại trong bảng SanPham hay không
    IF NOT EXISTS (SELECT 1 FROM SanPham WHERE MaSanPham = @MaSanPham)
    BEGIN
        RAISERROR('Sản phẩm không tồn tại.', 16, 1);
        RETURN;
    END

    -- Kiểm tra sản phẩm có giá nhập hay không
    IF NOT EXISTS (SELECT 1 FROM GiaNhap WHERE MaSanPham = @MaSanPham)
    BEGIN
        RAISERROR('Sản phẩm chưa có giá nhập để cập nhật.', 16, 1);
        RETURN;
    END

    -- Cập nhật giá nhập mới cho sản phẩm
    UPDATE GiaNhap
    SET GiaNhap = @GiaNhapMoi
    WHERE MaSanPham = @MaSanPham;

    PRINT 'Cập nhật giá nhập thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_giohang_delete]
    @MaKhachHang nvarchar(50), -- Mã TenTK
    @MaSP INT -- Mã sản phẩm cần xóa
AS
BEGIN
	
	declare @MaKhachHang2 int
	select @MaKhachHang2=MaKhachHang from taikhoanKH where TenTK=@MaKhachHang

    -- Kiểm tra nếu sản phẩm đã có trong giỏ hàng
    IF EXISTS (SELECT 1 FROM GioHang WHERE MaKhachHang = @MaKhachHang2 AND MaSP = @MaSP)
    BEGIN
        -- Xóa sản phẩm từ giỏ hàng
        DELETE FROM GioHang
        WHERE MaKhachHang = @MaKhachHang2 AND MaSP = @MaSP;

        PRINT N'Xóa sản phẩm khỏi giỏ hàng thành công!';
    END
    ELSE
    BEGIN
        PRINT N'Sản phẩm không tồn tại trong giỏ hàng!';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_giohang_getall]
AS
BEGIN
    -- Lấy tất cả dữ liệu trong bảng GioHang
    SELECT 
        gh.MaGH,
        gh.MaKhachHang,
        kh.TenKH,
        gh.MaSP,
        gh.TenSanPham,
        gh.SoLuong,
        gh.DonGia,
        gh.ThanhTien,
        gh.HinhAnh
    FROM GioHang gh
    INNER JOIN KhachHang kh ON gh.MaKhachHang = kh.MaKhachHang;
    
    PRINT N'Lấy tất cả dữ liệu trong bảng Giỏ Hàng thành công!';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_getallgiohangbyidKH]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_giohang_getallgiohangbyidKH]
    @UserID nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.MaSanPham,
        s.TenSanPham,
        s.Gia,
        s.HinhAnh,
        g.SoLuong
    FROM 
        dbo.GioHang g
    INNER JOIN 
        dbo.SanPham s ON g.MaSP = s.MaSanPham
	INNER JOIN 
        dbo.TaiKhoanKH a ON a.MaKhachHang = g.MaKhachHang
    WHERE 
        a.TenTK = @UserID;  -- Lọc theo ID khách hàng

END


GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_getalltop]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_giohang_getalltop]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.MaSanPham,
        s.TenSanPham,
        s.NoiDung,
        s.Gia,
        s.HinhAnh,
        g.SoLuong
    FROM 
        dbo.SanPham s
    INNER JOIN 
        dbo.GioHang g ON s.MaSanPham = g.MaSP
    WHERE 
        s.SanPhamTop = 1;  -- Lọc chỉ các sản phẩm top

END
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_them]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_giohang_them]
    @MaKhachHang INT,
    @MaSP INT,
    @SoLuong INT =1
AS
BEGIN
    DECLARE @DonGia DECIMAL(10, 2), @ThanhTien DECIMAL(10, 2), @HinhAnh VARCHAR(100), @TenSanPham NVARCHAR(200)

    -- Lấy thông tin sản phẩm từ bảng SanPham
    SELECT 
        @DonGia = Gia,
        @HinhAnh = HinhAnh,
        @TenSanPham = TenSanPham
    FROM 
        SanPham
    WHERE 
        MaSanPham = @MaSP;

    -- Tính thành tiền
    SET @ThanhTien = @DonGia * @SoLuong;

    -- Thêm vào giỏ hàng
    INSERT INTO GioHang (MaKhachHang, MaSP, SoLuong, DonGia, ThanhTien, HinhAnh, TenSanPham)
    VALUES (@MaKhachHang, @MaSP, @SoLuong, @DonGia, @ThanhTien, @HinhAnh, @TenSanPham);

    -- Thông báo thêm thành công
    PRINT 'Thêm sản phẩm vào giỏ hàng thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_themgiohang]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_giohang_themgiohang]  
    @UserID nvarchar(50),  
    @MaSP INT  
  --  @SoLuongMoi INT -- Số lượng sản phẩm muốn cập nhật thêm vào giỏ  
AS  
BEGIN  
   
   DECLARE @MaKhachHang int,@SoLuongTonKho INT  
      -- Lấy số lượng tồn kho của sản phẩm từ bảng SoLuong  
    SELECT @SoLuongTonKho = SoLuong  
    FROM SoLuong  
    WHERE MaSanPham = @MaSP  
  
 select @MaKhachHang=MaKhachHang from TaiKhoanKH where TenTK=@UserID  
 if exists( select * from GIoHang where MaKhachHang=@MaKhachHang and MaSP=@MaSP)  
 begin  
  
  update giohang set SoLuong=SoLuong+1,ThanhTien=DonGIa*(Soluong+1)  
  where MaKhachHang=@MaKhachHang and MaSP=@MaSP  
  
 end  
 else  
 begin  
  insert into  GioHang  
  select @MaKhachHang,@MaSP,1,Gia,Gia*1,HinhAnh,TenSanPham from SanPham where MaSanPham=@Masp  
  
 end  

  
END;  
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- exec sp_giohang_update @UserID=N'test',@MaSP=N'1'
--2.chỉnh sửa số lượng
CREATE PROCEDURE [dbo].[sp_giohang_update]
    @UserID nvarchar(50),
    @MaSP INT
  --  @SoLuongMoi INT -- Số lượng sản phẩm muốn cập nhật thêm vào giỏ
AS
BEGIN
    DECLARE @SoLuongTonKho INT, @SoLuongTrongGio INT,@MaKhachHang int;

	select @MaKhachHang=MaKhachHang from TaiKhoanKH where TenTK=@UserID
    -- Lấy số lượng tồn kho của sản phẩm từ bảng SoLuong
    SELECT @SoLuongTonKho = SoLuong
    FROM SoLuong
    WHERE MaSanPham = @MaSP;

    -- Lấy số lượng hiện tại của sản phẩm trong giỏ hàng
    SELECT @SoLuongTrongGio = SoLuong
    FROM GioHang
    WHERE MaKhachHang = @MaKhachHang AND MaSP = @MaSP;

    -- Kiểm tra nếu sản phẩm đã tồn tại trong giỏ hàng
    IF @SoLuongTrongGio IS NOT NULL
    BEGIN


        -- Nếu số lượng mới cộng với số lượng trong giỏ không vượt quá số lượng tồn kho
        IF (@SoLuongTrongGio) <= @SoLuongTonKho
        BEGIN
            -- Cập nhật số lượng sản phẩm trong giỏ hàng
            UPDATE GioHang
            SET SoLuong = SoLuong + 1,
                ThanhTien = DonGia * (SoLuong + 1)
            WHERE MaKhachHang = @MaKhachHang AND MaSP = @MaSP;

            PRINT N'Cập nhật số lượng thành công!';
        END
        ELSE
        BEGIN
            PRINT N'Không thể cập nhật, số lượng yêu cầu vượt quá số lượng tồn kho.';
        END
    END
    ELSE
    BEGIN
        PRINT N'Sản phẩm chưa có trong giỏ hàng.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_giohang_updategiam]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_giohang_updategiam]
    @UserID nvarchar(50),
    @MaSP INT
  --  @SoLuongMoi INT -- Số lượng sản phẩm muốn cập nhật thêm vào giỏ
AS
BEGIN
    DECLARE @SoLuongTonKho INT, @SoLuongTrongGio INT,@MaKhachHang int;

	select @MaKhachHang=MaKhachHang from TaiKhoanKH where TenTK=@UserID
    -- Lấy số lượng tồn kho của sản phẩm từ bảng SoLuong
    SELECT @SoLuongTonKho = SoLuong
    FROM SoLuong
    WHERE MaSanPham = @MaSP;

    -- Lấy số lượng hiện tại của sản phẩm trong giỏ hàng
    SELECT @SoLuongTrongGio = SoLuong
    FROM GioHang
    WHERE MaKhachHang = @MaKhachHang AND MaSP = @MaSP;

    -- Kiểm tra nếu sản phẩm đã tồn tại trong giỏ hàng
    IF @SoLuongTrongGio IS NOT NULL
    BEGIN


        -- Nếu số lượng mới cộng với số lượng trong giỏ không vượt quá số lượng tồn kho
        IF (@SoLuongTrongGio) <= @SoLuongTonKho
        BEGIN
            -- Cập nhật số lượng sản phẩm trong giỏ hàng
            UPDATE GioHang
            SET SoLuong = SoLuong - 1,
                ThanhTien = DonGia * (SoLuong - 1)
            WHERE MaKhachHang = @MaKhachHang AND MaSP = @MaSP;

			update GioHang
			 SET SoLuong =  1,
                ThanhTien = DonGia * 1
            WHERE MaKhachHang = @MaKhachHang AND MaSP = @MaSP and SoLuong=0



            PRINT N'Cập nhật số lượng thành công!';
        END
        ELSE
        BEGIN
            PRINT N'Không thể cập nhật, số lượng yêu cầu vượt quá số lượng tồn kho.';
        END
    END
    ELSE
    BEGIN
        PRINT N'Sản phẩm chưa có trong giỏ hàng.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadon_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_hoadon_create]
    @MaKhachHang INT,
    @NgayBan DATETIME2,
    @TrangThai NVARCHAR(100)
AS
BEGIN
    BEGIN TRY
        -- Bắt đầu một giao dịch
        BEGIN TRANSACTION;

        -- Kiểm tra xem khách hàng có tồn tại không
        IF NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKhachHang = @MaKhachHang)
        BEGIN
            -- Nếu không tồn tại, rollback và báo lỗi
            THROW 50001, N'Khách hàng không tồn tại.', 1;
        END

        -- Nếu tồn tại, tạo hóa đơn bán
        INSERT INTO HoaDonBan (MaKhachHang, NgayBan, TrangThai)
        VALUES (@MaKhachHang, @NgayBan, @TrangThai);

        -- Commit giao dịch
        COMMIT TRANSACTION;

        -- Thông báo hóa đơn đã tạo thành công
        PRINT N'Hóa đơn được tạo thành công.';
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, rollback giao dịch và in lỗi
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadon_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_hoadon_delete]
    @MaHoaDonBan INT
AS
BEGIN
    BEGIN TRY
        -- Bắt đầu một giao dịch
        BEGIN TRANSACTION;

        -- Kiểm tra xem hóa đơn có tồn tại không
        IF NOT EXISTS (SELECT 1 FROM HoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan)
        BEGIN
            -- Nếu không tồn tại, rollback và báo lỗi
            THROW 50001, N'Mã hóa đơn không tồn tại.', 1;
        END

        -- Xóa chi tiết hóa đơn trước
        DELETE FROM ChiTietHoaDonBan
        WHERE MaHoaDonBan = @MaHoaDonBan;

        -- Xóa hóa đơn
        DELETE FROM HoaDonBan
        WHERE MaHoaDonBan = @MaHoaDonBan;

        -- Commit giao dịch
        COMMIT TRANSACTION;

        -- Thông báo xóa thành công
        PRINT N'Hóa đơn và các chi tiết liên quan đã được xóa thành công.';
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, rollback giao dịch và in lỗi
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonban_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_hoadonban_getall]
AS
BEGIN
    BEGIN TRY
        -- Lấy danh sách hóa đơn và chi tiết hóa đơn
        SELECT 
            h.MaHoaDonBan,
            h.NgayBan,
            h.TrangThai,
			h.MaKhachHang
         --   c.MaChiTietHoaDonBan,
         --   c.MaSanPham,
         --   c.SoLuongBan,
        --    c.DonGiaBan
        FROM 
            HoaDonBan h
        --LEFT JOIN 
        --    ChiTietHoaDonBan c ON h.MaHoaDonBan = c.MaHoaDonBan
        ORDER BY 
            h.MaHoaDonBan;
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hiển thị thông báo lỗi
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonban_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_hoadonban_getallbyid]
    @MaHoaDonBan INT
AS
BEGIN
    BEGIN TRY
        -- Lấy thông tin hóa đơn và chi tiết hóa đơn theo mã
        SELECT 
            h.MaHoaDonBan,
            h.NgayBan,
            h.TrangThai,
            c.MaChiTietHoaDonBan,
            c.MaSanPham,
            c.SoLuongBan,
            c.DonGiaBan
        FROM 
            HoaDonBan h
        LEFT JOIN 
            ChiTietHoaDonBan c ON h.MaHoaDonBan = c.MaHoaDonBan
        WHERE 
            h.MaHoaDonBan = @MaHoaDonBan;

        -- Kiểm tra xem có hóa đơn nào được trả về không
        IF @@ROWCOUNT = 0
        BEGIN
            THROW 50001, N'Mã hóa đơn không tồn tại.', 1;
        END
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hiển thị thông báo lỗi
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonban_getallbyiduser]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_hoadonban_getallbyiduser]
@Username nvarchar(50)
as
begin
	
	select a.MaHoadonban AS MaHoaDon,NgayBan as NgayDat,TrangThai,SUM(SOLuongBan*DOnGiaBan) as TongTien from HoaDonBan a
	inner join ChiTietHoaDonBan b on a.mahoadonban=b.mahoadonban
	inner join taikhoankh c on a.makhachhang=c.MaKhachhang
	where c.TenTK=@Username
	group by a.MaHoadonban,NgayBan ,TrangThai


end
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonban_getalltt]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_hoadonban_getalltt]
AS
BEGIN
    BEGIN TRY
        -- Lấy danh sách hóa đơn và chi tiết hóa đơn
        SELECT top 5 
            h.MaHoaDonBan,
            h.TrangThai,
			c1.TongTien,
			c.TenKH as TenKhachHang
         --   c.MaChiTietHoaDonBan,
         --   c.MaSanPham,
         --   c.SoLuongBan,
        --    c.DonGiaBan
        FROM HoaDonBan h
        inner JOIN KhachHang c ON h.MaKhachHang = c.MaKhachHang
		outer apply (
			
			select SUm(SoLuongBan*DonGiaBan) as TongTien from ChiTietHoaDonBan where MaHoaDonBan=h.MaHoaDonBan
			
				
		)C1
        ORDER BY 
            h.MaHoaDonBan

    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hiển thị thông báo lỗi
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonban_getmax]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_hoadonban_getmax]  
as  
begin  
 select c.TenKH,c.DiaChiKH,a.NgayBan as NgayLap,b.HinhAnh  
 ,d.TenSanPham,b.SoLuongBan as SoLuong,b.DonGiaBan as DonGia,b.SoLuongBan*b.DonGiaBan as ThanhTien 

 from HoaDonBan a  
 inner join ChiTietHoaDonBan b on a.MaHoaDonBan=b.MaHoaDonBan  
 inner join KhachHang c on a.MaKhachHang=c.MaKhachHang  
 inner join SanPham d on b.MaSanPham=d.MaSanPham  
  where a.MaHoaDonBan = (select MAX(MaHoaDonBan) from HoaDonBan)



end
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonban_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_hoadonban_update]
    @MaHoaDonBan INT,
    @TrangThai NVARCHAR(100)
AS
BEGIN
    BEGIN TRY
        -- Bắt đầu một giao dịch
        BEGIN TRANSACTION;

        -- Kiểm tra xem hóa đơn có tồn tại không
        IF NOT EXISTS (SELECT 1 FROM HoaDonBan WHERE MaHoaDonBan = @MaHoaDonBan)
        BEGIN
            -- Nếu không tồn tại, rollback và báo lỗi
            THROW 50001, N'Mã hóa đơn không tồn tại.', 1;
        END

        -- Cập nhật trạng thái của hóa đơn
        UPDATE HoaDonBan
        SET TrangThai = @TrangThai
        WHERE MaHoaDonBan = @MaHoaDonBan;

        -- Commit giao dịch
        COMMIT TRANSACTION;

        -- Thông báo cập nhật thành công
        PRINT N'Trạng thái hóa đơn đã được cập nhật thành công.';
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, rollback giao dịch và in lỗi
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonhap_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_hoadonhap_create]
    @NgayNhap DATETIME,
    @TrangThai NVARCHAR(100),
    @MaNhaCungCap INT,
    @ChiTietHoaDon AS NVARCHAR(MAX) -- Dùng JSON để truyền chi tiết sản phẩm
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Thêm hóa đơn nhập
        INSERT INTO HoaDonNhap (NgayNhap, TrangThai, MaNhaCungCap)
        VALUES (@NgayNhap, @TrangThai, @MaNhaCungCap);

        -- Lấy MaHoaDonNhap vừa được thêm
        DECLARE @MaHoaDonNhap INT;
        SET @MaHoaDonNhap = SCOPE_IDENTITY();

        -- Đọc chi tiết hóa đơn từ JSON
        DECLARE @ChiTietHoaDonTable TABLE (
            MaSanPham INT,
            SoLuongNhap INT,
            GiaNhap DECIMAL(10, 2)
        );

        -- Thêm dữ liệu vào bảng tạm từ JSON
        INSERT INTO @ChiTietHoaDonTable (MaSanPham, SoLuongNhap, GiaNhap)
        SELECT 
            MaSanPham,
            SoLuongNhap,
            GiaNhap
        FROM OPENJSON(@ChiTietHoaDon)
        WITH (
            MaSanPham INT '$.MaSanPham',
            SoLuongNhap INT '$.SoLuongNhap',
            GiaNhap DECIMAL(10, 2) '$.GiaNhap'
        );

        -- Thêm chi tiết hóa đơn nhập và cập nhật bảng GiaNhap
        DECLARE @MaSanPham INT;
        DECLARE @SoLuongNhap INT;
        DECLARE @GiaNhap DECIMAL(10, 2);

        DECLARE cur CURSOR FOR
        SELECT MaSanPham, SoLuongNhap, GiaNhap
        FROM @ChiTietHoaDonTable;

        OPEN cur;
        FETCH NEXT FROM cur INTO @MaSanPham, @SoLuongNhap, @GiaNhap;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Thêm chi tiết hóa đơn nhập
            INSERT INTO ChiTietHoaDonNhap (MaHoaDonNhap, MaSanPham, SoLuongNhap)
            VALUES (@MaHoaDonNhap, @MaSanPham, @SoLuongNhap);

            -- Cập nhật giá nhập cho sản phẩm trong bảng GiaNhap
            IF EXISTS (SELECT 1 FROM GiaNhap WHERE MaSanPham = @MaSanPham)
            BEGIN
                UPDATE GiaNhap
                SET GiaNhap = @GiaNhap
                WHERE MaSanPham = @MaSanPham;
            END
            ELSE
            BEGIN
                INSERT INTO GiaNhap (MaSanPham, GiaNhap)
                VALUES (@MaSanPham, @GiaNhap);
            END;

            FETCH NEXT FROM cur INTO @MaSanPham, @SoLuongNhap, @GiaNhap;
        END;

        CLOSE cur;
        DEALLOCATE cur;

        -- Xác nhận giao dịch
        COMMIT TRANSACTION;
        PRINT N'Hóa đơn nhập và chi tiết đã được thêm thành công.';

    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hủy giao dịch
        ROLLBACK TRANSACTION;
        PRINT N'Có lỗi xảy ra trong quá trình thêm hóa đơn nhập.';
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonnhap_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_hoadonnhap_delete]
    @MaHoaDonNhap INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Xóa các chi tiết hóa đơn nhập liên quan
        DELETE FROM ChiTietHoaDonNhap
        WHERE MaHoaDonNhap = @MaHoaDonNhap;

        -- Xóa hóa đơn nhập
        DELETE FROM HoaDonNhap
        WHERE MaHoaDonNhap = @MaHoaDonNhap;

        -- Cam kết giao dịch
        COMMIT TRANSACTION;

        -- Trả về thông báo thành công
        SELECT N'Hóa đơn nhập và các chi tiết đã được xóa thành công.' AS Message;
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi xảy ra, rollback giao dịch
        ROLLBACK TRANSACTION;

        -- Trả về thông báo lỗi
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonnhap_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_hoadonnhap_getall]
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy ra toàn bộ hóa đơn nhập và chi tiết hóa đơn nhập
    SELECT 
        hd.MaHoaDonNhap,
        hd.NgayNhap,
        hd.TrangThai,
        hd.MaNhaCungCap,
        ctn.MaChiTietHoaDon,
        ctn.MaSanPham,
        ctn.SoLuongNhap,
        g.GiaNhap -- Nếu có bảng GiaNhap liên quan
    FROM 
        HoaDonNhap hd
    LEFT JOIN 
        ChiTietHoaDonNhap ctn ON hd.MaHoaDonNhap = ctn.MaHoaDonNhap
    LEFT JOIN 
        GiaNhap g ON ctn.MaSanPham = g.MaSanPham -- Nếu cần thêm giá nhập từ bảng GiaNhap
    ORDER BY 
        hd.MaHoaDonNhap;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonnhap_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_hoadonnhap_getallbyid]
    @MaHoaDonNhap INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy ra hóa đơn nhập và chi tiết hóa đơn nhập theo mã hóa đơn
    SELECT 
        hd.MaHoaDonNhap,
        hd.NgayNhap,
        hd.TrangThai,
        hd.MaNhaCungCap,
        ctn.MaChiTietHoaDon,
        ctn.MaSanPham,
        ctn.SoLuongNhap,
        g.GiaNhap -- Nếu có bảng GiaNhap liên quan
    FROM 
        HoaDonNhap hd
    LEFT JOIN 
        ChiTietHoaDonNhap ctn ON hd.MaHoaDonNhap = ctn.MaHoaDonNhap
    LEFT JOIN 
        GiaNhap g ON ctn.MaSanPham = g.MaSanPham -- Nếu cần thêm giá nhập từ bảng GiaNhap
    WHERE 
        hd.MaHoaDonNhap = @MaHoaDonNhap
    ORDER BY 
        ctn.MaChiTietHoaDon; -- Sắp xếp theo mã chi tiết hóa đơn
END
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonnhap_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_hoadonnhap_update]
    @MaHoaDonNhap INT,
    @TrangThai NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem hóa đơn nhập có tồn tại không
    IF EXISTS (SELECT 1 FROM HoaDonNhap WHERE MaHoaDonNhap = @MaHoaDonNhap)
    BEGIN
        -- Cập nhật trạng thái của hóa đơn nhập
        UPDATE HoaDonNhap
        SET TrangThai = @TrangThai
        WHERE MaHoaDonNhap = @MaHoaDonNhap;

        -- Trả về số dòng đã cập nhật
        SELECT @@ROWCOUNT AS RowsAffected;
    END
    ELSE
    BEGIN
        -- Nếu không tồn tại hóa đơn nhập, trả về thông báo lỗi
        RAISERROR(N'Hóa đơn nhập không tồn tại.', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_KhachHang_create]
@TenKH nvarchar (200),
				@SDTKH varchar(10),
				@Email varchar(200),
				@DiaChiKH nvarchar(200)
as
begin
	insert into KhachHang values(@TenKH, @SDTKH, @Email, @DiaChiKH)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHang_delete]  
    @MaKhachHang INT  
AS  
BEGIN  
    -- Kiểm tra xem mã khách hàng có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKhachHang = @MaKhachHang)  
    BEGIN  
        SELECT N'Mã khách hàng không tồn tại' AS ThongBao;  
        RETURN;
    END  

    -- Kiểm tra xem khách hàng có hóa đơn nào không
    IF EXISTS (SELECT 1 FROM HoaDonBan WHERE MaKhachHang = @MaKhachHang)  
    BEGIN  
        SELECT N'Không thể xóa vì khách hàng này đã có hóa đơn bán' AS ThongBao;  
        RETURN;
    END  

    -- Thực hiện xóa khách hàng
    DELETE FROM KhachHang WHERE MaKhachHang = @MaKhachHang;  
    SELECT N'Đã xóa thành công khách hàng với mã ' + CAST(@MaKhachHang AS NVARCHAR(10)) AS ThongBao;  
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_getall]
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy toàn bộ danh sách khách hàng
    SELECT 
        MaKhachHang, 
        TenKH, 
        SDTKH, 
        Email, 
        DiaChiKH
    FROM dbo.KhachHang;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_KhachHang_getallbyid]
@MaKhachHang int
as
begin
	select * from KhachHang
	if exists (select * from KhachHang where MaKhachHang = @MaKhachHang)
	begin
		select '';
	end
	else 
	begin
		select N'Mã khách hàng không tồn tại'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_getallbyidtheouser]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[sp_KhachHang_getallbyidtheouser]
 @username nvarchar(50)
 as 
 begin
		select * from KhachHang a
		inner join taikhoankh b on a.makhachhang=b.makhachhang
		where b.TenTK=@username

		if exists (select * from KhachHang a
		inner join taikhoankh b on a.makhachhang=b.makhachhang
		where b.TenTK=@username)
		begin
			select '';
		end

		else
		begin
			select 'khong co makh'
		end

 end
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_update]
    @TenKH NVARCHAR(200) = NULL,
    @SDTKH VARCHAR(10) = NULL,
    @Email VARCHAR(200) = NULL,
    @DiaChiKH NVARCHAR(300) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem khách hàng có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM [dbo].[KhachHang] WHERE [TenKH] = @TenKH OR [SDTKH] = @SDTKH OR [Email] = @Email)
    BEGIN
        RAISERROR(N'Không tìm thấy khách hàng với thông tin đã cung cấp.', 16, 1);
        RETURN;
    END

    -- Cập nhật thông tin khách hàng
    UPDATE [dbo].[KhachHang]
    SET 
        [TenKH] = COALESCE(@TenKH, [TenKH]),
        [SDTKH] = COALESCE(@SDTKH, [SDTKH]),
        [Email] = COALESCE(@Email, [Email]),
        [DiaChiKH] = COALESCE(@DiaChiKH, [DiaChiKH])
    WHERE 
        [TenKH] = @TenKH OR 
        [SDTKH] = @SDTKH OR 
        [Email] = @Email;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_updatetheouser]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_KhachHang_updatetheouser]  
    @TenKH NVARCHAR(200) = NULL,  
    @SDTKH VARCHAR(100) = NULL,  
    @Email VARCHAR(200) = NULL,  
    @DiaChiKH NVARCHAR(300) = NULL  ,
	@MaKH NVARCHAR(300) = NULL  
AS  
BEGIN  
    SET NOCOUNT ON;  
    
    -- Cập nhật thông tin khách hàng  
    UPDATE a 
    SET   
        [TenKH] = COALESCE(@TenKH, [TenKH]),  
        [SDTKH] = COALESCE(@SDTKH, [SDTKH]),  
        [Email] = COALESCE(@Email, [Email]),  
        [DiaChiKH] = COALESCE(@DiaChiKH, [DiaChiKH])  
    from khachhang a
	inner join taikhoankh b on a.Makhachhang=b.MaKhachHang
	where b.TenTk=@MaKH


END  



GO
/****** Object:  StoredProcedure [dbo].[sp_loginKH]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_loginKH]
@UserName nvarchar(50),
@Pass nvarchar(50)
as
begin
	if exists(select * from taikhoankh where  TenTK=@UserName and MatKhau=@Pass)
	begin
		select ''
	end
	else
	begin
		select N'tài khoản hoặc mật khẩu không đúng'

	end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhacungcap_create]  
    @TenNhaCungCap NVARCHAR(500),  
    @DiaChiNhaCungCap NVARCHAR(500),  
    @SDTNhaCungCap VARCHAR(10),  
    @EmailNhaCungCap VARCHAR(200)  
AS  
BEGIN  
    -- Kiểm tra xem tên nhà cung cấp đã tồn tại chưa  
    IF EXISTS(SELECT 1 FROM NhaCungCap WHERE TenNhaCungCap = @TenNhaCungCap)  
    BEGIN  
        -- Nếu nhà cung cấp đã tồn tại, thông báo lỗi  
        RAISERROR(N'Nhà cung cấp đã tồn tại.', 16, 1);  
        RETURN;  
    END  
  
    -- Thêm mới nhà cung cấp vào bảng  
    INSERT INTO NhaCungCap (TenNhaCungCap, DiaChiNhaCungCap, SDTNhaCungCap, EmailNhaCungCap)  
    VALUES (@TenNhaCungCap, @DiaChiNhaCungCap, @SDTNhaCungCap, @EmailNhaCungCap);  
  
  select ''
    -- Trả về ID của nhà cung cấp mới được thêm  
   -- SELECT SCOPE_IDENTITY() AS MaNhaCungCap;  
END  
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhacungcap_delete]
    @MaNhaCungCap INT  -- ID của nhà cung cấp cần xóa
AS
BEGIN
    -- Kiểm tra xem nhà cung cấp có tồn tại không
    IF NOT EXISTS(SELECT 1 FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap)
    BEGIN
        -- Nếu nhà cung cấp không tồn tại, thông báo lỗi
        RAISERROR(N'Nhà cung cấp không tồn tại.', 16, 1);
        RETURN;
    END

    -- Kiểm tra xem nhà cung cấp có ràng buộc dữ liệu với các bảng khác không (ví dụ: HoaDonNhap)
    IF EXISTS(SELECT 1 FROM HoaDonNhap WHERE MaNhaCungCap = @MaNhaCungCap)
    BEGIN
        -- Nếu nhà cung cấp có liên kết với hóa đơn nhập, không cho phép xóa
        RAISERROR(N'Nhà cung cấp có ràng buộc dữ liệu, không thể xóa.', 16, 1);
        RETURN;
    END

    -- Xóa nhà cung cấp
    DELETE FROM NhaCungCap
    WHERE MaNhaCungCap = @MaNhaCungCap;

    -- Thông báo thành công
    PRINT N'Xóa nhà cung cấp thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhacungcap_getall]
AS
BEGIN
    -- Lấy tất cả thông tin từ bảng NhaCungCap
    SELECT 
        MaNhaCungCap,
        TenNhaCungCap,
        DiaChiNhaCungCap,
        SDTNhaCungCap,
        EmailNhaCungCap
    FROM 
        NhaCungCap;

    -- Thông báo nếu cần
    PRINT N'Lấy danh sách tất cả nhà cung cấp thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhacungcap_getallbyid]
    @MaNhaCungCap INT  -- ID của nhà cung cấp cần lấy thông tin
AS
BEGIN
    -- Kiểm tra xem nhà cung cấp có tồn tại không
    IF NOT EXISTS(SELECT 1 FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap)
    BEGIN
        -- Nếu nhà cung cấp không tồn tại, thông báo lỗi
        RAISERROR(N'Nhà cung cấp không tồn tại.', 16, 1);
        RETURN;
    END

    -- Lấy thông tin của nhà cung cấp theo mã
    SELECT 
        MaNhaCungCap,
        TenNhaCungCap,
        DiaChiNhaCungCap,
        SDTNhaCungCap,
        EmailNhaCungCap
    FROM 
        NhaCungCap
    WHERE 
        MaNhaCungCap = @MaNhaCungCap;

    -- Thông báo thành công
    PRINT N'Lấy thông tin nhà cung cấp thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_getallbyname]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhacungcap_getallbyname]
    @TenNhaCungCap NVARCHAR(500)  -- Tên hoặc một phần tên nhà cung cấp cần tìm
AS
BEGIN
    -- Kiểm tra nếu tên tìm kiếm không rỗng hoặc null
    IF @TenNhaCungCap IS NULL OR LTRIM(RTRIM(@TenNhaCungCap)) = ''
    BEGIN
        RAISERROR(N'Vui lòng nhập tên nhà cung cấp hợp lệ để tìm kiếm.', 16, 1);
        RETURN;
    END

    -- Tìm các nhà cung cấp có chứa chuỗi tìm kiếm trong tên
    SELECT 
        MaNhaCungCap,
        TenNhaCungCap,
        DiaChiNhaCungCap,
        SDTNhaCungCap,
        EmailNhaCungCap
    FROM 
        NhaCungCap
    WHERE 
        TenNhaCungCap LIKE '%' + @TenNhaCungCap + '%';

    -- Thông báo nếu tìm kiếm thành công
    PRINT N'Tìm kiếm nhà cung cấp theo tên thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhacungcap_update]
    @MaNhaCungCap INT,  -- ID của nhà cung cấp cần cập nhật
    @TenNhaCungCap NVARCHAR(500),
    @DiaChiNhaCungCap NVARCHAR(500),
    @SDTNhaCungCap VARCHAR(10),
    @EmailNhaCungCap VARCHAR(200)
AS
BEGIN
    -- Kiểm tra xem nhà cung cấp có tồn tại không
    IF NOT EXISTS(SELECT 1 FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap)
    BEGIN
        -- Nếu nhà cung cấp không tồn tại, thông báo lỗi
        RAISERROR('Nhà cung cấp không tồn tại.', 16, 1);
        RETURN;
    END

    -- Kiểm tra xem tên nhà cung cấp mới có bị trùng với nhà cung cấp khác không
    IF EXISTS(SELECT 1 FROM NhaCungCap WHERE TenNhaCungCap = @TenNhaCungCap AND MaNhaCungCap != @MaNhaCungCap)
    BEGIN
        -- Nếu tên nhà cung cấp bị trùng, thông báo lỗi
        RAISERROR(N'Tên nhà cung cấp đã tồn tại cho nhà cung cấp khác.', 16, 1);
        RETURN;
    END

    -- Cập nhật thông tin nhà cung cấp
    UPDATE NhaCungCap
    SET 
        TenNhaCungCap = @TenNhaCungCap,
        DiaChiNhaCungCap = @DiaChiNhaCungCap,
        SDTNhaCungCap = @SDTNhaCungCap,
        EmailNhaCungCap = @EmailNhaCungCap
    WHERE 
        MaNhaCungCap = @MaNhaCungCap;

    -- Thông báo thành công
    PRINT N'Cập nhật thông tin nhà cung cấp thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_sanpham_create] 
@MaDanhMuc int,
                @MaSanPham int, 
                @TenSanPham nvarchar(300) , 
                @NoiDung nvarchar(300),
                @Gia decimal(10,2),
                @SanPhamTop bit, 
                @SanPhamUuDai bit,
				@HinhAnh varchar(500)

as
	begin

	if exists(select * from DanhMuc where MaDanhMuc=@MaDanhMuc)
	begin
			insert into SanPham values(@MaSanPham,@MaDanhMuc, @TenSanPham,@NoiDung,@Gia,@HinhAnh,@SanPhamTop, @SanPhamUuDai)
			SELECT ''
	end
	else
	begin
		SELECT N'Mã Danh mục không tồn tại'
	
	end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_sanpham_delete]
                @MaSanPham int 
                

as
	begin

	if exists (select * from ChiTietHoaDonBan where MaSanPham= @MaSanPham)
	begin
		select 'Sản phẩm đã có trong hóa đơn không thể xóa'
		return;
	end
	
	if not exists (select * from SanPham where MaSanPham= @MaSanPham)
	begin
		select N'Mã sản phẩm không tồn tại'
		return;
	end

	delete ChiTietSanPham where MaSanPham = @MaSanPham
	delete SanPham where MaSanPham = @MaSanPham
	select ''

end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sanpham_getall]

as

begin
	select MaDanhMuc, MaSanPham,  TenSanPham, NoiDung, Gia, HinhAnh, SanPhamTop, SanPhamUuDai   from SanPham
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_getalladmin]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sanpham_getalladmin]

as

begin
	select b.TenDanhMuc as DanhMuc, a.MaSanPham,  TenSanPham, c.SoLuong, Gia, HinhAnh, case when isnull(c.SoLuong,0)=0 then N'Hết hàng' else N'Còn hàng' end as TinhTrang   from SanPham a
	left join soluong c on a.MaSanPham=c.MaSanPham
	inner join DanhMuc b on a.MaDanhMuc=b.MaDanhMuc


end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_sanpham_getallbyid]
@MaSanPham int
as
begin
if exists (select * from SanPham where MaSanPham = @MaSanPham)
	begin
		select * from SanPham where MaSanPham = @MaSanPham
		select ''
	end
	else 
	begin
		select N'Mã sản phẩm không tồn tại'
	end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_getallbyidDM]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sanpham_getallbyidDM] 
@MaDanhMuc int
as
begin
	select * from SanPham where MaDanhMuc =@MaDanhMuc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_getallbyname]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_sanpham_getallbyname]
@TenSanPham nvarchar(100)
as
begin	
	SELECT * 
    FROM SanPham s
    WHERE s.TenSanPham LIKE '%' + @TenSanPham + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_getalltop]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sanpham_getalltop]

as

begin
	select MaDanhMuc, MaSanPham,  TenSanPham, NoiDung, Gia, HinhAnh, SanPhamTop, SanPhamUuDai   from SanPham where SanPHamTOp=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_sanpham_update]   
@MaDanhMuc int,  
                @MaSanPham int,   
                @TenSanPham nvarchar(300) ,   
                @NoiDung nvarchar(300),  
                @Gia decimal(10,2),  
                @SanPhamTop bit,   
                @SanPhamUuDai bit,  
    @HinhAnh varchar(500)  
  
as  
 begin  
 if exists (select * from SanPham where MaSanPham = @MaSanPham)  
 begin  
   SELECT ''  
 end  
 else  
 begin  
  SELECT N'Mã Sản Phẩm không tồn tại'  
 end  
  
   
 if exists(select * from DanhMuc where MaDanhMuc=@MaDanhMuc)  
 begin  
   SELECT ''  
 end  
 else  
 begin  
  SELECT N'Mã Danh Mục không tồn tại'  
 end  
 update SanPham set MaDanhMuc = @MaDanhMuc, TenSanPham = @TenSanPham, NoiDung = @NoiDung, Gia = @Gia where MaSanPham = @MaSanPham  
  
end  

GO
/****** Object:  StoredProcedure [dbo].[sp_soluong_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_soluong_create]
    @MaSanPham INT,
    @SoLuongSP INT
AS
BEGIN
    -- Kiểm tra sản phẩm có tồn tại không
    IF EXISTS (SELECT 1 FROM SanPham WHERE MaSanPham = @MaSanPham)
    BEGIN
        -- Thêm số lượng vào bảng SoLuong
        INSERT INTO SoLuong (MaSanPham, SoLuong)
        VALUES (@MaSanPham, @SoLuongSP);
        
        PRINT N'Thêm số lượng thành công!';
    END
    ELSE
    BEGIN
        -- Nếu sản phẩm không tồn tại
        PRINT N'Lỗi: Sản phẩm không tồn tại!';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_soLuong_getall]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_soLuong_getall]
AS
BEGIN
    SELECT 
        sp.MaSanPham,
        sp.TenSanPham,
        sl.SoLuong
    FROM 
        SanPham sp
    LEFT JOIN 
        SoLuong sl ON sp.MaSanPham = sl.MaSanPham;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_soluong_getallbyid]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_soluong_getallbyid]
    @MaSanPham INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem mã sản phẩm có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM dbo.SoLuong WHERE MaSanPham = @MaSanPham)
    BEGIN
        RAISERROR('Không tìm thấy thông tin số lượng cho sản phẩm với mã %d.', 16, 1, @MaSanPham);
        RETURN;
    END

    -- Lấy thông tin số lượng sản phẩm theo mã sản phẩm
    SELECT 
        sl.MaSanPham,
        sl.SoLuong
    FROM dbo.SoLuong sl
    WHERE sl.MaSanPham = @MaSanPham;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_soluong_getalltop]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_soluong_getalltop]
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy số lượng lớn nhất
    DECLARE @MaxSoLuong INT;

    SELECT @MaxSoLuong = MAX(SoLuong)
    FROM dbo.SoLuong;

    -- Lấy thông tin sản phẩm có số lượng nhiều nhất
    SELECT 
        sl.MaSanPham,
        sl.SoLuong,
        sp.TenSanPham,
        sp.Gia
    FROM dbo.SoLuong sl
    JOIN dbo.SanPham sp ON sl.MaSanPham = sp.MaSanPham
    WHERE sl.SoLuong = @MaxSoLuong;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_soluong_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_soluong_update]
    @MaSanPham INT,
    @SoLuongSP INT
AS
BEGIN
    -- Kiểm tra sản phẩm có tồn tại trong bảng SoLuong không
    IF EXISTS (SELECT 1 FROM SoLuong WHERE MaSanPham = @MaSanPham)
    BEGIN
        -- Cập nhật số lượng sản phẩm
        UPDATE SoLuong
        SET SoLuong = @SoLuongSP
        WHERE MaSanPham = @MaSanPham;

        PRINT 'Cập nhật số lượng thành công!';
    END
    ELSE
    BEGIN
        -- Nếu sản phẩm không tồn tại
        PRINT 'Lỗi: Sản phẩm không tồn tại trong bảng SoLuong!';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_themhoadonkh]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themhoadonkh]    
 @HoaDonXML xml    
 as    
 begin    
    
   declare @iDoc int            
   Exec sp_xml_preparedocument @iDoc output,@HoaDonXML    
   select  MaKhachHang,MaSanPham,SoLuongBan,DonGiaBan into #temp1    
   from openxml(@iDoc,'Root/SDT')    
   with(MaKhachHang nvarchar(50),MaSanPham nvarchar(50),SoLuongBan int,DonGiaBan decimal(10,2) )    
    
  
  update a set a.MaKhachHang=b.MaKhachHang  
  from #temp1 a   
  inner join taikhoankh b on a.MaKhachHang= b.TenTK  
   
 declare @MaKH int  
 select @MaKH=Max(MaKhachHang) from khachhang   
  
 update #temp1 set MaKhachHang=@MaKH  
 where isnull(MaKhachHang,'0')='0'  
  
   insert into  HoaDonBan     
   select distinct getdate(),N'Mua Hàng',MaKhachHang from #temp1    
    
   declare @MaHD int    
   select @MaHD=MaX(MaHoaDonBan) from HoaDonBan    
  
   insert into ChiTietHoaDonBan    
   select  @MaHD,a.MaSanPham,SoLuongBan,DonGiaBan,b.HinhAnh from #temp1 a    
   inner join SanPham b on a.MaSanPham=b.MaSanPham    
  
  --xoa sanpham do trong gio hang

  delete a
  from GIohang a
  inner join #temp1 b on a.MaKhachHang=b.MaKhachHang and a.MaSp=b.MaSanPham

  --giam so luong
  update a set a.Soluong=a.Soluong-b.SoLuongBan
  from Soluong a
  inner join #temp1 b on a.MaSanPham=b.MaSanPham
   
 end  
GO
/****** Object:  StoredProcedure [dbo].[sp_updatedanhmuc_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updatedanhmuc_create]
@MaDanhMuc int, @TenDanhMuc nvarchar(500)

as
begin 
	update DanhMuc set TenDanhMuc = @TenDanhMuc where MaDanhMuc = @MaDanhMuc
	select '';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_create]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_create]
(@user_id              varchar(50), 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          varchar(30) ,
 @image_url varchar(300) 
)
AS
    BEGIN
      INSERT INTO [user]
                (
				 	 [user_id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role    ,
					 image_url
				)
                VALUES
                (
				 @user_id               , 
				 @hoten           ,
				 @ngaysinh          ,
				 @diachi           ,
				 @gioitinh           ,
				 @email           ,
				 @taikhoan         ,
				 @matkhau           ,
				 @role ,
				 @image_url
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_user_delete]
(@user_id              varchar(50) 
)
AS
    BEGIN
		delete from [user] where user_id = @user_id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_id]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_get_by_id](@user_id VARCHAR(50))
AS
    BEGIN
        SELECT  [user_id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role      ,
					 image_url  
        FROM [user]
      where  [user_id] = @user_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_username_password]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_get_by_username_password](@taikhoan varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  [user_id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 role      ,
					 image_url  
        FROM [user]
      where  taikhoan = @taikhoan and matkhau = @matkhau ;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_search]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_search] (@page_index  INT, 
                                       @page_size   INT,
									   @hoten nvarchar(150),
									    @taikhoan varchar(30)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.user_id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role  ,
							 u.image_url  
                        INTO #Results1
                        FROM [user] AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.user_id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role     ,
							 u.image_url  
                        INTO #Results2
                        FROM [user] AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_update]    Script Date: 01-11-2024 8:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_update]
(@user_id              varchar(50), 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          varchar(30),
 @image_url         varchar(300)
)
AS
    BEGIN
   update [user] set 
				hoten= @hoten    ,     
				taikhoan= @taikhoan  ,   
				--ngaysinh= @ngaysinh          ,
				--diachi= @diachi           ,
				--gioitinh= @gioitinh           ,
				--email= @email           ,
				--matkhau = @matkhau           ,
				--role= @role ,
				image_url = @image_url 
				where user_id = @user_id;
			 
        SELECT '';
    END;
GO
USE [master]
GO
ALTER DATABASE [ShopTayCam] SET  READ_WRITE 
GO
