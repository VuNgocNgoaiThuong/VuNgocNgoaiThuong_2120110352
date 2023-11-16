-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 16, 2023 lúc 04:46 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vungocngoaithuong_2120110352`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_banner`
--

CREATE TABLE `0352_banner` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã Slider',
  `name` varchar(255) NOT NULL COMMENT 'Tên Slider',
  `link` varchar(255) NOT NULL COMMENT 'Liên kết',
  `position` varchar(100) NOT NULL COMMENT 'Vị trí',
  `image` varchar(100) NOT NULL COMMENT 'Hình ảnh',
  `sort_order` int(10) UNSIGNED NOT NULL COMMENT 'Thứ tự',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người tạo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_banner`
--

INSERT INTO `0352_banner` (`id`, `name`, `link`, `position`, `image`, `sort_order`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(7, 'Banner Mỹ Phẩm', '', 'slideshow', 'slider1.jpg', 0, '2023-11-15 07:44:14', 1, '2023-11-15 14:27:27', 6, 1),
(8, 'Banner 2', '', 'slideshow', 'slider2.jpg', 0, '2023-11-15 07:45:32', 1, '2023-11-15 07:45:32', 1, 1),
(9, 'Banner 3', '', 'slideshow', 'slider3.jpg', 0, '2023-11-15 07:45:32', 1, '2023-11-15 07:45:32', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_brand`
--

CREATE TABLE `0352_brand` (
  `id` int(11) NOT NULL COMMENT 'Mã Loại',
  `name` varchar(255) NOT NULL COMMENT 'Tên loại SP',
  `slug` varchar(255) NOT NULL COMMENT 'SLug Loại SP',
  `sort_order` int(11) NOT NULL DEFAULT 1 COMMENT 'Thứ tự',
  `image` varchar(255) DEFAULT '' COMMENT 'Hình đại diện',
  `description` varchar(255) DEFAULT NULL COMMENT 'Từ khóa SEO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) DEFAULT NULL COMMENT 'Người sửa',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_brand`
--

INSERT INTO `0352_brand` (`id`, `name`, `slug`, `sort_order`, `image`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Việt Nam', 'viet-nam', 0, '', 'Từ khóa SEO', '2020-07-03 02:06:19', 1, '2022-11-19 00:54:25', 1, 1),
(2, 'Hàn Quốc', 'han-quoc', 0, '', 'Từ khóa SEO', '2020-07-03 02:06:19', 1, '2022-11-19 00:54:31', 1, 1),
(3, 'Pháp', 'phap', 0, '', 'Từ khóa SEO', '2020-07-03 02:06:19', 1, '2023-11-15 19:21:52', 6, 1),
(4, 'Nhật Bản', 'nhat-ban', 0, '', 'Từ khóa SEO', '2020-07-03 02:06:19', 1, '2022-11-19 00:54:44', 1, 1),
(5, 'Black Rouge', 'black-rouge', 0, '', NULL, '2023-11-15 09:08:52', 0, NULL, NULL, 1),
(6, 'Pink Coco', 'pink-coo', 1, '', NULL, '2023-11-15 09:22:58', 0, NULL, NULL, 1),
(7, 'L\'Oreal Paris', 'l\'oreal-paris', 1, '', NULL, '2023-11-15 09:33:15', 0, NULL, NULL, 1),
(8, 'Focalskin', 'focalskin', 1, '', NULL, '2023-11-15 09:37:10', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_category`
--

CREATE TABLE `0352_category` (
  `id` int(11) NOT NULL COMMENT 'Mã Loại',
  `name` varchar(255) NOT NULL COMMENT 'Tên loại SP',
  `slug` varchar(255) NOT NULL COMMENT 'SLug Loại SP',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Mã cấp cha',
  `sort_order` int(11) NOT NULL COMMENT 'Thứ tự',
  `image` varchar(255) DEFAULT NULL COMMENT 'Hình đại diện',
  `description` varchar(255) NOT NULL COMMENT 'Từ khóa SEO',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Người tạo',
  `updated_at` datetime DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) DEFAULT 0 COMMENT 'Người sửa',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_category`
--

INSERT INTO `0352_category` (`id`, `name`, `slug`, `parent_id`, `sort_order`, `image`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Trang Điểm', 'trang-diem', 0, 0, '', 'Trang điểm', '2023-11-15 07:28:39', 6, '2023-11-15 07:28:39', 0, 1),
(2, 'Chăm Sóc Da', 'cham-soc-da', 0, 0, NULL, '', '2023-11-15 08:12:44', 1, '2023-11-15 08:12:44', 0, 1),
(3, 'Chăm Sóc Sức Khỏe', 'cham-so-suc-khoe', 0, 0, NULL, '', '2023-11-15 08:15:30', 1, '2023-11-15 08:15:30', 0, 1),
(4, 'Chăm Sóc Tóc', 'cham-soc-toc', 0, 0, NULL, '', '2023-11-15 08:15:42', 1, '2023-11-15 08:15:42', 0, 1),
(5, 'Trang Điểm Mặt', 'trang-diem-mat', 1, 0, NULL, '', '2023-11-15 08:26:55', 1, '2023-11-15 08:26:55', 0, 1),
(6, 'Trang Điểm Mắt', 'trang-diem-matt', 1, 0, NULL, '', '2023-11-15 08:27:08', 1, '2023-11-15 08:27:08', 0, 1),
(7, 'Trang Điểm Môi', 'trang-diem-moi', 1, 0, NULL, '', '2023-11-15 08:27:18', 1, '2023-11-15 08:27:18', 0, 1),
(8, 'Tẩy Trang', 'tay-trang', 1, 0, NULL, '', '2023-11-15 08:27:24', 1, '2023-11-15 08:27:24', 0, 1),
(9, 'Mặt Nạ', 'mat-na', 2, 0, NULL, '', '2023-11-15 08:31:15', 1, '2023-11-15 08:31:16', 0, 1),
(10, 'Làm sạch', 'lam-sach', 2, 0, NULL, '', '2023-11-15 08:31:23', 1, '2023-11-15 08:31:23', 0, 1),
(11, 'Chống Nắng', 'chong-nang', 2, 0, NULL, '', '2023-11-15 08:31:33', 1, '2023-11-15 08:31:33', 0, 1),
(12, 'Chăm Sóc Da Mặt', 'cham-soc-da-mat', 2, 0, NULL, '', '2023-11-15 08:33:09', 1, '2023-11-15 08:33:09', 0, 1),
(13, 'Chăm Sóc Tai & Mắt', 'cham-soc-tai-mat', 3, 0, NULL, '', '2023-11-15 08:33:25', 1, '2023-11-15 08:33:25', 0, 1),
(14, 'Thực Phẩm Dinh Dưỡng', 'thuc-pham-dinh-duong', 3, 0, NULL, '', '2023-11-15 08:33:56', 1, '2023-11-15 08:33:56', 0, 1),
(15, 'Chăm Sóc Chân', 'cham-soc-chan', 3, 0, NULL, '', '2023-11-15 08:34:08', 1, '2023-11-15 08:34:08', 0, 1),
(16, 'Dầu Gội', 'dau-goi', 4, 0, NULL, '', '2023-11-15 08:34:42', 1, '2023-11-15 08:34:43', 0, 1),
(17, 'Dầu Xã', 'dau-xa', 4, 0, NULL, '', '2023-11-15 08:34:50', 1, '2023-11-15 08:34:50', 0, 1),
(18, 'Dụng Cụ Tóc', 'dung-cu-toc', 4, 0, NULL, '', '2023-11-15 08:34:59', 1, '2023-11-15 08:34:59', 0, 1),
(19, 'Dưỡng Tóc/Ủ Tóc', 'duong-toc-u-toc', 4, 0, NULL, '', '2023-11-15 08:35:28', 1, '2023-11-15 21:26:07', 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_contact`
--

CREATE TABLE `0352_contact` (
  `id` int(11) NOT NULL COMMENT 'Mã liên hệ',
  `name` varchar(255) NOT NULL COMMENT 'Họ và tên',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `phone` varchar(100) NOT NULL COMMENT 'Điện thoại',
  `title` varchar(255) NOT NULL COMMENT 'Tiêu đề',
  `content` mediumtext NOT NULL COMMENT 'Chi tiết',
  `replay_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Nội dung liên hệ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày liên hệ',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Ngày trả lời',
  `updated_by` tinyint(4) DEFAULT 0 COMMENT 'Người trả lời',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Tráng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_contact`
--

INSERT INTO `0352_contact` (`id`, `name`, `email`, `phone`, `title`, `content`, `replay_id`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Nguyễn Văn An', 'nguyenvanan@gmail.com', '3545454', 'Hỏi về liên kết mua sĩ', 'Hỏi về liên kết mua sĩ', NULL, '2023-11-15 23:52:03', '2023-11-15 18:08:28', 6, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_menu`
--

CREATE TABLE `0352_menu` (
  `id` int(11) NOT NULL COMMENT 'Mã Menu',
  `name` varchar(255) NOT NULL COMMENT 'Tên Menu',
  `link` varchar(255) NOT NULL COMMENT 'Liên kết',
  `type` varchar(50) NOT NULL COMMENT 'Kiểu Menu',
  `table_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Mã trong bảng',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT 'Thứ tự',
  `position` varchar(255) NOT NULL COMMENT 'Vị trí',
  `level` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL COMMENT 'Mã cấp cha',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày Tạo',
  `created_by` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Người tạo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Người sửa',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_menu`
--

INSERT INTO `0352_menu` (`id`, `name`, `link`, `type`, `table_id`, `sort_order`, `position`, `level`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Trang chủ', 'http://localhost:81/VuNgocNgoaiThuong_2120110352/', 'custom', 0, 2, 'mainmenu', 1, 0, '2022-11-22 05:36:05', 1, '2023-07-31 23:17:16', 1, 1),
(2, 'Giới thiệu', 'index.php?option=page&cat=gioi-thieu', 'page', 39, 2, 'mainmenu', 1, 0, '2022-11-22 06:13:46', 1, '2022-11-22 06:18:22', 1, 1),
(14, 'Chăm Sóc Da', 'index.php?option=product&cat=cham-soc-da', 'category', 2, 4, 'mainmenu', 1, 0, '2022-11-22 06:14:09', 1, '2022-11-22 06:19:41', 1, 1),
(15, 'Trang Điểm', 'index.php?option=product&cat=trang-diem', 'category', 1, 3, 'mainmenu', 1, 0, '2022-11-22 06:14:09', 1, '2022-11-22 06:19:41', 1, 1),
(16, 'Giới thiệu', 'index.php?option=page&cat=gioi-thieu', 'page', 39, 1, 'footermenu', 1, 0, '2022-11-22 06:55:36', 1, '2023-11-15 00:16:46', 6, 2),
(17, 'Chính Sách Hoàn Tiền', 'index.php?option=page&cat=chinh-sach-hoan-tien', 'page', 38, 1, 'footermenu', 1, 0, '2022-11-22 06:55:36', 1, '2023-11-15 14:33:28', 6, 1),
(18, 'Chính sách bảo hành', 'index.php?option=page&cat=chinh-sach-bao-hanh', 'page', 37, 2, 'footermenu', 1, 0, '2022-11-22 06:55:36', 1, '2023-07-31 23:17:16', 1, 1),
(19, 'Chính sách đổi hàng', 'index.php?option=page&cat=chinh-sach-doi-hang', 'page', 36, 2, 'footermenu', 1, 0, '2022-11-22 06:55:36', 1, '2023-07-31 23:17:16', 1, 1),
(20, 'Quần dài nữ', 'index.php?option=product&cat=quan-dai-nu', 'category', 11, 2, 'mainmenu', 1, 0, '2023-07-31 23:16:31', 1, '2023-11-15 00:16:40', 6, 0),
(29, 'Chăm Sóc Sức Khỏe', 'index.php?option=product&cat=cham-soc-suc-khoe', 'category', 0, 5, 'mainmenu', 1, 0, '2023-11-15 11:22:14', 1, '2023-11-15 11:22:14', 1, 1),
(30, 'Chăm Sóc Tóc', 'index.php?option=product&cat=cham-soc-toc', 'category', 0, 6, 'mainmenu', 1, 0, '2023-11-15 11:25:00', 1, '2023-11-15 11:25:00', 1, 1),
(31, 'Trang Điểm Mặt', 'index.php?option=product&cat=trang-diem-mat', 'category', 0, 0, 'mainmenu', 0, 15, '2023-11-15 11:29:49', 1, '2023-11-15 11:29:49', 1, 1),
(32, 'Trang Điểm Mắt', 'index.php?option=product&cat=trang-diem-matt', 'category', 0, 0, 'mainmenu', 1, 15, '2023-11-15 11:29:49', 1, '2023-11-15 11:29:49', 1, 1),
(33, 'Trang Điểm Môi', 'index.php?option=product&cat=trang-diem-moi', 'category', 0, 0, 'mainmenu', 1, 15, '2023-11-15 11:30:59', 1, '2023-11-15 11:30:59', 1, 1),
(34, 'Tẩy Trang', 'index.php?option=product&cat=tay-trang', 'category', 0, 0, 'mainmenu', 1, 15, '2023-11-15 11:30:59', 1, '2023-11-15 11:30:59', 1, 1),
(35, 'Mặt Nạ', 'index.php?option=product&cat=mat-na', 'category', 0, 0, 'mainmenu', 0, 14, '2023-11-15 11:33:18', 1, '2023-11-15 11:33:18', 1, 1),
(36, 'Làm Sạch', 'index.php?option=product&cat=lam-sach', '', 0, 0, 'mainmenu', 0, 14, '2023-11-15 11:33:18', 1, '2023-11-15 11:33:18', 1, 1),
(37, 'Chống Nắng ', 'index.php?option=product&cat=chong-nang', 'category', 0, 0, 'mainmenu', 0, 14, '2023-11-15 11:34:07', 1, '2023-11-15 11:34:07', 1, 1),
(38, 'Chăm Sóc Da Mặt', 'index.php?option=product&cat=cham-soc-da-mat', '', 0, 0, 'mainmenu', 0, 14, '2023-11-15 11:34:07', 1, '2023-11-15 11:34:07', 1, 1),
(39, 'Chăm Sóc Tai & Mắt', 'index.php?option=product&cat=cham-soc-tai-mat', 'category', 0, 0, 'mainmenu', 0, 29, '2023-11-15 11:37:41', 1, '2023-11-15 11:37:41', 1, 1),
(40, 'Thực Phẩm Dinh Dưỡng', 'index.php?option=product&cat=thuc-pham-dinh-duong', 'category', 0, 0, 'mainmenu', 0, 29, '2023-11-15 11:37:41', 1, '2023-11-15 11:37:41', 1, 1),
(41, 'Chăm Sóc Chân', 'index.php?option=product&cat=cham-soc-chan', 'category', 0, 0, 'mainmenu', 0, 29, '2023-11-15 11:38:19', 1, '2023-11-15 11:38:19', 1, 1),
(42, 'Dầu Gội', 'index.php?option=product&cat=dau-goi', 'category', 0, 0, 'mainmenu', 0, 30, '2023-11-15 11:39:43', 1, '2023-11-15 11:39:43', 1, 1),
(43, 'Dầu Xã', 'index.php?option=product&cat=dau-xa', '', 0, 0, 'mainmenu', 0, 30, '2023-11-15 11:39:43', 1, '2023-11-15 11:39:43', 1, 1),
(44, 'Dụng Cụ Tóc', 'index.php?option=product&cat=dung-cu-toc', 'category', 0, 0, 'mainmenu', 0, 30, '2023-11-15 11:40:50', 1, '2023-11-15 11:40:50', 1, 1),
(45, 'Dưỡng Tóc/Ủ Tóc', 'index.php?option=product&cat=duong-toc-u-toc', 'category', 0, 0, 'mainmenu', 0, 30, '2023-11-15 11:40:50', 1, '2023-11-15 11:40:50', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_order`
--

CREATE TABLE `0352_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng',
  `user_id` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `deliveryaddress` varchar(255) NOT NULL COMMENT 'Địa chỉ người nhận',
  `deliveryname` varchar(100) NOT NULL COMMENT 'Tên người nhận',
  `deliveryphone` varchar(120) NOT NULL COMMENT 'Điện thoại người nhận',
  `deliveryemail` varchar(120) NOT NULL COMMENT 'Email ngươig nhận',
  `note` varchar(1000) NOT NULL COMMENT 'Code đơn hàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Ngày cập nhật',
  `updated_by` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Người cập nhật',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_order`
--

INSERT INTO `0352_order` (`id`, `user_id`, `deliveryaddress`, `deliveryname`, `deliveryphone`, `deliveryemail`, `note`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(4, 6, 'Đồng Nai', 'Thương', '098888', 'thuongvu@gmail.com', 'Không chú ý', '2023-11-15 14:17:31', '2023-11-15 14:26:56', 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_orderdetail`
--

CREATE TABLE `0352_orderdetail` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã CT Đơn hàng',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `price` float(12,2) NOT NULL COMMENT 'Giá sản phẩm',
  `qty` int(10) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `amount` float(12,2) NOT NULL COMMENT 'Thành tiền'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_orderdetail`
--

INSERT INTO `0352_orderdetail` (`id`, `order_id`, `product_id`, `price`, `qty`, `amount`) VALUES
(6, 4, 47, 39000.00, 3, 117000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_post`
--

CREATE TABLE `0352_post` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã bài viết',
  `topic_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Mã chủ đề',
  `title` varchar(1000) NOT NULL COMMENT 'Tiêu đề bài viết',
  `slug` varchar(1000) NOT NULL COMMENT 'Slug tiêu đề',
  `detail` longtext NOT NULL COMMENT 'Chi tiết bài viết',
  `image` varchar(1000) NOT NULL COMMENT 'Hình ảnh',
  `type` varchar(10) NOT NULL DEFAULT 'post' COMMENT 'Kiểu bài viết',
  `description` varchar(255) NOT NULL COMMENT 'Từ khóa SEO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Người tạo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Người sửa',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_post`
--

INSERT INTO `0352_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `image`, `type`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(40, 1, 'Giới thiệu', 'gioi-thieu', 'Thành lập từ 2016 đến nay, NGOAOITHUONG BEUTYSOLUTION “phủ sóng” với hệ thống chi nhánh trải dài trên toàn quốc,, qua đó giúp mọi người nâng cao chất lượng cuộc sống. Trên hành trình đó, NGOAOITHUONG BEUTYSOLUTIONkhông ngừng cải thiện và phát triển để đem đến cho khách hàng những dịch vụ tốt nhất với cam kết “An toàn thật - Hiệu quả thật!\".\r\nĐể có một làm da mịn màng trắng sáng trước hết phải đủ ẩm và tiếp đến là được tái tạo nhờ vitamin C. Bên cạnh đó vitamin C còn nhân đôi khả năng bảo về da của kem chống nắng, nhận thấy điều đó có nhiều hãng mỹ phẩm cho ra nhiều dòng kem vitamin C hỗ trợ chị em trong việc dưỡng trắng da. Hãy cùng tìm hiểu Top 5 Kem Vitamin C được yêu thích nhất hiện nay trong bài dưới đây nhé.\r\nMột làn da trắng hồng, mịn màng là điều mà chị em Việt Nam rất yêu thích. Biết được điều đó có rất nhiều hãng mỹ phẩm cho ra đời nhiều dòng sản phẩm khác nhau để hỗ trợ chị em dưỡng trắng da. Trong bài này Review mỹ phẩm sẽ giới thiệu đến bạn Top 5 serum dưỡng trắng chất lượng nhất hiện nay, cùng tìm hiểu ngay nhé.', 'gioi-thieu.jpg', 'page', '', '2023-11-15 04:56:48', 1, '2023-11-15 04:56:48', 1, 1),
(41, 1, 'Chính Sách Hoàn Tiền', 'chinh-sach-hoan-tien', 'Người mua đồng ý rằng Người mua chỉ có thể yêu cầu trả hàng/hoàn tiền trong các trường hợp sau:\r\n\r\na. Người mua đã thanh toán bằng cách phương thức thanh toán hợp lệ và trực tiếp trên web nhưng (i) không nhận được sản phẩm, hoặc (ii) không nhận được toàn bộ các sản phẩm đã đặt, hoặc (iii) nhận được sản phẩm là hàng giả, hàng nhái;\r\n\r\nb. Sản phẩm bị lỗi hoặc bị hư hại trong quá trình vận chuyển;\r\n\r\nc. Người bán giao sai sản phẩm cho Người mua (ví dụ: sai kích cỡ, sai màu sắc, v.vv...);\r\n\r\nd. Sản phẩm Người mua nhận được khác biệt một cách rõ rệt so với thông tin mà Người bán cung cấp trong mục mô tả sản phẩm;\r\n\r\ne. Sản phẩm hết hạn sử dụng;\r\n\r\nf. Sản phẩm bị trả lại không phải là Sản phẩm hạn chế trả hàng;\r\n\r\ng. Người bán đã tự thỏa thuận và đồng ý cho Người mua trả hàng (tuy nhiên Shopee sẽ cần Người bán xác nhận lại những thỏa thuận này).\r\n\r\nNgười mua có thể gửi yêu cầu trả hàng/hoàn tiền trong vòng 07 (bảy) ngày và 03 (ba) ngày  kể từ lúc đơn hàng được cập nhật giao hàng thành công. Riêng đối với các sản phẩm thực phẩm tươi sống và đông lạnh (trừ trường hợp chưa nhận được hàng), Người mua cần gửi yêu cầu trả hàng/hoàn tiền trong vòng 24 giờ kể từ lúc đơn hàng được cập nhật giao hàng thành công.\r\n\r\nTất cả các yêu cầu trả hàng-hoàn tiền phải được thực hiện trên Ứng dụng .\r\n\r\nShopee luôn xem xét cẩn thận các yêu cầu trả hàng/hoàn tiền của Người mua và có quyền đưa ra quyết định cuối cùng đối với yêu cầu đó dựa trên các quy định nêu trên và theo Điều khoản Dịch vụ của shop.', '', 'page', '', '2023-11-15 05:09:28', 1, '2023-11-15 05:09:28', 1, 1),
(42, 1, 'Chính Sách Bảo Hành', 'chinh-sach-bao-hanh', '1) BẢO HÀNH CÓ CAM KẾT TRONG 12 THÁNG\r\n\r\n- RIÊNG Phụ kiện có điện AVA bảo hành 3 tháng. Đồng hồ thời trang chỉ bảo hành bộ máy, không bảo hành dây, vỏ, mặt kính.\r\n\r\n- Chỉ áp dụng cho sản phẩm chính, KHÔNG áp dụng cho phụ kiện đi kèm sản phẩm chính.\r\n\r\n+ Bảo hành trong vòng 15 ngày (tính từ ngày TGDĐ nhận máy ở trạng thái lỗi và đến ngày gọi khách hàng ra lấy lại máy đã bảo hành).\r\n\r\n+ Sản phẩm không bảo hành lại lần 2 trong 30 ngày kể từ ngày máy được bảo hành xong.\r\n\r\n+ Nếu TGDD vi phạm cam kết (bảo hành quá 15 ngày hoặc phải bảo hành lại sản phẩm lần nữa trong 30 ngày kể từ lần bảo hành trước), Khách hàng được áp dụng phương thức Hư gì đổi nấy ngay và luôn hoặc Hoàn tiền với mức phí giảm 50%.\r\n\r\n*Từ tháng thứ 13 trở đi không áp dụng bảo hành cam kết, chỉ áp dụng bảo hành hãng (nếu có).', '', 'page', '', '2023-11-15 05:13:06', 1, '2023-11-15 05:13:06', 1, 1),
(43, 1, 'Chính Sách Đổi Hàng', 'chinh-sach-doi-hang', 'Sản phẩm chỉ được xem là lỗi kĩ thuật khi được xác nhận từ chính Trung tâm kĩ thuật hoặc Trung tâm bảo hành của sản phẩm.\r\n\r\nKhi Quý khách gặp trục trặc với sản phẩm đặt mua tại hol.com.vn, vui lòng thực hiện các bước sau đây:\r\n\r\nBước 1: Tự kiểm tra cách thức sử dụng sản phẩm, các thao tác được hướng dẫn trong “Sách hướng dẫn sử dụng” đi kèm với mỗi sản phẩm (nếu có).\r\nBước 2: Quý khách liên hệ với trung tâm kĩ thuật/ bảo hành: HOTLINE 1800 6063 nhấn phím 03 hoặc email: info@houseofluggage.vn. Đối với một vài dòng sản phẩm tiêu biểu, Quý khách có thể tìm thấy thông tin bảo hành tại: Hệ thống cửa hàng gần nhất.\r\nBước 3: Trong vòng 07 ngày kể từ ngày nhận hàng, nếu Quý khách được xác nhận từ Trung tâm kĩ thuật hoặc Trung tâm bảo hành của sản phẩm rằng sản phẩm bị lỗi kỹ thuật, quý khách vui lòng truy cập ngay mục III (Hướng dẫn đổi trả hàng) để bắt đầu quy trình đổi trả hàng.\r\nNếu không thể liên hệ với trung tâm kĩ thuật/ bảo hành của sản phẩm, hãy liên lạc ngay với hol.com.vn, HOTLINE: 1800 6063\r\nTheo kinh nghiệm của chúng tôi, hơn một nửa sản phẩm hoàn về vì lí do lỗi kỹ thuật sau khi được bộ phận kĩ thuật kiểm tra đều được đánh giá sản phẩm nằm trong điều kiện sử dụng hoàn hảo. Vì vậy, để tiết kiệm thời gian và thuận tiện cho Quý khách, vui lòng đọc kĩ hướng dẫn sử dụng hoặc liên hệ tham vấn trực tiếp với bộ phận hỗ trợ kĩ thuật của sản phẩm để chắc rằng sản phẩm đã được lắp ráp, kết nối và vận hành chính xác trước khi gửi hàng về lại hol.com.vn.\r\n\r\n1.2 - Hàng giao bị bể vỡ, sai nội dung hoặc bị thiếu:\r\n\r\nHol.com.vn khuyến khích Quý khách hàng phải kiểm tra tình trạng bên ngoài của thùng hàng và sản phẩm trước khi thanh toán để đảm bảo rằng hàng hóa được giao đúng chủng loại, số lượng, màu sắc theo đơn đặt hàng và tình trạng bên ngoài không bị tác động (bể vỡ/ trầy xước). Nếu gặp trường hợp này, Quý khách vui lòng từ chối nhận hàng và/hoặc báo ngay cho bộ phận hỗ trợ khách hàng HOTLINE: 1800 6063 để chúng tôi có phương án xử lí kịp thời.\r\n\r\nTrong trường hợp khách hàng đã thanh toán, nhận hàng và sau đó phát hiện hàng hóa bị bể vỡ, sai nội dung hoặc thiếu hàng, xin vui lòng chụp ảnh sản phẩm gửi về hộp thư info@houseofluggage.vn để được chúng tôi hỗ trợ các bước tiếp theo như đổi/trả hàng hoặc gửi sản phẩm còn thiếu đến Quý khách.\r\n\r\nSau 48h kể từ khi Quý khách nhận hàng, hol.com.vn có quyền từ chối hỗ trợ cho những khiếu nại theo nội dung như trên.\r\n\r\n2. Danh mục miễn đổi/ trả (sản phẩm không áp dụng đổi trả)\r\n\r\nSản phẩm khuyến mãi (có giá giảm từ 10% trở lên so với giá gốc), hàng đồng giá.\r\nSản phẩm đổi trả không do lỗi kỹ thuật.\r\nPhụ kiện.', '', 'page', '', '2023-11-15 05:14:57', 1, '2023-11-15 05:14:57', 1, 1),
(47, 1, 'tt', 'tt', 'fgvdfvd', '', 'page', '', '2023-11-15 05:16:36', 1, '2023-11-15 05:16:36', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_product`
--

CREATE TABLE `0352_product` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT 'Mã loại sản phẩm',
  `brand_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL COMMENT 'Tên sản phẩm',
  `slug` varchar(1000) NOT NULL COMMENT 'Slug tên sản phẩm',
  `image` varchar(255) NOT NULL COMMENT 'Hình ảnh',
  `detail` mediumtext NOT NULL COMMENT 'Chi tiết',
  `qty` smallint(5) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `price` float(12,2) NOT NULL COMMENT 'Giá',
  `pricesale` float(12,3) NOT NULL COMMENT 'Giá khuyến mãi',
  `description` varchar(255) NOT NULL COMMENT 'Từ khóa SEO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người tạo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_product`
--

INSERT INTO `0352_product` (`id`, `category_id`, `brand_id`, `name`, `slug`, `image`, `detail`, `qty`, `price`, `pricesale`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(38, 5, 2, 'Kem che khuyết điểm Focallure độ che phủ cao chống thấm nước giữ màu lâu trôi 4.3g', 'kem-che-khuyet-diem-focallure-do-che-phu-cao-chong-tham-nuoc-giu-mau-lau-troi-4-3g', 'cn-11134207-7qukw-lii5i5u3gzga59.jpg', 'Kem che khuyết điểm 5 màu, Nhẹ, độ che phủ cao, dễ hòa trộn và mang lại hiệu quả che phủ toàn diện<br>\r\n· Không bị cakey và giữ cho lớp trang điểm của bạn tươi mát cả ngàyLâu trôi 8 giờ và chứa công thức chống thấm nước<br>\r\nMàu vàng - làm sáng màu da, hồng - che quầng thâm dưới mắt, nâu sẫm - che phủ mụn và khuyết điểm, màu xanh lá - che phủ đỏ, cam - đều màu da<br>\r\nChe phủ cao nhưng không cakey, bền cả ngày\r\nNhiều hiệu ứng, mọi vết mờ được bao phủ', 0, 79000.00, 0.000, '', '2023-11-15 01:23:18', 1, '2023-11-15 01:23:18', 1, 1),
(39, 7, 5, 'Son Kem Lì Black Rouge Air Fit Velvet TintA01', 'son-kem-li-black-rouge-air-fit-velvet-tinta01', 'son-kem-li-black-rouge-air-fit-velvet-tinta01.jpg', 'ƯU ĐIỂM:\r\n\r\nChất son kem vô cùng mềm, mịn, mướt, bền màu lâu, không gây cảm giác nứt nẻ khô môi nhưng vẫn đủ lì tạo nên một bờ môi căng mọng đầy quyến rũ.\r\n\r\nĐầu cọ được thiết kế tối ưu phù hợp giúp lấy ra một lượng son vừa đủ tán đều trên môi của bạn.\r\n', 0, 135000.00, 100000.000, '', '2023-11-15 03:11:03', 1, '2023-11-15 03:11:03', 1, 1),
(40, 6, 5, 'Bút kẻ mắt dạng lỏng màu đen chống thấm nước và không bị nhòe', 'but-ke-mat-dang-long-mau-den-chong-tham-nuoc-va-khong-bi-nhoe', 'but-ke-mat-dang-long-mau-den-chong-tham-nuoc-va-khong-bi-nhoe.jpg', 'Thành phần: Nước, iron oxide, mica, propylene glycol, v.v.\r\n  Khối lượng: 6g\r\n  Khối lượng tịnh: 1.5g\r\n  Thành phần: Titanium oxide, paraffin lỏng, talc, hemioleate, zinc laurate, v.v.\r\n  Dễ sử dụng, có khả năng thiết kế và sáng tạo, dễ phù hợp với các phong cách trang điểm khác nhau.\r\n  Dễ lên màu, không thấm nước, lâu trôi, giúp cho đôi mắt của bạn trở nên to và đẹp hơn.\r\n  Đầu bút mịn, dễ vẽ và mềm mịn khi sử dụng.', 0, 15000.00, 10000.000, '', '2023-11-15 03:16:34', 1, '2023-11-15 03:16:34', 1, 1),
(41, 5, 2, 'Phấn phủ kiềm dầu Perfect Diary Perfect chống thấm nước kiểm soát dầu lên đến 12h với 3 màu tùy chọn 7g', 'phan-phu-kiem-dau-perfect-diary-perfect-chong-tham-nuoc-kiem-soat-dau-len-den-12h-voi-3-mau-tuy-chon-7g', 'phan-phu-kiem-dau-perfect-diary-perfect-chong-tham-nuoc-kiem-soat-dau-len-den-12h-voi-3-mau-tuy-chon-7g.jpg', ' Chi tiết sản phẩm \'\r\n\r\n Màu sản phẩm \'\r\n\r\n 01a\r\n\r\n 02\r\n\r\n 03 \r\n\r\n  \r\n\r\n  Mã sản phẩm \'\r\n\r\n  Pda032\r\n\r\n  \r\n\r\n  Thành phần \"\r\n\r\n  1. Octyldodecanol\r\n\r\n  2. Chất béo trung tính Caprylic / CAPRIC\r\n\r\n  3. Silica chung, SILICA\r\n\r\n  4. Khác', 0, 450000.00, 209000.000, '', '2023-11-15 03:18:51', 1, '2023-11-15 03:18:51', 1, 1),
(42, 5, 5, 'Kem che khuyết điểm FOCALLURE gồm 7 màu tùy chọn chuyên dụng 10g', 'kem-che-khuyet-diem-focallure-gom-7-mau-tuy-chon-chuyen-dung-10g', 'kem-che-khuyet-diem-focallure-gom-7-mau-tuy-chon-chuyen-dung-10g.jpg', 'Che khuyết điểm hiệu quả ✔ Làm sáng màu da ✔ \r\n\r\nCơ sở môi ✔ Kết cấu nhẹ ✔ Di động ✔\r\n\r\n\r\n\r\n1. Các sản phẩm thông thường có khả năng che khuyết điểm mạnh nên dưỡng ẩm đơn giản trước khi sử dụng\r\n\r\nMột. Điều đặc biệt quan trọng là phải dưỡng ẩm tốt cho da trong giai đoạn đầu.\r\n\r\nB. Kem che khuyết điểm và nhũ tương được trộn để giảm tình trạng khô da hiệu quả\r\n\r\n2. Kem che khuyết điểm FOCALLURE thích hợp cho kem che khuyết điểm một phần\r\n\r\nMột. Thoa lên vị trí bộ phận cần che khuyết điểm và dùng đầu ngón tay mở nhẹ.\r\n\r\nB. Mỗi lần uống một ít, để tránh làm khô và trắng da quá nhiều', 0, 80000.00, 45000.000, '', '2023-11-15 03:20:17', 1, '2023-11-15 03:20:17', 1, 1),
(43, 5, 4, 'Kem má hồng KIMUSE chống thấm nước và mồ hôi 6ml', 'kem-ma-hong-kimuse-chong-tham-nuoc-va-mo-hoi-6ml', 'kem-ma-hong-kimuse-chong-tham-nuoc-va-mo-hoi-6ml.jpg', ' Kem má hồng KIMUSE \r\n\r\n  1. Kết cấu rất nhẹ - vì vậy bạn không cần phải lo lắng nếu vô tình đánh quá nhiều. Rất mỏng và có thể đánh chồng lên nhau và giữ màu sắc bền lâu. \r\n\r\n  2. Màu sắc hoàn hảo trông tự nhiên - phấn má dễ dàng lướt trên da tạo độ sáng lâu trôi, thích hợp để tạo kết cấu pha trộn: kem đánh má hồng cho sắc tố màu cao, hoặc đánh lót để tạo hiệu ứng tán xạ tạo độ sáng. \r\n\r\n  3. Dạng kem lỏng không gây nặng da và mượt mà - tạo ra một lớp trang điểm trông tự nhiên, như làn da thứ hai, một tấm màn màu phủ lên da tạo ra một độ sáng khỏe mạnh. \r\n\r\n  \r\n\r\n  4. Cách sử dụng: \r\n\r\n  1). Làm ấm một chút kem đánh má hồng trên lòng bàn tay. Sử dụng với đầu ngón tay cho một hiệu ứng tự nhiên và dễ dàng. \r\n\r\n  2). Để tăng cường màu sắc và tạo hiệu ứng không gian, dùng một lớp lớp Orgasm hoặc phấn má hồng màu khác trên kem má hồng. \r\n\r\n  3). Có thể sử dụng đánh phía dưới hoặc trên một lớp nền để tạo các hiệu ứng khác nhau. ', 0, 52000.00, 42000.000, '', '2023-11-15 03:21:59', 1, '2023-11-15 03:21:59', 1, 1),
(44, 7, 6, 'Pink Coco Son kem lì dưỡng ẩm chống nước chống khô môi 3ml', 'pink-coco-son-kem-li-duong-am-chong-nuoc-chong-kho-moi-3ml', 'pink-coco-son-kem-li-duong-am-chong-nuoc-chong-kho-moi-3ml.jpg', 'Pink Coco\r\n\r\n100% chính hãng / Spot\r\n\r\nHiệu lực: 3 năm\r\n\r\nGói hàng bao gồm: 1 cái / hộp\r\n\r\nKích thước hộp màu: 15 * 2 * 2cm\r\n\r\nKhối lượng tịnh: 3g\r\n\r\nThành phần chính: dầu mỡ, dầu khoáng, squalane, ozokerite, sáp candelilla, sáp carnauba, sáp vi tinh thể, chất tạo màu, v.v.\r\n\r\nHồi giáo và Phật giáo có thể sử dụng 100%', 0, 28000.00, 14000.000, '', '2023-11-15 03:24:39', 1, '2023-11-15 03:24:39', 1, 1),
(45, 7, 6, 'son pink coco siêu hot', 'son-pink-coco-sieu-hot', 'son-pink-coco-sieu-hot.jpg', 'màu son siêu xinh 01 tone da sáng da ????????..\r\n\r\ncác tình yêu sài là phải mê luôn ấy chứ đùa', 0, 50000.00, 50000.000, '', '2023-11-15 03:26:13', 1, '2023-11-15 03:26:13', 1, 1),
(46, 7, 6, '[Hàng mới về]Son Môi Pink CoCo Màu Nhung Lì Lâu Trôi Mềm Mịn Cho Học Sinh', 'hang-moi-ve-son-moi-pink-coco-mau-nhung-li-lau-troi-mem-min-cho-hoc-sinh', 'hang-moi-ve-son-moi-pink-coco-mau-nhung-li-lau-troi-mem-min-cho-hoc-sinh.jpg', 'Thông số kỹ thuật sản phẩm:\r\n\r\nThương hiệu sản phẩm: PINK COCO\r\n\r\nTên sản phẩm: Matte Lip Glaze\r\n\r\nNội dung tịnh: 3,8g\r\n\r\nBao bì: Son môi 1 CÁI\r\n\r\nKết cấu sản phẩm: mượt, sáng bóng, màu đẹp\r\n\r\nTác dụng: Cải thiện làn da và làm phong phú lớp trang điểm\r\n\r\nLoại da áp dụng: bình thường', 0, 48000.00, 24000.000, '', '2023-11-15 03:27:12', 1, '2023-11-15 03:27:13', 1, 1),
(47, 5, 6, 'Bảng Phấn Má Hồng PINK COCO 4 Màu Bền Màu Tiện Lợi', 'bang-phan-ma-hong-pink-coco-4-mau-ben-mau-tien-loi', 'bang-phan-ma-hong-pink-coco-4-mau-ben-mau-tien-loi.jpg', 'Chi tiết sản phẩm:\r\n-Thương Hiệu: Pink Coco\r\n-Xuất Xứ: Trung Quốc (Nội Địa Trung)\r\n-Khối Lượng Tịnh: 3g*4\r\n-Hạn Sử Dụng: In trên bao bì (Năm/Tháng/Ngày)\r\n\r\nMàu sắc sản phẩm\r\n01, 02, 03\r\n\r\nBảng phấn mắt 4 màu phấn má PINK COCO bền màu tiện lợi, thiết kế trẻ trung dễ thương.\r\nSản phẩm của nhà Gogo Tales được thiết kế làm 2 lớp phấn mắt và phấn má siêu tiện lợi cho các cô nàng mới tập tành makeup. Chất phấn bơ mịn, không vón cục, không bị rơi vãi phấn, dễ tán. ', 0, 60000.00, 39000.000, '', '2023-11-15 03:28:16', 1, '2023-11-15 03:28:16', 1, 1),
(48, 16, 7, '[COSCPD40K1111 đơn từ 199K] Dầu dưỡng tóc L\'Oreal Paris Elseve Extraordinary Oil 100ml', 'coscpd40k1111-don-tu-199k-dau-duong-toc-loreal-paris-elseve-extraordinary-oil-100ml', 'coscpd40k1111-don-tu-199k-dau-duong-toc-loreal-paris-elseve-extraordinary-oil-100ml.jpg', 'VÌ SAO BẠN SẼ THÍCH?\r\n\r\nDầu dưỡng chiết xuất tinh dầu hoa tự nhiên L\'Oreal Paris Elseve Extraordinary Oil 100ml chứa hàm lượng lớn tinh dầu hạt bông cùng nhiều dưỡng chất giúp nuôi dưỡng mái tóc từ sâu bên trong, cho tóc suôn mượt, mềm mại, chắc khỏe. Sản phẩm có hương thơm dịu nhẹ của các loài hoa thiên nhiên sẽ tạo cho bạn cảm giác thư giãn. Thành phần an toàn, không gây kích ứng da đầu. Dầu dưỡng phù hợp cho cho mọi loại tóc, đặc biệt hiệu quả với mái tóc khô, xơ rối và hư tổn.\r\n• ƯU ĐIỂM NỔI BẬT\r\n● Chiết xuất từ 6 loại hoa thiên nhiên nuôi dưỡng mái tóc mềm mại, suôn mượt.\r\n● Thành phần dưỡng ẩm tốt cho tóc khô, xoăn và hư tổn.\r\n\r\n● Nuôi dưỡng tóc chắc khỏe, bồng bềnh, giảm thiểu tình trạng rụng tóc.\r\n● Lưu giữ hương thơm nhẹ nhàng cho mái tóc, tạo cảm giác thoải mái.\r\n• HIỆU QUẢ SỬ DỤNG\r\n● Tóc mềm mại, suôn mượt.\r\n● Tóc chắc khỏe, bồng bềnh, giảm thiểu tình trạng rụng tóc.\r\n● Lưu giữ hương thơm nhẹ nhàng cho mái tóc, tạo cảm giác thoải mái.\r\n• HƯỚNG DẪN SỬ DỤNG\r\n● Sau khi gội, xả, thấm khô tóc bằng khăn rồi lấy một lượng tinh dầu vừa đủ ra lòng bàn tay.\r\n● Xoa đều lòng bàn tay và vuốt nhẹ lên tóc.\r\n● Dùng lược chải từ đỉnh đầu xuống ngọn để dưỡng chất thấm sâu hơn.\r\n● Để khô tự nhiên hoặc dùng máy sấy.\r\n● Ngoài ra, khi tóc khô, thêm 1 -2 giọt tùy vào độ dày để tạo độ bóng, dưỡng ẩm phần đuôi tóc và tạo kiểu tóc theo ý muốn.', 0, 229000.00, 195000.000, '', '2023-11-15 03:35:06', 1, '2023-11-15 03:35:06', 1, 1),
(49, 12, 8, 'FOCALSKIN Serum Tinh Chất Sáng Da Đều Màu 3% NIACINAMIDE + 3% α-ARBUTIN + Vitamin C + Tranexamic Acid 15ml/30ml', 'focalskin-serum-tinh-chat-sang-da-deu-mau-3-niacinamide-3-arbutin-vitamin-c-tranexamic-acid-15ml-30ml', 'focalskin-serum-tinh-chat-sang-da-deu-mau-3-niacinamide-3-arbutin-vitamin-c-tranexamic-acid-15ml-30ml.jpg', 'THÀNH PHẦN CHÍNH\r\n\r\n- Niacinamide 3%\r\n\r\n- Alpha-Arbutin 3%\r\n\r\n- HEPES 1%\r\n\r\n- 377 0,2%\r\n\r\n- Nước hoa hồng Damascus 1,5%\r\n\r\n- Vitamin C\r\n\r\n- Tranexamic Acid\r\n\r\n\r\n\r\n\r\n\r\nCÔNG DỤNG SẢN PHẨM\r\n\r\n- \"\"CÔNG THỨC VÀNG\"\": 3% Niacinamide + 3% Alpha Arbutin, hiệu quả làm trắng gấp 10 lần vit C, làm trắng một cách khoa học. Với nồng độ 3% hoàn hảo vừa giảm thiểu khả năng bị kích ứng, vừa chắc chắn sự ổn định của hợp chất, khi kết hợp với nước hoa hồng và vitamin C sẽ càng thêm hoàn hảo tạo thành một công thức vàng cho sản phẩm\r\n\r\n\r\n\r\n- Sử dụng nước hoa hồng Damascna như lớp nền tinh chất, chiết xuất từ ​​thực vật dịu nhẹ rất thích hợp cho da nhạy cảm.\r\n\r\n- HEPES + 377, một thành phần phổ biến trong các thẩm mỹ viện cao cấp của Nhật Bản, có tỷ lệ gấp đôi trong chai này.', 0, 350000.00, 139000.000, '', '2023-11-15 03:38:14', 1, '2023-11-15 03:38:14', 1, 1),
(50, 10, 8, 'FOCALSKIN Sữa Rửa Mặt Sủi Bọt ACIDS AHA BHA PHA Giảm Mụn Đầu Đen Làm Sạch Sâu Lỗ Chân Lông 120g', 'focalskin-sua-rua-mat-sui-bot-acids-aha-bha-pha-giam-mun-dau-den-lam-sach-sau-lo-chan-long-120g', 'focalskin-sua-rua-mat-sui-bot-acids-aha-bha-pha-giam-mun-dau-den-lam-sach-sau-lo-chan-long-120g.jpg', 'FOCALSKIN Sữa Rửa Mặt Sủi Bọt ACIDS AHA BHA PHA Giảm Mụn Đầu Đen Làm Sạch Sâu Lỗ Chân Lông 120g FOCALSKIN Sữa Rửa Mặt Sủi Bọt ACIDS AHA BHA PHA Giảm Mụn Đầu Đen Làm Sạch Sâu Lỗ Chân Lông 120g', 0, 99000.00, 99000.000, '', '2023-11-15 03:40:09', 1, '2023-11-15 03:40:09', 1, 1),
(51, 9, 8, '[Mã INCMT15 giảm 15K đơn 99K] FOCALSKIN Mặt Nạ Trắng Sáng Làn Da Vitamin C Niacinamide Dưỡng ẩm 25ml', 'ma-incmt15-giam-15k-don-99k-focalskin-mat-na-trang-sang-lan-da-vitamin-c-niacinamide-duong-am-25ml', 'ma-incmt15-giam-15k-don-99k-focalskin-mat-na-trang-sang-lan-da-vitamin-c-niacinamide-duong-am-25ml.jpg', 'FOCALSKIN Mặt Nạ Trắng Sáng Làn Da Vitamin C Niacinamide Dưỡng ẩm 25ml\r\n\r\nTranexamic acid làm trắng nhẹ nhàng, sáng và đều màu da. Hoạt chất VC chống oxi hóa, làm sáng da với Hydrat và dưỡng ẩm cho làn da tinh tế hơn Hoa Camellia Japonica, nhẹ nhàng trên da, tự nhiên, thân thiện với môi trường và có thể phân hủy sinh học.\r\n\r\n【Công dụng】\r\n\r\nNiacinamide làm trắng sáng da \r\nChiết xuất hoa Trà Nhật bản giúp làm dịu da giảm thâm \r\nGiảm các dấu hiệu kích ứng \r\n\r\n【Hướng dẫn sử dụng】\r\n\r\nBước 1: Rửa sạch mặt với sữa rửa mặt\r\nBước 2: Dùng toner\r\nBước 3: Sử dụng mặt nạ tầm 10 đến 15 phút, sau đó massage để dưỡng chất thấm đều mặt\r\n\r\nKhông cồn, không dầu khoáng, không paraben, không sulfate ', 0, 145000.00, 79000.000, '', '2023-11-15 03:41:19', 1, '2023-11-15 03:41:19', 1, 1),
(52, 9, 8, 'Mặt Nạ Đất Sét Rau Má FOCALSKIN Chăm Sóc Da Dưỡng Ẩm Kiểm Soát Dầu 80g', 'mat-na-dat-set-rau-ma-focalskin-cham-soc-da-duong-am-kiem-soat-dau-80g', 'mat-na-dat-set-rau-ma-focalskin-cham-soc-da-duong-am-kiem-soat-dau-80g.jpg', '❖ THÔNG TIN SẢN PHẨM:\r\n- Xuất xứ: Nội Địa Trung\r\n- Thương Hiệu: Focalskin\r\n- Quy cách đóng gói: 80g\r\n- NSX: Xem trên bao bì\r\n- HSD: 3 năm\r\n\r\n❖ CÔNG DỤNG:\r\n- Làm sạch da, hút dầu thừa trên da, thông thoáng lỗ chân lông\r\n- Giảm mụn đầu đen, mụn cám.\r\n- Giảm tình trạng da ửng đỏ.\r\n- Phục hồi làn da tổn thương.\r\n- Làm dịu nốt mụn sưng.\r\n\r\n❖ ĐỐI TƯỢNG SỬ DỤNG:\r\n- Phù hợp với mọi loại da - cải thiện tình trạng da lỗ chân lông to, mụn cám, mụn đầu đen, sạm nám\r\n\r\n❖ HƯỚNG DẪN SỬ DỤNG:\r\n- Làm sạch da bằng sữa rửa mặt và nước tẩy trang.\r\n- Bôi một lượng sản phẩm vừa đủ lên da.\r\n- Để sản phẩm trên da 10-15 phút.\r\n- Rửa sạch bằng nước ấm.\r\n- Tiếp tục các bước dưỡng da.', 0, 300000.00, 170000.000, '', '2023-11-15 03:42:15', 1, '2023-11-15 03:42:15', 1, 1),
(53, 12, 7, 'Bộ Serum mắt cấp ẩm căng mướt da Hyaluronic Acid 2.5% L\'Oreal Paris', 'bo-serum-mat-cap-am-cang-muot-da-hyaluronic-acid-2-5-loreal-paris', 'bo-serum-mat-cap-am-cang-muot-da-hyaluronic-acid-2-5-loreal-paris.jpg', 'VÌ SAO BẠN SẼ THÍCH?\r\n01 x Serum mắt Hyaluronic Acid 2.5% 20ml\r\n02 x Serum mặt Hyaluronic Acid 1.5% 7.5ml\r\nVÌ SAO BẠN SẼ THÍCH? \r\nSerum mắt Revitalift 2.5% Hyaluronic Acid + Caffeine 20ml giúp giảm bọng mắt tức thì &amp; căng mướt rãnh nhăn, mang đến đôi mắt tươi trẻ &amp; căng tràn sức sống sau 2 tuần \r\n1.5% HYALURONIC ACID: Giúp cấp ẩm, căng mướt vùng da quanh mắt \r\n1% CAFFEINE: chống oxy hóa, đánh thức sức sống cho đôi mắt \r\n4% NIACINAMIDE: Giảm quầng thâm mắt \r\nSản phẩm còn sở hữu Thanh Lăn Triple Roller Mới với: \r\n3 BÓNG LĂN:  Hiệu quả làm mát tức thì \r\nTHANH LĂN ÔM SÁT: Mát-xa vùng da quanh mắt \r\nƯU ĐIỂM NỔI BẬT \r\nGiảm quầng thâm &amp; làm đầy rãnh nhăn vùng mắt \r\nGiảm bọng mắt tức thì \r\nĐôi mắt tươi trẻ &amp; căng tràn sức sống \r\nDành cho mọi loại da ', 0, 839000.00, 399000.000, '', '2023-11-15 03:44:00', 1, '2023-11-15 03:44:00', 1, 1),
(54, 12, 7, 'Kem Dưỡng Sáng Da Ban Đêm L\'Oreal Paris Glycolic 7,5ml', 'kem-duong-sang-da-ban-dem-loreal-paris-glycolic-7-5ml', 'kem-duong-sang-da-ban-dem-loreal-paris-glycolic-7-5ml.jpg', 'Với công thức đặc biệt có chứa Glycolic Acid giúp làm sáng da. Glycolic Acid là một loại AHA có thể làm sạch bề mặt, tẩy da chết nhẹ nhàng mà hiệu quả, đồng thời hỗ trợ quá trình tái tạo da.\r\n\r\nBổ sung vitamin E giúp ngăn chặn và làm chậm quá trình oxy hóa, giảm sự hình thành của hắc sắc tố, giúp làm đều màu da, ngăn hình thành các vết nám và thâm sạm da.', 0, 19000.00, 18000.000, '', '2023-11-15 03:44:48', 1, '2023-11-15 03:44:48', 1, 1),
(55, 11, 7, 'Kem Chống Nắng X20 Thoáng Da Mỏng Nhẹ L’oreal Paris Uv Defender Serum 50ml Spf 50++', 'kem-chong-nang-x20-thoang-da-mong-nhe-l-oreal-paris-uv-defender-serum-50ml-spf-50', 'kem-chong-nang-x20-thoang-da-mong-nhe-l-oreal-paris-uv-defender-serum-50ml-spf-50.jpg', 'Kem chống nắng UV Defender SPF 50+ PA ++++ giúp cản nắng tối đa, ngăn da lão hóa đến 5 năm. Sự kết hợp hoàn hảo của công nghệ chống nắng bền bỉ tối đa và thành phần vàng bảo vệ da & dưỡng trắng giảm thâm nám - Niacinamide. Chi tiết bao bì sản phẩm thay đổi theo từng đợt nhập hàng.\r\n\r\n\r\n\r\nKem chống nắng UV Defender SPF 50+ PA ++++ giúp cản nắng tối đa, ngăn da lão hóa đến 5 năm. Sự kết hợp hoàn hảo của công nghệ chống nắng bền bỉ tối đa và thành phần vàng bảo vệ da & dưỡng trắng giảm thâm nám. Với 2 lớp màng bảo vệ ( Màng lọc Mexoryl SX và Mexorul XL) giúp cản tia UVA và UVB  cả ngày dài. Lần đầu tiên ở thị trường, tinh chất Niacinamide có trong kem chống nắng như một lớp thứ 3 bảo vệ hàng rào da, nâng tông tức thì, giảm thâm dưỡng trắng. Kem chống nắng bảo vệ toàn diện L\'Oreal Paris UV Defender SPF 50+ PA ++++ 50ml hiện đang có 4 loại cho bạn lựa chọn tùy thuộc vào nhu cầu sử dụng. \r\n\r\n', 0, 269000.00, 249000.000, '', '2023-11-15 03:46:36', 1, '2023-11-15 03:46:36', 1, 1),
(56, 12, 7, 'Kem dưỡng sáng da Loreal Paris Aura Perfect 50ml', 'kem-duong-sang-da-loreal-paris-aura-perfect-50ml', 'kem-duong-sang-da-loreal-paris-aura-perfect-50ml.jpg', ' ƯU ĐIỂM NỔI BẬT\r\n\r\n● Ngăn ngừa Melalin gây sạm da.\r\n● Mang lại làn da sáng mịn, đều màu.\r\n● Tăng cường SPF17/ PA++ giúp chống nắng và bảo vệ da dưới tác hại của tia UV.\r\n• HIỆU QUẢ SỬ DỤNG\r\nSau 1 tháng, làn da trở nên sáng mượt, đều màu thấy rõ. Ngoài ra, sản phẩm tăng cường với SPF 17/PA++ giúp chống nắng và bảo vệ làn da trước tác hại của tia UV.\r\n• HƯỚNG DẪN SỬ DỤNG\r\n● Sử dụng kem dưỡng da ban ngày vào mỗi sáng, sau bước làm sạch và cân bằng da.\r\n● Nên dùng thêm cho vùng da ở cổ. Tránh vùng da quanh mắt. Thích hợp cho mọi loại da.\r\nXuất xứ: Indonesia\r\nHSD: 3 năm kể từ ngày sản xuất \r\nNSX: Xem trên bao bì\r\n2.Kem dưỡng L’Oreal Paris White Perfect ban đêm SPF17 PA++ chứa vitamin CG giúp giảm, cân bằng hắc sắc tố ở mức thấp; Glycerin tạo và lưu giữ độ ẩm trên da, tinh thể đá quý Tourmaline giúp thúc đẩy quá trình tuần hoàn dưới da chính là lựa chọn hoàn hảo cho làn da của bạm. Ngay lập tức, làn da được dưỡng ẩm mềm mịn và tươi sáng rõ rệt. Sau 1 tuần, làn da dần đều màu &amp; được cải thiện rõ rệt. Sau 1 tháng, làn da trở nên sáng mượt, đều màu thấy rõ. Ngoài ra, sản phẩm tăng cường với SPF 17/PA++ giúp chống nắng và bảo vệ làn da trước tác hại của tia UV.', 0, 219000.00, 199000.000, '', '2023-11-15 03:48:01', 1, '2023-11-15 03:48:01', 1, 1),
(57, 8, 7, 'Nước Tẩy Trang L\'Oreal Paris Giúp Căng Mịn Da Revitalift Hyaluronic Acid Micellar Water 400ml', 'nuoc-tay-trang-loreal-paris-giup-cang-min-da-revitalift-hyaluronic-acid-micellar-water-400ml', 'nuoc-tay-trang-loreal-paris-giup-cang-min-da-revitalift-hyaluronic-acid-micellar-water-400ml.jpg', 'Nước Tẩy Trang L\'Oreal Paris Giúp Căng Mịn Da Revitalift Hyaluronic Acid Micellar Water 400ml là dòng nước tẩy trang cao cấp dành cho da dầu với khả năng làm sạch sâu gấp 5 lần tẩy trang thông thường, chứa vô số phân tử siêu nhỏ với khả năng hút sạch những tạp chất, bã nhờn nằm sâu trong lỗ chân lông, đồng thời cấp nước và làm mềm da, có thể sử dụng để làm sạch da mà không cần rửa mặt lại với nước.', 0, 269000.00, 229000.000, '', '2023-11-15 04:03:48', 1, '2023-11-15 04:03:48', 1, 1),
(58, 8, 7, 'Tẩy Trang L\'Oreal Paris Skincare Make Up Remover Micellar Refreshing Tươi Mát 400ml', 'tay-trang-loreal-paris-skincare-make-up-remover-micellar-refreshing-tuoi-mat-400ml', 'tay-trang-loreal-paris-skincare-make-up-remover-micellar-refreshing-tuoi-mat-400ml.png', 'Thành Phần Chính và Công Dụng:\r\n- Công nghệ Mi-xen đột phá hoạt động như nam châm thông minh tự động hút sạch cặn trang điểm, bụi bẩn mà không lấy đi độ ẩm tự nhiên của da và không gây kích ứng da.\r\n- Chiết xuất từ hoa hồng & hương thảo giúp da ẩm mượt và mềm mịn.\r\n- Tẩy trang hằng ngày ở nhà hoặc tẩy trang cho lớp trang điểm đậm.\r\n- Sử dụng tẩy trang nhanh khi bận rộn hoặc ở những nơi không có nước: khi đi du lịch, tập thể thao, khi đi spa.\r\n\r\nHướng Dẫn Sử Dụng:\r\n- Thấm vừa đủ nước tẩy trang vào bông, nhẹ nhàng lau lên mặt theo chiều từ dưới lên trên', 0, 219000.00, 164000.000, '', '2023-11-15 04:04:57', 1, '2023-11-15 04:04:57', 1, 1),
(59, 13, 4, 'Mặt Nạ Xông Hơi Mắt Megrhythm Hương Hoa Cúc Hộp 5 Miếng Tặng Dán Nóng Vai Lưng 1M & Dán Nóng Bụng 1M', 'mat-na-xong-hoi-mat-megrhythm-huong-hoa-cuc-hop-5-mieng-tang-dan-nong-vai-lung-1m-dan-nong-bung-1m', 'mat-na-xong-hoi-mat-megrhythm-huong-hoa-cuc-hop-5-mieng-tang-dan-nong-vai-lung-1m-dan-nong-bung-1m.jpg', 'Mặt Nạ Xông Hơi Mắt MegRhythm Hương Rừng Phiên Bản Moomin 5 Miếng/Hộp giúp bạn thư giãn bằng cách quấn quanh mắt và vùng da mắt bằng hơi nước ấm, dịu. Nhiệt độ thoải mái là khoảng 40 ℃ và thời gian thoải mái là khoảng 20 phút. Mặt nạ sẽ giúp làm dịu và tan biến đi sự mệt mỏi cho vùng da quanh mắt, đồng thời mang lại cho bạn những giây phút thư giãn tuyệt vời và một đôi mắt tươi tỉnh hơn sau khi sử dụng. Dòng sản phẩm dành cho các khách hàng có cuộc sống bận rộn, thường xuyên sử dụng thiết bị điện tử trong thời gian dài khiến mắt khô và dễ căng thẳng, mệt mỏi và có nhu cầu tìm kiếm giải pháp thư giãn nhanh chóng, hiệu quả. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 0, 140000.00, 133000.000, '', '2023-11-15 04:09:17', 1, '2023-11-15 04:09:17', 1, 1),
(60, 13, 4, 'Dung dịch nhỏ mắt V.Rohto Mineral Tear 13ml', 'dung-dich-nho-mat-v-rohto-mineral-tear-13ml', 'dung-dich-nho-mat-v-rohto-mineral-tear-13ml.jpg', 'Thành Phần Chính Và Công Dụng:\r\n- Không chỉ là dung dịch nhỏ mắt bổ sung nước mắt nhân tạo, V.Rohto Mineral Tear còn chứa 4 thành phần khoáng chất: Na+, K+, Ca2+, HCO3- nhằm cung cấp các nguyên tố tương tự như nước mắt tự nhiên, giúp tái tạo lại nước mắt, giữ ẩm và làm dịu mắt khô.\r\n- Ngoài ra, đối với những người thường xuyên đeo kính áp tròng, V.Rohto Mineral Tear giúp tạo một lớp màng dưỡng ẩm bảo vệ giữa kính áp tròng và mắt, giúp việc đeo kính áp tròng thoải mái hơn, ngay cả sau khi tháo kính áp tròng.\r\n- Nuôi dưỡng và bảo vệ mắt mỗi ngày với V.Rohto Mineral Tear:\r\n- Bổ sung khoáng chất và nước mắt nhân tạo giúp giữ ẩm, làm dịu mắt khô.\r\n- Hỗ trợ sự trao đổi chất ở biểu mô giác mạc, giúp phục hồi mắt mỏi, mắt kích ứng nhẹ với 4 thành phần khoáng chất Potassium Chloride, Sodium Chloride, Calcium Chloride Hydrate, Sodium Bicarbonate.\r\n- Giữ ẩm và bảo vệ bề mặt giác mạc, phòng ngừa khô mắt với Sodium Chondroitin Sulfate.\r\n- Tăng cường độ ẩm của giác mạc nhờ Hypromellose, giúp mắt cử động dễ dàng hơn, giảm cảm giác khó chịu khi mang kính áp tròng.\r\n\r\nHướng Dẫn Sử Dụng:\r\n- Nhỏ vào mắt mỗi lần 1-2 giọt.\r\n- Có thể nhỏ nhiều lần trong ngày tùy vào tình trạng khô mắt, mỏi mắt và khó chịu của mắt.\r\n- Có thể sử dụng cho người không đeo kính áp tròng, đang đeo hoặc sau khi tháo kính áp tròng.', 0, 60000.00, 55000.000, '', '2023-11-15 04:10:45', 1, '2023-11-15 04:10:45', 1, 1),
(61, 13, 4, 'Mặt Nạ Xông Hơi Mắt MegRhythm Hương Rừng Phiên Bản Moomin 5 Miếng/Hộp', 'mat-na-xong-hoi-mat-megrhythm-huong-rung-phien-ban-moomin-5-mieng-hop', 'mat-na-xong-hoi-mat-megrhythm-huong-rung-phien-ban-moomin-5-mieng-hop.jpg', 'Mặt Nạ Xông Hơi Mắt MegRhythm Hương Rừng Phiên Bản Moomin 5 Miếng/Hộp giúp bạn thư giãn bằng cách quấn quanh mắt và vùng da mắt bằng hơi nước ấm, dịu. Nhiệt độ thoải mái là khoảng 40 ℃ và thời gian thoải mái là khoảng 20 phút. Mặt nạ sẽ giúp làm dịu và tan biến đi sự mệt mỏi cho vùng da quanh mắt, đồng thời mang lại cho bạn những giây phút thư giãn tuyệt vời và một đôi mắt tươi tỉnh hơn sau khi sử dụng. Dòng sản phẩm dành cho các khách hàng có cuộc sống bận rộn, thường xuyên sử dụng thiết bị điện tử trong thời gian dài khiến mắt khô và dễ căng thẳng, mệt mỏi và có nhu cầu tìm kiếm giải pháp thư giãn nhanh chóng, hiệu quả. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 0, 140000.00, 130000.000, '', '2023-11-15 04:11:47', 1, '2023-11-15 04:11:47', 1, 1),
(62, 13, 4, 'Dung Dịch Nhỏ Mắt V.Rohto Dryeye 13ml', 'dung-dich-nho-mat-v-rohto-dryeye-13ml', 'dung-dich-nho-mat-v-rohto-dryeye-13ml.jpg', 'Thành Phần Chính và Công Dụng:\r\n- Bổ sung nước mắt nhân tạo, bôi trơn và bảo vệ bề mặt giác mạc, tạo độ ẩm cho mắt khô, mắt mỏi, giúp giảm khô mắt hiệu quả.\r\n- Làm dịu ngay tình trạng khô mắt, cảm giác nóng rát, khó chịu, cộm, xốn mắt do tiếp xúc với gió, ánh nắng và các thiết bị điện tử trong thời gian dài, nhờ đó phòng ngừa kích ứng mắt.\r\n\r\nHướng Dẫn Sử Dụng:\r\n- Nhỏ vào mắt mỗi lần 1-2 giọt.\r\n- Có thể nhỏ nhiều lần trong ngày tùy vào tình trạng khô mắt, mỏi mắt và khó chịu của mắt.\r\n- Phù hợp cho người thường xuyên bị khô mắt hoặc sau phẫu thuật khúc xạ\r\n- Có thể sử dụng cho người không đeo kính áp tròng, đang đeo hoặc sau khi tháo kính áp tròng.\r\n\r\nXuất Xứ Thương Hiệu:\r\nNhật Bản', 0, 60000.00, 54000.000, '', '2023-11-15 04:13:30', 1, '2023-11-15 04:13:30', 1, 1),
(63, 14, 1, 'Thực Phẩm Bảo Vệ Sức Khỏe Blossomy Curcumin Tươi Trẻ Từ Bên Trong 50ml x 10 Chai', 'thuc-pham-bao-ve-suc-khoe-blossomy-curcumin-tuoi-tre-tu-ben-trong-50ml-x-10-chai', 'thuc-pham-bao-ve-suc-khoe-blossomy-curcumin-tuoi-tre-tu-ben-trong-50ml-x-10-chai.jpg', 'Thực Phẩm Bảo Vệ Sức Khỏe Blossomy Curcumin Tươi Trẻ Từ Bên Trong 50ml với Curcumin, Collagen, Lactium có công dụng hạn chế tình trạng lão hóa da, tăng cường độ đàn hồi, giảm nếp nhăn, nám sạm và tàn nhang đồng thời hỗ trợ cải thiện, làm giảm các vấn đề ở dạ dày, hệ tiêu hóa, góp phần mang lại vẻ ngoài rạng rỡ, trẻ trung đầy sức sống cho bạn. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 0, 520000.00, 416000.000, '', '2023-11-15 04:16:04', 1, '2023-11-15 04:16:04', 1, 1),
(64, 14, 4, 'Nước Uống Kinohimitsu Đẹp Da J\'Pan Collagen Diamond 5300 Drink 50ml x 16', 'nuoc-uong-kinohimitsu-dep-da-jpan-collagen-diamond-5300-drink-50ml-x-16', 'nuoc-uong-kinohimitsu-dep-da-jpan-collagen-diamond-5300-drink-50ml-x-16.jpg', 'Nước Uống Kinohimitsu Đẹp Da J\'Pan Collagen Diamond 5300 50ml x 16 được thiết kế đặc biệt cho làn da trưởng thành để khôi phục sự trẻ trung, đàn hồi và rạng rỡ của da. So với collagen tự nhiên của da, Collagen Peptide có cấu trúc phân tử ngắn hơn nhưng do sự giống nhau của chúng, Collagen Peptide có thể dễ dàng được hấp thụ, giúp làm tăng tổng hợp collagen và sửa chữa các sợi collagen bị tổn thương để giảm thiểu các dấu hiệu lão hóa như nếp nhăn và da khô. Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.', 0, 1718000.00, 1499000.000, '', '2023-11-15 04:17:40', 1, '2023-11-15 04:17:40', 1, 1),
(65, 14, 4, 'Thực Phẩm Bảo Vệ Sức Khỏe Nucos Spa 10,000mg Whitening & Skin Therapy Giảm Lão Hóa Da 50ml x 10 Chai', 'thuc-pham-bao-ve-suc-khoe-nucos-spa-10-000mg-whitening-skin-therapy-giam-lao-hoa-da-50ml-x-10-chai', 'thuc-pham-bao-ve-suc-khoe-nucos-spa-10-000mg-whitening-skin-therapy-giam-lao-hoa-da-50ml-x-10-chai.jpg', 'Thực Phẩm Bảo Vệ Sức Khỏe Nucos Spa 10,000mg Whitening & Skin Therapy Giúp Sáng Da 50ml x 10 Chai là sản phẩm Collagen Peptide chiết xuất từ cá hồi Nhật Bản. Sản phẩm bảo vệ làn da của bạn khỏi sự tàn phá của thời gian bằng cách hỗ trợ bảo vệ da, giảm quá trình lão hóa da, giúp da sáng mịn. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 0, 1790000.00, 1468000.000, '', '2023-11-15 04:18:36', 1, '2023-11-15 04:18:36', 1, 1),
(66, 14, 4, 'Thực Phẩm Bảo Vệ Sức Khỏe DHC Collagen Beauty Collagen Nước 7000 Plus Hộp 10 Chai x 50ml', 'thuc-pham-bao-ve-suc-khoe-dhc-collagen-beauty-collagen-nuoc-7000-plus-hop-10-chai-x-50ml', 'thuc-pham-bao-ve-suc-khoe-dhc-collagen-beauty-collagen-nuoc-7000-plus-hop-10-chai-x-50ml.jpg', 'Thực Phẩm Bảo Vệ Sức Khỏe DHC Collagen Beauty Collagen Nước 7000 Plus Hộp 10 Chai x 50ml mang theo \"công thức đột phá, trẻ hóa tức thì\" của công nghệ Beauty Plus độc quyền từ DHC, bên cạnh hàm lượng collagen vượt trội, collagen nước DHC còn được tăng cường bổ sung thêm hơn 1000mg các siêu dưỡng chất hỗ trợ nâng cao hiệu quả làm đẹp là: 500mg vitamin C, 400mg citrulline, 200mg tiền chất HA. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 0, 1200000.00, 850000.000, '', '2023-11-15 04:19:52', 1, '2023-11-15 04:19:52', 1, 1),
(67, 14, 4, 'Kinohimitsu Giúp Trắng Da Và Gan Khoẻ Mạnh Prowhite 8g x 30', 'kinohimitsu-giup-trang-da-va-gan-khoe-manh-prowhite-8g-x-30', 'kinohimitsu-giup-trang-da-va-gan-khoe-manh-prowhite-8g-x-30.jpg', 'Kinohimitsu Giúp Trắng Da Và Gan Khoẻ Mạnh Prowhite 8g x 30 là một thức uống thơm ngon, cung cấp đầy đủ nhu cầu về sức khỏe và làm đẹp cơ thể. Sản phẩm chứa Glutathione, Camu-camu và Maqui Berry giúp loại bỏ các nhược điểm trên da, giảm thiểu quá trình Oxy hoá. Da sáng rạng ngời & gan khỏe mạnh. Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.', 0, 1718000.00, 1460000.000, '', '2023-11-15 04:20:54', 1, '2023-11-15 04:20:54', 1, 1),
(68, 15, 4, 'Miếng Dán Xông Hơi Vùng Chân MegRhythm - Không Hương 6 Miếng/Hộp', 'mieng-dan-xong-hoi-vung-chan-megrhythm-khong-huong-6-mieng-hop', 'mieng-dan-xong-hoi-vung-chan-megrhythm-khong-huong-6-mieng-hop.jpg', 'Miếng Dán Xông Hơi Vùng Chân MegRhythm - Không Hương 6 Miếng/Hộp là giải pháp mới cho những triệu chứng như bắp chân bị mỏi, chân có cảm giác bị trì trệ và nặng chân, giúp thư giãn vùng chân một cách nhanh chóng. Sản phẩm cung cấp nhiệt lên đến 40 độ giúp giảm đau cơ, nhức mỏi và căng thẳng. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 0, 160000.00, 120000.000, '', '2023-11-15 04:22:08', 1, '2023-11-15 04:22:09', 1, 1),
(69, 15, 4, 'Miếng Dán Thư Giãn Vùng Chân MegRhythm Carbonation-Softened - Hương Oải Hương - Bạc Hà 6 Miếng/Hộp', 'mieng-dan-thu-gian-vung-chan-megrhythm-carbonation-softened-huong-oai-huong-bac-ha-6-mieng-hop', 'mieng-dan-thu-gian-vung-chan-megrhythm-carbonation-softened-huong-oai-huong-bac-ha-6-mieng-hop.jpg', 'Miếng Dán Thư Giãn Vùng Chân MegRhythm Carbonation-Softened - Hương Oải Hương - Bạc Hà 6 Miếng/Hộp được làm mềm bằng cacbonat giúp giảm đau tạm thời cho mọi căng thẳng và đau nhức. Đắp tấm gel mềm lên vùng chân để tạo cảm giác mát lạnh và nhẹ nhàng. Miếng dán là giải pháp mới cho những triệu chứng như chân bị căng cơ, sưng phồng,... do lối sống bận rộn và vận động nhiều. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.\r\n', 0, 170000.00, 155000.000, '', '2023-11-15 04:23:06', 1, '2023-11-15 04:23:06', 1, 1),
(70, 15, 3, 'Xịt Khử Mùi Chân Etiaxil Dòng Hằng Ngày Anti-transpirant 48h 100ml', 'xit-khu-mui-chan-etiaxil-dong-hang-ngay-anti-transpirant-48h-100ml', 'xit-khu-mui-chan-etiaxil-dong-hang-ngay-anti-transpirant-48h-100ml.jpg', 'Xịt Khử Mùi Chân Etiaxil Dòng Hằng Ngày Anti-transpirant 48h 100ml\r\nXịt Khử Mùi Chân Etiaxil Dòng Hằng Ngày Anti-transpirant 48h là dòng sản phẩm sử dụng hàng ngày dành cho những người tiết mồ hôi ở vùng da chân. Xịt Khử Mùi Chân Etiaxil Dòng Hằng Ngày Anti-transpirant 48h có khả năng ngăn tiết mồ hôi và ngăn mùi lên đến 48h. Sản phẩm hầu như không gây kích ứng hoặc dị ứng trên da.', 0, 260000.00, 249000.000, '', '2023-11-15 04:24:21', 1, '2023-11-15 04:24:21', 1, 1),
(71, 16, 4, 'Dầu Gội Sạch Dầu Mát Lạnh Tsubaki Cool & Repair Shampoo 490ml', 'dau-goi-sach-dau-mat-lanh-tsubaki-cool-repair-shampoo-490ml', 'dau-goi-sach-dau-mat-lanh-tsubaki-cool-repair-shampoo-490ml.jpg', 'Thành Phần Chính Và Công Dụng:\r\n- Làm sạch bụi bẩn, bã nhờn, dầu thừa, không gây khô hay tổn hại cho mái tóc hay da đầu, giúp loại bỏ các vấn đề của da đầu như ngứa, khô, hạn chế tình trạng da đầu bị đổ dầu gây bết tóc & gây mùi khó chịu.\r\n- Công thức chứa bạc hà mang đến cảm giác mát lạnh sảng khoái suốt ngày dài.\r\n- Mùi hương hoa cỏ & bạc hà sang trọng, thanh mát\r\n\r\nHướng Dẫn Sử Dụng:\r\nLấy một lượng vừa đủ lên tay, xoa đều lên tóc ướt. Nhẹ nhàng xả sạch với nước.\r\n\r\nXuất Xứ Thương Hiệu:\r\nNhật Bản', 0, 100000.00, 100000.000, '', '2023-11-15 04:27:40', 1, '2023-11-15 04:27:40', 1, 1),
(72, 16, 1, 'Dầu Gội Trị Gàu Selsun 100ml', 'dau-goi-tri-gau-selsun-100ml', 'dau-goi-tri-gau-selsun-100ml.jpg', 'Thành Phần Chính và Công Dụng:\r\n- Dầu gội chống gàu Selsun với Selenium Sulfide 1% hiệu quả vượt trội trong việc tìm và đánh bay nấm gây gàu, làm sạch vảy nấm và ngứa da đầu. Nhờ vậy, Selsun giữ cho da đầu không gàu, không ngứa và luôn khỏe mạnh.\r\n- Với sự kết hợp hoàn hảo giữa thành phần dưỡng tóc Dimethicone và Tab 2, Selsun giúp duy trì mái tóc khỏe đẹp, mềm mại và dễ chải.\r\n- Có thể dùng Selsun cho cả tóc nhuộm và uốn.\r\nHướng Dẫn Sử Dụng:\r\n+ Lắc kỹ trước khi dùng.\r\n+ Thoa dầu gội lên chân tóc và da đầu ướt, để 2-3 phút cho kết quả tốt nhất. Xả sạch lại với nước. Để chống gàu hiệu quả, nên dùng đều đặn 2 lần/tuần cho đến khi gàu hết hẳn.\r\n+ Liều duy trì: dùng 1 lần/ tuần để ngăn ngừa gàu quay trở lại.\r\n+ Chú ý: Tránh tiếp xúc với mắt. Nếu dầu gội dính vào mắt, rửa kỹ bằng nước sạch.', 0, 93000.00, 81000.000, '', '2023-11-15 04:28:41', 1, '2023-11-15 04:28:41', 1, 1),
(73, 16, 4, 'Dầu Gội Tsubaki Phục Hồi Hư Tổn Chuyên Sâu Premium Ex Intensive Repair Shampoo 490ml', 'dau-goi-tsubaki-phuc-hoi-hu-ton-chuyen-sau-premium-ex-intensive-repair-shampoo-490ml', 'dau-goi-tsubaki-phuc-hoi-hu-ton-chuyen-sau-premium-ex-intensive-repair-shampoo-490ml.jpg', 'Dầu Gội Tsubaki Phục Hồi Hư Tổn Chuyên Sâu Premium Ex Intensive Repair Shampoo 490ml mang đến cho bạn mái tóc chắc khỏe và thơm ngát hương hoa. Các dưỡng chất phục hồi thiết yếu được thấm sâu và nuôi dưỡng tóc, mang đến một mái tóc khỏe đẹp hoàn hảo.', 0, 100000.00, 100000.000, '', '2023-11-15 04:29:24', 1, '2023-11-15 04:29:24', 1, 1),
(74, 17, 4, 'Dầu Xả Naturals By Watsons True Natural Argan Conditioner 490ml', 'dau-xa-naturals-by-watsons-true-natural-argan-conditioner-490ml', 'dau-xa-naturals-by-watsons-true-natural-argan-conditioner-490ml.jpg', 'Thành phần chính và công dụng:\r\nSử dụng cho tóc và da đầu. Giúp dưỡng tóc và da đầu. Giúp dưỡng ẩm cho tóc. Giúp tóc mềm mượt.\r\n\r\nĐối tượng sử dụng:\r\nDầu Xả Naturals By Watsons True Natural Argan Conditioner 490ml phù hợp sử dụng cho mọi loại tóc.\r\n\r\nHướng dẫn sử dụng:\r\nSau khi gội đầu, lấy một lượng vừa đủ sản phẩm thoa lên tóc ướt, sau đó mát-xa nhẹ nhàng. Gội sạch lại bằng nước ấm.', 0, 130000.00, 120000.000, '', '2023-11-15 04:30:50', 1, '2023-11-15 04:30:50', 1, 1),
(75, 17, 4, 'Dầu Xả Sạch Dầu Mát Lạnh Tsubaki Cool & Repair Conditioner 490ml', 'dau-xa-sach-dau-mat-lanh-tsubaki-cool-repair-conditioner-490ml', 'dau-xa-sach-dau-mat-lanh-tsubaki-cool-repair-conditioner-490ml.jpg', 'Thành Phần Chính Và Công Dụng:\r\n- Nuôi dưỡng & phục hồi mái tóc hư tổn, mang lại mái tóc mềm mại & bóng mượt, hạn chế tình trạng tóc gãy rụng do khô rối.\r\n- Đồng thời, giúp loại bỏ các vấn đề của da đầu như ngứa, khô, hạn chế tình trạng da đầu bị đổ dầu gây bết tóc & gây mùi khó chịu.\r\n- Công thức chứa bạc hà mang đến cảm giác mát lạnh sảng khoái suốt ngày dài.\r\n- Mùi hương hoa cỏ & bạc hà sang trọng, thanh mát\r\n\r\nHướng Dẫn Sử Dụng:\r\nSau khi gội, lấy một lượng vừa đủ lên tay, xoa đều lên tóc. Nhẹ nhàng xả sạch với nước.\r\n\r\nXuất Xứ Thương Hiệu:\r\nNhật Bản', 0, 215000.00, 215000.000, '', '2023-11-15 04:31:56', 1, '2023-11-15 04:31:56', 1, 1),
(76, 17, 2, 'Dầu Xả Derma & More Cica Nourishing Chăm Sóc Tóc Hư Tổn 600ml', 'dau-xa-derma-more-cica-nourishing-cham-soc-toc-hu-ton-600ml', 'dau-xa-derma-more-cica-nourishing-cham-soc-toc-hu-ton-600ml.jpg', 'Dầu Xả Derma & More Cica Nourishing Chăm Sóc Tóc Hư Tổn 600ml với thành phần có trong lá và cây rau má giúp chăm sóc da đầu và tóc từ sâu bên trong giúp phục hồi hư tổn. Dầu xả giảm gãy rụng, chẻ ngọn, cho bạn mái tóc chắc khỏe, bóng mượt đồng thời cấp ẩm, phục hồi tóc sau sử dụng hóa chất, giảm tình trạng khô, xơ, dễ rối.', 0, 160000.00, 143000.000, '', '2023-11-15 04:33:30', 1, '2023-11-15 04:33:30', 1, 1),
(77, 17, 7, 'Dầu Xả L\'Oréal Paris Elseve Fall Resist 3x Anti-Hairfall Giảm Gãy Rụng 280ml', 'dau-xa-loreal-paris-elseve-fall-resist-3x-anti-hairfall-giam-gay-rung-280ml', 'dau-xa-loreal-paris-elseve-fall-resist-3x-anti-hairfall-giam-gay-rung-280ml.jpg', 'Dầu Xả L\'Oréal Paris Elseve Fall Resist 3x Anti-Hairfall Giảm Gãy Rụng 280ml cung cấp cho tóc các dưỡng chất thiết yếu, ngăn tóc gãy rụng mang đến cho bạn mái tóc đẹp và chắc khỏe hơn. Công thức ngăn rụng tóc với 3 tác động: nuôi dưỡng từ gốc, tái tạo cấu trúc sợi tóc, tóc mọc khỏe hơn.', 0, 109000.00, 109000.000, '', '2023-11-15 04:34:12', 1, '2023-11-15 04:34:12', 1, 1),
(78, 18, 2, 'Lược Wet Brush Pro Flex Dry Metamorphosis Sapphire Empress Gỡ Rối & Giảm Rụng Tóc 1 Cái', 'luoc-wet-brush-pro-flex-dry-metamorphosis-sapphire-empress-go-roi-giam-rung-toc-1-cai', 'luoc-wet-brush-pro-flex-dry-metamorphosis-sapphire-empress-go-roi-giam-rung-toc-1-cai.jpg', 'Lược Wet Brush Pro Flex Dry Metamorphosis Sapphire Empress Gỡ Rối & Giảm Rụng Tóc 1 Cái\r\nLược Wet Brush Pro Flex Dry Metamorphosis Sapphire Empress Gỡ Rối & Giảm Rụng Tóc là dòng sản phẩm chuyên dụng gỡ rối dành cho tóc ướt kèm công năng làm khô tóc nhanh hơn bình thường tới 30%. Cán lược như một lõi thông gió, giúp đẩy hơi ẩm từ sâu bên trong các lớp tóc, giúp người dùng chải khô tóc nhanh hơn 30% so với thông thường. Ngoài ra, khi kết hợp Flex Dry với máy sấy nóng thì thiết kế OmniFlex(R) có thể bỏ qua nhiệt thừa và tránh giữ lại nhiệt quá lâu trên thân tóc, điều này tránh làm hư hại tóc, giúp tóc của bạn giữ lại vẻ bóng mượt và khỏe hơn.', 0, 390000.00, 390000.000, '', '2023-11-15 04:35:28', 1, '2023-11-15 04:35:28', 1, 1),
(79, 18, 2, 'Lược Wet Brush Pro Shine Enhancer Purple Gỡ Rối & Giảm Rụng Tóc 1 Cái', 'luoc-wet-brush-pro-shine-enhancer-purple-go-roi-giam-rung-toc-1-cai', 'luoc-wet-brush-pro-shine-enhancer-purple-go-roi-giam-rung-toc-1-cai.jpg', 'Thành phần chính và công dụng:\r\n- Lược Wet Brush Pro Shine Enhancer Purple Gỡ Rối & Giảm Rụng Tóc độc quyền sáng chế sợi lược siêu mềm và linh hoạt IntelliFlex(R) giúp răng lược dẻo dai, linh hoạt, mạnh mẽ, có thể vượt qua mối rối một cách dễ dàng mà không để lại bất cứ tổn thương nào trên bề mặt thân sợi tóc, giảm thiểu đau nhức cho tóc không bị chẻ ngọn và gãy rụng.\r\n- Những sợi lông heo rừng gắn phía dưới chân sợi răng lược intelliFlex(R) có khả năng chiết xuất ra dầu dưỡng tự nhiên để làm bóng tóc, bên cạnh đó có thể dùng chiếc này với dầu gội khô (dry shampoo) hoặc dưỡng tóc, các sợi lông heo có tác dụng phân bổ dầu gội hoặc dưỡng chất tới toàn bộ các sợi tóc ở phía sâu bên trong các lớp tóc.\r\n- Đầu sợi răng lược được bọc 1 lớp nhựa tròn có tên gọi là Polysoft, có tác dụng mát xa da đầu, kích thích mọc tóc.\r\n- Bản lược rộng giúp chải tóc theo lọn sóng gọn và đẹp hơn, đồng thời dễ dàng loại bỏ gầu, bụi bẩn ra khỏi chân tóc tạo độ phòng và sự mềm mại, bồng bềnh cho mái tóc.\r\n- Cán lược được làm từ nhựa ABS nguyên sinh, an toàn cho sức khoẻ.\r\n\r\nĐối tượng sử dụng:\r\nLược Wet Brush Pro Shine Enhancer Purple Gỡ Rối & Giảm Rụng Tóc phù hợp sử dụng cho mọi loại tóc, trừ tóc nối.\r\n\r\nHướng dẫn sử dụng:\r\n- Lược dùng để tạo ra phong cách chuyên nghiệp và giúp bạn duy trì mái tóc khỏe đẹp.', 0, 190000.00, 170000.000, '', '2023-11-15 04:36:48', 1, '2023-11-15 14:20:51', 6, 1),
(80, 9, 7, 'Mặt nạ dưỡng chất pha lê L\'Oreal Paris Revitalift Crystal, dưỡng sáng mờ thâm LOreal Paris Glycolic (AHA) Bright, Pháp', 'mat-na-duong-chat-pha-le-loreal-paris-revitalift-crystal-duong-sang-mo-tham-loreal-paris-glycolic-aha-bright-phap', 'mat-na-duong-chat-pha-le-loreal-paris-revitalift-crystal-duong-sang-mo-tham-loreal-paris-glycolic-aha-bright-phap.jpg', 'L’Oréal là tập đoàn chuyên về mỹ phẩm và chăm sóc sắc đẹp lớn thế giới. L’Oréal Paris đã có mặt tại hơn 120 quốc gia với các dòng sản phẩm về chăm sóc tóc, chăm sóc da và trang điểm dành cho đại chúng. Được xây dựng trên nền tảng khoa học, áp dụng những phát minh công nghệ mới, các sản phẩm L’Oréal Paris có chất lượng cao cấp, đa dạng, dễ sử dụng, với mức giá phù hợp cho tất cả mọi người, đáp ứng nhiều nhu cầu làm đẹp. L’Oréal Paris là nhãn hiệu mỹ phẩm hàng đầu tại Châu Âu được sản xuất tại nhiều nhà máy trên toàn thế giới như Trung Quốc, Mỹ, Indonesia… Dù được sản xuất ở đâu, các sản phẩm đều tuân theo quy trình kiểm soát chất lượng nghiêm ngặt và đồng đều của L’Oréal toàn cầu.', 0, 140000.00, 120000.000, '', '2023-11-15 19:24:38', 6, '2023-11-15 19:24:38', 1, 1),
(81, 9, 7, 'Mặt nạ đất sét nguyên chất L\'Oreal Skin Expert Detox & Brighten 48g [Mỹ]', 'mat-na-dat-set-nguyen-chat-loreal-skin-expert-detox-brighten-48g-my', 'mat-na-dat-set-nguyen-chat-loreal-skin-expert-detox-brighten-48g-my.jpg', '????????̣̆???? ????????̣ đ????̂́???? ????????́???? ????????????????????̂???? ????????????̂́???? ????\'???????????????????? ???????????????? ???????????????????????? ???????????????????? & ???????????????????????????????? mang lại một số lợi ích cho da:\r\n\r\n♦ Giải độc cho da: Công thức dựa trên đất sét của mặt nạ giúp loại bỏ các tạp chất và độc tố khỏi da, giải độc hiệu quả. Điều này có thể giúp cải thiện độ trong và vẻ ngoài tổng thể của làn da của bạn.\r\n\r\n♦ Làm sạch sâu lỗ chân lông: Mặt nạ được thiết kế để làm thông thoáng và se khít lỗ chân lông, giúp giảm sự xuất hiện của chúng và ngăn ngừa sự tích tụ của bụi bẩn, dầu và tế bào da chết. Hành động làm sạch sâu này có thể mang lại kết cấu da mịn màng và tinh tế hơn.\r\n\r\n♦ Làm sáng da: Mặt nạ chứa các thành phần có thể giúp làm sáng da và làm đều màu da. Điều này có thể mang lại một làn da rạng rỡ và tươi sáng hơn.\r\n\r\n♦ Làm dịu và làm dịu da: Ngoài tác dụng giải độc, mặt nạ còn có chiết xuất thực vật mang lại đặc tính làm dịu và làm dịu da. Điều này có thể làm cho nó phù hợp ngay cả với các loại da nhạy cảm, giúp giảm thiểu mọi kích ứng hoặc mẩn đỏ tiềm ẩn.\r\n\r\n♦ Phù hợp với mọi loại da: Mặt nạ đất sét tinh khiết L\'Oreal Skin Expert Detox & Brighten được bào chế phù hợp với mọi loại da, kể cả da nhạy cảm. Tuy nhiên, bạn nên kiểm tra trước khi sử dụng bất kỳ sản phẩm chăm sóc da mới nào để đảm bảo khả năng tương thích với làn da của bạn.\r\n\r\n►Ngay sau khi sử dụng, làn da trông sáng hơn với ánh sáng khỏe mạnh. Bụi bẩn và ô nhiễm được loại bỏ. Da trông mịn màng hơn, tông màu da đều hơn. ', 0, 410000.00, 410000.000, '', '2023-11-15 19:25:33', 6, '2023-11-15 19:25:33', 1, 1),
(82, 9, 7, 'Mặt Nạ Dưỡng Chất Hỗ Trợ Sáng Da Glycolic Loreal 22G', 'mat-na-duong-chat-ho-tro-sang-da-glycolic-loreal-22g', 'mat-na-duong-chat-ho-tro-sang-da-glycolic-loreal-22g.jpg', 'Mặt Nạ L\'Oreal Glycolic Bright Dưỡng Chất Sáng Da Instant Glowing Serum Mask 22g với Axit Glycolic làm sáng làm giảm các đốm đen và che phủ các khuyết điểm cho làn da sáng, mờ thâm. Sản phẩm đã được chứng minh lâm sàng để tăng lá chắn bảo vệ da chống lại các tia UV có hại.\r\n\r\nThành Phần Chính Và Công Dụng:\r\n\r\nViện Nghiên cứu L’Oréal Paris giới thiệu Mặt nạ Sáng Da L’ORÉAL PARIS GLYCOLIC-BRIGHT GLOWING SERUM MASK được chứng minh giảm các vết thâm nám và vùng da sạm màu. Với công thức đặc biệt kết hợp giữa Glycolic Acid - giúp làm sáng da và Vitamin E – thành phần giảm tác hại của quá trình oxy hóa, giảm sự hình thành các vùng da sạm màu, cho làn da sáng, đều màu rõ rệt.\r\nGlycolic Acid có trọng lượng phân tử nhỏ nhất trong nhóm AHA, giúp thẩm thấu sâu hơn và làm sạch tế bào da chết nhẹ nhàng trên bề mặt da giúp hỗ trợ quá trình tái tạo da, cho làn da trông tươi sáng, rạng rỡ hơn. Mặt nạ dưỡng da, cung cấp dưỡng chất, làm sáng, đều màu da, làm giảm tình trạng da xỉn màu, giảm vết thâm, cho làn da trông rạng rỡ hơn..', 0, 310000.00, 210000.000, '', '2023-11-15 19:26:27', 6, '2023-11-15 19:26:29', 1, 1),
(83, 9, 2, 'Hộp 12 Mặt Nạ Cà Rốt Sủi Bọt YANFU GINBI 4g x 12 Gói MÃ 0461(Màu Cam)', 'hop-12-mat-na-ca-rot-sui-bot-yanfu-ginbi-4g-x-12-goi-ma-0461-mau-cam', 'hop-12-mat-na-ca-rot-sui-bot-yanfu-ginbi-4g-x-12-goi-ma-0461-mau-cam.jpg', 'Hộp 12 Mặt Nạ Cà Rốt Sủi Bọt 4g x 12 Gói MÃ 0461(Màu Cam)\r\n\r\nTên: Mặt nạ bọt cà rốt axit tổng hợp\r\n\r\nThông số kỹ thuật: 12 chiếc / hộp\r\n\r\nHiệu ứng:\r\n\r\nSản phẩm này tạo bọt phong phú và tinh tế, làm sạch sâu, cải thiện làn da khô và thô ráp, làm sạch bụi bẩn trên da, dưỡng ẩm và cấp nước, đồng thời giúp da thông thoáng và giữ ẩm, tinh tế và mịn màng.\r\n\r\nSử DỤNG:\r\n\r\n1.Lấy một lượng vừa đủ thoa lên mặt.\r\n\r\n2.Xoay đều khắp mặt.\r\n\r\n3.Tạo ra bọt sạch, phong phú.\r\n\r\n4.Xả lại bằng nước sạch.', 0, 70000.00, 69000.000, '', '2023-11-15 19:27:39', 6, '2023-11-15 19:27:39', 1, 1),
(84, 9, 1, 'CHÍNH HÃNG] Mặt nạ diếp cá Meea Organic Dưỡng Trắng Da Giảm Thâm Se Khít Lỗ Chân Lông Giữ Ẩm 120g - Teri.House', 'chinh-hang-mat-na-diep-ca-meea-organic-duong-trang-da-giam-tham-se-khit-lo-chan-long-giu-am-120g-teri-house', 'chinh-hang-mat-na-diep-ca-meea-organic-duong-trang-da-giam-tham-se-khit-lo-chan-long-giu-am-120g-teri-house.jpg', 'THÔNG TIN SẢN PHẨM: Mặt nạ diếp cá\r\n✔️ Tên sản phẩm: MẶT NẠ DIẾP CÁ TÁI SINH\r\n✔️ Thương hiệu: MEEA ORGANIC\r\n✔️ Xuất xứ: Việt Nam\r\n✔️ Quy cách: Hộp 120g\r\n✔️ Đối tượng sử dụng: cả Nam và Nữ\r\n✔️ Hạn sử dụng: 3 năm (date luôn mới nhất)\r\n✔️ Đơn vị sở hữu: CÔNG TY CỔ PHẦN THƯƠNG MẠI DỊCH VỤ KIỆT ANH KHANG\r\n✔️ Địa chỉ: Lô A3 đường Nguyễn Huệ, Khu phố 3, thị trấn Trảng Bom, huyện Trảng Bom, Đồng Nai.', 0, 289000.00, 280000.000, '', '2023-11-15 19:28:39', 6, '2023-11-15 19:28:39', 1, 1),
(85, 19, 3, 'Serum dưỡng tóc mới Mise En Scene 80ml', 'serum-duong-toc-moi-mise-en-scene-80ml', 'serum-duong-toc-moi-mise-en-scene-80ml.jpg', ' Giao hàng tốc hành trong TP.HCM trong vòng 2 tiếng khi khách chọn giao hàng hỏa tốc\r\n☎ / Zalo 0️⃣3️⃣4️⃣4️⃣0️⃣1️⃣1️⃣4️⃣3️⃣6️⃣\r\n-----------------------------------------------------\r\n✔️ Serum dưỡng tóc mới Mise En Scene 80ml, có 5 dòng\r\n1. Dòng ORIGINAL vàng đậm: bán chạy nhất bản orginal \r\n- Dòng cơ bản chính bán chạy nhất, dùng cho mọi loại tóc, giúp tóc mềm mượt, phục hồi hư tổn.\r\n\r\n2. Dòng SUPER RICH đỏ nâu: \r\n- Dành cho tóc hư tổn nhiều, chẻ ngọn, tóc uốn, tóc tẩy, tóc khô xơ.\r\n\r\n3. Dòng STYLING hồng phấn: \r\n- Dầu dưỡng + hỗ trợ giữ nếp cho tóc tạo kiểu . Sử dụng cả trước và sau khi tạo kiểu tóc để đạt hiệu quả tốt nhất. \r\nDành cho tóc uốn nhuộm\r\n', 0, 100000.00, 100000.000, '', '2023-11-15 19:30:18', 6, '2023-11-15 19:30:18', 1, 1),
(86, 19, 1, '[CHÍNH HÃNG] XỊT BƯỞI KÍCH MỌC NGĂN RỤNG TÓC PHƯƠNG ANH COSMETIC 100ml, Dưỡng Tóc Bóng Mượt', 'chinh-hang-xit-buoi-kich-moc-ngan-rung-toc-phuong-anh-cosmetic-100ml-duong-toc-bong-muot', 'chinh-hang-xit-buoi-kich-moc-ngan-rung-toc-phuong-anh-cosmetic-100ml-duong-toc-bong-muot.jpg', 'Xịt Nước Tinh Dầu Bưởi Kích Mọc Tóc,Giảm Rụng Tóc,Dưỡng Tóc, Dài Tóc PHƯƠNG ANH COSMETIC 100ml\r\n\r\n-Thương hiệu : Phương Anh Cosmetic\r\n-Nơi sản xuất : An Giang - Việt Nam\r\n-Dung tích : 100ml\r\n-Hạn sử dụng : 24 tháng kể từ ngày sản xuất\r\n-Thành phần : Nước cất từ hoa bưởi và hoa bưởi, tinh dầu tràm trà, vitamin B5, dầu argan\r\n\r\nCông dụng :\r\n- Kích thích nang tóc phát triển, giúp tóc mọc dài nhanh.\r\n- Giúp đẩy nhanh quá trình phục hồi tóc, cho mái tóc chắc khỏe, góp phần ngăn ngưa và làm giảm xơ rối, chẻ ngọn, gãy rụng tóc.\r\n\r\nHướng dẫn sử dụng:\r\n-Lắc đều chai xịt bưởi rồi xịt vào da đầu, xịt vào những chỗ tóc thưa cần kích tóc con.\r\n-Massage da đầu trong 3-5\' để dưỡng chất ngấm đều vào da đầu và máu huyết được lưu thông.\r\n-Sử dụng ngày 2-3 lần , nhất là buổi tối trước khi đi ngủ để đạt hiệu quả tốt nhất. Sử dụng khi tóc sạch.', 0, 210000.00, 190000.000, '', '2023-11-15 19:31:12', 6, '2023-11-15 19:31:12', 1, 1),
(87, 19, 1, 'Xịt tinh dầu Bưởi Xanh kích thích mọc tóc ngăn rụng tóc, làm dày tóc, nấm gàu da đầu', 'xit-tinh-dau-buoi-xanh-kich-thich-moc-toc-ngan-rung-toc-lam-day-toc-nam-gau-da-dau', 'xit-tinh-dau-buoi-xanh-kich-thich-moc-toc-ngan-rung-toc-lam-day-toc-nam-gau-da-dau.jpg', 'Tinh dầu Bưởi Xanh ngăn rụng tóc và kích thích mọc tóc - Xịt bưởi, xịt mọc tóc bưởi xanh\r\n\r\n\r\n\r\nTinh dầu Bưởi Xanh ngăn rụng tóc và kích thích mọc tóc\r\n\r\n\r\n\r\n•	Dung tích: 100ml\r\n\r\n\r\n\r\n•	Xuất xứ: Việt Nam\r\n\r\n\r\n\r\n- TÁC DỤNG : Tinh dầu Bưởi Xanh ngăn rụng tóc và kích thích mọc tóc\r\n\r\n\r\n\r\n➟ Kích mọc tóc, làm dài tóc, dày tóc, phục hồi hư tổn cho tóc \r\n\r\n\r\n\r\n➟ Ngăn rụng tóc giúp cho mái tóc bóng khỏe chắc đẹp. \r\n\r\n\r\n\r\n➟ Giảm tóc khô xơ, phục hồi tóc chẻ ngọn và bị cháy do hóa chất \r\n\r\n\r\n\r\n➟ Sau 1 tháng dài từ 4- 6 cm ➟ Mùi thơm cực dễ chịu, không gây bết dính tóc \r\n\r\n', 0, 120000.00, 110000.000, '', '2023-11-15 19:31:57', 6, '2023-11-15 19:31:57', 1, 1),
(88, 19, 1, 'Xịt tinh dầu bưởi xanh beautywithhan kích mọc tóc hiệu quả xịt tóc hair mist nhà Thảo Phùng', 'xit-tinh-dau-buoi-xanh-beautywithhan-kich-moc-toc-hieu-qua-xit-toc-hair-mist-nha-thao-phung', 'xit-tinh-dau-buoi-xanh-beautywithhan-kich-moc-toc-hieu-qua-xit-toc-hair-mist-nha-thao-phung.jpg', 'Về vấn đề hạn sử dụng là lô mới mỗi tuần hàng làm theo mẻ thủ công mà tem được in hàng loạt nên trên tem không có hạn sử dụng chi tiết. Hạn sử dụng là 2024, và khách lưu ý sử dụng tốt nhất trước 6 tháng hộ em nha. Bên em không chấp nhận giải quyết vấn đề hoàn hàng vì không có lô hạn sử dụng ạ. Vì sản phẩm của hãng là như vậy. Khách iu lưu ý trước khi mua hộ bên em. Khách quen ai mua dùng cũng quen hết rồi ạ, mấy chị khách mới thì lưu ý hộ bên em nha . Bên em hàng không đủ bán thì không có hàng tồn kho hàng cũ gì đâu ạ. \r\n???? Xịt tinh dầu  bưởi beautywithhan kích mọc tóc hiệu quả xịt tóc hair mist nhà Thảo Phùng\r\n+ Tên sản phẩm : Xịt kích mọc tóc tinh dầu Vỏ Bưởi Xanh @beautywithHan\r\n + Tên và địa chỉ của tổ chức, cá nhân chịu trách nhiệm về hàng hóa : Shop @beautywithHan - đường Mậu Thân , p. An Hòa, Ninh Kiều, Cần Thơ.', 0, 310000.00, 310000.000, '', '2023-11-15 19:32:46', 6, '2023-11-15 19:32:46', 1, 1),
(89, 19, 1, 'Xịt Kích Mọc Tóc Dưỡng Da Đầu Nuôi Dưỡng Nang Tóc Chắc Khỏe Dành Cho Tóc Rụng Mỏng Yếu Hasol Anagen Active Tonic 100ml', 'xit-kich-moc-toc-duong-da-dau-nuoi-duong-nang-toc-chac-khoe-danh-cho-toc-rung-mong-yeu-hasol-anagen-active-tonic-100ml', 'xit-kich-moc-toc-duong-da-dau-nuoi-duong-nang-toc-chac-khoe-danh-cho-toc-rung-mong-yeu-hasol-anagen-active-tonic-100ml.jpg', 'Xịt dưỡng da đầu Ecomine Ha’sol cho tóc rụng, mỏng và yếu\r\n\r\nHa’sol là dòng sản phẩm chăm sóc tóc chuyên dụng của Ecomine được phát triển từ năm 1992. Ecomine Ha’sol Anagen Scalp Active Tonic là sản phẩm chăm sóc chuyên sâu cho da đầu khô, tóc rụng và yếu. Cung cấp độ ẩm và dinh dưỡng cho da đầu và tóc, giữ cho tóc khỏe và bóng mượt.\r\n\r\nCông dụng chính:\r\nNgăn ngừa rụng tóc, tăng độ dày của tóc nhờ cải thiện môi trường da đầu.\r\nCung cấp dinh dưỡng giúp da đầu khỏe hơn.\r\n\r\nSản phẩm giúp ngăn ngừa rụng tóc hiệu quả được chứng nhận bởi Bộ an toàn Thực phẩm và Dược phẩm Hàn Quốc.\r\n\r\nThành phần chính:\r\nL-Menthol, axit salicylic, Dex-panthenol, chiết xuất nhân sâm, chiết xuất cải ngựa, chiết xuất lá xanh, chiết xuất trà xanh.\r\n', 0, 150000.00, 120000.000, '', '2023-11-15 19:33:43', 6, '2023-11-15 19:33:43', 1, 1);
INSERT INTO `0352_product` (`id`, `category_id`, `brand_id`, `name`, `slug`, `image`, `detail`, `qty`, `price`, `pricesale`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(90, 19, 2, 'Combo Tinh chất nuôi dưỡng và kem ủ phục hồi chăm sóc tóc khô, hư tổn UNOVE Silk Oil Essence x Deep Damage Treatment EX', 'combo-tinh-chat-nuoi-duong-va-kem-u-phuc-hoi-cham-soc-toc-kho-hu-ton-unove-silk-oil-essence-x-deep-damage-treatment-ex', 'combo-tinh-chat-nuoi-duong-va-kem-u-phuc-hoi-cham-soc-toc-kho-hu-ton-unove-silk-oil-essence-x-deep-damage-treatment-ex.jpg', 'Combo Tinh chất nuôi dưỡng và kem ủ phục hồi chăm sóc tóc khô và hư tổn UNOVE Silk Oil Essence x Deep Damage Treatment EX\r\n\r\n\r\n\r\nTẶNG COMBO PHỤC HỒI TÓC CHUYÊN SÂU CHO ĐƠN HÀNG ĐẠT GIÁ TRỊ CAO NHẤT THÁNG 10\r\n\r\n\r\n\r\nMô tả sản phẩm:\r\n\r\n- Thương hiệu: UNOVE\r\n\r\n- Xuất xứ: Hàn Quốc\r\n\r\n- Dung tích: Deep Damage Treatment EX 207ml X UNOVE Silk Oil Essence 70ml\r\n\r\n- Quy cách: Chai', 0, 278000.00, 250000.000, '', '2023-11-15 19:34:46', 6, '2023-11-15 19:34:46', 1, 1),
(91, 19, 1, 'Nước Xịt Dưỡng Tóc Khô Xơ & Hư Tổn Double Rich 250ml', 'nuoc-xit-duong-toc-kho-xo-hu-ton-double-rich-250ml', 'nuoc-xit-duong-toc-kho-xo-hu-ton-double-rich-250ml.jpg', 'Nước dưỡng tóc giúp giảm gãy rụng & làm mềm tóc Double Rich BW Double Repair Hàn Quốc, bổ sung vitamin, protein dồi dào phục hồi sâu bên trong tóc, cân bằng độ ẩm giúp tóc suôn mượt, không bết dính. \r\n\r\n\r\n\r\nĐặc biệt nước dưỡng tóc Double Rich với các ưu điểm nổi bật như:\r\n\r\n\r\n\r\n• Không chứa cồn (Alcohol free) => tác nhân hàng đầu gây rụng tóc\r\n\r\n• Không Paraben (Paraben free) => gây mất độ ẩm da đầu\r\n\r\n\r\n\r\nVà nếu bạn đang gặp các vấn đề về tóc như sau:\r\n\r\n1. Tóc gãy rụng nhiều khi chải hay vuốt tóc\r\n\r\n2. Tóc nhanh phai màu, không có độ phồng\r\n\r\n3. Tóc khô, hư tổn sau nhuộm, xơ rối, chẻ ngọn, gãy rụng', 0, 104000.00, 100000.000, '', '2023-11-15 19:35:44', 6, '2023-11-15 19:35:44', 1, 1),
(92, 5, 4, '[CHÍNH HÃNG] Kem nền tự nhiên CLE DE PEAU BEAUTÉ Radiant Fluid Foundation Natural Spf25 PA++ 35ml', 'chinh-hang-kem-nen-tu-nhien-cle-de-peau-beaute-radiant-fluid-foundation-natural-spf25-pa-35ml', 'chinh-hang-kem-nen-tu-nhien-cle-de-peau-beaute-radiant-fluid-foundation-natural-spf25-pa-35ml.jpg', 'Tham khảo màu sắc:\r\nBắt đầu với 0C là màu tiêu chuẩn, phù hợp với làn da của người châu Á nói chung\r\nNhững màu bắt đầu với PO thuộc phạm vi giữa màu tiêu chuẩn OC và hồng\r\nThích hợp cho các bạn gái có làn da trắng nhưng không ra máu nhiều, có thể làm cho khuôn mặt hồng hào hơn, và có thể hiển thị làn da trắng và đỏ\r\n\r\nNó cũng giúp tăng cường hiệu quả nuôi dưỡng làn da, tạo cảm giác dễ chịu và hiệu ứng trang điểm là trang điểm nude tự nhiên, nhẹ nhàng và tự nhiên.', 0, 102000.00, 100000.000, '', '2023-11-15 19:38:01', 6, '2023-11-15 19:38:01', 1, 1),
(93, 5, 2, '[Bản mới] Kem nền YSL All Hours Luminous Matte Foundation kem nền kiềm dầu che phủ suốt 24h', 'ban-moi-kem-nen-ysl-all-hours-luminous-matte-foundation-kem-nen-kiem-dau-che-phu-suot-24h', 'ban-moi-kem-nen-ysl-all-hours-luminous-matte-foundation-kem-nen-kiem-dau-che-phu-suot-24h.jpg', 'Kem nền mới xịn xò với lớp finish matte, độ che phủ tốt, kiềm dầu đỉnh, bền màu & lâu trôi, đặc biệt rất phù hợp với khí hậu Việt Nam.\r\n Khả năng che phủ tuyệt đỉnh mà vẫn mỏng nhẹ, che phủ hầu hết các vết, mụn, tàn nhang, nám, lỗ chân lông to mà trông vẫn tự nhiên không tì vết.\r\n Ưng nhất là độ bám siêu tốt, cho lớp nền bền đẹp không xuống tone kéo dài cả ngày. \r\n\r\n100% Hàng chính hãng', 0, 100000.00, 100000.000, '', '2023-11-15 19:38:48', 6, '2023-11-15 19:38:48', 1, 1),
(94, 5, 2, 'Kem che khuyết điểm Catrice Ultimate Camouflage Cream chất kem lì che phủ cực cao chống nước lâu trôi 3g', 'kem-che-khuyet-diem-catrice-ultimate-camouflage-cream-chat-kem-li-che-phu-cuc-cao-chong-nuoc-lau-troi-3g', 'kem-che-khuyet-diem-catrice-ultimate-camouflage-cream-chat-kem-li-che-phu-cuc-cao-chong-nuoc-lau-troi-3g.jpg', 'Kem che khuyết điểm Catrice Ultimate Camouflage Cream chất kem lì che phủ cực cao chống nước lâu trôi 3g', 0, 154000.00, 120000.000, '', '2023-11-15 19:39:52', 6, '2023-11-15 19:39:52', 1, 1),
(95, 5, 4, 'Phấn Nước Cushion GOGO TALES Square Box GT543 Kèm Lõi Thay Thế - GOGO TALES', 'phan-nuoc-cushion-gogo-tales-square-box-gt543-kem-loi-thay-the-gogo-tales', 'phan-nuoc-cushion-gogo-tales-square-box-gt543-kem-loi-thay-the-gogo-tales.jpg', 'Phấn Nước Cushion GOGO TALES Square Box GT543 Kèm Lõi Thay Thế - GOGO TALES', 0, 120000.00, 110000.000, '', '2023-11-15 19:40:30', 6, '2023-11-15 19:40:30', 1, 1),
(96, 6, 2, 'Chì Kẻ Mày, Kẻ Mắt Siêu Mảnh 2 in 1 Duo Brow And Eyeliner By Nongchat - Wincy Mart', 'chi-ke-may-ke-mat-sieu-manh-2-in-1-duo-brow-and-eyeliner-by-nongchat-wincy-mart', 'chi-ke-may-ke-mat-sieu-manh-2-in-1-duo-brow-and-eyeliner-by-nongchat-wincy-mart.jpg', 'Siêu mịn gồm hai đầu vô cùng tiện lợi và tiết kiệm chi phí, vừa kẻ chân mày vừa kẻ mí mắt bút kẻ chân mày điều chỉnh đậm nhạt tùy ý - mịn - dễ tán - đều và đẹp long lanh.\r\n\r\nBrowit Duo Brown and Eyeliner: Sản phẩm kẻ chân mày và đường viền mắt 2 trong 1\r\n- Lông mày đậm, đôi mắt sắc nét, kết thúc bằng một que.\r\n- Vẽ chân mày, dễ kiểm soát, đẹp, lâu trôi.\r\n- Kẻ mắt, đường kẻ đẹp, sắc nét, đen sâu.', 0, 10000.00, 10000.000, '', '2023-11-15 19:43:04', 6, '2023-11-15 19:43:05', 1, 1),
(97, 6, 8, 'Flortte FLORTTE FLORTTE Bảng Phấn Bắt Sáng Hai Đầu Ánh Ngọc Trai Mềm Mịn Như Lụa', 'flortte-flortte-flortte-bang-phan-bat-sang-hai-dau-anh-ngoc-trai-mem-min-nhu-lua', 'flortte-flortte-flortte-bang-phan-bat-sang-hai-dau-anh-ngoc-trai-mem-min-nhu-lua.jpg', 'Flortte FLORTTE FLORTTE Bảng Phấn Bắt Sáng Hai Đầu Ánh Ngọc Trai Mềm Mịn Như Lụa', 0, 15000.00, 10000.000, '', '2023-11-15 19:43:46', 6, '2023-11-15 19:43:46', 1, 1),
(98, 6, 4, 'PVN57885 Bút kẻ mắt Suake vỏ nhũ bạc lấp lánh', 'pvn57885-but-ke-mat-suake-vo-nhu-bac-lap-lanh', 'pvn57885-but-ke-mat-suake-vo-nhu-bac-lap-lanh.jpg', 'Tên sản phẩm: Bút kẻ mắt Suake vỏ nhũ bạc lấp lánh\r\n- Xuất xứ : Trung Quốc - \r\n   Dung tích : 1ml \r\nKẻ mắt nước SUAKE được thiết kế dạng bút dạ với đầu cọ thanh mảnh và sắc nét.\r\n -> Giải pháp tạo ra sự lôi cuốn giúp cho đôi mắt to tròn với nét vẽ thanh mảnh và khả năng chống nước vượt trội.\r\n ** Ưu điểm nổi bật :\r\n- Đầu bút cực mảnh, tăng cường tối đa tính linh hoạt khi vẽ. \r\n- Khả năng chịu nước và mồ hôi vượt trội. \r\n- Ánh nhìn sâu thẳm cùng chất mực đen lì tuyệt đẹp. \r\n- Họa tiết bắt mắt, thiết kế đẹp, gọn nhẹ, tiện dụng mang theo\r\n#bútkẻmắt #bút_kẻ_mắt #butkemat #but_ke_mat #bútkẻmắtsiêumảnh #bút_kẻ_mắt_siêu_mảnh #butkematsieumanh #but_ke_mat_sieu_manh #bútkẻmắt2đầu #bút_kẻ_mắt_2_đầu #butkemat2dau #but_ke_mat_2_dau #bútkẻmắtfocallure #bút_kẻ_mắt_focallure #butkematfocallure #but_ke_mat_focallure #bútkẻmắtchì #bút_kẻ_mắt_chì #butkematchi #but_ke_mat_chi #bútkẻmắtmaybeline #bút_kẻ_mắt_maybeline #butkematmaybeline #but_ke_mat_maybeline #bútkẻmắtpinkflash #bút_kẻ_mắt_pinkflash #butkematpinkflash #but_ke_mat_pinkflash #bútkẻmắtmerzy #bút_kẻ_mắt_merzy #butkematmerzy #but_ke_mat_merzy #bútkẻmắtsacelady #bút_kẻ_mắt_sace_lady #butkematsacelady #but_ke_mat_sace_lady #bútkẻmắtnước #bút_kẻ_mắt_nước #butkematnuoc #but_ke_mat_nuoc #bútkẻmắtkaradium #bút_kẻ_mắt_karadium #butkematkaradium #but_ke_mat_karadium #bútkẻmắttrắng #bút_kẻ_mắt_trắng #butkemattrang #but_ke_mat_trang', 0, 10000.00, 10000.000, '', '2023-11-15 19:44:26', 6, '2023-11-15 19:44:26', 1, 1),
(99, 6, 2, 'DỤNG CỤ HỖ TRỢ CHUỐT MI - KẺ MÍ VÀ KẺ BÓNG MẮT TIỆN LỢI NHỎ GỌN', 'dung-cu-ho-tro-chuot-mi-ke-mi-va-ke-bong-mat-tien-loi-nho-gon', 'dung-cu-ho-tro-chuot-mi-ke-mi-va-ke-bong-mat-tien-loi-nho-gon.jpg', 'ụng cụ hỗ trợ trang điểm mắt đa chức năng\r\n\r\nChất liệu: Nhựa loại tốt\r\n\r\n????Đặc điểm:\r\n\r\n-Rất thích hợp cho người mới bắt đầu trang điểm mắt, và bạn có thể chọn hình dạng phù hợp với dáng mắt của mình, có thể thể hiện sự quyến rũ của lớp trang điểm mắt;\r\n\r\n-Thiết kế đặc biệt, siêu chất lượng.\r\n\r\n-Kiểu dáng độc đáo và hợp thời trang.', 0, 19000.00, 19000.000, '', '2023-11-15 19:51:55', 6, '2023-11-15 19:51:55', 1, 1),
(100, 6, 4, 'Bút Kẻ Mắt UKISS Dạng Lỏng Ngòi Mảnh Chống Thấm Nước Lâu Trôi', 'but-ke-mat-ukiss-dang-long-ngoi-manh-chong-tham-nuoc-lau-troi', 'but-ke-mat-ukiss-dang-long-ngoi-manh-chong-tham-nuoc-lau-troi.jpg', 'Tên sản phẩm: Bút kẻ mắt nước\r\n\r\nThương hiệu: UKISS\r\n\r\nNguồn: Hàng công ty\r\n\r\nĐặc điểm kỹ thuật: 0.55ML\r\n\r\nĐóng gói: Hộp và nhựa\r\n\r\nMàu sắc: 01# Đen, 02# Nâu, 03# Xám, 04# Hồng\r\n\r\nLưu ý:\r\n\r\nNhớ đóng nắp sau khi sử dụng, Vui lòng đặt theo chiều ngang khi không sử dụng, không dễ bị khô trong thời gian dài', 0, 10000.00, 10000.000, '', '2023-11-15 19:52:40', 6, '2023-11-15 19:52:40', 1, 1),
(101, 6, 8, 'Bút Kẻ Mắt MAYCREATE Không Thấm Nước Hàng Nội Địa Trung Dễ Tạo Nét Không Lem.', 'but-ke-mat-maycreate-khong-tham-nuoc-hang-noi-dia-trung-de-tao-net-khong-lem', 'but-ke-mat-maycreate-khong-tham-nuoc-hang-noi-dia-trung-de-tao-net-khong-lem.jpg', 'MÔ TẢ SẢN PHẨM:\r\n- Bút lông kẻ mắt Maycreate sẽ làm hài lòng các cô gái, tạo cho bạn một đôi mắt ấn tượng, cuốn hút hơn hẳn với đường kẻ mắt \"kì diệu\".\r\n- Bút lông kẻ mắt Maycreate với đầu lông kĩ thuật công nghệ cao, ứng dụng vật liệu siêu bền mới nhất, vừa êm vừa nét, vẽ đường kẻ mắt siêu dễ siêu nhanh, bền đẹp cực nét.\r\n- Bút lông kẻ mắt Maycreate với đầu nét vẽ thanh mảnh, đầu cọ mềm dễ điều khiển chính xác và cùng 1 độ đậm màu.\r\n- Đặc biệt, công thức không lem, không trôi khi gặp nước,mồ hôi nên các bạn thoải mái tung tăng mà không lo nhé.\r\n- FineLine chỉ chùi sạch khi bạn tẩy trang thôi nhé. Màu đen chuẩn, mực mịn và bám da lâu, cho bạn đôi mắt hoàn hảo 1 cách nhanh chóng nhất.\r\n- Mực ra đều, ổn định và dáng tay cầm siêu chuẩn, vẽ mắt siêu nhanh siêu đệp mà lại cực kì đơn giản.\r\n- Bé này có thể kẻ nét mảnh, nhỏ ở khóe mắt hoặc tạo đường viền khi kẻ mắt mèo. Kiểu mắt mèo rất cá tính và quyến rũ nhưng chống chỉ định với các cô nàng mắt vốn đã xếch sẵn hoặc mắt quá to và quá tròn.\r\n- Kẻ mắt dạng nước đặc biệt được ưa chuộng cho style trang điểm dự tiệc, bởi đường kẻ sắc sảo, ấn tượng khiến bạn nổi bật và thật quyến rũ.', 0, 13000.00, 110000.000, '', '2023-11-15 19:53:46', 6, '2023-11-15 19:53:46', 1, 1),
(102, 6, 2, 'Bút Kẻ Mắt Màu Đen Nhanh Khô Chống Thấm Nước Lâu Trôi Trang Điểm Mượt Mà', 'but-ke-mat-mau-den-nhanh-kho-chong-tham-nuoc-lau-troi-trang-diem-muot-ma', 'but-ke-mat-mau-den-nhanh-kho-chong-tham-nuoc-lau-troi-trang-diem-muot-ma.jpg', 'Bút kẻ mắt nước Kẻ Mi Dưới Sweet mint Đầu Siêu Mảnh Mềm Mại Tự Nhiên Không Phai Lâu Trôi 0.01mm', 0, 10000.00, 10000.000, '', '2023-11-15 19:54:31', 6, '2023-11-15 19:54:31', 1, 1),
(103, 6, 4, 'Bút Kẻ Mắt NOVO Ngòi Mềm Mịn Chống Thấm Nước Và Mồ Hôi Lâu Trôi Không Lem Nhòe NO.5375', 'but-ke-mat-novo-ngoi-mem-min-chong-tham-nuoc-va-mo-hoi-lau-troi-khong-lem-nhoe-no-5375', 'but-ke-mat-novo-ngoi-mem-min-chong-tham-nuoc-va-mo-hoi-lau-troi-khong-lem-nhoe-no-5375.jpg', 'Sản Phẩm trông tinh tế , nhỏ gọn và dễ mang theo .\r\n\r\n- Mịn và mịn. không thấm nước và mồ hôi. dễ dàng tạo lớp trang điểm đẹp\r\n\r\nLời khuyên \'\r\n\r\nCác sản phẩm đều được chụp bằng hiện vật , và chúng tôi đã cố gắng hết sức để khôi phục thực tế . Tuy nhiên , do việc chụp ảnh bị ảnh hưởng bởi nhiều yếu tố như thời tiết , phơi sáng , v.v . , màn hình hiển thị ảnh bị ảnh hưởng bởi phần mềm máy tính , màn hình và các yếu tố khác , và có thể có sự khác biệt nhỏ về màu sắc . Xin vui lòng hiểu', 0, 19000.00, 19000.000, '', '2023-11-15 19:55:30', 6, '2023-11-15 19:55:30', 1, 1),
(104, 6, 8, 'Derf Phấn Mắt Dạng Bút Ánh Ngọc Trai Độ Bóng Cao Làm Sáng Da', 'derf-phan-mat-dang-but-anh-ngoc-trai-do-bong-cao-lam-sang-da', 'derf-phan-mat-dang-but-anh-ngoc-trai-do-bong-cao-lam-sang-da.jpg', 'Tính năng\r\n\r\n1.Đầu siêu mịn, dễ dàng cho người mới bắt đầu điều khiển\r\n\r\n2.Các sơ đồ đường mảnh có thể chính xác\r\n\r\n3. làm sáng mắt to đôi mắt\r\n\r\n4.Khô nhanh - Khô nhanh. dễ mặc. bền và tự nhiên\r\n\r\n5.Nhẹ nhàng tẩy trang. lau nhẹ bằng nước tẩy trang để tẩy trang nhẹ nhàng\r\n\r\n6.Nhỏ và tiện lợi. dễ mang theo', 0, 10000.00, 10000.000, '', '2023-11-15 19:56:04', 6, '2023-11-15 19:56:04', 1, 1),
(105, 10, 7, 'DÒNG SỮA RỬA MẶT KHÔNG TẠO BỌT & NƯỚC HOA HỒNG CHỐNG LÃO HÓA DA- Loreal', 'dong-sua-rua-mat-khong-tao-bot-nuoc-hoa-hong-chong-lao-hoa-da-loreal', 'dong-sua-rua-mat-khong-tao-bot-nuoc-hoa-hong-chong-lao-hoa-da-loreal.jpg', 'SỮA RỬA MẶT CHỐNG LÃO HÓA DA - 200ml (chai trắng)\r\n\r\n➖Vừa làm Sữa rửa mặt và tẩy trang làm sạch nhẹ nhàng và làm mờ nếp nhăn mang lại làn da trẻ trung hơn. \r\n\r\n➖Công thức tăng cường Canxi và Vitamin E, cung cấp độ ẩm chuyên sâu, sử dụng hàng ngày làm giảm dấu hiệu lão hóa da', 0, 210000.00, 210000.000, '', '2023-11-15 19:58:16', 6, '2023-11-15 19:58:16', 1, 1),
(106, 10, 7, 'SỮA RỬA MẶT CHỐNG LÃO HOÁ LOREAL REVITALIFT ANTI-AGING', 'sua-rua-mat-chong-lao-hoa-loreal-revitalift-anti-aging', 'sua-rua-mat-chong-lao-hoa-loreal-revitalift-anti-aging.jpg', 'ỮA RỬA MẶT CHỐNG LÃO HOÁ LOREAL REVITALIFT ANTI-AGING\r\n✨Sữa rửa mặt làm sạch sâu và giúp da săn chắc L\'Oreal Paris thuộc dòng \"Revitalift\" được nghiên cứu mang lại hiệu quả cao trong việc rửa sạch và nuôi dưỡng làn da sáng, khỏe mạnh mỗi ngày. Thành phần BHA đã được nghiên cứu giúp làn da luôn săn chắc và chống lão hóa hoàn hảo đồng thời Glycerin giúp da luôn mềm mượt, ẩm mịn.\r\n♥️ƯU ĐIỂM NỔI BẬT', 0, 10000.00, 10000.000, '', '2023-11-15 19:59:19', 6, '2023-11-15 19:59:19', 1, 1),
(107, 11, 7, 'Sữa Rửa Mặt L\'Oreal Làm Sáng Da, Giảm Thâm Nám 100ml', 'sua-rua-mat-loreal-lam-sang-da-giam-tham-nam-100ml', 'sua-rua-mat-loreal-lam-sang-da-giam-tham-nam-100ml.jpg', 'Sữa Rửa Mặt L\'Oreal Aura Perfect Milky Foam thuộc dòng sản phẩm dưỡng sáng da Aura Perfect, được nghiên cứu bởi viện nghiên cứu L\'oreal Paris sẽ là lựa chọn đúng đắn để nuôi dưỡng và chăm sóc làn da sáng mịn rạng ngời hơn mỗi ngày. Với thành phần tinh thể đá quý Tourmaline và Vitamin C được nghiên cứu giúp làm dịu và ngăn ngừa hắc tố melanin là nguyên nhân chính gây sạm da, nuôi dưỡng da khỏe mạnh và sáng bóng, sản phẩm là bước khởi đầu hoàn hảo cho quá trình dưỡng da sáng mịn của bạn.\r\n\r\n*Lưu ý: L’Oréal Paris được sản xuất tại nhiều nhà máy trên toàn thế giới như Trung Quốc, Mỹ, Indonesia… Tất cả các sản phẩm đều tuân theo quy trình kiểm soát chất lượng nghiêm ngặt và đồng đều của L’Oréal Toàn Cầu.', 0, 180000.00, 160000.000, '', '2023-11-15 20:00:25', 6, '2023-11-15 20:00:25', 1, 1),
(108, 18, 2, 'Kẹp Tóc Dạng Lô Cuốn Làm Phồng Tóc Thời Trang Cho Nữ', 'kep-toc-dang-lo-cuon-lam-phong-toc-thoi-trang-cho-nu', 'kep-toc-dang-lo-cuon-lam-phong-toc-thoi-trang-cho-nu.jpg', 'Tính năng\r\n\r\nTự dính, Hình dạng bồng bềnh, Tạo kiểu chân tóc, Không dấu vết, Định hình nhanh, Lông mịn tự nhiên, Di động\r\n\r\nNhiều hình dạng: Kẹp uốn tóc này có thể được sử dụng để tạo nhiều hình dạng tóc xoăn khác nhau, chẳng hạn như tóc xoăn C, tóc xoăn S, tóc xoăn gợn sóng, chân tóc phồng và tóc xoăn mái.\r\n\r\nTóc xoăn bồng bềnh tự nhiên: Tóc xoăn tự nhiên không có chủ ý xoắn và xoay, với độ bền tốt hơn trước khi sấy tóc.\r\n\r\nDễ dàng tạo mẫu, dễ mang theo: Kẹp tóc xoăn này được thiết kế để dễ dàng cố định và người mới làm quen không có áp lực. Thật dễ dàng để mang theo và tạo ra vẻ ngoài bạn muốn bất cứ lúc nào.', 0, 10000.00, 10000.000, '', '2023-11-15 20:01:47', 6, '2023-11-15 20:01:47', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_topic`
--

CREATE TABLE `0352_topic` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã chủ đề',
  `name` varchar(255) NOT NULL COMMENT 'Tên chủ đề',
  `slug` varchar(255) NOT NULL COMMENT 'Slug tên chủ đề',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Mã cấp cha',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Sắp xếp',
  `description` varchar(255) NOT NULL,
  `metakey` varchar(255) NOT NULL COMMENT 'Từ khóa SEO',
  `metadesc` varchar(255) NOT NULL COMMENT 'Mô tả SEO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người tạo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_topic`
--

INSERT INTO `0352_topic` (`id`, `name`, `slug`, `parent_id`, `sort_order`, `description`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Bộ sưu tập son thỏi cao cấp Love M.O.I phiên bản giới hạn', '', 0, 1, 'Bộ sưu tập son thỏi cao cấp Love M.O.I phiên bản giới hạn với 6 màu son thời thượng được lấy cảm hứng ngọt ngào từ những món ăn và thức uống yêu thích của \"Quý cô Pháp\" sành điệu. Với thiết kế sang trọng bởi sự kết hợp giữa chất liệu da và kim loại mạ vàn', '', '', '2023-11-15 10:48:49', 1, '2023-11-15 04:49:02', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `0352_user`
--

CREATE TABLE `0352_user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Họ và tên',
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhâp',
  `password` varchar(64) NOT NULL COMMENT 'Mật khẩu',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `gender` tinyint(3) UNSIGNED NOT NULL COMMENT 'Giới tính',
  `phone` varchar(11) NOT NULL COMMENT 'Điện thoại',
  `image` varchar(100) NOT NULL COMMENT 'Hình',
  `roles` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quyền truy cập',
  `address` varchar(255) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người tạo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `0352_user`
--

INSERT INTO `0352_user` (`id`, `name`, `username`, `password`, `email`, `gender`, `phone`, `image`, `roles`, `address`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(6, 'Thương', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'thuongvu@gmail.com', 1, '098888', 'thuongvu.jpg', 1, 'Đồng Nai', '2023-10-13 10:34:44', 1, '2023-11-15 19:08:10', 6, 1),
(7, 'thuong', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'tt', 0, '22', '', 0, 'rr', '2023-11-15 18:43:40', 6, '2023-11-15 18:43:40', 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `0352_banner`
--
ALTER TABLE `0352_banner`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_brand`
--
ALTER TABLE `0352_brand`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_category`
--
ALTER TABLE `0352_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_contact`
--
ALTER TABLE `0352_contact`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_menu`
--
ALTER TABLE `0352_menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_order`
--
ALTER TABLE `0352_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_orderdetail`
--
ALTER TABLE `0352_orderdetail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_post`
--
ALTER TABLE `0352_post`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_product`
--
ALTER TABLE `0352_product`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_topic`
--
ALTER TABLE `0352_topic`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `0352_user`
--
ALTER TABLE `0352_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `0352_banner`
--
ALTER TABLE `0352_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã Slider', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `0352_brand`
--
ALTER TABLE `0352_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Loại', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `0352_category`
--
ALTER TABLE `0352_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Loại', AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `0352_contact`
--
ALTER TABLE `0352_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã liên hệ', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `0352_menu`
--
ALTER TABLE `0352_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Menu', AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `0352_order`
--
ALTER TABLE `0352_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn hàng', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `0352_orderdetail`
--
ALTER TABLE `0352_orderdetail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã CT Đơn hàng', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `0352_post`
--
ALTER TABLE `0352_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã bài viết', AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `0352_product`
--
ALTER TABLE `0352_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `0352_topic`
--
ALTER TABLE `0352_topic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chủ đề', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `0352_user`
--
ALTER TABLE `0352_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã tài khoản', AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
