-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Feb 2023 pada 22.28
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsipedia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(6, 'Dosen_Fungsional'),
(4, 'Dosen_Matkul'),
(2, 'Dosen_Pembimbing'),
(5, 'Kaprodi'),
(1, 'LAA'),
(3, 'Mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(2, 1, 13),
(3, 1, 14),
(4, 1, 15),
(1, 1, 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add kelas', 7, 'add_kelas'),
(26, 'Can change kelas', 7, 'change_kelas'),
(27, 'Can delete kelas', 7, 'delete_kelas'),
(28, 'Can view kelas', 7, 'view_kelas'),
(29, 'Can add fk kelas', 8, 'add_fkkelas'),
(30, 'Can change fk kelas', 8, 'change_fkkelas'),
(31, 'Can delete fk kelas', 8, 'delete_fkkelas'),
(32, 'Can view fk kelas', 8, 'view_fkkelas'),
(33, 'Can add user_ kelas', 8, 'add_user_kelas'),
(34, 'Can change user_ kelas', 8, 'change_user_kelas'),
(35, 'Can delete user_ kelas', 8, 'delete_user_kelas'),
(36, 'Can view user_ kelas', 8, 'view_user_kelas'),
(37, 'Can add profil_ mahasiswa', 9, 'add_profil_mahasiswa'),
(38, 'Can change profil_ mahasiswa', 9, 'change_profil_mahasiswa'),
(39, 'Can delete profil_ mahasiswa', 9, 'delete_profil_mahasiswa'),
(40, 'Can view profil_ mahasiswa', 9, 'view_profil_mahasiswa'),
(41, 'Can add profil_ staff', 10, 'add_profil_staff'),
(42, 'Can change profil_ staff', 10, 'change_profil_staff'),
(43, 'Can delete profil_ staff', 10, 'delete_profil_staff'),
(44, 'Can view profil_ staff', 10, 'view_profil_staff'),
(45, 'Can add proposal', 11, 'add_proposal'),
(46, 'Can change proposal', 11, 'change_proposal'),
(47, 'Can delete proposal', 11, 'delete_proposal'),
(48, 'Can view proposal', 11, 'view_proposal'),
(49, 'Can add lab', 12, 'add_lab'),
(50, 'Can change lab', 12, 'change_lab'),
(51, 'Can delete lab', 12, 'delete_lab'),
(52, 'Can view lab', 12, 'view_lab'),
(53, 'Can add file', 13, 'add_file'),
(54, 'Can change file', 13, 'change_file'),
(55, 'Can delete file', 13, 'delete_file'),
(56, 'Can view file', 13, 'view_file'),
(57, 'Can add proposal_ order', 14, 'add_proposal_order'),
(58, 'Can change proposal_ order', 14, 'change_proposal_order'),
(59, 'Can delete proposal_ order', 14, 'delete_proposal_order'),
(60, 'Can view proposal_ order', 14, 'view_proposal_order'),
(61, 'Can add nilai', 15, 'add_nilai'),
(62, 'Can change nilai', 15, 'change_nilai'),
(63, 'Can delete nilai', 15, 'delete_nilai'),
(64, 'Can view nilai', 15, 'view_nilai'),
(65, 'Can add sempro', 16, 'add_sempro'),
(66, 'Can change sempro', 16, 'change_sempro'),
(67, 'Can delete sempro', 16, 'delete_sempro'),
(68, 'Can view sempro', 16, 'view_sempro'),
(69, 'Can add order', 14, 'add_order'),
(70, 'Can change order', 14, 'change_order'),
(71, 'Can delete order', 14, 'delete_order'),
(72, 'Can view order', 14, 'view_order'),
(73, 'Can add daftar sidang', 17, 'add_daftarsidang'),
(74, 'Can change daftar sidang', 17, 'change_daftarsidang'),
(75, 'Can delete daftar sidang', 17, 'delete_daftarsidang'),
(76, 'Can view daftar sidang', 17, 'view_daftarsidang'),
(77, 'Can add angkatan', 18, 'add_angkatan'),
(78, 'Can change angkatan', 18, 'change_angkatan'),
(79, 'Can delete angkatan', 18, 'delete_angkatan'),
(80, 'Can view angkatan', 18, 'view_angkatan'),
(81, 'Can add ruang sidang', 19, 'add_ruangsidang'),
(82, 'Can change ruang sidang', 19, 'change_ruangsidang'),
(83, 'Can delete ruang sidang', 19, 'delete_ruangsidang'),
(84, 'Can view ruang sidang', 19, 'view_ruangsidang'),
(85, 'Can add jadwal kelas dosen', 20, 'add_jadwalkelasdosen'),
(86, 'Can change jadwal kelas dosen', 20, 'change_jadwalkelasdosen'),
(87, 'Can delete jadwal kelas dosen', 20, 'delete_jadwalkelasdosen'),
(88, 'Can view jadwal kelas dosen', 20, 'view_jadwalkelasdosen'),
(89, 'Can add jadwal sidang', 21, 'add_jadwalsidang'),
(90, 'Can change jadwal sidang', 21, 'change_jadwalsidang'),
(91, 'Can delete jadwal sidang', 21, 'delete_jadwalsidang'),
(92, 'Can view jadwal sidang', 21, 'view_jadwalsidang'),
(93, 'Can add beban pengujian', 22, 'add_bebanpengujian'),
(94, 'Can change beban pengujian', 22, 'change_bebanpengujian'),
(95, 'Can delete beban pengujian', 22, 'delete_bebanpengujian'),
(96, 'Can view beban pengujian', 22, 'view_bebanpengujian'),
(97, 'Can add input jadwal sempro', 23, 'add_inputjadwalsempro'),
(98, 'Can change input jadwal sempro', 23, 'change_inputjadwalsempro'),
(99, 'Can delete input jadwal sempro', 23, 'delete_inputjadwalsempro'),
(100, 'Can view input jadwal sempro', 23, 'view_inputjadwalsempro'),
(101, 'Can add jadwal sempro dosen', 24, 'add_jadwalsemprodosen'),
(102, 'Can change jadwal sempro dosen', 24, 'change_jadwalsemprodosen'),
(103, 'Can delete jadwal sempro dosen', 24, 'delete_jadwalsemprodosen'),
(104, 'Can view jadwal sempro dosen', 24, 'view_jadwalsemprodosen'),
(105, 'Can add jam sempro dosen', 25, 'add_jamsemprodosen'),
(106, 'Can change jam sempro dosen', 25, 'change_jamsemprodosen'),
(107, 'Can delete jam sempro dosen', 25, 'delete_jamsemprodosen'),
(108, 'Can view jam sempro dosen', 25, 'view_jamsemprodosen'),
(109, 'Can add c d2', 26, 'add_cd2'),
(110, 'Can change c d2', 26, 'change_cd2'),
(111, 'Can delete c d2', 26, 'delete_cd2'),
(112, 'Can view c d2', 26, 'view_cd2'),
(113, 'Can add c d3', 27, 'add_cd3'),
(114, 'Can change c d3', 27, 'change_cd3'),
(115, 'Can delete c d3', 27, 'delete_cd3'),
(116, 'Can view c d3', 27, 'view_cd3'),
(117, 'Can add c d1', 28, 'add_cd1'),
(118, 'Can change c d1', 28, 'change_cd1'),
(119, 'Can delete c d1', 28, 'delete_cd1'),
(120, 'Can view c d1', 28, 'view_cd1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$1kURA9QhsnheozzuY1ACxK$tqsxxlChLx+tPiqtlkSeoLn59tetH8Dz/iubfohjL3U=', '2023-02-04 16:39:18.599853', 1, 'superuser', 'Skripsipedia', '', 'skripsipedia@protonmail.com', 1, 1, '2022-11-03 08:34:57.000000'),
(5, 'pbkdf2_sha256$390000$6VgUVdC8pVYlLPYER1jAKL$THMO3Y3REtYn067FZwKuScE2ey/mZOwMpAsI9ljQaA0=', '2023-01-30 17:00:21.170389', 0, 'laa', 'LAA', 'Tel-U', 'apanji133@gmail.com', 1, 1, '2022-11-05 13:13:30.000000'),
(6, 'pbkdf2_sha256$390000$3i98AkHyVKvDgmgqryl6BQ$4/AD53eHEt30ZV2HtO9A2+XWDpqeMh2Go3p7FeVqa68=', NULL, 0, 'putranto', 'Putranto', 'Octa Adika', '', 1, 1, '2022-11-07 10:02:00.000000'),
(7, 'pbkdf2_sha256$390000$4PvZDsifVHQaAtx2qnzAD3$/EllrFjkCm3tHlpBdJSj4iRZb/A17Spa6Y9VLl7h0W4=', NULL, 0, 'naufal', 'Naufal', 'Ridha Bisono', '', 1, 1, '2022-11-07 10:02:21.000000'),
(8, 'pbkdf2_sha256$390000$mbJK35idftPpY4myjlXeEp$WcgEH9rqlTv2BDCLLGln8A7GlVxn5yEzElBRagML9RA=', '2022-12-29 11:19:38.223214', 0, 'gihon', 'Gihon', 'Godwin Silitonga', '', 1, 1, '2022-11-07 10:03:09.000000'),
(9, 'pbkdf2_sha256$390000$r0jlBCtxS6MLIxzLbHScj4$/WPm3jE4we4DromWpgk6iLnk4+ByYCz9EsRIMUJv+ZE=', '2023-02-16 10:03:41.795543', 0, 'apanji', 'Agung', 'Panjimasjaya', 'apanji133@gmail.com', 0, 1, '2022-11-12 11:50:56.000000'),
(13, 'pbkdf2_sha256$390000$ATfzEpeh0QwUJ2vyJdYFuj$g//2d1UIgjQe/WcYkAt+Edvx8jdEIMGrDdiwRDlrK7E=', '2023-02-15 15:16:06.344921', 0, 'r.kebab', 'Rehan', 'Kebab', 'koneksi.ken111@gmail.com', 0, 1, '2022-11-20 03:44:03.104245'),
(40, 'pbkdf2_sha256$390000$WCvvFhimaLAhG9iahyr2ZB$fAQAWxpltPe6qrJuBBzkL4ePNkpZhwdFaenYPcXbdTM=', '2022-12-29 11:11:26.581091', 0, 'zack', 'qwerty', 'zxcvb', 'apanji133@gmail.com', 0, 1, '2022-11-29 11:55:15.418810'),
(42, 'pbkdf2_sha256$390000$c2uedWioGjIwjxrDVEuljc$mTWr7/eKf4qbqfHGzkmGZKymVzaB51+hcSS63SXPffA=', '2023-02-15 15:15:43.988166', 0, 'TK-42-06', 'TK-42-06', '', 'mannerheim@gmail.com', 0, 1, '2022-12-09 11:44:44.000000'),
(43, 'pbkdf2_sha256$390000$w3iqp4sUJFplO1p3cRGoTI$NNeUH9CNcGmVHugDz9gsNk7O/ab5qO14oXc+W5b3PT4=', '2023-02-06 17:50:26.546836', 0, 'dosen_fungsional', 'Dosen', 'Fungsional', '', 1, 1, '2022-12-18 04:39:52.000000'),
(45, 'pbkdf2_sha256$390000$yKi7di8lYGQaBeJxLBzBDn$/ulNmGx/5JB6iXSP4nDA0uavfKn/jnN5quITsiUgkWY=', '2022-12-29 11:03:04.588820', 0, 'jcena', 'John', 'Cena', 'apanji@student.telkomuniversity.ac.id', 0, 1, '2022-12-27 14:19:18.051274'),
(46, 'pbkdf2_sha256$390000$Hd7txxkFZnJpLWZXkVDqj5$4xG8vjRpEDIrVRVLaYAf4SZcMNFtFdWnx2aws3kSDdU=', NULL, 0, 'agus_virgono', '', '', '', 0, 1, '2022-12-29 10:30:07.000000'),
(47, 'pbkdf2_sha256$390000$OhsU1fhAr2iPbYl6ZtQDr3$3g/IiCHWmNpgbJxxffm8rwNTu2OWRF3lVz6+ph/dTY0=', NULL, 0, 'ashri_dinimaharawati', '', '', '', 0, 1, '2022-12-29 10:32:24.000000'),
(48, 'pbkdf2_sha256$390000$WOmkN9876GH5lvCTiF28fJ$O599s+TksGGsvvAj6Tequj5JWT8kUokenGOc2W2gcRo=', NULL, 0, 'budhi_irawan', '', '', '', 0, 1, '2022-12-29 10:33:01.000000'),
(49, 'pbkdf2_sha256$390000$ijP16KziorEvgW8aBF4jqc$00Hain9aLlVRMo09kq2H4/pz8RPd6EmHSY91VOTVnRc=', NULL, 0, 'burhanuddin_dirgantoro', '', '', '', 0, 1, '2022-12-29 10:33:44.000000'),
(50, 'pbkdf2_sha256$390000$cLWRkXxaf0CYS15vSdDlkP$X3VrSxD5FzhO5gocUgbb17yRVcHiwKuIxEL4bz5tnx8=', '2023-02-16 09:59:25.209576', 0, 'casi_setianingsih', '', '', '', 0, 1, '2022-12-29 10:34:12.000000'),
(51, 'pbkdf2_sha256$390000$lFoqnfXbM5kRxV0JrdtQdf$Sek0qjALdhPOx0ESXP9PnXMBADYFt4ArOAcA5MfAdmQ=', NULL, 0, 'fairuz_azmi', '', '', '', 0, 1, '2022-12-29 10:34:44.000000'),
(52, 'pbkdf2_sha256$390000$oNqDEEbuDQgytM5EHFmbDE$1ts8gOohUs2kIV/ndGvNuOZwAh3EqOWJreUy0+yl/7U=', NULL, 0, 'faisal_candrasyah_hasibuan', '', '', '', 0, 1, '2022-12-29 10:35:21.000000'),
(53, 'pbkdf2_sha256$390000$X1nsEfL1yUHmzEfTGjWn44$F1Ih64hzylxnsrQBdpU4M/e3Ob+U+ZB8mkLtNxzAd2o=', NULL, 0, 'meta_kallista', '', '', '', 0, 1, '2022-12-29 10:36:04.000000'),
(54, 'pbkdf2_sha256$390000$tWL8W2i9yFUvvsWcdPTh95$OSmFJlFRha3fPKhy9Zy7mmj82L115vBY/Ks6KVXkuLw=', NULL, 0, 'marisa_w_paryasto', '', '', '', 0, 1, '2022-12-29 10:36:40.000000'),
(55, 'pbkdf2_sha256$390000$p6UZ9hmBT4USEStdvD9dD1$T5Z4RtjPq4fZ6Bd4y/b1g6r0wyWv1lsOVHR0SqfRGe0=', NULL, 0, 'm.faris_ruriawan', '', '', '', 0, 1, '2022-12-29 10:37:17.000000'),
(56, 'pbkdf2_sha256$390000$M86klU3NYjFHD5Z9HQVDMX$fjQ+zf0pUEn0/Eqz1zittXDBY39APqHRJvxcuWkHEjI=', NULL, 0, 'm.nasrun', '', '', '', 0, 1, '2022-12-29 10:37:41.000000'),
(57, 'pbkdf2_sha256$390000$teN880xU3hsCMT5jWxV675$Kw477NdPBb0UAsGFBnQ7oqR6IboAFItvtQ+RlJ4lHfs=', '2023-01-20 12:30:09.244459', 0, 'randy_erfa_saputra', '', '', '', 0, 1, '2022-12-29 10:38:53.000000'),
(58, 'pbkdf2_sha256$390000$1MGWvsTyJfHx5qx6YU5syN$iaJ7WDcC/4ARTfyBFfWdkC+XMxlQyR5zjrMOot7LAdQ=', NULL, 0, 'roswan_latuconsina', '', '', '', 0, 1, '2022-12-29 10:40:10.000000'),
(59, 'pbkdf2_sha256$390000$aCUtXdpZNw9yuoiwDhYIea$mJVwiLt0FIhUDn8Rx/PY/Nx+RiPYJrazyyWDJPzcSR0=', NULL, 0, 'tito_waluyo_purboyo', '', '', '', 0, 1, '2022-12-29 10:40:43.000000'),
(60, 'pbkdf2_sha256$390000$wIlWJc6e9d9k3wYL3TN8yI$FsI1Ujm1DmIb2mmqScgZ921vSE4kTwMjZy4cv0+1bXE=', NULL, 0, 'umar_ali_ahmad', '', '', '', 0, 1, '2022-12-29 10:41:05.000000'),
(61, 'pbkdf2_sha256$390000$EiMKyMtGQvTgXZ6SrN3O0I$1BrRPGx31iALYNGiPAzpAI5LKpXTCtkICqAxQU0hC6w=', NULL, 0, 'yudha_purwanto', '', '', '', 0, 1, '2022-12-29 10:41:32.000000'),
(62, 'pbkdf2_sha256$390000$HHJaEagTQc6JytgymyGFc3$v442L6/4ngi0RkzQkLVdYvjY6pjwaVBgblQgl/OJ8N4=', '2022-12-29 11:25:43.744905', 0, 'cr7.shuuu', 'Christiano', 'Ronaldo', 'abc@gmail.com', 0, 1, '2022-12-29 11:25:28.988258'),
(63, 'pbkdf2_sha256$390000$1sZc6gIGfBejZZ3VV2ZPLZ$ZsfdwRDXjoXYkp8WrEXBNuUPw8/eUXaDkuaXUOy8/Ig=', '2023-01-24 18:36:24.628582', 0, 'lionel.messi', 'Lionel', 'Messi', 'lyunelmessit@gmail.com', 0, 1, '2023-01-13 14:27:16.716626'),
(64, 'pbkdf2_sha256$390000$rTNuScpWMEMwpbW0Wu22Dd$fBIM9hYvUUXy1bkEbjXK8tQRRbcHnTVSZUYesb0N9Z0=', '2023-01-27 18:06:30.196813', 0, 'naufal.r', 'Naufal', 'Ridha', 'naufal@gmail.com', 0, 1, '2023-01-27 18:06:17.408532'),
(65, 'pbkdf2_sha256$390000$KqfqjiMmDXUf6AcHQQBGLL$qW728/h+zziAjOcSe+KbPC6Bv4Zf7/X/+4XbZmEG+5Q=', '2023-01-30 15:48:36.186798', 0, 'TK-43-06', 'TK-43-06', '', '', 0, 1, '2023-01-30 15:45:56.000000'),
(66, 'pbkdf2_sha256$390000$WevghBk5p2aorlCgrndIvM$yDqv3Zzy/yFlFi5OuLKQDuk4xVByicxCrRSCscpX8VY=', NULL, 0, 'agung_nugroho_jati', '', '', '', 0, 1, '2023-02-04 15:28:30.000000'),
(67, 'pbkdf2_sha256$390000$dJd67U7e7zmnNdXzVareDQ$V9t60A/WymneyiSaIb9xtA8Opz5o+tVWizntvwdyg2c=', NULL, 0, 'andrew_brian_osmond', '', '', '', 0, 1, '2023-02-04 15:30:52.000000'),
(68, 'pbkdf2_sha256$390000$BHZzag3ZrBY7QWutfew9YD$7arp5nHpFIUF6fGaQht3ck6i0zf6lc4InIQhm34FAk0=', NULL, 0, 'anggunmeka_luhur_prasasti', '', '', '', 0, 1, '2023-02-04 15:33:04.000000'),
(69, 'pbkdf2_sha256$390000$u10au3rkWeQIguH6PTNxNc$FN0C1zngrITjscC9YQlslT1iU3ZaXnjsROCnMzuSiFg=', NULL, 0, 'asif_awaludin', '', '', '', 0, 1, '2023-02-04 15:35:37.000000'),
(70, 'pbkdf2_sha256$390000$Pedjrj2CnKVWEyTtDZiRDt$0Urw/GW6kMnV9uSn3zm/5LSCdqSc/uHv5tDsMMQS1Og=', NULL, 0, 'astri_novianty', '', '', '', 0, 1, '2023-02-04 15:39:26.000000'),
(71, 'pbkdf2_sha256$390000$5LNdAOTLlVndMwtNJ2Gglb$J1VnPMdl3G4uNm0ZFtnev8asicRYZC8L85HhWSsQceg=', NULL, 0, 'dick_maryopi', '', '', '', 0, 1, '2023-02-04 15:41:25.000000'),
(72, 'pbkdf2_sha256$390000$p707zsOeBYcvnxyFHfe4pd$gJDndbiEV9oCVhPXtG7TmLCVLcSU5YXdw7xvbTezKqo=', NULL, 0, 'fussy_mentari_dirgantara', '', '', '', 0, 1, '2023-02-04 15:44:03.000000'),
(73, 'pbkdf2_sha256$390000$LKCQPru7lQnn7VRUGiZYFG$YaIZdQmqBZlvkOZx76EfFHeN9hzWMOwKG4ZRtNrMPEc=', NULL, 0, 'izazi_mubarok', '', '', '', 0, 1, '2023-02-04 15:46:37.000000'),
(74, 'pbkdf2_sha256$390000$Tyv2biawpAxWronSTbCmtb$e8yNcYoJkrcCkRA/Lur9XrnWMsN5iGkqTbgqymmixiQ=', NULL, 0, 'novera_istiqomah', '', '', '', 0, 1, '2023-02-04 15:48:35.000000'),
(75, 'pbkdf2_sha256$390000$tHLo17Y2F1whywqFsb8nBA$U4ADW7ybT025dWFvA8U9sO6H7x4IJ98pzK24XokqCBU=', NULL, 0, 'prayitno_abadi', '', '', '', 0, 1, '2023-02-04 15:50:59.000000'),
(76, 'pbkdf2_sha256$390000$IDVDHNCxgr2ebN3nbhpRzu$6R3i/RrsIslh8duEhGql3X7rYtkujh/OC3LHPAiyaak=', NULL, 0, 'purba_daru_kusuma', '', '', '', 0, 1, '2023-02-04 15:52:42.000000'),
(77, 'pbkdf2_sha256$390000$RzDJp2CYXlMp3JLFjUnwLk$YzDhpZW3io2hfcZO1Eihz/fZOLYyjaaC0OQe4Bwvpsg=', NULL, 0, 'ratna_astuti', '', '', '', 0, 1, '2023-02-04 15:54:11.000000'),
(78, 'pbkdf2_sha256$390000$AYTrO8nacWZbAamm7pQRAb$9b+8OL/lui+5uzuG7bg4PatMLGwMg1Q7sR71VrO6oN4=', NULL, 0, 'reza_rendian', '', '', '', 0, 1, '2023-02-04 15:55:45.000000'),
(79, 'pbkdf2_sha256$390000$kHOMObB7qfekspCuQxwESE$HIsb2hwajnyWOv1bfMklItBuBaJFbbywSgqB0Z0h1Pg=', NULL, 0, 'risman_adnan', '', '', '', 0, 1, '2023-02-04 15:57:54.000000'),
(80, 'pbkdf2_sha256$390000$ub0Imno1Qm7zK8lixVJ78q$DZJ/DPaE3u70Bb10EkmcjAxTi27wwTSAN91bNY5z5QM=', NULL, 0, 'surya_michrandi', '', '', '', 0, 1, '2023-02-04 15:59:35.000000'),
(81, 'pbkdf2_sha256$390000$XWg3BWf7WduEpWqlGwscOA$QIkdVDK49KpfutyF9azWxY6gWt/yjYsW5uPscRBUurE=', NULL, 0, 'wendi_harjupa', '', '', '', 0, 1, '2023-02-04 16:01:19.000000'),
(82, 'pbkdf2_sha256$390000$COfncZTVHNUB5QcO0pjUrH$ETdwj9g4IchUjAgT7BE2F1YpeTaIFjx5oUDu2eFB8GY=', NULL, 0, 'wildan_panji', '', '', '', 0, 1, '2023-02-04 16:03:05.000000'),
(83, 'pbkdf2_sha256$390000$rBkoCgvURuO3l29NB0nWg7$jUdtRLL/ehoeb2tNfQjBxb7qEaK/DarY9uaetArfWqI=', '2023-02-16 16:57:58.716533', 0, 'coba1', 'TM. ALVIAN', 'SYAFRIL', 'abc@gmail.com', 0, 1, '2023-02-04 16:20:05.578634'),
(84, 'pbkdf2_sha256$390000$z51WDh6BNkmCSDv1E1RTGR$kT+a6EI8p/bxGYyF3tglbM5v131bTXCyXIuxxTdRvso=', '2023-02-16 11:48:57.251499', 0, 'coba2', 'NUGROHO', 'BAGUS DARMAWAN', 'abc@gmail.com', 0, 1, '2023-02-04 16:40:55.199139'),
(85, 'pbkdf2_sha256$390000$yjdVKlkn0SLZSSxbd0ZVo6$lbbqAVceQxax2fQ7KyXdDO8N230rHHYt0O8TjI81FVM=', '2023-02-16 11:52:41.491561', 0, 'coba3', 'ISNI', 'DWITINIARDI', 'abc@gmail.com', 0, 1, '2023-02-04 16:44:11.768782'),
(86, 'pbkdf2_sha256$390000$L5PX5ruIYvAQeyILxd0mZz$HfOIk6vT1HGifKIcj2+orDCLS9g8I7/75cV7fIDYjYc=', '2023-02-16 12:30:39.638255', 0, 'coba4', 'AGUNG', 'RYANTO', 'abc@gmail.com', 0, 1, '2023-02-04 16:47:33.241354'),
(87, 'pbkdf2_sha256$390000$LgesEFQNNalTVhmzUXqZhw$MOQAdljzIvdkK0SKgqpxolQlcR23GAOtu8g1KqqroEI=', '2023-02-16 16:58:16.866351', 0, 'coba5', 'FAHMI', 'KEMAL FASHA', 'abc@gmail.com', 0, 1, '2023-02-04 16:50:58.563795'),
(88, 'pbkdf2_sha256$390000$rQCUcS7xQS1035G8rKxQF4$58exWiWeqY9QlY7o6lEtwOqTUVbJVTMzUNyox1RDsuM=', '2023-02-04 16:54:11.467953', 0, 'coba6', 'MUHAMMAD', 'RIVAN AULYA', 'abc@gmail.com', 0, 1, '2023-02-04 16:53:59.668696'),
(89, 'pbkdf2_sha256$390000$msxXVrAj2Rh2rvGJiii2LA$E3GlIn0AhjOoc02HP9Cmy5IpUnrhyrZhNLzOHVt/G9U=', '2023-02-06 18:08:42.879669', 0, 'coba7', '', '', '', 0, 1, '2023-02-04 16:56:38.000000'),
(90, 'pbkdf2_sha256$390000$8X0emFwaOepTo8gC4LNXtG$CilpUqtGHfxgEnUU8oZYz9YXxH7byYVDSuDD+6uOtC8=', '2023-02-04 17:01:22.727844', 0, 'coba8', '', '', '', 0, 1, '2023-02-04 16:56:57.000000'),
(91, 'pbkdf2_sha256$390000$WWGHBioPVi4jLAauSNCiDB$6M+r2UanUlRG3RzYMf3gt6XtnUfFripbPJkh3CkVgZE=', '2023-02-04 17:03:08.470643', 0, 'coba9', '', '', '', 0, 1, '2023-02-04 16:57:19.000000'),
(92, 'pbkdf2_sha256$390000$qtujIbS1kmQ2Epk6DiC349$8CNrHLSvlDKpThvpLWwM8fvyhKl9DvM+InRIGTtMsfQ=', '2023-02-04 17:05:19.692273', 0, 'coba10', '', '', '', 0, 1, '2023-02-04 16:57:38.000000'),
(93, 'pbkdf2_sha256$390000$uSvG6iNPy4ZN0PhYCXHTOf$DkpKLqluaf5yZ+bvdma+IdaQ/AKKnbDigw59Wi6SHA0=', '2023-02-04 17:11:22.165588', 0, 'coba11', '', '', '', 0, 1, '2023-02-04 17:07:51.000000'),
(94, 'pbkdf2_sha256$390000$2RoUcNoIvhb48henyopH3X$Vx48HcgSWWxtwu1TUpxqbxaQ7qgf/0OS7eu04tqcNec=', '2023-02-04 17:13:32.173728', 0, 'coba12', '', '', '', 0, 1, '2023-02-04 17:08:13.000000'),
(95, 'pbkdf2_sha256$390000$6jKF8voFrglQgjovdHKDkR$yn+ERxGWtEOsYKVneRy701LuHd9m9MlGIXmqsmiM4OQ=', '2023-02-04 17:16:00.408456', 0, 'coba13', '', '', '', 0, 1, '2023-02-04 17:08:29.000000'),
(96, 'pbkdf2_sha256$390000$UXmhmoWxs3ZlmIIN8rbRGr$2I6VWURw/uqwJvmXu335XpsMJ3Xoo73PIULn4D2FhJc=', '2023-02-04 17:20:33.012364', 0, 'coba14', '', '', '', 0, 1, '2023-02-04 17:08:47.000000'),
(97, 'pbkdf2_sha256$390000$Zf2rRUdTKThEqY7r4mbyCL$pkJqcw3vSEG+SXfDYQsvzU4T26tmInmie7utRQemTTY=', '2023-02-04 17:20:42.753071', 0, 'coba15', '', '', '', 0, 1, '2023-02-04 17:09:05.000000'),
(98, 'pbkdf2_sha256$390000$hUPAfp6VeRnNxuIitae1l7$+9LJyGSV+DHjjt4QiFG2mX6RKsZ0Ghnl98D86ntmkUA=', '2023-02-04 17:38:48.369660', 0, 'coba16', '', '', '', 0, 1, '2023-02-04 17:09:27.000000'),
(99, 'pbkdf2_sha256$390000$qr8Xu6bImhdjHsfJSdqfi1$h6ZY0FuJgP+5F+OXLh7rW41b/o4wyL/1/TBsdQ7a/nk=', '2023-02-04 17:46:00.000334', 0, 'coba17', '', '', '', 0, 1, '2023-02-04 17:09:43.000000'),
(100, 'pbkdf2_sha256$390000$44o3TRRXc5YSbB2FnfNfZH$DYHutkE0AbiU/LxTrQINtU2hwzRGMZkWj+wixzRZwyw=', '2023-02-04 17:46:09.660974', 0, 'coba18', '', '', '', 0, 1, '2023-02-04 17:10:00.000000'),
(101, 'pbkdf2_sha256$390000$3713h4D0OO5YEfmUZk7wjF$hAREvxbrrdw6GmxcMLkto+bIB3GwgDoOnaumKa6FSEI=', '2023-02-04 17:49:59.335138', 0, 'coba19', '', '', '', 0, 1, '2023-02-04 17:10:44.000000'),
(102, 'pbkdf2_sha256$390000$11rfNSnhde2Qwbe5ckBWii$7By1R2AV6IL0BtTFvcm0b1JgOjGqkTbFoLItcR8nXdE=', '2023-02-04 17:50:08.601439', 0, 'coba20', '', '', '', 0, 1, '2023-02-04 17:11:01.000000'),
(103, 'pbkdf2_sha256$390000$FqDBjdf1M4aRhVjg0zckoH$gBBrgcyxYd4lLq3L75TjUQHd0EPCNVyjEkXQzkSmWw4=', '2023-02-04 17:55:25.756198', 0, 'coba21', '', '', '', 0, 1, '2023-02-04 17:52:11.000000'),
(104, 'pbkdf2_sha256$390000$RAXgtTBoqYsvet7lk4vQc1$HwpoFHEWtAQL5H6DQO1ezpmVEDxI3pSpu51lqSUrTQ0=', NULL, 0, 'boba22', '', '', '', 0, 1, '2023-02-04 17:52:30.000000'),
(105, 'pbkdf2_sha256$390000$ef6ZAforvPl8Y9quQUdRRt$bilLYaC3pvsS8KML4eyWcYIfmUXhjFhT2hF/xdBLiY0=', '2023-02-04 18:00:44.649424', 0, 'coba23', '', '', '', 0, 1, '2023-02-04 17:52:53.000000'),
(106, 'pbkdf2_sha256$390000$4Zk7IoG8sHORWfzgoTUZtr$LzlN+lSZ/+AGfNH5uxGX2RmJTInT/ccM6aZ5by6XGHo=', '2023-02-04 18:02:50.952791', 0, 'coba24', '', '', '', 0, 1, '2023-02-04 17:53:14.000000'),
(107, 'pbkdf2_sha256$390000$6K3bRaFJjBlBF1ceWoX0r7$/JISEAI88v4vfREJCpj0a2IgJRP28JOmzXoHpwXGkhQ=', '2023-02-04 18:04:58.316662', 0, 'coba25', '', '', '', 0, 1, '2023-02-04 17:53:31.000000'),
(108, 'pbkdf2_sha256$390000$6TyEj0mMLWHFyRIjQGWJqW$FNA7Evv4y1qwG2tVKTKUcTToISt2+rdmnReyaRyDSPU=', '2023-02-04 18:07:10.252803', 0, 'coba26', '', '', '', 0, 1, '2023-02-04 17:53:55.000000'),
(109, 'pbkdf2_sha256$390000$PnzXsI6Xy7PPYnc9lDIlal$z/DYI2BNYwDQI733dlZ5agyj3rDSIWAfX9DQ1PrOuiA=', '2023-02-04 18:08:58.363386', 0, 'coba27', '', '', '', 0, 1, '2023-02-04 17:54:09.000000'),
(110, 'pbkdf2_sha256$390000$iTpWp7xr58S78y1uwltsEM$4tLrSHBAyHrKeUlVh+KxtqjUixJHi27RqMk9kLLtWuI=', '2023-02-04 18:11:20.608506', 0, 'coba28', '', '', '', 0, 1, '2023-02-04 17:54:30.000000'),
(111, 'pbkdf2_sha256$390000$1SbMybaRtzUwx0Pkn6el3A$4TD5BCEVdO8GpgHO0qHeCNGK6RKX0ZGVbM7Kl1yYfi4=', '2023-02-04 18:15:10.098498', 0, 'coba29', '', '', '', 0, 1, '2023-02-04 17:54:47.000000'),
(112, 'pbkdf2_sha256$390000$izKpbURk5q3z7rTS9eDO3n$yMy1euyie91VGq4SoYBYxVhcQc0H+72qtpnckX9Fu84=', '2023-02-04 18:15:18.464675', 0, 'coba30', '', '', '', 0, 1, '2023-02-04 17:55:06.000000'),
(113, 'pbkdf2_sha256$390000$yne5TVQk0VfXyf1a9uNgqZ$n3+2yqc8DSOxTfMySgl2kHMj5iEM8AslQ5k68VGOS6o=', '2023-02-04 17:58:41.737131', 0, 'coba22', '', '', '', 0, 1, '2023-02-04 17:58:28.000000'),
(114, 'pbkdf2_sha256$390000$WENyvSwgYmNOp4KzYdbXV9$flk+HrFImc1cl5HRj2h0W+008MPGY9ijRn8rn25PmxE=', '2023-02-04 18:19:37.541665', 0, 'coba31', '', '', '', 0, 1, '2023-02-04 18:18:05.000000'),
(115, 'pbkdf2_sha256$390000$uVXWLTcVkTS44QFXEiBB1I$emUEJB+XYWVsNnBftVEAzaz9a3CJ1ix5YRmD7n1fjwA=', '2023-02-04 18:21:20.215479', 0, 'coba32', '', '', '', 0, 1, '2023-02-04 18:18:25.000000'),
(116, 'pbkdf2_sha256$390000$9DqeLvcrgNAjGlsicAj5Rx$NrVy+yuObJOR39V+HfovNsD67J8sfWBaNNoa4Va4Fwo=', '2023-02-04 18:23:23.222026', 0, 'coba33', '', '', '', 0, 1, '2023-02-04 18:18:46.000000'),
(117, 'pbkdf2_sha256$390000$9iDgZnZ7lowZG6t6wNmqqG$bBkBkTo3SVhBrNi+CfesDfhygmMXo1HFLGWwGzv9nac=', '2023-02-15 11:27:55.459878', 0, 'coba34', '', '', '', 0, 1, '2023-02-04 18:19:08.000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 5, 1),
(46, 6, 3),
(48, 7, 3),
(47, 8, 3),
(7, 9, 3),
(10, 13, 3),
(24, 40, 3),
(25, 42, 4),
(27, 43, 6),
(29, 45, 3),
(30, 46, 2),
(31, 47, 2),
(32, 48, 2),
(33, 49, 2),
(34, 50, 2),
(35, 51, 2),
(36, 52, 2),
(37, 53, 2),
(38, 54, 2),
(39, 55, 2),
(40, 56, 2),
(41, 57, 2),
(42, 58, 2),
(43, 59, 2),
(44, 60, 2),
(45, 61, 2),
(49, 62, 3),
(50, 63, 3),
(51, 64, 3),
(52, 65, 4),
(53, 66, 2),
(54, 67, 2),
(55, 68, 2),
(56, 69, 2),
(57, 70, 4),
(58, 71, 2),
(59, 72, 2),
(60, 73, 6),
(61, 74, 2),
(62, 75, 2),
(63, 76, 2),
(64, 77, 2),
(65, 78, 2),
(66, 79, 2),
(67, 80, 2),
(68, 81, 2),
(69, 82, 6),
(70, 83, 3),
(71, 84, 3),
(72, 85, 3),
(73, 86, 3),
(74, 87, 3),
(75, 88, 3),
(76, 89, 3),
(77, 90, 3),
(78, 91, 3),
(79, 92, 3),
(80, 93, 3),
(81, 94, 3),
(82, 95, 3),
(83, 96, 3),
(84, 97, 3),
(85, 98, 3),
(86, 99, 3),
(87, 100, 3),
(88, 101, 3),
(89, 102, 3),
(90, 103, 3),
(91, 104, 3),
(92, 105, 3),
(93, 106, 3),
(94, 107, 3),
(95, 108, 3),
(96, 109, 3),
(97, 110, 3),
(98, 111, 3),
(99, 112, 3),
(100, 113, 3),
(101, 114, 3),
(102, 115, 3),
(103, 116, 3),
(104, 117, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-11-03 08:44:15.264259', '2', 'admin1', 1, '[{\"added\": {}}]', 4, 1),
(2, '2022-11-03 08:54:30.987051', '3', 'admin2', 1, '[{\"added\": {}}]', 4, 1),
(3, '2022-11-03 08:55:24.597844', '4', 'admin3', 1, '[{\"added\": {}}]', 4, 1),
(4, '2022-11-03 09:25:26.713835', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(5, '2022-11-03 09:25:37.448992', '2', 'dosen', 1, '[{\"added\": {}}]', 3, 1),
(6, '2022-11-03 09:25:45.325404', '3', 'mahasiswa', 1, '[{\"added\": {}}]', 3, 1),
(7, '2022-11-05 12:47:02.634084', '2', 'admin1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(8, '2022-11-05 12:47:19.161510', '3', 'admin2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(9, '2022-11-05 12:47:29.121779', '4', 'admin3', 2, '[]', 4, 1),
(10, '2022-11-05 12:48:53.285425', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(11, '2022-11-05 13:13:30.826582', '5', 'agung', 1, '[{\"added\": {}}]', 4, 1),
(12, '2022-11-05 13:13:43.057307', '5', 'agung', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(13, '2022-11-06 19:18:05.461970', '5', 'agung', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(14, '2022-11-07 10:01:14.594365', '2', 'admin1', 3, '', 4, 1),
(15, '2022-11-07 10:01:14.602359', '3', 'admin2', 3, '', 4, 1),
(16, '2022-11-07 10:01:14.602359', '4', 'admin3', 3, '', 4, 1),
(17, '2022-11-07 10:02:01.140807', '6', 'putranto', 1, '[{\"added\": {}}]', 4, 1),
(18, '2022-11-07 10:02:22.262521', '7', 'naufal', 1, '[{\"added\": {}}]', 4, 1),
(19, '2022-11-07 10:02:32.918241', '7', 'naufal', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(20, '2022-11-07 10:02:44.939834', '6', 'putranto', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(21, '2022-11-07 10:03:09.534526', '8', 'gihon', 1, '[{\"added\": {}}]', 4, 1),
(22, '2022-11-07 10:03:19.929903', '8', 'gihon', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(23, '2022-11-12 11:47:53.417381', '1', 'Admin', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(24, '2022-11-12 11:48:18.444642', '2', 'Dosenpbb', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(25, '2022-11-12 11:48:27.976439', '3', 'Mahasiswa', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(26, '2022-11-12 11:50:57.191019', '9', 'apanji', 1, '[{\"added\": {}}]', 4, 1),
(27, '2022-11-12 11:51:25.690307', '9', 'apanji', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 1),
(28, '2022-11-12 11:52:09.181379', '10', 'dosen1', 1, '[{\"added\": {}}]', 4, 1),
(29, '2022-11-12 11:52:37.921444', '10', 'dosen1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 1),
(30, '2022-11-13 14:59:09.832287', '11', 'antoanto', 3, '', 4, 1),
(31, '2022-11-17 15:22:30.107957', '4', 'LAA', 1, '[{\"added\": {}}]', 3, 1),
(32, '2022-11-17 15:22:45.062047', '5', 'Keprodi', 1, '[{\"added\": {}}]', 3, 1),
(33, '2022-11-17 15:22:53.778281', '5', 'Kaprodi', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(34, '2022-11-20 06:55:27.341867', '5', 'agung', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(35, '2022-11-20 06:55:40.413065', '12', 'antoanto', 3, '', 4, 1),
(36, '2022-11-24 08:02:36.654958', '5', 'agung', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(37, '2022-11-24 08:02:56.051608', '8', 'gihon', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(38, '2022-11-24 08:05:23.761153', '7', 'naufal', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(39, '2022-11-24 08:05:37.390901', '7', 'naufal', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(40, '2022-11-24 08:06:18.957476', '6', 'putranto', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\"]}}]', 4, 1),
(41, '2022-11-24 08:06:42.074132', '8', 'gihon', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(42, '2022-11-24 08:07:06.480461', '1', 'superuser', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 4, 1),
(43, '2022-11-24 19:40:29.089756', '2', 'Pembimbing', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(44, '2022-11-27 06:12:31.274909', '4', 'Dosen_Matkul', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(45, '2022-11-27 06:12:43.783826', '1', 'LAA', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(46, '2022-11-27 06:13:41.143485', '2', 'Dosen_Pembimbing', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(47, '2022-11-27 21:40:08.834886', '1', 'TK-42-01', 1, '[{\"added\": {}}]', 7, 1),
(48, '2022-11-27 21:40:16.967218', '2', 'TK-42-02', 1, '[{\"added\": {}}]', 7, 1),
(49, '2022-11-27 21:40:24.783845', '3', 'TK-42-03', 1, '[{\"added\": {}}]', 7, 1),
(50, '2022-11-27 21:40:32.226138', '4', 'TK-42-06', 1, '[{\"added\": {}}]', 7, 1),
(51, '2022-11-27 21:40:47.724104', '4', 'TK-42-06', 3, '', 7, 1),
(52, '2022-11-27 21:40:56.949134', '5', 'TK-42-04', 1, '[{\"added\": {}}]', 7, 1),
(53, '2022-11-27 21:41:04.925684', '6', 'TK-42-05', 1, '[{\"added\": {}}]', 7, 1),
(54, '2022-11-27 21:41:11.643775', '7', 'TK-42-06', 1, '[{\"added\": {}}]', 7, 1),
(55, '2022-11-28 00:21:46.117388', '15', 'jcena', 3, '', 4, 5),
(56, '2022-11-28 00:21:46.120390', '16', 'panji123', 3, '', 4, 5),
(57, '2022-11-28 00:21:46.122391', '17', 'wasd', 3, '', 4, 5),
(58, '2022-11-28 00:25:51.725160', '1', 'User_Kelas object (1)', 1, '[{\"added\": {}}]', 8, 1),
(59, '2022-11-28 00:37:25.774798', '1', 'User_Kelas object (1)', 3, '', 8, 1),
(60, '2022-11-28 00:43:09.219199', '18', 'jcena', 3, '', 4, 1),
(61, '2022-11-28 00:43:09.222200', '19', 'wasd', 3, '', 4, 1),
(62, '2022-11-28 07:41:00.197406', '22', 'jancok', 3, '', 4, 1),
(63, '2022-11-28 07:41:00.205406', '21', 'jcena', 3, '', 4, 1),
(64, '2022-11-28 07:41:00.205406', '14', 'naufal123', 3, '', 4, 1),
(65, '2022-11-28 07:41:00.213407', '20', 'wasd', 3, '', 4, 1),
(66, '2022-11-28 07:41:43.019696', '2', 'User_Kelas object (2)', 1, '[{\"added\": {}}]', 8, 1),
(67, '2022-11-28 07:47:09.339231', '2', 'User_Kelas object (2)', 3, '', 8, 1),
(68, '2022-11-28 07:54:24.416676', '23', 'jcena', 3, '', 4, 1),
(69, '2022-11-28 07:57:59.590177', '24', 'jcena', 3, '', 4, 1),
(70, '2022-11-28 10:04:17.177231', '3', 'User_Kelas object (3)', 1, '[{\"added\": {}}]', 8, 1),
(71, '2022-11-28 10:15:28.646756', '3', 'apanji', 3, '', 8, 1),
(72, '2022-11-28 10:47:26.145470', '7', 'TK-42-06', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 7, 1),
(73, '2022-11-28 10:47:35.876077', '6', 'TK-42-05', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 7, 1),
(74, '2022-11-28 10:47:50.079985', '5', 'TK-42-04', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 7, 1),
(75, '2022-11-28 10:47:58.661300', '3', 'TK-42-03', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 7, 1),
(76, '2022-11-28 10:48:05.762311', '2', 'TK-42-02', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 7, 1),
(77, '2022-11-28 10:48:13.210786', '1', 'TK-42-01', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 7, 1),
(78, '2022-11-28 12:06:44.692910', '4', 'r.kebab', 3, '', 8, 1),
(79, '2022-11-28 12:36:53.436003', '5', 'r.kebab', 3, '', 8, 1),
(80, '2022-11-28 13:14:02.819168', '6', 'None', 3, '', 8, 1),
(81, '2022-11-28 13:14:20.745482', '25', 'jcena', 3, '', 4, 1),
(82, '2022-11-28 13:18:09.651100', '26', 'jcena', 3, '', 4, 1),
(83, '2022-11-28 13:21:15.125006', '7', 'None', 3, '', 8, 1),
(84, '2022-11-28 13:21:27.773782', '27', 'jcena', 3, '', 4, 1),
(85, '2022-11-28 14:44:23.986064', '8', 'None', 3, '', 8, 1),
(86, '2022-11-28 14:44:36.402436', '28', 'jcena', 3, '', 4, 1),
(87, '2022-11-28 14:53:09.744167', '29', 'jcena', 3, '', 4, 1),
(88, '2022-11-28 14:55:04.299032', '30', 'jcena', 3, '', 4, 1),
(89, '2022-11-28 21:55:55.926364', '9', 'r.kebab', 1, '[{\"added\": {}}]', 8, 1),
(90, '2022-11-28 21:56:07.174800', '10', 'r.kebab', 1, '[{\"added\": {}}]', 8, 1),
(91, '2022-11-28 21:56:22.696388', '10', 'r.kebab', 3, '', 8, 1),
(92, '2022-11-28 21:56:22.698384', '9', 'r.kebab', 3, '', 8, 1),
(93, '2022-11-28 21:57:55.160935', '11', 'r.kebab', 1, '[{\"added\": {}}]', 8, 1),
(94, '2022-11-28 21:58:56.612588', '11', 'r.kebab', 3, '', 8, 1),
(95, '2022-11-28 22:18:15.196342', '31', 'jcena', 3, '', 4, 1),
(96, '2022-11-28 22:19:18.074117', '32', 'jcena', 3, '', 4, 1),
(97, '2022-11-28 22:21:58.544587', '33', 'jcena', 3, '', 4, 1),
(98, '2022-11-28 22:35:25.825460', '12', 'jcena', 3, '', 8, 1),
(99, '2022-11-28 22:45:35.686421', '13', 'jcena', 3, '', 8, 1),
(100, '2022-11-28 22:46:03.867971', '14', 'jcena', 3, '', 8, 1),
(101, '2022-11-28 22:57:37.816788', '35', 'zack', 3, '', 4, 1),
(102, '2022-11-29 11:16:28.060674', '19', 'None', 3, '', 8, 1),
(103, '2022-11-29 11:16:28.067676', '18', 'wasd', 3, '', 8, 1),
(104, '2022-11-29 11:16:41.360082', '37', 'wasd', 3, '', 4, 1),
(105, '2022-11-29 11:16:41.364084', '36', 'zack', 3, '', 4, 1),
(106, '2022-11-29 11:20:15.966971', '38', 'zack', 3, '', 4, 1),
(107, '2022-11-29 11:47:13.816478', '34', 'jcena', 3, '', 4, 1),
(108, '2022-11-29 11:47:25.255743', '15', 'None', 3, '', 8, 1),
(109, '2022-11-29 11:54:26.781773', '20', 'zack', 1, '[{\"added\": {}}]', 8, 1),
(110, '2022-11-29 11:54:39.413688', '39', 'zack', 3, '', 4, 1),
(111, '2022-11-29 12:40:35.530784', '1', 'Agung Panjimasjaya', 1, '[{\"added\": {}}]', 9, 1),
(112, '2022-11-30 05:27:11.163735', '1', 'Tukiman Manjek', 1, '[{\"added\": {}}]', 10, 1),
(113, '2022-11-30 05:27:18.810779', '1', 'Tukiman Manjek', 2, '[]', 10, 1),
(114, '2022-11-30 06:05:35.182637', '41', 'dosen2', 1, '[{\"added\": {}}]', 4, 1),
(115, '2022-11-30 06:06:37.792644', '2', 'Jhonny', 1, '[{\"added\": {}}]', 10, 1),
(116, '2022-11-30 07:00:44.787569', '1', 'Evconn', 1, '[{\"added\": {}}]', 12, 1),
(117, '2022-11-30 07:01:01.675261', '2', 'I-Smile', 1, '[{\"added\": {}}]', 12, 1),
(118, '2022-11-30 07:01:16.972864', '3', 'Magics', 1, '[{\"added\": {}}]', 12, 1),
(119, '2022-11-30 07:01:36.815352', '4', 'Rnest', 1, '[{\"added\": {}}]', 12, 1),
(120, '2022-11-30 07:01:50.721468', '5', 'SEA', 1, '[{\"added\": {}}]', 12, 1),
(121, '2022-11-30 07:02:08.200957', '6', 'Seculab', 1, '[{\"added\": {}}]', 12, 1),
(122, '2022-11-30 07:23:06.225536', '1', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 2, '[{\"changed\": {\"fields\": [\"Jml mhs\"]}}]', 11, 1),
(123, '2022-11-30 07:26:37.890062', '1', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 11, 1),
(124, '2022-11-30 07:28:51.083228', '2', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 11, 1),
(125, '2022-11-30 07:30:33.211008', '3', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 11, 1),
(126, '2022-11-30 07:35:29.665075', '4', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 11, 1),
(127, '2022-11-30 12:54:09.239446', '1', 'File object (1)', 1, '[{\"added\": {}}]', 13, 1),
(128, '2022-12-02 10:04:18.963876', '1', 'Rehan Kebab', 3, '', 13, 1),
(129, '2022-12-02 10:42:18.856394', '2', 'Rehan Kebab', 3, '', 13, 1),
(130, '2022-12-02 10:42:50.495854', '4', 'Rehan Kebab', 2, '[{\"changed\": {\"fields\": [\"Revisi\", \"Lembar ta\", \"Jurnal\"]}}]', 13, 1),
(131, '2022-12-02 10:47:51.243759', '4', 'Rehan Kebab', 3, '', 13, 1),
(132, '2022-12-02 10:50:03.157264', '5', 'Rehan Kebab', 3, '', 13, 1),
(133, '2022-12-04 05:51:40.822472', '1', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 1, '[{\"added\": {}}]', 14, 1),
(134, '2022-12-04 06:16:45.941847', '2', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 1, '[{\"added\": {}}]', 14, 1),
(135, '2022-12-04 06:35:51.624711', '1', 'Kunci Otomatis Menggunakan Suara Kentut', 2, '[{\"changed\": {\"fields\": [\"Proposal\"]}}]', 14, 1),
(136, '2022-12-04 07:09:00.418237', '4', 'None', 3, '', 14, 1),
(137, '2022-12-04 07:09:00.421239', '3', 'None', 3, '', 14, 1),
(138, '2022-12-04 07:28:20.335463', '2', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 2, '[]', 14, 1),
(139, '2022-12-04 07:28:27.002708', '1', 'Kunci Otomatis Menggunakan Suara Kentut', 2, '[]', 14, 1),
(140, '2022-12-04 07:29:38.612425', '5', 'Sistem Pelacakan Barang Berbasis Website', 1, '[{\"added\": {}}]', 14, 1),
(141, '2022-12-04 07:53:11.442870', '6', 'None', 3, '', 14, 1),
(142, '2022-12-04 08:21:54.650533', '5', 'Sistem Pelacakan Barang Berbasis Website', 3, '', 14, 1),
(143, '2022-12-04 08:21:54.653532', '2', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 14, 1),
(144, '2022-12-04 08:21:54.657534', '1', 'Kunci Otomatis Menggunakan Suara Kentut', 3, '', 14, 1),
(145, '2022-12-04 08:24:46.858027', '2', 'Rehan Kebab', 1, '[{\"added\": {}}]', 9, 1),
(146, '2022-12-04 08:49:22.169400', '22', 'apanji', 1, '[{\"added\": {}}]', 8, 1),
(147, '2022-12-04 08:50:09.349855', '23', 'dosen1', 1, '[{\"added\": {}}]', 8, 1),
(148, '2022-12-05 15:58:45.394523', '7', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 1, '[{\"added\": {}}]', 14, 1),
(149, '2022-12-05 17:53:15.559966', '7', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 14, 1),
(150, '2022-12-06 10:04:03.130516', '1', 'Rehan Kebab', 1, '[{\"added\": {}}]', 16, 1),
(151, '2022-12-06 10:04:14.519518', '1', 'Rehan Kebab', 3, '', 16, 1),
(152, '2022-12-06 10:49:44.085534', '6', 'Rehan Kebab', 3, '', 13, 1),
(153, '2022-12-09 11:44:45.495674', '42', 'dosen_kelas1', 1, '[{\"added\": {}}]', 4, 1),
(154, '2022-12-09 11:45:53.880021', '42', 'dosen_kelas1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 1),
(155, '2022-12-13 06:36:39.164915', '23', 'dosen1', 3, '', 8, 1),
(156, '2022-12-13 06:36:57.685643', '24', 'dosen_kelas1', 1, '[{\"added\": {}}]', 8, 1),
(157, '2022-12-13 07:55:37.179818', '8', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 1, '[{\"added\": {}}]', 14, 1),
(158, '2022-12-13 07:55:55.096064', '9', 'Sistem Pelacakan Barang Berbasis Website', 1, '[{\"added\": {}}]', 14, 1),
(159, '2022-12-13 08:10:29.874022', '10', 'None', 3, '', 14, 1),
(160, '2022-12-13 10:55:47.827706', '9', 'Sistem Pelacakan Barang Berbasis Website', 3, '', 14, 1),
(161, '2022-12-13 10:55:47.832708', '8', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 14, 1),
(162, '2022-12-13 10:55:59.043503', '11', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 1, '[{\"added\": {}}]', 14, 1),
(163, '2022-12-13 10:56:21.285770', '12', 'Sistem Pelacakan Barang Berbasis Website', 1, '[{\"added\": {}}]', 14, 1),
(164, '2022-12-15 08:12:29.395153', '41', 'dosen2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(165, '2022-12-15 08:14:08.715019', '41', 'dosen2', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(166, '2022-12-15 08:16:07.473636', '2', 'Jhonny', 2, '[]', 10, 1),
(167, '2022-12-15 08:16:30.354015', '13', 'None', 3, '', 14, 1),
(168, '2022-12-17 12:03:49.128604', '13', 'Kunci Otomatis Menggunakan Suara', 3, '', 11, 1),
(169, '2022-12-17 12:03:49.134618', '12', 'Chatbot Menggunakan Framework Django', 3, '', 11, 1),
(170, '2022-12-17 12:03:49.137606', '11', 'iot penguncian otomatis', 3, '', 11, 1),
(171, '2022-12-17 12:03:49.140605', '10', 'Sistem Pelacakan Barang Berbasis Website', 3, '', 11, 1),
(172, '2022-12-17 12:03:49.143606', '9', 'Kunci Otomatis Menggunakan Suara Kentut', 3, '', 11, 1),
(173, '2022-12-17 12:03:49.148607', '5', 'Penjadwalan Sidang Skripsi Menggunakan Algoritma Genetika', 3, '', 11, 1),
(174, '2022-12-17 13:22:54.848053', '12', 'None', 3, '', 14, 1),
(175, '2022-12-17 13:22:54.851050', '11', 'None', 3, '', 14, 1),
(176, '2022-12-18 04:39:14.779683', '6', 'Dosen_Fungsional', 1, '[{\"added\": {}}]', 3, 1),
(177, '2022-12-18 04:39:53.424825', '43', 'dosen_fungsional1', 1, '[{\"added\": {}}]', 4, 1),
(178, '2022-12-18 04:40:33.196582', '43', 'dosen_fungsional1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Staff status\", \"Groups\"]}}]', 4, 1),
(179, '2022-12-18 04:58:54.978729', '24', 'dosen_kelas1', 3, '', 8, 1),
(180, '2022-12-18 04:58:54.981728', '22', 'apanji', 3, '', 8, 1),
(181, '2022-12-18 04:58:54.984729', '21', 'r.kebab', 3, '', 8, 1),
(182, '2022-12-18 05:00:15.728319', '1', '2016', 1, '[{\"added\": {}}]', 18, 1),
(183, '2022-12-18 05:00:21.321693', '2', '2017', 1, '[{\"added\": {}}]', 18, 1),
(184, '2022-12-18 05:00:28.855536', '3', '2018', 1, '[{\"added\": {}}]', 18, 1),
(185, '2022-12-18 05:00:33.566591', '4', '2019', 1, '[{\"added\": {}}]', 18, 1),
(186, '2022-12-18 05:01:22.259842', '1', 'TK-42-01', 2, '[{\"changed\": {\"fields\": [\"Angkatan\"]}}]', 7, 1),
(187, '2022-12-18 05:01:27.863036', '2', 'TK-42-02', 2, '[{\"changed\": {\"fields\": [\"Angkatan\"]}}]', 7, 1),
(188, '2022-12-18 05:01:33.344310', '3', 'TK-42-03', 2, '[{\"changed\": {\"fields\": [\"Angkatan\"]}}]', 7, 1),
(189, '2022-12-18 05:01:38.238252', '5', 'TK-42-04', 2, '[{\"changed\": {\"fields\": [\"Angkatan\"]}}]', 7, 1),
(190, '2022-12-18 05:01:43.423496', '6', 'TK-42-05', 2, '[{\"changed\": {\"fields\": [\"Angkatan\"]}}]', 7, 1),
(191, '2022-12-18 05:01:48.083735', '7', 'TK-42-06', 2, '[{\"changed\": {\"fields\": [\"Angkatan\"]}}]', 7, 1),
(192, '2022-12-18 05:02:05.773704', '8', 'TK-43-01', 1, '[{\"added\": {}}]', 7, 1),
(193, '2022-12-18 05:02:15.258578', '9', 'TK-43-02', 1, '[{\"added\": {}}]', 7, 1),
(194, '2022-12-18 05:02:22.730611', '10', 'TK-43-03', 1, '[{\"added\": {}}]', 7, 1),
(195, '2022-12-18 05:02:30.497132', '11', 'TK-43-04', 1, '[{\"added\": {}}]', 7, 1),
(196, '2022-12-18 05:02:38.636003', '12', 'TK-43-05', 1, '[{\"added\": {}}]', 7, 1),
(197, '2022-12-18 05:02:47.112161', '13', 'TK-43-06', 1, '[{\"added\": {}}]', 7, 1),
(198, '2022-12-18 05:03:27.289418', '14', 'TK-41-01', 1, '[{\"added\": {}}]', 7, 1),
(199, '2022-12-18 05:03:37.872291', '15', 'TK-41-02', 1, '[{\"added\": {}}]', 7, 1),
(200, '2022-12-18 05:03:45.646104', '16', 'TK-41-03', 1, '[{\"added\": {}}]', 7, 1),
(201, '2022-12-18 05:03:55.481139', '17', 'TK-41-04', 1, '[{\"added\": {}}]', 7, 1),
(202, '2022-12-18 05:04:07.175259', '18', 'TK-41-05', 1, '[{\"added\": {}}]', 7, 1),
(203, '2022-12-18 05:04:17.750799', '19', 'TK-41-06', 1, '[{\"added\": {}}]', 7, 1),
(204, '2022-12-18 05:04:32.350937', '20', 'TK-40-01', 1, '[{\"added\": {}}]', 7, 1),
(205, '2022-12-18 05:04:40.354591', '21', 'TK-40-02', 1, '[{\"added\": {}}]', 7, 1),
(206, '2022-12-18 05:04:48.298472', '22', 'TK-40-03', 1, '[{\"added\": {}}]', 7, 1),
(207, '2022-12-18 05:04:56.863832', '23', 'TK-40-04', 1, '[{\"added\": {}}]', 7, 1),
(208, '2022-12-18 05:05:06.405699', '24', 'TK-40-05', 1, '[{\"added\": {}}]', 7, 1),
(209, '2022-12-18 05:05:14.435034', '25', 'TK-40-06', 1, '[{\"added\": {}}]', 7, 1),
(210, '2022-12-18 06:47:16.001909', '26', 'dosen_kelas1', 1, '[{\"added\": {}}]', 8, 1),
(211, '2022-12-18 07:24:54.586914', '15', 'Sistem Pelacakan Barang Berbasis Website', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 11, 1),
(212, '2022-12-18 07:25:36.861012', '14', 'Website Penjadwalan Otomatis Menggunakan Algoritma Genetika', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 11, 1),
(213, '2022-12-20 11:27:34.356377', '1', 'Agung Panjimasjaya', 3, '', 17, 1),
(214, '2022-12-20 16:06:01.956542', '3', 'Agung Panjimasjaya', 3, '', 17, 1),
(215, '2022-12-21 05:42:10.906943', '1', 'Agung Panjimasjaya', 3, '', 9, 1),
(216, '2022-12-21 05:43:46.536064', '7', 'Agung Panjimasjaya', 3, '', 9, 1),
(217, '2022-12-21 15:12:57.325155', '3', 'Rehan Kebab', 2, '[{\"changed\": {\"fields\": [\"Berkas nilai\"]}}]', 9, 1),
(218, '2022-12-23 17:16:46.607904', '15', 'Sistem Pelacakan Barang Berbasis Website', 3, '', 11, 1),
(219, '2022-12-23 17:41:52.723999', '16', 'Chatbot Menggunakan Framework Django', 3, '', 11, 1),
(220, '2022-12-23 17:42:33.139557', '20', 'Website Penjadwalan Otomatis Menggunakan Algoritma Genetika', 2, '[{\"changed\": {\"fields\": [\"Proposal\"]}}]', 14, 1),
(221, '2022-12-23 17:42:38.469194', '18', 'Chatbot Menggunakan Framework Django', 2, '[{\"changed\": {\"fields\": [\"Proposal\"]}}]', 14, 1),
(222, '2022-12-27 09:14:04.890536', '44', 'dosen_fungsional', 1, '[{\"added\": {}}]', 4, 1),
(223, '2022-12-27 09:14:43.757353', '44', 'dosen_fungsional', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Groups\"]}}]', 4, 1),
(224, '2022-12-27 09:15:04.469695', '44', 'dosen_fungsional', 3, '', 4, 1),
(225, '2022-12-29 10:00:57.279764', '2', 'Jhonny', 2, '[{\"changed\": {\"fields\": [\"Kelompok keahlian\"]}}]', 10, 1),
(226, '2022-12-29 10:01:04.713463', '1', 'Tukiman Manjek', 2, '[{\"changed\": {\"fields\": [\"Kelompok keahlian\"]}}]', 10, 1),
(227, '2022-12-29 10:02:51.101288', '5', 'Rehan Kebab', 3, '', 17, 1),
(228, '2022-12-29 10:02:51.104286', '4', 'Agung Panjimasjaya', 3, '', 17, 1),
(229, '2022-12-29 10:21:02.243170', '1', 'N.202', 1, '[{\"added\": {}}]', 19, 1),
(230, '2022-12-29 10:21:12.128317', '2', 'N.208', 1, '[{\"added\": {}}]', 19, 1),
(231, '2022-12-29 10:21:22.547627', '3', 'N.208A', 1, '[{\"added\": {}}]', 19, 1),
(232, '2022-12-29 10:25:56.916560', '20', 'Website Penjadwalan Otomatis Menggunakan Algoritma Genetika', 3, '', 14, 1),
(233, '2022-12-29 10:25:56.918559', '18', 'Chatbot Menggunakan Framework Django', 3, '', 14, 1),
(234, '2022-12-29 10:26:10.881666', '17', 'Chatbot Menggunakan Framework Django', 3, '', 11, 1),
(235, '2022-12-29 10:26:10.883666', '14', 'Website Penjadwalan Otomatis Menggunakan Algoritma Genetika', 3, '', 11, 1),
(236, '2022-12-29 10:27:44.955356', '2', 'Jhonny', 3, '', 10, 1),
(237, '2022-12-29 10:27:44.958355', '1', 'Tukiman Manjek', 3, '', 10, 1),
(238, '2022-12-29 10:27:57.010309', '10', 'dosen1', 3, '', 4, 1),
(239, '2022-12-29 10:27:57.013314', '41', 'dosen2', 3, '', 4, 1),
(240, '2022-12-29 10:30:07.747471', '46', '93660027-1', 1, '[{\"added\": {}}]', 4, 1),
(241, '2022-12-29 10:31:00.382131', '46', 'agus_virgono', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Groups\"]}}]', 4, 1),
(242, '2022-12-29 10:32:25.225846', '47', 'ashri_dinimaharawati', 1, '[{\"added\": {}}]', 4, 1),
(243, '2022-12-29 10:32:35.253143', '47', 'ashri_dinimaharawati', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(244, '2022-12-29 10:33:01.738353', '48', 'budhi_irawan', 1, '[{\"added\": {}}]', 4, 1),
(245, '2022-12-29 10:33:09.504858', '48', 'budhi_irawan', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(246, '2022-12-29 10:33:45.326461', '49', 'burhanuddin_dirgantoro', 1, '[{\"added\": {}}]', 4, 1),
(247, '2022-12-29 10:33:54.150144', '49', 'burhanuddin_dirgantoro', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(248, '2022-12-29 10:34:13.232029', '50', 'casi_setianingsih', 1, '[{\"added\": {}}]', 4, 1),
(249, '2022-12-29 10:34:24.033237', '50', 'casi_setianingsih', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(250, '2022-12-29 10:34:45.311429', '51', 'fairuz_azmi', 1, '[{\"added\": {}}]', 4, 1),
(251, '2022-12-29 10:34:51.886763', '51', 'fairuz_azmi', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(252, '2022-12-29 10:35:22.320209', '52', 'faisal_candrasyah_hasibuan', 1, '[{\"added\": {}}]', 4, 1),
(253, '2022-12-29 10:35:30.047826', '52', 'faisal_candrasyah_hasibuan', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(254, '2022-12-29 10:36:05.391092', '53', 'meta_kallista', 1, '[{\"added\": {}}]', 4, 1),
(255, '2022-12-29 10:36:14.649508', '53', 'meta_kallista', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(256, '2022-12-29 10:36:41.046466', '54', 'marisa_w_paryasto', 1, '[{\"added\": {}}]', 4, 1),
(257, '2022-12-29 10:36:51.301191', '54', 'marisa_w_paryasto', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(258, '2022-12-29 10:37:17.972121', '55', 'm.faris_ruriawan', 1, '[{\"added\": {}}]', 4, 1),
(259, '2022-12-29 10:37:24.842452', '55', 'm.faris_ruriawan', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(260, '2022-12-29 10:37:41.678096', '56', 'm.nasrun', 1, '[{\"added\": {}}]', 4, 1),
(261, '2022-12-29 10:37:48.509253', '56', 'm.nasrun', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(262, '2022-12-29 10:38:54.206006', '57', 'randy_erfa_saputra', 1, '[{\"added\": {}}]', 4, 1),
(263, '2022-12-29 10:39:03.388661', '57', 'randy_erfa_saputra', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(264, '2022-12-29 10:40:11.414882', '58', 'roswan_latuconsina', 1, '[{\"added\": {}}]', 4, 1),
(265, '2022-12-29 10:40:19.746397', '58', 'roswan_latuconsina', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(266, '2022-12-29 10:40:43.819433', '59', 'tito_waluyo_purboyo', 1, '[{\"added\": {}}]', 4, 1),
(267, '2022-12-29 10:40:51.097449', '59', 'tito_waluyo_purboyo', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(268, '2022-12-29 10:41:05.759116', '60', 'umar_ali_ahmad', 1, '[{\"added\": {}}]', 4, 1),
(269, '2022-12-29 10:41:12.868903', '60', 'umar_ali_ahmad', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(270, '2022-12-29 10:41:33.028212', '61', 'yudha_purwanto', 1, '[{\"added\": {}}]', 4, 1),
(271, '2022-12-29 10:41:41.282512', '61', 'yudha_purwanto', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(272, '2022-12-29 10:46:28.180394', '3', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 10, 1),
(273, '2022-12-29 10:47:07.568163', '4', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 10, 1),
(274, '2022-12-29 10:48:26.591240', '5', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(275, '2022-12-29 10:49:20.080735', '6', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 10, 1),
(276, '2022-12-29 10:50:14.888986', '7', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 10, 1),
(277, '2022-12-29 10:50:44.513840', '8', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(278, '2022-12-29 10:51:44.177990', '9', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(279, '2022-12-29 10:52:20.973990', '10', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(280, '2022-12-29 10:53:12.259722', '11', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(281, '2022-12-29 10:54:32.841915', '12', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(282, '2022-12-29 10:55:25.723150', '13', 'Dr. META KALLISTA S.Si., M.Si.', 1, '[{\"added\": {}}]', 10, 1),
(283, '2022-12-29 10:58:26.763056', '14', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(284, '2022-12-29 10:59:06.025814', '15', 'ROSWAN LATUCONSINA S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(285, '2022-12-29 11:00:03.287969', '16', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 10, 1),
(286, '2022-12-29 11:00:47.142508', '17', 'UMAR ALI AHMAD Ph.D.', 1, '[{\"added\": {}}]', 10, 1),
(287, '2022-12-29 11:01:21.080192', '18', 'Dr. YUDHA PURWANTO S.T., M.T.', 1, '[{\"added\": {}}]', 10, 1),
(288, '2022-12-29 11:02:07.211868', '8', 'Agung Panjimasjaya', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 9, 1),
(289, '2022-12-29 11:02:20.547000', '3', 'Rehan Kebab', 2, '[]', 9, 1),
(290, '2022-12-29 11:16:17.211527', '6', 'putranto', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(291, '2022-12-29 11:16:33.351396', '8', 'gihon', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(292, '2022-12-29 11:16:47.184929', '7', 'naufal', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(293, '2023-01-04 07:52:05.291030', '1', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(294, '2023-01-04 07:52:18.427825', '2', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(295, '2023-01-04 07:52:28.147457', '3', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(296, '2023-01-04 07:52:48.805807', '4', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(297, '2023-01-04 07:53:03.831735', '5', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(298, '2023-01-04 07:53:19.397730', '6', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(299, '2023-01-04 07:53:37.142640', '7', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(300, '2023-01-04 07:53:46.173838', '8', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(301, '2023-01-04 07:53:55.575232', '9', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(302, '2023-01-04 07:54:06.488806', '10', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(303, '2023-01-04 07:54:18.848108', '11', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(304, '2023-01-04 07:54:26.988407', '12', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(305, '2023-01-04 07:54:43.647149', '13', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(306, '2023-01-04 07:54:56.680581', '14', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(307, '2023-01-04 07:55:07.245913', '15', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(308, '2023-01-04 07:55:15.869042', '16', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(309, '2023-01-04 07:55:34.023308', '17', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(310, '2023-01-04 07:55:48.147349', '18', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(311, '2023-01-04 07:55:57.108782', '19', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(312, '2023-01-04 07:56:09.068963', '20', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(313, '2023-01-04 07:56:19.050752', '21', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(314, '2023-01-04 07:56:30.036551', '22', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(315, '2023-01-04 07:56:38.162867', '23', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(316, '2023-01-04 07:56:45.683351', '24', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(317, '2023-01-04 07:56:54.095536', '25', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(318, '2023-01-04 07:57:02.510324', '26', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(319, '2023-01-04 07:57:17.979123', '27', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(320, '2023-01-04 07:57:33.390856', '28', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(321, '2023-01-04 07:57:50.244008', '29', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(322, '2023-01-04 07:57:58.467084', '30', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 20, 1),
(323, '2023-01-04 07:58:08.567599', '31', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 20, 1),
(324, '2023-01-04 07:58:18.153749', '32', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 20, 1),
(325, '2023-01-04 07:58:26.699874', '33', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 20, 1),
(326, '2023-01-04 07:58:38.664212', '34', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 20, 1),
(327, '2023-01-04 07:58:47.144166', '35', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(328, '2023-01-04 07:58:56.588232', '36', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(329, '2023-01-04 07:59:07.765297', '37', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(330, '2023-01-04 07:59:20.181781', '38', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(331, '2023-01-04 07:59:30.928875', '39', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(332, '2023-01-04 07:59:40.635854', '40', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(333, '2023-01-04 07:59:48.754672', '41', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(334, '2023-01-04 07:59:59.606978', '42', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(335, '2023-01-04 08:00:12.476338', '43', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(336, '2023-01-04 08:00:28.893676', '44', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(337, '2023-01-04 08:00:41.537519', '45', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(338, '2023-01-04 08:00:50.115755', '46', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(339, '2023-01-04 08:00:59.430888', '47', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(340, '2023-01-04 08:01:09.656262', '48', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(341, '2023-01-04 08:01:25.507343', '49', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(342, '2023-01-04 08:01:48.100419', '50', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(343, '2023-01-04 08:01:56.817103', '51', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(344, '2023-01-04 08:02:06.674387', '52', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(345, '2023-01-04 08:02:20.762433', '53', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(346, '2023-01-04 08:02:32.811101', '54', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(347, '2023-01-04 08:02:44.752459', '55', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(348, '2023-01-04 08:02:56.149260', '56', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(349, '2023-01-04 08:03:05.841316', '57', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(350, '2023-01-04 08:03:19.238151', '58', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(351, '2023-01-04 08:03:30.467441', '59', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(352, '2023-01-04 08:03:40.972803', '60', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(353, '2023-01-04 08:04:04.726103', '61', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(354, '2023-01-04 08:04:14.248221', '62', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(355, '2023-01-04 08:04:23.215302', '63', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(356, '2023-01-04 08:04:35.479839', '64', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(357, '2023-01-04 08:04:46.108779', '65', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(358, '2023-01-04 08:04:55.233610', '66', 'Dr. META KALLISTA S.Si., M.Si.', 1, '[{\"added\": {}}]', 20, 1),
(359, '2023-01-04 08:05:05.290728', '67', 'Dr. META KALLISTA S.Si., M.Si.', 1, '[{\"added\": {}}]', 20, 1),
(360, '2023-01-04 08:05:14.742922', '68', 'Dr. META KALLISTA S.Si., M.Si.', 1, '[{\"added\": {}}]', 20, 1),
(361, '2023-01-04 08:05:40.189250', '69', 'Dr. META KALLISTA S.Si., M.Si.', 1, '[{\"added\": {}}]', 20, 1),
(362, '2023-01-04 08:05:50.431640', '70', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(363, '2023-01-04 08:05:59.964769', '71', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(364, '2023-01-04 08:06:09.010626', '72', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(365, '2023-01-04 08:06:20.002423', '73', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(366, '2023-01-04 08:06:31.878767', '74', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(367, '2023-01-04 08:06:44.462105', '75', 'ROSWAN LATUCONSINA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(368, '2023-01-04 08:07:03.225647', '76', 'ROSWAN LATUCONSINA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(369, '2023-01-04 08:07:13.921572', '77', 'ROSWAN LATUCONSINA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(370, '2023-01-04 08:07:33.047114', '78', 'ROSWAN LATUCONSINA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(371, '2023-01-04 08:07:42.900942', '79', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 20, 1),
(372, '2023-01-04 08:07:51.595092', '80', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 20, 1),
(373, '2023-01-04 08:08:02.823905', '81', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 20, 1),
(374, '2023-01-04 08:08:12.863467', '82', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 20, 1),
(375, '2023-01-04 08:08:30.742931', '83', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 20, 1),
(376, '2023-01-04 08:08:41.623071', '84', 'UMAR ALI AHMAD Ph.D.', 1, '[{\"added\": {}}]', 20, 1),
(377, '2023-01-04 08:08:52.273204', '85', 'UMAR ALI AHMAD Ph.D.', 1, '[{\"added\": {}}]', 20, 1),
(378, '2023-01-04 08:09:06.019090', '86', 'UMAR ALI AHMAD Ph.D.', 1, '[{\"added\": {}}]', 20, 1),
(379, '2023-01-04 08:09:14.378416', '87', 'UMAR ALI AHMAD Ph.D.', 1, '[{\"added\": {}}]', 20, 1),
(380, '2023-01-04 08:09:35.031002', '88', 'Dr. YUDHA PURWANTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(381, '2023-01-04 08:09:48.465528', '89', 'Dr. YUDHA PURWANTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(382, '2023-01-04 08:09:59.733499', '90', 'Dr. YUDHA PURWANTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(383, '2023-01-04 08:10:08.933196', '91', 'Dr. YUDHA PURWANTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(384, '2023-01-04 08:10:20.839824', '92', 'Dr. YUDHA PURWANTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(385, '2023-01-04 08:10:54.893343', '93', 'Ir. AGUS VIRGONO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(386, '2023-01-04 08:11:06.010376', '94', 'ASHRI DINIMAHARAWATI S.Pd., M.T', 1, '[{\"added\": {}}]', 20, 1),
(387, '2023-01-04 08:11:15.184906', '95', 'BUDHI IRAWAN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(388, '2023-01-04 08:11:27.190205', '96', 'Ir. BURHANUDDIN DIRGANTORO M.T.', 1, '[{\"added\": {}}]', 20, 1),
(389, '2023-01-04 08:11:35.599365', '97', 'FAIRUZ AZMI ST., MT.', 1, '[{\"added\": {}}]', 20, 1),
(390, '2023-01-04 08:11:44.850402', '98', 'CASI SETIANINGSIH S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(391, '2023-01-04 08:11:57.649554', '99', 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(392, '2023-01-04 08:12:06.534091', '100', 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(393, '2023-01-04 08:12:15.281031', '101', 'MUHAMMAD NASRUN S.Si., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(394, '2023-01-04 08:12:25.653140', '102', 'Dr. MARISA W. PARYASTO S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(395, '2023-01-04 08:12:38.038762', '103', 'Dr. META KALLISTA S.Si., M.Si.', 1, '[{\"added\": {}}]', 20, 1),
(396, '2023-01-04 08:13:01.167742', '104', 'RANDY ERFA SAPUTRA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(397, '2023-01-04 08:13:10.776694', '105', 'ROSWAN LATUCONSINA S.T., M.T.', 1, '[{\"added\": {}}]', 20, 1),
(398, '2023-01-04 08:13:20.118539', '106', 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', 1, '[{\"added\": {}}]', 20, 1),
(399, '2023-01-04 08:13:36.327438', '107', 'UMAR ALI AHMAD Ph.D.', 1, '[{\"added\": {}}]', 20, 1),
(400, '2023-01-04 08:16:08.909089', '11', 'Christiano Ronaldo', 2, '[{\"changed\": {\"fields\": [\"Tanggal sidang\"]}}]', 17, 1),
(401, '2023-01-04 08:16:20.230819', '10', 'Gihon Godwin Silitonga', 2, '[{\"changed\": {\"fields\": [\"Tanggal sidang\"]}}]', 17, 1),
(402, '2023-01-04 08:16:30.785617', '9', 'Zack', 2, '[{\"changed\": {\"fields\": [\"Tanggal sidang\"]}}]', 17, 1),
(403, '2023-01-04 08:16:57.180464', '8', 'Agung Panjimasjaya', 2, '[{\"changed\": {\"fields\": [\"Tanggal sidang\"]}}]', 17, 1),
(404, '2023-01-04 08:17:18.134000', '7', 'John Cena', 2, '[{\"changed\": {\"fields\": [\"Tanggal sidang\"]}}]', 17, 1),
(405, '2023-01-04 08:17:35.057471', '6', 'Rehan Kebab', 2, '[{\"changed\": {\"fields\": [\"Tanggal sidang\"]}}]', 17, 1),
(406, '2023-01-04 08:19:28.132837', '11', 'Christiano Ronaldo', 2, '[{\"changed\": {\"fields\": [\"Hari sidang\"]}}]', 17, 1),
(407, '2023-01-04 08:19:36.876756', '10', 'Gihon Godwin Silitonga', 2, '[{\"changed\": {\"fields\": [\"Hari sidang\"]}}]', 17, 1),
(408, '2023-01-04 08:19:47.086113', '9', 'Zack', 2, '[{\"changed\": {\"fields\": [\"Hari sidang\"]}}]', 17, 1),
(409, '2023-01-04 08:20:01.555886', '8', 'Agung Panjimasjaya', 2, '[{\"changed\": {\"fields\": [\"Hari sidang\"]}}]', 17, 1),
(410, '2023-01-04 08:20:16.913834', '7', 'John Cena', 2, '[{\"changed\": {\"fields\": [\"Hari sidang\"]}}]', 17, 1),
(411, '2023-01-04 08:20:29.253176', '6', 'Rehan Kebab', 2, '[{\"changed\": {\"fields\": [\"Hari sidang\"]}}]', 17, 1),
(412, '2023-01-15 14:54:13.822139', '6', 'Rehan Kebab', 2, '[{\"changed\": {\"fields\": [\"Pbb1\", \"Pbb2\", \"Pemeriksa1\", \"Pemeriksa2\"]}}]', 17, 1),
(413, '2023-01-17 09:37:22.355724', '5', 'laa', 2, '[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}]', 4, 1),
(414, '2023-01-30 15:44:31.344274', '42', 'TK-42-06', 2, '[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}]', 4, 1),
(415, '2023-01-30 15:45:15.308482', '43', 'dosen_fungsional', 2, '[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}]', 4, 1),
(416, '2023-01-30 15:45:56.934874', '65', 'TK-43-06', 1, '[{\"added\": {}}]', 4, 1),
(417, '2023-01-30 15:46:20.307420', '65', 'TK-43-06', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Groups\"]}}]', 4, 1),
(418, '2023-01-30 15:48:21.623233', '30', 'TK-43-06', 1, '[{\"added\": {}}]', 8, 1),
(419, '2023-02-04 15:28:30.852224', '66', 'agung_nugroho_jati', 1, '[{\"added\": {}}]', 4, 1),
(420, '2023-02-04 15:28:51.444654', '66', 'agung_nugroho_jati', 2, '[]', 4, 1),
(421, '2023-02-04 15:29:15.189687', '66', 'agung_nugroho_jati', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(422, '2023-02-04 15:29:49.932245', '19', 'ANG', 1, '[{\"added\": {}}]', 10, 1),
(423, '2023-02-04 15:30:06.568696', '3', 'AGV', 2, '[{\"changed\": {\"fields\": [\"Nip\"]}}]', 10, 1),
(424, '2023-02-04 15:30:52.483410', '67', 'andrew_brian_osmond', 1, '[{\"added\": {}}]', 4, 1),
(425, '2023-02-04 15:30:59.584131', '67', 'andrew_brian_osmond', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(426, '2023-02-04 15:32:23.952827', '20', 'ABO', 1, '[{\"added\": {}}]', 10, 1),
(427, '2023-02-04 15:33:05.331657', '68', 'anggunmeka_luhur_prasasti', 1, '[{\"added\": {}}]', 4, 1),
(428, '2023-02-04 15:33:17.205996', '68', 'anggunmeka_luhur_prasasti', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(429, '2023-02-04 15:35:07.013204', '21', 'AGL', 1, '[{\"added\": {}}]', 10, 1),
(430, '2023-02-04 15:35:38.377055', '69', 'asif_awaludin', 1, '[{\"added\": {}}]', 4, 1),
(431, '2023-02-04 15:35:47.060411', '69', 'asif_awaludin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(432, '2023-02-04 15:38:48.248556', '22', 'WAL', 1, '[{\"added\": {}}]', 10, 1),
(433, '2023-02-04 15:39:26.879450', '70', 'astri_novianty', 1, '[{\"added\": {}}]', 4, 1),
(434, '2023-02-04 15:39:33.943824', '70', 'astri_novianty', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(435, '2023-02-04 15:40:43.720270', '23', 'ANY', 1, '[{\"added\": {}}]', 10, 1),
(436, '2023-02-04 15:41:25.602381', '71', 'dick_maryopi', 1, '[{\"added\": {}}]', 4, 1),
(437, '2023-02-04 15:41:33.080366', '71', 'dick_maryopi', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(438, '2023-02-04 15:43:21.117433', '24', 'DOI', 1, '[{\"added\": {}}]', 10, 1),
(439, '2023-02-04 15:44:04.347600', '72', 'fussy_mentari_dirgantara', 1, '[{\"added\": {}}]', 4, 1),
(440, '2023-02-04 15:44:25.918576', '72', 'fussy_mentari_dirgantara', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(441, '2023-02-04 15:46:10.045242', '25', 'FUY', 1, '[{\"added\": {}}]', 10, 1),
(442, '2023-02-04 15:46:38.043580', '73', 'izazi_mubarok', 1, '[{\"added\": {}}]', 4, 1),
(443, '2023-02-04 15:46:44.975365', '73', 'izazi_mubarok', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(444, '2023-02-04 15:47:50.760008', '26', 'IZY', 1, '[{\"added\": {}}]', 10, 1),
(445, '2023-02-04 15:48:35.932062', '74', 'novera_istiqomah', 1, '[{\"added\": {}}]', 4, 1),
(446, '2023-02-04 15:48:51.175169', '74', 'novera_istiqomah', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(447, '2023-02-04 15:50:36.747221', '27', 'NVO', 1, '[{\"added\": {}}]', 10, 1),
(448, '2023-02-04 15:51:00.491395', '75', 'prayitno_abadi', 1, '[{\"added\": {}}]', 4, 1),
(449, '2023-02-04 15:51:06.084437', '75', 'prayitno_abadi', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(450, '2023-02-04 15:52:17.312319', '28', 'PYO', 1, '[{\"added\": {}}]', 10, 1),
(451, '2023-02-04 15:52:42.701667', '76', 'purba_daru_kusuma', 1, '[{\"added\": {}}]', 4, 1),
(452, '2023-02-04 15:52:49.635397', '76', 'purba_daru_kusuma', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(453, '2023-02-04 15:53:43.781650', '29', 'PBD', 1, '[{\"added\": {}}]', 10, 1),
(454, '2023-02-04 15:54:12.296825', '77', 'ratna_astuti', 1, '[{\"added\": {}}]', 4, 1),
(455, '2023-02-04 15:54:22.631558', '77', 'ratna_astuti', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(456, '2023-02-04 15:55:23.975710', '30', 'NGE', 1, '[{\"added\": {}}]', 10, 1),
(457, '2023-02-04 15:55:45.796859', '78', 'reza_rendian', 1, '[{\"added\": {}}]', 4, 1),
(458, '2023-02-04 15:55:53.963288', '78', 'reza_rendian', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(459, '2023-02-04 15:57:26.541590', '31', 'RER', 1, '[{\"added\": {}}]', 10, 1),
(460, '2023-02-04 15:57:55.027584', '79', 'risman_adnan', 1, '[{\"added\": {}}]', 4, 1),
(461, '2023-02-04 15:58:01.776737', '79', 'risman_adnan', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(462, '2023-02-04 15:58:59.938463', '32', 'TOR', 1, '[{\"added\": {}}]', 10, 1),
(463, '2023-02-04 15:59:36.230309', '80', 'surya_michrandi', 1, '[{\"added\": {}}]', 4, 1),
(464, '2023-02-04 15:59:42.258952', '80', 'surya_michrandi', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(465, '2023-02-04 16:00:41.756798', '33', 'SMC', 1, '[{\"added\": {}}]', 10, 1),
(466, '2023-02-04 16:01:19.546720', '81', 'wendi_harjupa', 1, '[{\"added\": {}}]', 4, 1),
(467, '2023-02-04 16:01:34.782357', '81', 'wendi_harjupa', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(468, '2023-02-04 16:02:46.028048', '34', 'WEJ', 1, '[{\"added\": {}}]', 10, 1),
(469, '2023-02-04 16:03:05.831178', '82', 'wildan_panji', 1, '[{\"added\": {}}]', 4, 1),
(470, '2023-02-04 16:03:16.769234', '82', 'wildan_panji', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(471, '2023-02-04 16:05:19.557932', '35', 'WPT', 1, '[{\"added\": {}}]', 10, 1),
(472, '2023-02-04 16:56:38.531908', '89', 'coba7', 1, '[{\"added\": {}}]', 4, 1),
(473, '2023-02-04 16:56:47.409854', '89', 'coba7', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(474, '2023-02-04 16:56:57.576418', '90', 'coba8', 1, '[{\"added\": {}}]', 4, 1),
(475, '2023-02-04 16:57:03.752740', '90', 'coba8', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(476, '2023-02-04 16:57:19.878151', '91', 'coba9', 1, '[{\"added\": {}}]', 4, 1),
(477, '2023-02-04 16:57:28.301172', '91', 'coba9', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(478, '2023-02-04 16:57:38.992984', '92', 'coba10', 1, '[{\"added\": {}}]', 4, 1),
(479, '2023-02-04 16:57:47.034740', '92', 'coba10', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(480, '2023-02-04 17:07:51.620598', '93', 'coba11', 1, '[{\"added\": {}}]', 4, 1),
(481, '2023-02-04 17:08:00.276289', '93', 'coba11', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(482, '2023-02-04 17:08:13.517236', '94', 'coba12', 1, '[{\"added\": {}}]', 4, 1),
(483, '2023-02-04 17:08:19.849132', '94', 'coba12', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(484, '2023-02-04 17:08:29.718940', '95', 'coba13', 1, '[{\"added\": {}}]', 4, 1),
(485, '2023-02-04 17:08:35.589672', '95', 'coba13', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(486, '2023-02-04 17:08:48.300865', '96', 'coba14', 1, '[{\"added\": {}}]', 4, 1),
(487, '2023-02-04 17:08:55.019070', '96', 'coba14', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(488, '2023-02-04 17:09:06.483877', '97', 'coba15', 1, '[{\"added\": {}}]', 4, 1),
(489, '2023-02-04 17:09:16.567896', '97', 'coba15', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(490, '2023-02-04 17:09:28.227136', '98', 'coba16', 1, '[{\"added\": {}}]', 4, 1),
(491, '2023-02-04 17:09:33.595472', '98', 'coba16', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(492, '2023-02-04 17:09:44.301875', '99', 'coba17', 1, '[{\"added\": {}}]', 4, 1),
(493, '2023-02-04 17:09:49.893296', '99', 'coba17', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(494, '2023-02-04 17:10:01.079864', '100', 'coba18', 1, '[{\"added\": {}}]', 4, 1),
(495, '2023-02-04 17:10:09.378862', '100', 'coba18', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(496, '2023-02-04 17:10:44.956910', '101', 'coba19', 1, '[{\"added\": {}}]', 4, 1),
(497, '2023-02-04 17:10:50.757973', '101', 'coba19', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(498, '2023-02-04 17:11:01.793899', '102', 'coba20', 1, '[{\"added\": {}}]', 4, 1),
(499, '2023-02-04 17:11:13.290198', '102', 'coba20', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(500, '2023-02-04 17:52:11.578007', '103', 'coba21', 1, '[{\"added\": {}}]', 4, 1),
(501, '2023-02-04 17:52:19.126898', '103', 'coba21', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(502, '2023-02-04 17:52:31.379964', '104', 'boba22', 1, '[{\"added\": {}}]', 4, 1),
(503, '2023-02-04 17:52:38.712984', '104', 'boba22', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(504, '2023-02-04 17:52:54.591968', '105', 'coba23', 1, '[{\"added\": {}}]', 4, 1),
(505, '2023-02-04 17:53:02.838026', '105', 'coba23', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(506, '2023-02-04 17:53:14.760013', '106', 'coba24', 1, '[{\"added\": {}}]', 4, 1),
(507, '2023-02-04 17:53:20.889550', '106', 'coba24', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(508, '2023-02-04 17:53:31.738816', '107', 'coba25', 1, '[{\"added\": {}}]', 4, 1),
(509, '2023-02-04 17:53:37.584278', '107', 'coba25', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(510, '2023-02-04 17:53:55.632317', '108', 'coba26', 1, '[{\"added\": {}}]', 4, 1),
(511, '2023-02-04 17:54:00.898637', '108', 'coba26', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(512, '2023-02-04 17:54:10.523050', '109', 'coba27', 1, '[{\"added\": {}}]', 4, 1),
(513, '2023-02-04 17:54:19.335260', '109', 'coba27', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(514, '2023-02-04 17:54:31.460302', '110', 'coba28', 1, '[{\"added\": {}}]', 4, 1),
(515, '2023-02-04 17:54:37.877871', '110', 'coba28', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(516, '2023-02-04 17:54:48.356468', '111', 'coba29', 1, '[{\"added\": {}}]', 4, 1),
(517, '2023-02-04 17:54:55.993384', '111', 'coba29', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(518, '2023-02-04 17:55:06.749072', '112', 'coba30', 1, '[{\"added\": {}}]', 4, 1),
(519, '2023-02-04 17:55:14.477388', '112', 'coba30', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(520, '2023-02-04 17:58:28.666067', '113', 'coba22', 1, '[{\"added\": {}}]', 4, 1),
(521, '2023-02-04 17:58:34.292389', '113', 'coba22', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(522, '2023-02-04 18:18:05.790021', '114', 'coba31', 1, '[{\"added\": {}}]', 4, 1),
(523, '2023-02-04 18:18:14.781272', '114', 'coba31', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(524, '2023-02-04 18:18:25.558045', '115', 'coba32', 1, '[{\"added\": {}}]', 4, 1),
(525, '2023-02-04 18:18:32.010696', '115', 'coba32', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(526, '2023-02-04 18:18:46.745393', '116', 'coba33', 1, '[{\"added\": {}}]', 4, 1),
(527, '2023-02-04 18:18:57.883199', '116', 'coba33', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(528, '2023-02-04 18:19:08.845471', '117', 'coba34', 1, '[{\"added\": {}}]', 4, 1),
(529, '2023-02-04 18:19:14.734941', '117', 'coba34', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(530, '2023-02-04 18:29:56.616268', '18', 'AGUNG RYANTO', 2, '[{\"changed\": {\"fields\": [\"Waktu sidang\"]}}]', 17, 1),
(531, '2023-02-04 19:19:15.417007', '111', 'ANG', 1, '[{\"added\": {}}]', 20, 1),
(532, '2023-02-04 19:19:30.767750', '112', 'ANG', 1, '[{\"added\": {}}]', 20, 1),
(533, '2023-02-04 19:19:43.562429', '113', 'ANG', 1, '[{\"added\": {}}]', 20, 1),
(534, '2023-02-04 19:19:58.518789', '114', 'ANG', 1, '[{\"added\": {}}]', 20, 1),
(535, '2023-02-04 19:20:14.054153', '115', 'ANG', 1, '[{\"added\": {}}]', 20, 1),
(536, '2023-02-04 19:20:29.676644', '116', 'ANG', 1, '[{\"added\": {}}]', 20, 1),
(537, '2023-02-04 19:20:42.208345', '117', 'ABO', 1, '[{\"added\": {}}]', 20, 1),
(538, '2023-02-04 19:20:51.997747', '118', 'ABO', 1, '[{\"added\": {}}]', 20, 1),
(539, '2023-02-04 19:21:03.797351', '119', 'ABO', 1, '[{\"added\": {}}]', 20, 1),
(540, '2023-02-04 19:21:14.187972', '120', 'ABO', 1, '[{\"added\": {}}]', 20, 1),
(541, '2023-02-04 19:21:27.916703', '121', 'ABO', 1, '[{\"added\": {}}]', 20, 1),
(542, '2023-02-04 19:21:39.811248', '122', 'ABO', 1, '[{\"added\": {}}]', 20, 1),
(543, '2023-02-04 19:21:55.690155', '123', 'AGL', 1, '[{\"added\": {}}]', 20, 1),
(544, '2023-02-04 19:22:08.281867', '124', 'AGL', 1, '[{\"added\": {}}]', 20, 1),
(545, '2023-02-04 19:22:19.909759', '125', 'AGL', 1, '[{\"added\": {}}]', 20, 1),
(546, '2023-02-04 19:22:30.961118', '126', 'WAL', 1, '[{\"added\": {}}]', 20, 1),
(547, '2023-02-04 19:22:43.923108', '127', 'AGL', 1, '[{\"added\": {}}]', 20, 1),
(548, '2023-02-04 19:23:06.687477', '128', 'AGL', 1, '[{\"added\": {}}]', 20, 1),
(549, '2023-02-04 19:23:18.633015', '129', 'WAL', 1, '[{\"added\": {}}]', 20, 1),
(550, '2023-02-04 19:23:30.771796', '130', 'WAL', 1, '[{\"added\": {}}]', 20, 1),
(551, '2023-02-04 19:23:43.542325', '131', 'WAL', 1, '[{\"added\": {}}]', 20, 1),
(552, '2023-02-04 19:23:55.583561', '132', 'WAL', 1, '[{\"added\": {}}]', 20, 1),
(553, '2023-02-04 19:24:07.334439', '133', 'WAL', 1, '[{\"added\": {}}]', 20, 1),
(554, '2023-02-04 19:24:25.681811', '134', 'ANY', 1, '[{\"added\": {}}]', 20, 1),
(555, '2023-02-04 19:24:44.908320', '135', 'ANY', 1, '[{\"added\": {}}]', 20, 1),
(556, '2023-02-04 19:24:57.905149', '136', 'ANY', 1, '[{\"added\": {}}]', 20, 1),
(557, '2023-02-04 19:25:09.463839', '137', 'ANY', 1, '[{\"added\": {}}]', 20, 1),
(558, '2023-02-04 19:25:26.230267', '138', 'ANY', 1, '[{\"added\": {}}]', 20, 1),
(559, '2023-02-04 19:25:37.186310', '139', 'DOI', 1, '[{\"added\": {}}]', 20, 1),
(560, '2023-02-04 19:25:42.914513', '139', 'DOI', 2, '[]', 20, 1),
(561, '2023-02-04 19:25:53.428610', '140', 'DOI', 1, '[{\"added\": {}}]', 20, 1),
(562, '2023-02-04 19:26:03.684593', '141', 'DOI', 1, '[{\"added\": {}}]', 20, 1),
(563, '2023-02-04 19:26:16.730391', '142', 'DOI', 1, '[{\"added\": {}}]', 20, 1),
(564, '2023-02-04 19:26:24.299749', '143', 'DOI', 1, '[{\"added\": {}}]', 20, 1),
(565, '2023-02-04 19:26:31.922649', '144', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(566, '2023-02-04 19:26:39.124626', '145', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(567, '2023-02-04 19:26:49.911052', '146', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(568, '2023-02-04 19:27:00.275583', '147', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(569, '2023-02-04 19:27:08.531657', '148', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(570, '2023-02-04 19:27:16.823732', '149', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(571, '2023-02-04 19:27:24.903783', '150', 'FUY', 1, '[{\"added\": {}}]', 20, 1),
(572, '2023-02-04 19:27:33.309266', '151', 'IZY', 1, '[{\"added\": {}}]', 20, 1),
(573, '2023-02-04 19:27:42.506259', '152', 'IZY', 1, '[{\"added\": {}}]', 20, 1),
(574, '2023-02-04 19:27:49.685933', '153', 'IZY', 1, '[{\"added\": {}}]', 20, 1),
(575, '2023-02-04 19:27:57.285487', '154', 'IZY', 1, '[{\"added\": {}}]', 20, 1),
(576, '2023-02-04 19:28:05.336793', '155', 'IZY', 1, '[{\"added\": {}}]', 20, 1),
(577, '2023-02-04 19:28:13.682688', '156', 'IZY', 1, '[{\"added\": {}}]', 20, 1),
(578, '2023-02-04 19:28:21.005550', '157', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(579, '2023-02-04 19:28:28.038474', '158', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(580, '2023-02-04 19:28:35.203325', '159', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(581, '2023-02-04 19:28:44.886006', '160', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(582, '2023-02-04 19:28:51.948847', '161', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(583, '2023-02-04 19:28:59.064121', '162', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(584, '2023-02-04 19:29:06.731855', '163', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(585, '2023-02-04 19:29:15.457400', '164', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(586, '2023-02-04 19:29:23.137502', '165', 'NVO', 1, '[{\"added\": {}}]', 20, 1),
(587, '2023-02-04 19:29:36.287621', '166', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(588, '2023-02-04 19:29:43.989625', '167', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(589, '2023-02-04 19:29:51.019522', '168', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(590, '2023-02-04 19:29:58.681532', '169', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(591, '2023-02-04 19:30:05.603239', '170', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(592, '2023-02-04 19:30:12.298878', '171', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(593, '2023-02-04 19:30:22.265710', '172', 'PYO', 1, '[{\"added\": {}}]', 20, 1),
(594, '2023-02-04 19:30:36.053574', '173', 'PBD', 1, '[{\"added\": {}}]', 20, 1),
(595, '2023-02-04 19:30:43.799413', '174', 'PBD', 1, '[{\"added\": {}}]', 20, 1),
(596, '2023-02-04 19:30:52.031603', '175', 'PBD', 1, '[{\"added\": {}}]', 20, 1),
(597, '2023-02-04 19:31:03.721841', '176', 'PBD', 1, '[{\"added\": {}}]', 20, 1),
(598, '2023-02-04 19:31:13.430222', '177', 'PBD', 1, '[{\"added\": {}}]', 20, 1),
(599, '2023-02-04 19:31:19.743111', '178', 'NGE', 1, '[{\"added\": {}}]', 20, 1),
(600, '2023-02-04 19:31:26.358774', '179', 'NGE', 1, '[{\"added\": {}}]', 20, 1),
(601, '2023-02-04 19:31:35.548141', '180', 'NGE', 1, '[{\"added\": {}}]', 20, 1),
(602, '2023-02-04 19:31:45.698410', '181', 'NGE', 1, '[{\"added\": {}}]', 20, 1),
(603, '2023-02-04 19:31:53.012133', '182', 'NGE', 1, '[{\"added\": {}}]', 20, 1),
(604, '2023-02-04 19:32:00.021781', '183', 'RER', 1, '[{\"added\": {}}]', 20, 1),
(605, '2023-02-04 19:32:08.335096', '184', 'RER', 1, '[{\"added\": {}}]', 20, 1),
(606, '2023-02-04 19:32:16.938410', '185', 'RER', 1, '[{\"added\": {}}]', 20, 1),
(607, '2023-02-04 19:32:25.780779', '186', 'RER', 1, '[{\"added\": {}}]', 20, 1),
(608, '2023-02-04 19:32:36.395094', '187', 'RER', 1, '[{\"added\": {}}]', 20, 1),
(609, '2023-02-04 19:32:43.913195', '188', 'TOR', 1, '[{\"added\": {}}]', 20, 1),
(610, '2023-02-04 19:32:51.670308', '189', 'TOR', 1, '[{\"added\": {}}]', 20, 1),
(611, '2023-02-04 19:33:08.660763', '190', 'TOR', 1, '[{\"added\": {}}]', 20, 1),
(612, '2023-02-04 19:33:17.749683', '191', 'TOR', 1, '[{\"added\": {}}]', 20, 1),
(613, '2023-02-04 19:33:28.714281', '192', 'SMC', 1, '[{\"added\": {}}]', 20, 1),
(614, '2023-02-04 19:33:35.375087', '193', 'SMC', 1, '[{\"added\": {}}]', 20, 1),
(615, '2023-02-04 19:33:42.019867', '194', 'SMC', 1, '[{\"added\": {}}]', 20, 1),
(616, '2023-02-04 19:33:48.974152', '195', 'SMC', 1, '[{\"added\": {}}]', 20, 1),
(617, '2023-02-04 19:33:55.586715', '196', 'WEJ', 1, '[{\"added\": {}}]', 20, 1),
(618, '2023-02-04 19:34:09.658514', '197', 'WEJ', 1, '[{\"added\": {}}]', 20, 1),
(619, '2023-02-04 19:34:17.085605', '198', 'WEJ', 1, '[{\"added\": {}}]', 20, 1),
(620, '2023-02-04 19:34:24.750767', '199', 'WEJ', 1, '[{\"added\": {}}]', 20, 1),
(621, '2023-02-04 19:34:32.819418', '200', 'WEJ', 1, '[{\"added\": {}}]', 20, 1),
(622, '2023-02-04 19:34:51.912390', '201', 'SMC', 1, '[{\"added\": {}}]', 20, 1),
(623, '2023-02-04 19:34:59.134745', '202', 'WPT', 1, '[{\"added\": {}}]', 20, 1),
(624, '2023-02-04 19:35:07.107678', '203', 'WPT', 1, '[{\"added\": {}}]', 20, 1),
(625, '2023-02-04 19:35:15.047630', '204', 'WPT', 1, '[{\"added\": {}}]', 20, 1),
(626, '2023-02-04 19:35:22.385181', '205', 'WPT', 1, '[{\"added\": {}}]', 20, 1),
(627, '2023-02-04 19:35:29.473489', '206', 'WPT', 1, '[{\"added\": {}}]', 20, 1),
(628, '2023-02-04 19:35:38.693045', '207', 'WPT', 1, '[{\"added\": {}}]', 20, 1),
(629, '2023-02-04 19:35:47.098669', '208', 'WPT', 1, '[{\"added\": {}}]', 20, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(18, 'web_app', 'angkatan'),
(22, 'web_app', 'bebanpengujian'),
(28, 'web_app', 'cd1'),
(26, 'web_app', 'cd2'),
(27, 'web_app', 'cd3'),
(17, 'web_app', 'daftarsidang'),
(13, 'web_app', 'file'),
(23, 'web_app', 'inputjadwalsempro'),
(20, 'web_app', 'jadwalkelasdosen'),
(24, 'web_app', 'jadwalsemprodosen'),
(21, 'web_app', 'jadwalsidang'),
(25, 'web_app', 'jamsemprodosen'),
(7, 'web_app', 'kelas'),
(12, 'web_app', 'lab'),
(15, 'web_app', 'nilai'),
(14, 'web_app', 'order'),
(9, 'web_app', 'profil_mahasiswa'),
(10, 'web_app', 'profil_staff'),
(11, 'web_app', 'proposal'),
(19, 'web_app', 'ruangsidang'),
(16, 'web_app', 'sempro'),
(8, 'web_app', 'user_kelas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-10-28 15:03:17.586376'),
(2, 'auth', '0001_initial', '2022-10-28 15:03:18.253545'),
(3, 'admin', '0001_initial', '2022-10-28 15:03:18.442589'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-10-28 15:03:18.471591'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-28 15:03:18.489591'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-10-28 15:03:18.598620'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-10-28 15:03:18.668637'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-10-28 15:03:18.764662'),
(9, 'auth', '0004_alter_user_username_opts', '2022-10-28 15:03:18.785666'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-10-28 15:03:18.856685'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-10-28 15:03:18.866688'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-10-28 15:03:18.885692'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-10-28 15:03:18.919700'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-10-28 15:03:18.961711'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-10-28 15:03:19.060735'),
(16, 'auth', '0011_update_proxy_permissions', '2022-10-28 15:03:19.082741'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-10-28 15:03:19.115752'),
(18, 'sessions', '0001_initial', '2022-10-28 15:03:19.171761'),
(19, 'web_app', '0001_initial', '2022-11-27 21:32:16.798878'),
(20, 'web_app', '0002_rename_fk_user_kelas_user', '2022-11-27 21:34:45.553067'),
(21, 'web_app', '0003_remove_kelas_user_alter_kelas_nama_kelas', '2022-11-27 21:39:44.348034'),
(22, 'web_app', '0004_rename_nama_kelas_kelas_namakelas', '2022-11-27 21:43:25.837538'),
(23, 'web_app', '0005_fkkelas', '2022-11-27 21:56:39.832736'),
(24, 'web_app', '0006_rename_namakelas_kelas_nama', '2022-11-27 22:01:58.055585'),
(25, 'web_app', '0007_rename_fkkelas_user_kelas', '2022-11-28 00:08:30.453623'),
(26, 'web_app', '0008_delete_user_kelas', '2022-11-28 00:09:45.702022'),
(27, 'web_app', '0009_user_kelas', '2022-11-28 00:10:12.628400'),
(28, 'web_app', '0010_remove_kelas_nama_kelas_kelas', '2022-11-28 10:46:38.933662'),
(29, 'web_app', '0011_rename_kelas_kelas_nama', '2022-11-28 10:46:38.964930'),
(30, 'web_app', '0012_alter_user_kelas_kelas_alter_user_kelas_user', '2022-11-28 12:36:12.440042'),
(31, 'web_app', '0013_alter_user_kelas_user', '2022-11-28 21:57:01.457083'),
(32, 'web_app', '0014_alter_user_kelas_kelas_alter_user_kelas_user_and_more', '2022-11-29 12:18:57.517017'),
(33, 'web_app', '0015_proposal_profil_staff', '2022-11-29 12:52:46.673710'),
(34, 'web_app', '0016_rename_laboratorium_proposal_lab_and_more', '2022-11-30 05:51:47.284180'),
(35, 'web_app', '0017_lab_alter_proposal_jml_mhs', '2022-11-30 06:59:52.161844'),
(36, 'web_app', '0018_alter_proposal_jml_mhs', '2022-11-30 07:28:37.517201'),
(37, 'web_app', '0019_alter_proposal_jml_mhs', '2022-11-30 07:30:22.581557'),
(38, 'web_app', '0020_alter_proposal_jml_mhs', '2022-11-30 07:35:14.446477'),
(39, 'web_app', '0021_alter_proposal_penelitian_sebelumnya', '2022-11-30 09:56:58.870577'),
(40, 'web_app', '0022_alter_proposal_user', '2022-11-30 10:04:04.449196'),
(41, 'web_app', '0023_file', '2022-11-30 12:51:47.358194'),
(42, 'web_app', '0024_alter_file_jurnal_alter_file_lembar_ta_and_more', '2022-12-02 10:40:58.352744'),
(43, 'web_app', '0025_proposal_order', '2022-12-04 05:49:04.342649'),
(44, 'web_app', '0026_alter_proposal_order_proposal_and_more', '2022-12-04 08:21:07.026372'),
(45, 'web_app', '0027_alter_proposal_order_status_nilai', '2022-12-04 08:54:19.934317'),
(46, 'web_app', '0028_user_kelas_nilai_delete_nilai', '2022-12-05 10:13:26.945266'),
(47, 'web_app', '0029_remove_user_kelas_nilai_profil_mahasiswa_nilai', '2022-12-05 10:42:53.915238'),
(48, 'web_app', '0030_alter_proposal_order_mahasiswa', '2022-12-05 17:54:02.332358'),
(49, 'web_app', '0031_alter_file_user_alter_proposal_user_sempro', '2022-12-06 10:02:24.032992'),
(50, 'web_app', '0032_sempro_file', '2022-12-06 10:10:49.418266'),
(51, 'web_app', '0033_rename_file_sempro_proposal', '2022-12-06 10:24:25.918668'),
(52, 'web_app', '0034_alter_sempro_jam_alter_sempro_tanggal', '2022-12-06 10:27:21.799698'),
(53, 'web_app', '0035_rename_proposal_order_order_alter_sempro_jam_and_more', '2022-12-12 07:10:09.221938'),
(54, 'web_app', '0036_file_date_created_order_date_created_and_more', '2022-12-16 12:10:14.513726'),
(55, 'web_app', '0037_alter_daftarsidang_user_alter_file_user_and_more', '2022-12-17 13:25:13.258211'),
(56, 'web_app', '0038_rename_mahasiswa_order_user', '2022-12-17 14:07:23.674544'),
(57, 'web_app', '0039_angkatan_kelas_angkatan_user_kelas_angkatan', '2022-12-18 04:58:29.411535'),
(58, 'web_app', '0040_alter_user_kelas_angkatan_alter_user_kelas_kelas_and_more', '2022-12-18 05:46:18.393000'),
(59, 'web_app', '0041_remove_daftarsidang_email2', '2022-12-20 08:06:55.169190'),
(60, 'web_app', '0042_rename_judul_bahasa_daftarsidang_judul_indo_and_more', '2022-12-20 08:09:10.160801'),
(61, 'web_app', '0043_rename_waktu_daftarsidang_waktu_sidang_and_more', '2022-12-20 11:03:01.013342'),
(62, 'web_app', '0044_alter_daftarsidang_persetujuan', '2022-12-20 11:16:31.027231'),
(63, 'web_app', '0045_rename_nilai_profil_mahasiswa_nilai_proposal_and_more', '2022-12-21 05:36:04.971606'),
(64, 'web_app', '0046_alter_order_proposal_and_more', '2022-12-23 17:18:25.829681'),
(65, 'web_app', '0047_remove_order_proposal_order_proposal', '2022-12-23 17:20:00.138622'),
(66, 'web_app', '0048_remove_order_proposal_order_proposal', '2022-12-23 17:34:23.025827'),
(67, 'web_app', '0049_nilai', '2022-12-24 06:31:08.442882'),
(68, 'web_app', '0050_profil_mahasiswa_cd_1_profil_mahasiswa_cd_2_and_more', '2022-12-24 06:50:41.759883'),
(69, 'web_app', '0051_alter_profil_mahasiswa_nilai_proposal', '2022-12-24 07:42:42.154370'),
(70, 'web_app', '0052_ruangsidang_and_more', '2022-12-29 09:45:30.032917'),
(71, 'web_app', '0053_alter_profil_staff_kelompok_keahlian', '2022-12-29 10:00:13.797065'),
(72, 'web_app', '0054_rename_nik_profil_staff_nip_and_more', '2022-12-29 10:25:09.402426'),
(73, 'web_app', '0055_alter_profil_staff_nip', '2022-12-29 10:45:04.016180'),
(74, 'web_app', '0056_alter_profil_staff_nip', '2022-12-29 10:46:11.077192'),
(75, 'web_app', '0057_jadwalsidang_jadwalkelasdosen_bebanpengujian', '2023-01-04 07:51:16.446269'),
(76, 'web_app', '0058_daftarsidang_hari_sidang', '2023-01-04 08:19:07.380546'),
(77, 'web_app', '0059_remove_daftarsidang_tanggal_sidang_and_more', '2023-01-15 15:40:56.454691'),
(78, 'web_app', '0060_remove_jadwalsidang_daftar_sidang_and_more', '2023-01-15 15:40:56.460692'),
(79, 'web_app', '0061_jadwalsidang_tanggal_sidang_alter_jadwalsidang_hari_and_more', '2023-01-15 15:40:56.463834'),
(80, 'web_app', '0062_remove_jadwalsidang_peserta_and_more', '2023-01-15 15:40:56.500491'),
(81, 'web_app', '0063_remove_jadwalsidang_hari_and_more', '2023-01-15 15:40:56.523101'),
(82, 'web_app', '0064_remove_jadwalsidang_daftar_sidang_and_more', '2023-01-15 15:40:56.566539'),
(83, 'web_app', '0065_remove_jadwalsidang_peserta_and_more', '2023-01-15 15:56:41.704710'),
(84, 'web_app', '0066_delete_jadwalsidang', '2023-01-15 15:56:41.837025'),
(85, 'web_app', '0067_jadwalsidang', '2023-01-15 15:58:03.170093'),
(86, 'web_app', '0068_remove_daftarsidang_pemeriksa1_and_more', '2023-01-18 08:35:56.746053'),
(87, 'web_app', '0069_alter_proposal_jml_mhs_alter_proposal_judul_and_more', '2023-01-18 17:10:13.611704'),
(88, 'web_app', '0070_alter_order_proposal', '2023-01-21 06:03:55.975168'),
(89, 'web_app', '0052_tanggal', '2023-01-24 16:18:54.762780'),
(90, 'web_app', '0053_tanggal_jam', '2023-01-24 16:18:54.794029'),
(91, 'web_app', '0054_rename_tanggal_inputjadwalsempro', '2023-01-24 16:18:54.872158'),
(92, 'web_app', '0071_merge_20230124_2318', '2023-01-24 16:18:54.887789'),
(93, 'web_app', '0072_delete_inputjadwalsempro_alter_order_proposal_and_more', '2023-01-24 16:20:25.135435'),
(94, 'web_app', '0073_delete_bebanpengujian', '2023-01-24 16:21:48.564601'),
(95, 'web_app', '0074_remove_order_status', '2023-01-24 16:24:10.377773'),
(96, 'web_app', '0075_order_status', '2023-01-24 16:24:27.252862'),
(97, 'web_app', '0076_jadwalsemprodosen', '2023-01-24 17:41:03.871360'),
(98, 'web_app', '0077_rename_dosen_jadwalsemprodosen_user', '2023-01-24 18:35:35.372741'),
(99, 'web_app', '0078_jamsemprodosen', '2023-01-24 18:59:39.858739'),
(100, 'web_app', '0079_cd3_cd2_cd1', '2023-01-25 13:15:29.752907'),
(101, 'web_app', '0080_rename_cd1_cd2_cd2_rename_cd1_cd3_cd3', '2023-01-25 13:21:59.743806'),
(102, 'web_app', '0081_cd1_berkas_cd2_berkas_cd3_berkas', '2023-01-25 13:56:30.700556'),
(103, 'web_app', '0082_remove_cd1_cd1_remove_cd2_cd2_remove_cd3_cd3', '2023-01-25 13:57:34.169040'),
(104, 'web_app', '0083_profil_mahasiswa_buku_ta_and_more', '2023-01-25 14:50:25.763898'),
(105, 'web_app', '0084_alter_profil_mahasiswa_nilai_ta', '2023-01-25 15:00:07.742818'),
(106, 'web_app', '0085_profil_mahasiswa_batas_revisi_and_more', '2023-01-25 15:09:45.168272'),
(107, 'web_app', '0086_alter_profil_mahasiswa_revisi', '2023-01-25 15:29:27.285085'),
(108, 'web_app', '0087_alter_profil_mahasiswa_revisi', '2023-01-25 15:32:22.019966'),
(109, 'web_app', '0088_daftarsidang_status', '2023-01-25 16:08:36.689088'),
(110, 'web_app', '0089_remove_sempro_proposal_sempro_cd1_sempro_cd2_and_more', '2023-01-30 16:37:14.388257'),
(111, 'web_app', '0090_daftarsidang_date_created_jadwalsidang_date_created', '2023-01-31 15:36:12.543102'),
(112, 'web_app', '0091_profil_mahasiswa_hari_ini_profil_mahasiswa_judul_ta', '2023-02-06 18:04:36.565539'),
(113, 'web_app', '0092_remove_cd2_user_remove_cd3_user_delete_cd1_and_more', '2023-02-14 21:16:14.107119'),
(114, 'web_app', '0093_jadwalsemprodosen_jam_mulai_and_more', '2023-02-15 11:16:11.994010'),
(115, 'web_app', '0094_remove_jadwalsemprodosen_jam_mulai_and_more', '2023-02-15 14:30:58.418791');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0n29ses4pimyrcn88mkxywrsjk93lqvl', '.eJxVjDsOwjAQBe_iGllef9YbSvqcwVpnDQ6gRIqTCnF3iJQC2jcz76USb2tNWytLGkWdVTDq9DtmHh5l2oncebrNepindRmz3hV90Kb7Wcrzcrh_B5Vb_dbZh07EsiAxdhiBojjrYbDZhYgeyHAmB0hExsfADi1AxqsxxTCDen8A3vA2pw:1pSb2z:rQ8UnN6sMUs6EDEomBFUC-hvC5hmyHZ5XMJ46RuBOzw', '2023-03-02 09:59:25.225581'),
('2b9yqckj2z77h5vur1rwverzjj98cfcq', 'e30:1owjzd:wjM8FCGdTsRLZoOeEgUQU-Wo8UntApYqaHbbhOyOAJc', '2022-12-04 13:04:17.650972'),
('bqyr83hby37ylqxqg0mc3y2atkkvp2ss', 'e30:1owk26:BT-LHqLiLXSxry97FL58GNjpBqjPfAXcy3fduG0_5jM', '2022-12-04 13:06:50.486455'),
('ddc6pjwd7tskjw1v8xgkvis8wifu80jk', '.eJxVjDsOwjAQBe_iGln-O05JzxmsXXshBuKg2KkQd0eRUkD7Zt68WYStT3FrtMaS2cgkO_1uCOlBdQf5DvW28LTUvhbku8IP2vhlyfQ8H-5fYII27W-ttEuekAwSYDIWkrwSDYNJTkghQHgyMqBzKVjUaAafQSNZnYRUao82aq0sNZZaeuxlptZhfkU2SueC8l5Yx4Ow3irz-QKYhkam:1oy7DU:PNpNRmHy57-vnJAQFurpzsfC-8kh3UuzD2NvHCMBpOk', '2022-11-24 08:04:41.961765'),
('del9704fo8zedy2gihpevrlsonfn5t0n', '.eJxVjDsOwyAQRO9CHSHAeAGX6XMGtNhLTD4QGVxFuXtsyY2nfPNmvsxXqjWV7FNOzbf0ptrw_fFskABOGTBKcLBS9727MI9rm_1aafFpYgOTHTvBgOOT8t5MD8z3wseS25IC3xV-tJXfykSv6-GeDmas87ZWQQESOon9FnREkXQXXSej0gZFkNoQuRDIRmPjhkHHCSCQICuiYb8_WBFHOw:1oy784:PaA8fk85X15WiftodxMBoOP_fjV1NaR-iHqAfRCU66o', '2022-11-24 07:59:05.697451'),
('f58ejuvjk8qtgdysq2vxe1zbnbmyi1ko', '.eJxVjDsOwjAQBe_iGln-26Gk5wzW7nrBAeRIcVIh7o4spYD2zcx7iwz7VvPeec1zEWehxel3Q6AntwHKA9p9kbS0bZ1RDkUetMvrUvh1Ody_gwq9jtoaGygyskMGJOeB9I05JUdBaaVARXZ6whBo8mjRpVjAIntLShsjPl8FZThF:1pApdL:7whXY8YYjSXNE7iIIKv7ix4180aOAZxKVvNVZlfxEFs', '2023-01-12 09:55:31.562136'),
('fa8iznolb9ltopm7csx62ie1kwicy2er', 'e30:1otp6i:DOF9tAvy5R7wRxwf010YekjH1yvX3KAgAAM2FG7SV0s', '2022-11-26 11:55:32.033758'),
('h5kbttsx5u30hkqbwwbfurrbk7rh36vk', 'e30:1owjwy:0wqAANJNc6j1-eZ1tycTBjsyzukbd7Bgg9j1H7oK3WM', '2022-12-04 13:01:32.943050'),
('hd03q7n7j3i3qz3op26umgltyuqv48hx', '.eJxVjMEOgyAQRP-Fc0PA4i7rsfd-A1kVKm2FRvDU9N-riRePM-_NfIUrvpSYk4spVlfj7Evl-eNEpwGoQWgsSgMakeAiHK91cmvxi4uj6EQrTl3Pw8unHYxPTo8sh5zqEnu5K_KgRd7z6N-3wz0dTFymfR1UsGCuhAqVBt0ykbLtoJVi8r4ZDYUtkg3Bm4bRbAaCIrItB2QQvz_wFUV1:1oy715:XIjMnGT8Yy_Ce139boOYmUw170zPBZ0Mi8-MkIpR29M', '2022-11-24 07:51:52.469838'),
('hznu7ppnqqhzzhqrcuxty64qq7aypa6x', 'e30:1owk49:E1JNLJe0R7kWAo5CoHH4pjPUS2oFVkdtYepgWBNSoqA', '2022-12-04 13:08:57.151610'),
('ibx1e34eeu60jgt509wi124n6cxizsrh', '.eJxVjEEOwiAQRe_C2pABoUNduvcMZBhAqgaS0q6Md7dNutDte-__t_C0LsWvPc1-iuIiHIrTLwzEz1R3Ex9U701yq8s8Bbkn8rBd3lpMr-vR_h0U6mVbM4BRhODAhJiDQjOSA-2UxZxjHjQmYzMbOwRgZROOmlJkArZntQHx-QL_Szf6:1pShaK:sC0eMB9pXsV7rV001MUMfUyekzIQAZCxosAWOrFbo7c', '2023-03-02 16:58:16.882357'),
('lnpekorz7zjr6uy877d4lho4v869kt3t', 'e30:1owjwQ:ixeGF5Mm9oP3q14beLxDJw57SAG2pHSeiYu9ub1SQWA', '2022-12-04 13:00:58.538582'),
('lr7pb1k7xx1zftwou7bd6kca7lxioszk', 'e30:1oweAv:TJr6leMdMdJgbm0rcn-BIWnAqLkLQW15RJWs23FRtEI', '2022-12-04 06:51:33.504639'),
('njv3qnxkfpfxmvxow27w3v478w17sm3r', '.eJxVjDsOwjAQBe_iGln-ZWOnpOcM1q6zEANxUOxUiLujSGnSvpl5XxEr15qXEnPJLbY8c204f6IYNEAwPXgIErQLwdqLiLi1KW6V15hHMQgtThthenHZwfjE8lhkWkpbM8ldkQet8raM_L4e7ulgwjrttTUWUs_EjhgpuQ6TvjN77xIorRSqnp0OBJBCR5ac70e0xJ1NShsjfn83LEa0:1oy7AT:_dDx2Vo6PlZbtou0cdrcD0Xq5Rwl9OkofLYA-cAsT1o', '2022-11-24 08:01:34.863021'),
('o5tkf5l84nsnqwwbmg98i6qwk2r70d70', '.eJxVjDkOwyAURO9CHSHAbN9l-pwBfRuIyQKRwVWUu8dILpJyZt68N3G4tcVtNawueTISRU6_3YTzPeQ--Bvma6FzyW1NE-0IPdZKL8WHx_lg_wQL1qW_I4tWywEMM4xrrhCAWTVzxhBCEF5C3CPYGIMUaOROGM0ArMJoUHdpDbWmkl3KqbmWnqE2fL4cGbnWIIzmVlEFYmDD5wvUF0Uw:1oy6zR:i6G67kKvXmz6IfaciTIl9XmKCVlTpsGrxKq7szjimHM', '2022-11-24 07:50:10.592303'),
('o9xmhqy2707675cbk4366h6nevgmmo37', 'e30:1pHj8E:h2yN8ISf4ilQAZlcmnCXVKX8tH_aS1G8q6ZPjDBzNJA', '2023-01-31 10:23:54.393893'),
('po7yri525af3dpd16gyowb3las5b96x0', '.eJxVjDsOwjAQRO_iGlnr4N9S0nMGa2N7cQA5UpxUiLsTSymgnHlv5i0CbWsJW8tLmJK4CCNOv91I8ZlrB-lB9T7LONd1mUbZFXnQJm9zyq_r4f4dFGqlrxnYW31GBw6UVYYQwZuoAAhzHpJG3iN65qwHcno3nAVEb4gdWfH5Ar83Nwc:1pHj7X:RQtBLnV1Y3hi3QkAnOuB2oJchU8ryPn3K42AnHxlTV0', '2023-01-31 10:23:11.178691'),
('pvi3wpmwpal5zvuwnpe5362cy8t4wl40', '.eJxVjDsOwjAQBe_iGln-26Gk5wzW7nrBAeRIcVIh7o4spYD2zcx7iwz7VvPeec1zEWehxel3Q6AntwHKA9p9kbS0bZ1RDkUetMvrUvh1Ody_gwq9jtoaGygyskMGJOeB9I05JUdBaaVARXZ6whBo8mjRpVjAIntLShsjPl8FZThF:1ozSEL:Jkb8TAHt1HgW3KKqkWoIHYlOLkD8o-49DXOqVjM2mzs', '2022-12-12 00:42:41.841380'),
('quhbjplodllpjwupzgdvrddpoc3xee4n', 'e30:1owebF:cUo43bgIjkaMEm0xCGBe1FlRlIKBDbyGGjQM1LITVfE', '2022-12-04 07:18:45.652699'),
('qw5rwgf610d6n56dgdpcyl9rcgpqcwl0', 'e30:1pA69C:KFY-b9mgwcoC1T0BfGXr9Uy7Qb6xafZXlOx-MqiY1tg', '2023-01-10 09:21:22.052503'),
('qxcpydb1g7bfnlyi3jd33p39yt6r0az2', 'e30:1owk0Q:A-cMYp_JKk5QOkQQ29EhJ-rxJIWxdHJEXFUEV8xXc8Q', '2022-12-04 13:05:06.389534'),
('rsuas3krgnu56zyrcdvq7u30iedbdb3c', 'e30:1owea5:WNwClJROcaoKTKFKStpcly1GHAoehjxPLl_rC_wNXhg', '2022-12-04 07:17:33.182443'),
('wx3wbhpmlkbmnfxko3c6jqbjx7h9tjx7', 'e30:1owjvQ:88x0sRNG1hb_FnVIR8M76k0Ic3-yPyfJzIl9i6x_NmQ', '2022-12-04 12:59:56.870373'),
('x9ybpatwqivqtdbli0hwm3y07p8rigrv', '.eJxVjDkOwyAURO9CHSF2-C7T5wzo20BMFogMrqLcPbbkxuXMezNf4ltsLdfic8nd9_yOreP748nAjQFhjRSaKie1lHAhHtc--7XFxedABqLJqRtxesayg_DAcq90qqUveaS7Qg_a6K2G-Loe7ulgxjbv68SSM0qCZZZxwzUCMKcnzhhCjCIoSFsEl1JUAq3aDGsYgNOYLBry-wPnx0Vp:1oy71h:oHepD6VvQHk3h2Ch23x5xwhbvyQc44l-9S-RZmo60EQ', '2022-11-24 07:52:30.491471');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_angkatan`
--

CREATE TABLE `web_app_angkatan` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_angkatan`
--

INSERT INTO `web_app_angkatan` (`id`, `nama`) VALUES
(1, '2016'),
(2, '2017'),
(3, '2018'),
(4, '2019');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_daftarsidang`
--

CREATE TABLE `web_app_daftarsidang` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `nim` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL,
  `pbb1` varchar(100) DEFAULT NULL,
  `pbb2` varchar(100) DEFAULT NULL,
  `waktu_sidang` varchar(100) DEFAULT NULL,
  `tak` int(11) DEFAULT NULL,
  `eprt` int(11) DEFAULT NULL,
  `judul_indo` varchar(400) DEFAULT NULL,
  `judul_inggris` varchar(400) DEFAULT NULL,
  `whatsapp` bigint(20) DEFAULT NULL,
  `persetujuan` varchar(50) DEFAULT NULL,
  `berkas` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kelompok_keahlian` varchar(100) DEFAULT NULL,
  `hari_sidang` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_daftarsidang`
--

INSERT INTO `web_app_daftarsidang` (`id`, `nama`, `nim`, `email`, `kelas`, `prodi`, `pbb1`, `pbb2`, `waktu_sidang`, `tak`, `eprt`, `judul_indo`, `judul_inggris`, `whatsapp`, `persetujuan`, `berkas`, `user_id`, `kelompok_keahlian`, `hari_sidang`, `status`, `date_created`) VALUES
(15, 'TM. ALVIAN SYAFRIL', 1103150080, 'abc@gmail.com', 'TK-42-01', 'S1 Teknik Komputer', 'UAA', 'WAL', '10:30 - 12.30', 60, 500, 'DASHBOARD PEMANTAUAN HUJAN DAN PERINGATAN POTENSI BANJIR BERBASIS', 'RAIN MONITORING DASHBOARD AND BASED POTENTIAL FLOOD WARNING', 0, 'YA', 'pdf/sidang/filedummy.pdf', 83, 'SEA', 'Senin', 0, '2023-02-04 16:40:06.434279'),
(16, 'NUGROHO BAGUS DARMAWAN', 1103184142, 'abc@gmail.com', 'TK-42-04', 'S1 Teknik Komputer', 'BIR', 'CSI', '10:30 - 12.30', 60, 500, 'PENGENALAN EKSPRESI MAKRO DAN MIKRO DENGAN RECURRENT NEURAL', 'INTRODUCTION TO MACRO EXPRESSION AND MICRO WITH RECURRENT NEURAL', 0, 'YA', 'pdf/sidang/filedummy_HthYRHu.pdf', 84, 'I-Smile', 'Senin', 0, '2023-02-04 16:43:01.460228'),
(17, 'ISNI DWITINIARDI', 1103180183, 'abc@gmail.com', 'TK-42-02', 'S1 Teknik Komputer', 'MKT', 'IHA', '10:30 - 12.30', 60, 500, 'PEMANFAATAN INFORMASI IKLIM SEBAGAI PREDIKSI KASUS DEMAM BERDARAH DENGUE DI KOTA BANDUNG', 'USE OF CLIMATE INFORMATION AS A PREDICTION OF FEVER CASE DENGUE BLOOD IN THE CITY OF BANDUNG', 0, 'YA', 'pdf/sidang/filedummy_CPzUxXK.pdf', 85, 'I-Smile', 'Senin', 0, '2023-02-04 16:46:47.657379'),
(18, 'AGUNG RYANTO', 1103150057, 'abc@gmail.com', 'TK-42-01', 'S1 Teknik Komputer', 'UAA', 'WAL', '12:30 - 14.30', 60, 500, 'USER INTERFACE DAN KONFIGURASI UNTUK MESIN PENGEKTRAKSI MAGNETIK RNA VIRUS COVID-19 MENGGUNAKAN', 'USER INTERFACE AND CONFIGURATION FOR COVID-19 VIRUS MAGNETIC EXTRACTOR MACHINE USING', 0, 'YA', 'pdf/sidang/filedummy_YcPbr82.pdf', 86, 'SEA', 'Senin', 0, '2023-02-04 16:49:31.249100'),
(19, 'FAHMI KEMAL FASHA', 1103184042, 'abc@gmail.com', 'TK-42-03', 'S1 Teknik Komputer', 'YDP', 'FRW', '08:30 - 10.30', 60, 500, 'ANALISIS FORENSIC BUKTI DIGITAL TELEGRAM DALAM PERANGKAT ANDROID BERDASARKAN STANDART NIST', 'FORENSIC ANALYSIS OF DIGITAL EVIDENCE TELEGRAM IN DEVICE ANDROID BASED ON NIST STANDARDS', 0, 'YA', 'pdf/sidang/filedummy_znHiaoJ.pdf', 87, 'Seculab', 'Selasa', 0, '2023-02-04 16:52:55.475078'),
(20, 'MUHAMMAD RIVAN AULYA', 1103180034, 'abc@gmail.com', 'TK-42-04', 'S1 Teknik Komputer', 'YDP', 'FRW', '10:30 - 12.30', 60, 500, 'PERANCANGAN DAN IMPLEMENTASI TRACKER LIVE LOCATION PADA DEVICE', 'DESIGN AND IMPLEMENTATION TRACKER LIVE LOCATION ON DEVICE', 0, 'YA', 'pdf/sidang/filedummy_IHRCSOE.pdf', 88, 'Seculab', 'Selasa', 0, '2023-02-04 16:55:59.829501'),
(21, 'ABHISTA RIZKY PRATAMA', 1103184108, 'abc@gmail.com', 'TK-42-01', 'S1 Teknik Komputer', 'YDP', 'FRW', '10:30 - 12.30', 60, 500, 'PERANCANGAN BACKEND PADA APLIKASI PENCATATAN DAN TRACKING DOKUMEN', 'BACKEND DESIGN IN DOCUMENT RECORDING AND TRACKING APPLICATIONS', 0, 'YA', 'pdf/sidang/filedummy_IUsy16P.pdf', 89, 'SEA', 'Selasa', 0, '2023-02-04 17:00:55.151067'),
(22, 'BAYU KURNIA PRATAMA', 1103183178, 'abc@gmail.com', 'TK-42-04', 'S1 Teknik Komputer', 'YDP', 'FRW', '12:30 - 14.30', 60, 500, 'APLIKASI ANALISIS FORENSIK DARI MEMORI VOLATILE', 'FORENSIC ANALYSIS APPLICATION FROM VOLATILE MEMORY', 0, 'YA', 'pdf/sidang/filedummy_ScdpA2W.pdf', 90, 'Seculab', 'Selasa', 0, '2023-02-04 17:02:53.110815'),
(23, 'M.HAMZAH. MA\'RUFI PANE', 1103184128, 'abc@gmail.com', 'TK-42-02', 'S1 Teknik Komputer', 'YDP', 'FRW', '12:30 - 14.30', 60, 500, 'PERANCANGAN DAN IMPLEMENTASI DESAIN USER INTERFACE DAN USER EXPERIENCE PADA APLIKASI CELOE', 'DESIGN AND IMPLEMENTATION USER AND USER INTERFACE DESIGN EXPERIENCE ON THE CELOE APPLICATION', 0, 'YA', 'pdf/sidang/filedummy_ntIs7Ot.pdf', 91, 'SEA', 'Selasa', 0, '2023-02-04 17:05:05.899059'),
(24, 'FATHONI WASESO JATI', 1103180147, 'abc@gmail.com', 'TK-42-02', 'S1 Teknik Komputer', 'BIR', 'FCB', '08:30 - 10.30', 60, 500, 'SISTEM PREDIKSI PADA PEMAKAIAN ENERGI LISTRIK MENGGUNAKAN', 'PREDICTION SYSTEM ON USE ELECTRICAL ENERGY USING', 0, 'YA', 'pdf/sidang/filedummy_4inIdXG.pdf', 92, 'I-Smile', 'Rabu', 0, '2023-02-04 17:07:22.086778'),
(25, 'DANIEL R SILALAHI', 1103183232, 'abc@gmail.com', 'TK-42-05', 'S1 Teknik Komputer', 'AGV', 'RES', '10:30 - 12.30', 60, 500, 'ANALISIS PERFORMA SISTEM RADIO DALAM LAYANAN KOMUNIKASI SEKITAR', 'RADIO SYSTEM PERFORMANCE ANALYSIS IN SURROUNDING COMMUNICATION SERVICES', 0, 'YA', 'pdf/sidang/filedummy_AJmUE7C.pdf', 93, 'Rnest', 'Rabu', 0, '2023-02-04 17:13:18.719701'),
(26, 'DEVID ALFIAN', 1103184082, 'abc@gmail.com', 'TK-42-02', 'S1 Teknik Komputer', 'BIR', 'FCB', '10:30 - 12.30', 60, 500, 'PERANCANGAN APLIKASI WEBSITE BERBASIS IOT UNTUK PEMANTAUAN DAN KONTROL PADA PLTA DI DESA', 'DESIGN OF IOT-BASED WEBSITE APPLICATIONS FOR MONITORING AND CONTROL OF PLTA IN VILLAGES', 0, 'YA', 'pdf/sidang/filedummy_DbhgM95.pdf', 94, 'Evconn', 'Rabu', 0, '2023-02-04 17:15:44.049651'),
(27, 'TEJA KUSUMA', 1103184200, 'abc@gmail.com', 'TK-42-04', 'S1 Teknik Komputer', 'AGV', 'ANG', '12:30 - 14.30', 60, 500, 'SISTEM PENYORTIRAN BARANG OTOMATIS PADA BELT CONVEYOR BERDASARKAN WARNA BENDA', 'GOODS SORTING SYSTEM AUTOMATIC ON CONVEYOR BELT BASED ON OBJECT COLOR', 0, 'YA', 'pdf/sidang/filedummy_oeyyjAq.pdf', 95, 'Rnest', 'Rabu', 0, '2023-02-04 17:18:05.406853'),
(28, 'ALFIAN FAKHREZI', 1103184132, 'abc@gmail.com', 'TK-42-03', 'S1 Teknik Komputer', 'RES', 'FCB', '14:30 - 16.30', 60, 500, 'RANCANG BANGUN SISTEM MONITORING UNSUR HARA, KELEMBABAN, PH TANAH DAN SUHU', 'SYSTEM DESIGN MONITORING OF ELEMENTS, HUMIDITY, SOIL PH AND TEMPERATURE', 0, 'YA', 'pdf/sidang/filedummy_GtQRZ7j.pdf', 96, 'Rnest', 'Rabu', 0, '2023-02-04 17:20:18.046052'),
(29, 'M. GHALIB RISWANDI', 1103184126, 'abc@gmail.com', 'TK-42-05', 'S1 Teknik Komputer', 'AGL', 'MPY', '14:30 - 16.30', 60, 500, 'K-MEANS CLUSTERING DALAM PROSES PENGENALAN DAUN UNTUK MENGIDENTIFIKASI TANAMAN HERBAL', 'K-MEANS CLUSTERING IN PROCESS INTRODUCTION TO LEAVES IDENTIFY HERBAL PLANT', 0, 'YA', 'pdf/sidang/filedummy_ArP7w4X.pdf', 97, 'I-Smile', 'Rabu', 0, '2023-02-04 17:27:36.620453'),
(30, 'DEWI SWARNI BR GINTING', 1103183135, 'abc@gmail.com', 'TK-42-06', 'S1 Teknik Komputer', 'TWP', 'RES', '08:30 - 10.30', 60, 500, 'DETEKSI INFLUENZA BERDASARKAN HEART RATE, STEPS DAN RESTING HEART RATE MENGGUNAKAN ALGORITMA', 'INFLUENZA DETECTION BASED HEART RATE, STEPS AND RESTING HEART RATE USING ALGORITHM', 0, 'YA', 'pdf/sidang/filedummy_dsjcfIz.pdf', 98, 'I-Smile', 'Kamis', 0, '2023-02-04 17:43:03.687465'),
(31, 'FADEL ANFASHA PUTRA', 1103180177, 'abc@gmail.com', 'TK-42-06', 'S1 Teknik Komputer', 'BIR', 'IHA', '08:30 - 10.30', 60, 500, 'PENGENALAN EKSPRESI WAJAH MENGGUNAKAN ALGORITMA CONVOLUTIONAL NEURAL NETWORK', 'RECOGNITION OF FACIAL EXPRESSIONS USING ALGORITHMS CONVOLUTIONAL NEURAL NETWORK', 0, 'YA', 'pdf/sidang/filedummy_242Wkqw.pdf', 99, 'I-Smile', 'Kamis', 0, '2023-02-04 17:45:40.980393'),
(32, 'RIDHO ADHA HARDIYANTO', 1103184116, 'abc@gmail.com', 'TK-42-04', 'S1 Teknik Komputer', 'CSI', 'TWP', '08:30 - 10.30', 60, 500, 'SISTEM DETEKSI JATUH UNTUK LANSIA MENGGUNAKAN OPENPOSE DAN CONVOLUTIONAL NEURAL NETWORK', 'FALL DETECTION SYSTEM FOR THE ELDERLY USING OPENPOSE AND CONVOLUTIONAL NEURAL NETWORK', 0, 'YA', 'pdf/sidang/filedummy_QkjWEOn.pdf', 100, 'I-Smile', 'Kamis', 0, '2023-02-04 17:47:45.885510'),
(33, 'DIAH AISYAH', 1103184023, 'abc@gmail.com', 'TK-42-06', 'S1 Teknik Komputer', 'TWP', 'MKT', '10:30 - 12.30', 60, 500, 'PREDIKSI INFEKSI PENYAKIT TUBERKULOSIS MENGGUNAKAN ALGORITMA LONG SHORT TERM', 'PREDICTION OF DISEASE INFECTION TUBERCULOSIS USES LONG SHORT TERM ALGORITHM', 0, 'YA', 'pdf/sidang/filedummy_kc328WG.pdf', 101, 'I-Smile', 'Kamis', 0, '2023-02-04 17:49:43.147942'),
(34, 'RIZKI FAUZI ANDARU', 1103174135, 'abc@gmail.com', 'TK-41-05', 'S1 Teknik Komputer', 'AGL', 'RES', '10:30 - 12.30', 60, 500, 'KLASIFIKASI EMOSI KOMPLEKS YANG NEGATIF PADA ANAK MENGGUNAKAN', 'A CLASSIFICATION OF COMPLEX EMOTIONS NEGATIVE IN CHILD USE', 0, 'YA', 'pdf/sidang/filedummy_ZTzpIPq.pdf', 102, 'I-Smile', 'Kamis', 0, '2023-02-04 17:51:49.779572'),
(35, 'RADITYA BAYU ANANDA', 1103170111, 'abc@gmail.com', 'TK-42-01', 'S1 Teknik Komputer', 'RLC', 'NGE', '10:30 - 12.30', 60, 500, 'DETEKSI INFLUENZA BERDASARKAN HEART RATE, FOOTSTEPS DAN RESTING HEART RATE MENGGUNAKAN NEURAL', 'INFLUENZA DETECTION BASED HEART RATE, FOOTSTEP AND RESTING HEART RATE USING NEURAL', 0, 'YA', 'pdf/sidang/filedummy_nfXXQSv.pdf', 103, 'I-Smile', 'Kamis', 0, '2023-02-04 17:57:40.455904'),
(36, 'RAFI FAKHRI HIDAYAT', 1103184170, 'abc@gmail.com', 'TK-42-06', 'S1 Teknik Komputer', 'BIR', 'MNR', '12:30 - 14.30', 60, 500, 'IMPLEMENTASI KLASIFIKASI GAMBAR UNTUK INDUSTRI PAKAIAN MENGGUNAKAN IMAGE SEARCH ENGINE', 'IMPLEMENTATION OF IMAGE CLASSIFICATION FOR CLOTHING INDUSTRY USING THE IMAGE SEARCH ENGINE', 0, 'YA', 'pdf/sidang/filedummy_2ddrrTM.pdf', 113, 'I-Smile', 'Kamis', 0, '2023-02-04 18:00:25.880702'),
(37, 'IZZAN DWI RAIHAN', 1103170219, 'abc@gmail.com', 'TK-42-03', 'S1 Teknik Komputer', 'YDP', 'FRW', '12:30 - 14.30', 60, 500, 'SISTEM MONITORING BARANG BERBASIS WEBSITE MENGGUNAKAN DATABASE MYSQL', 'BASED GOODS MONITORING SYSTEM WEBSITE USES DATABASE MYSQL', 0, 'YA', 'pdf/sidang/filedummy_NP4ZmEk.pdf', 105, 'SEA', 'Kamis', 0, '2023-02-04 18:02:33.057518'),
(38, 'MUHAMMAD REYHAN ISLAMEY', 1103170062, 'abc@gmail.com', 'TK-42-03', 'S1 Teknik Komputer', 'RLC', 'AGL', '12:30 - 14.30', 60, 500, 'KLASIFIKASI MASUKAN TERBUKA SURVEY KEPUASAN MAHASISWA TERHADAP LAYANAN INSTITUSI DI UNIVERSITAS', 'OPEN SURVEY INPUT CLASSIFICATION STUDENT SATISFACTION WITH INSTITUTIONAL SERVICES AT UNIVERSITY', 0, 'YA', 'pdf/sidang/filedummy_Z369DVv.pdf', 106, 'SEA', 'Kamis', 0, '2023-02-04 18:04:45.281575'),
(39, 'SHINTA ROUDLOTUL HANAFIA', 1103184057, 'abc@gmail.com', 'TK-42-02', 'S1 Teknik Komputer', 'BRH', 'CSI', '14:30 - 16.30', 60, 500, 'PERANCANGAN PERANGKAT LUNAK PENGAMBIL KEPUTUSAN UNTUK JUAL BELI SAHAM DENGAN ALGORITMA', 'SOFTWARE DESIGN DECISION MAKER FOR SELLING BUY SHARE WITH ALGORITHM', 0, 'YA', 'pdf/sidang/filedummy_v6j9osK.pdf', 107, 'I-Smile', 'Kamis', 0, '2023-02-04 18:06:55.897863'),
(40, 'HENDRY SUBAGJA', 1103180103, 'abc@gmail.com', 'TK-42-03', 'S1 Teknik Komputer', 'BIR', 'IHA', '08:30 - 10.30', 60, 500, 'DETEKSI OBJEK PADA KERUMUNAN SISWA DI SEKOLAH UNTUK MENGKLASIFIKASI SOSIAL DISTANCING', 'OBJECT DETECTION IN STUDENT CROWDS TO CLASSIFICATE SOCIAL DISTANCING', 0, 'YA', 'pdf/sidang/filedummy_Fk8Rvdv.pdf', 108, 'I-Smile', 'Jumat', 0, '2023-02-04 18:08:45.652714'),
(41, 'MUHAMMAD NUR ZAINUL ZAKI', 1103160171, 'abc@gmail.com', 'TK-42-01', 'S1 Teknik Komputer', 'CSI', 'RES', '08:30 - 10.30', 60, 500, 'MONITORING STUP LEBAH MADU BERBASIS INTERNET OF THINGS', 'HONEYBEE MONITORING STUP BASED INTERNET OF THINGS', 0, 'YA', 'pdf/sidang/filedummy_Be3a2Do.pdf', 109, 'Rnest', 'Jumat', 0, '2023-02-04 18:11:08.649532'),
(42, 'MUHAMMAD FARHAN ARDHI NUGRAHA', 1103184067, 'abc@gmail.com', 'TK-41-02', 'S1 Teknik Komputer', 'CSI', 'WEJ', '08:30 - 10.30', 60, 500, 'PREDIKSI HUJAN DARI DATA SATELIT HIMAWARI-8 MENGGUNAKAN LOGISTIC REGRESSION', 'RAIN PREDICTION FROM SATELLITE DATA HIMAWARI-8 USING LOGISTICS REGRESSION', 0, 'YA', 'pdf/sidang/filedummy_hQ1pvAI.pdf', 110, 'I-Smile', 'Jumat', 0, '2023-02-04 18:12:48.375284'),
(43, 'BAYU PUTRA ANGGARA', 1103150021, 'abcd@gmail.com', 'TK-42-03', 'S1 Teknik Komputer', 'PBD', 'UAA', '12:30 - 14.30', 60, 500, 'PENGEMBANGAN PERILAKU NPC IKAN KECIL PADA GAME GO FISHING MENGGUNAKAN BROWNIAN', 'FISH NPC BEHAVIOR DEVELOPMENT LITTLE ON GO FISHING GAME USING BROWNIANS', 0, 'YA', 'pdf/sidang/filedummy_WUY057i.pdf', 111, 'I-Smile', 'Jumat', 0, '2023-02-04 18:14:52.046464'),
(44, 'MUHAMMAD FIKRU AL BAYYAN', 1103183217, 'abc@gmail.com', 'TK-42-04', 'S1 Teknik Komputer', 'RES', 'NGE', '12:30 - 14.30', 60, 500, 'SISTEM MONITORING UNTUK MENDETEKSI KETINGGIAN AIR SUNGAI', 'MONITORING SYSTEM FOR DETECT THE LEVEL OF THE RIVER WATER', 0, 'YA', 'pdf/sidang/filedummy_1AuSj2n.pdf', 112, 'Rnest', 'Jumat', 0, '2023-02-04 18:17:35.811988'),
(45, 'ADINE NAYLA', 1103184014, 'abc@gmail.com', 'TK-42-01', 'S1 Teknik Komputer', 'CSI', 'BRH', '12:30 - 14.30', 60, 500, 'DETEKSI HATE SPEECH PADA TWITTER MENGGUNAKAN ALGORITMA BERT', 'HATE SPEECH DETECTION ON TWITTER USING BERT\'S ALGORITHM', 0, 'YA', 'pdf/sidang/filedummy_WmYnKK8.pdf', 114, 'I-Smile', 'Jumat', 0, '2023-02-04 18:21:06.225000'),
(46, 'MUHAMMAD ABDUL GHOFAR', 1103180172, 'abc@gmail.com', 'TK-42-02', 'S1 Teknik Komputer', 'AGL', 'MPY', '14:30 - 16.30', 60, 500, 'ANALISIS KUALITAS DAN UKURAN TELUR MELALUI CITRA DIGITAL MENGGUNAKAN', 'ANALYSIS OF EGG QUALITY AND SIZE THROUGH DIGITAL IMAGE USING', 0, 'YA', 'pdf/sidang/filedummy_h0FhgH1.pdf', 115, 'I-Smile', 'Jumat', 0, '2023-02-04 18:23:10.703990'),
(47, 'ALVIYANDRI ADILLAH IQBAL', 1103184209, 'abc@gmail.com', 'TK-42-05', 'S1 Teknik Komputer', 'FZA', 'RER', '14:30 - 16.30', 60, 500, 'PERANCANGAN KONTROLER SISTEM OTOMASI HIDROPONIK RUMAHAN', 'SYSTEM CONTROLLER DESIGN HOME HYDROPONIC AUTOMATION', 0, 'YA', 'pdf/sidang/filedummy_MN3b1yj.pdf', 116, 'Rnest', 'Jumat', 0, '2023-02-04 18:24:51.468963'),
(48, 'YOSA AMARTYA RAHMAD', 1103184035, 'abc@gmail.com', 'TK-42-06', 'S1 Teknik Komputer', 'FZA', 'FRW', '14:30 - 16.30', 60, 500, 'IMPLEMENTASI PRIMARY KEY SEBAGAI KODE UNIK UNTUK SISTEM KODE', 'PRIMARY KEY IMPLEMENTATION AS UNIQUE CODE FOR THE CODE SYSTEM', 0, 'YA', 'pdf/sidang/filedummy_AGNLvgB.pdf', 117, 'SEA', 'Jumat', 0, '2023-02-04 18:26:34.833288');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_file`
--

CREATE TABLE `web_app_file` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `nim` int(11) DEFAULT NULL,
  `fakultas` varchar(200) DEFAULT NULL,
  `revisi` varchar(200) NOT NULL,
  `lembar_ta` varchar(200) NOT NULL,
  `jurnal` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_file`
--

INSERT INTO `web_app_file` (`id`, `nama`, `nim`, `fakultas`, `revisi`, `lembar_ta`, `jurnal`, `user_id`, `date_created`) VALUES
(10, 'TM. ALVIAN SYAFRIL', 1103150080, 'Fakultas Teknik Elektro', 'pdf/revisi/filedummy_XgY2eIv.pdf', 'pdf/lembar_ta/filedummy.pdf', 'pdf/jurnal/filedummy.pdf', 83, '2023-02-13 12:24:29.667272');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_jadwalkelasdosen`
--

CREATE TABLE `web_app_jadwalkelasdosen` (
  `id` bigint(20) NOT NULL,
  `hari` varchar(200) DEFAULT NULL,
  `waktu` varchar(200) DEFAULT NULL,
  `dosen_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_jadwalkelasdosen`
--

INSERT INTO `web_app_jadwalkelasdosen` (`id`, `hari`, `waktu`, `dosen_id`) VALUES
(1, 'Senin', '08:30 - 10.30', 3),
(2, 'Senin', '12:30 - 14.30', 3),
(3, 'Senin', '14:30 - 16.30', 3),
(4, 'Selasa', '08:30 - 10.30', 3),
(5, 'Selasa', '14:30 - 16.30', 3),
(6, 'Rabu', '08:30 - 10.30', 3),
(7, 'Kamis', '10:30 - 12.30', 3),
(8, 'Kamis', '14:30 - 16.30', 3),
(9, 'Jumat', '08:30 - 10.30', 3),
(10, 'Senin', '08:30 - 10.30', 4),
(11, 'Senin', '12:30 - 14.30', 4),
(12, 'Selasa', '08:30 - 10.30', 4),
(13, 'Selasa', '14:30 - 16.30', 4),
(14, 'Rabu', '12:30 - 14.30', 4),
(15, 'Kamis', '12:30 - 14.30', 4),
(16, 'Kamis', '14:30 - 16.30', 4),
(17, 'Jumat', '12:30 - 14.30', 4),
(18, 'Senin', '12:30 - 14.30', 5),
(19, 'Selasa', '08:30 - 10.30', 5),
(20, 'Rabu', '08:30 - 10.30', 5),
(21, 'Rabu', '10:30 - 12.30', 5),
(22, 'Kamis', '08:30 - 10.30', 5),
(23, 'Kamis', '14:30 - 16.30', 5),
(24, 'Senin', '08:30 - 10.30', 6),
(25, 'Senin', '12:30 - 14.30', 6),
(26, 'Selasa', '14:30 - 16.30', 6),
(27, 'Rabu', '14:30 - 16.30', 6),
(28, 'Kamis', '08:30 - 10.30', 6),
(29, 'Jumat', '08:30 - 10.30', 6),
(30, 'Senin', '08:30 - 10.30', 7),
(31, 'Selasa', '14:30 - 16.30', 7),
(32, 'Rabu', '12:30 - 14.30', 7),
(33, 'Kamis', '12:30 - 14.30', 7),
(34, 'Jumat', '08:30 - 10.30', 7),
(35, 'Senin', '08:30 - 10.30', 8),
(36, 'Senin', '10:30 - 12.30', 8),
(37, 'Senin', '14:30 - 16.30', 8),
(38, 'Selasa', '08:30 - 10.30', 8),
(39, 'Selasa', '12:30 - 14.30', 8),
(40, 'Rabu', '10:30 - 12.30', 8),
(41, 'Rabu', '14:30 - 16.30', 8),
(42, 'Kamis', '08:30 - 10.30', 8),
(44, 'Jumat', '14:30 - 16.30', 8),
(45, 'Senin', '14:30 - 16.30', 9),
(46, 'Selasa', '10:30 - 12.30', 9),
(47, 'Selasa', '14:30 - 16.30', 9),
(48, 'Rabu', '10:30 - 12.30', 9),
(49, 'Kamis', '08:30 - 10.30', 9),
(50, 'Senin', '12:30 - 14.30', 10),
(51, 'Senin', '14:30 - 16.30', 10),
(52, 'Selasa', '12:30 - 14.30', 10),
(53, 'Rabu', '08:30 - 10.30', 10),
(54, 'Kamis', '12:30 - 14.30', 10),
(55, 'Jumat', '08:30 - 10.30', 10),
(56, 'Senin', '14:30 - 16.30', 11),
(57, 'Selasa', '10:30 - 12.30', 11),
(58, 'Kamis', '14:30 - 16.30', 11),
(59, 'Jumat', '08:30 - 10.30', 11),
(60, 'Jumat', '14:30 - 16.30', 11),
(61, 'Senin', '10:30 - 12.30', 12),
(62, 'Selasa', '12:30 - 14.30', 12),
(63, 'Selasa', '14:30 - 16.30', 12),
(64, 'Rabu', '12:30 - 14.30', 12),
(65, 'Kamis', '08:30 - 10.30', 12),
(66, 'Selasa', '10:30 - 12.30', 13),
(67, 'Selasa', '14:30 - 16.30', 13),
(68, 'Rabu', '08:30 - 10.30', 13),
(69, 'Jumat', '08:30 - 10.30', 13),
(70, 'Senin', '08:30 - 10.30', 14),
(71, 'Senin', '10:30 - 12.30', 14),
(72, 'Selasa', '14:30 - 16.30', 14),
(73, 'Rabu', '10:30 - 12.30', 14),
(74, 'Jumat', '14:30 - 16.30', 14),
(75, 'Senin', '12:30 - 14.30', 15),
(76, 'Rabu', '08:30 - 10.30', 15),
(77, 'Rabu', '12:30 - 14.30', 15),
(78, 'Kamis', '10:30 - 12.30', 15),
(79, 'Senin', '08:30 - 10.30', 16),
(80, 'Senin', '10:30 - 12.30', 16),
(81, 'Selasa', '12:30 - 14.30', 16),
(82, 'Selasa', '14:30 - 16.30', 16),
(83, 'Jumat', '08:30 - 10.30', 16),
(84, 'Selasa', '08:30 - 10.30', 17),
(85, 'Selasa', '12:30 - 14.30', 17),
(86, 'Rabu', '14:30 - 16.30', 17),
(87, 'Jumat', '08:30 - 10.30', 17),
(88, 'Senin', '10:30 - 12.30', 18),
(89, 'Selasa', '08:30 - 10.30', 18),
(90, 'Rabu', '08:30 - 10.30', 18),
(91, 'Kamis', '14:30 - 16.30', 18),
(92, 'Jumat', '12:30 - 14.30', 18),
(93, 'Jumat', '10:30 - 12.30', 3),
(94, 'Jumat', '10:30 - 12.30', 4),
(95, 'Jumat', '10:30 - 12.30', 5),
(96, 'Jumat', '10:30 - 12.30', 6),
(97, 'Jumat', '10:30 - 12.30', 7),
(98, 'Jumat', '10:30 - 12.30', 8),
(99, 'Jumat', '10:30 - 12.30', 9),
(100, 'Jumat', '10:30 - 12.30', 10),
(101, 'Jumat', '10:30 - 12.30', 11),
(102, 'Jumat', '10:30 - 12.30', 12),
(103, 'Jumat', '10:30 - 12.30', 13),
(104, 'Jumat', '10:30 - 12.30', 14),
(105, 'Jumat', '10:30 - 12.30', 15),
(106, 'Jumat', '10:30 - 12.30', 16),
(107, 'Jumat', '10:30 - 12.30', 17),
(111, 'Senin', '08:30 - 10.30', 19),
(112, 'Senin', '14:30 - 16.30', 19),
(113, 'Selasa', '14:30 - 16.30', 19),
(114, 'Rabu', '08:30 - 10.30', 19),
(115, 'Kamis', '12:30 - 14.30', 19),
(116, 'Jumat', '10:30 - 12.30', 19),
(117, 'Senin', '14:30 - 16.30', 20),
(118, 'Selasa', '10:30 - 12.30', 20),
(119, 'Rabu', '12:30 - 14.30', 20),
(120, 'Kamis', '08:30 - 10.30', 20),
(121, 'Kamis', '10:30 - 12.30', 20),
(122, 'Jumat', '10:30 - 12.30', 20),
(123, 'Senin', '08:30 - 10.30', 21),
(124, 'Senin', '10:30 - 12.30', 21),
(125, 'Selasa', '10:30 - 12.30', 21),
(126, 'Rabu', '14:30 - 16.30', 22),
(127, 'Kamis', '12:30 - 14.30', 21),
(128, 'Jumat', '10:30 - 12.30', 21),
(129, 'Senin', '12:30 - 14.30', 22),
(130, 'Selasa', '08:30 - 10.30', 22),
(131, 'Rabu', '10:30 - 12.30', 22),
(132, 'Kamis', '12:30 - 14.30', 22),
(133, 'Jumat', '10:30 - 12.30', 22),
(134, 'Senin', '12:30 - 14.30', 23),
(135, 'Selasa', '08:30 - 10.30', 23),
(136, 'Rabu', '14:30 - 16.30', 23),
(137, 'Kamis', '12:30 - 14.30', 23),
(138, 'Jumat', '10:30 - 12.30', 23),
(139, 'Senin', '08:30 - 10.30', 24),
(140, 'Selasa', '14:30 - 16.30', 24),
(141, 'Kamis', '08:30 - 10.30', 24),
(142, 'Jumat', '08:30 - 10.30', 24),
(143, 'Jumat', '10:30 - 12.30', 24),
(144, 'Senin', '08:30 - 10.30', 25),
(145, 'Senin', '10:30 - 12.30', 25),
(146, 'Selasa', '10:30 - 12.30', 25),
(147, 'Selasa', '14:30 - 16.30', 25),
(148, 'Rabu', '12:30 - 14.30', 25),
(149, 'Kamis', '08:30 - 10.30', 25),
(150, 'Jumat', '10:30 - 12.30', 25),
(151, 'Senin', '12:30 - 14.30', 26),
(152, 'Selasa', '10:30 - 12.30', 26),
(153, 'Rabu', '08:30 - 10.30', 26),
(154, 'Kamis', '08:30 - 10.30', 26),
(155, 'Jumat', '10:30 - 12.30', 26),
(156, 'Jumat', '12:30 - 14.30', 26),
(157, 'Senin', '08:30 - 10.30', 27),
(158, 'Senin', '10:30 - 12.30', 27),
(159, 'Senin', '12:30 - 14.30', 27),
(160, 'Selasa', '10:30 - 12.30', 27),
(161, 'Rabu', '08:30 - 10.30', 27),
(162, 'Rabu', '12:30 - 14.30', 27),
(163, 'Kamis', '08:30 - 10.30', 27),
(164, 'Jumat', '10:30 - 12.30', 27),
(165, 'Jumat', '12:30 - 14.30', 27),
(166, 'Senin', '10:30 - 12.30', 28),
(167, 'Senin', '12:30 - 14.30', 28),
(168, 'Selasa', '08:30 - 10.30', 28),
(169, 'Rabu', '12:30 - 14.30', 28),
(170, 'Rabu', '14:30 - 16.30', 28),
(171, 'Kamis', '08:30 - 10.30', 28),
(172, 'Jumat', '10:30 - 12.30', 28),
(173, 'Senin', '12:30 - 14.30', 29),
(174, 'Selasa', '10:30 - 12.30', 29),
(175, 'Rabu', '14:30 - 16.30', 29),
(176, 'Kamis', '08:30 - 10.30', 29),
(177, 'Jumat', '10:30 - 12.30', 29),
(178, 'Senin', '08:30 - 10.30', 30),
(179, 'Selasa', '10:30 - 12.30', 30),
(180, 'Rabu', '14:30 - 16.30', 30),
(181, 'Jumat', '10:30 - 12.30', 30),
(182, 'Jumat', '08:30 - 10.30', 30),
(183, 'Senin', '08:30 - 10.30', 31),
(184, 'Selasa', '12:30 - 14.30', 31),
(185, 'Rabu', '08:30 - 10.30', 31),
(186, 'Kamis', '08:30 - 10.30', 31),
(187, 'Jumat', '10:30 - 12.30', 31),
(188, 'Senin', '12:30 - 14.30', 32),
(189, 'Rabu', '10:30 - 12.30', 32),
(190, 'Kamis', '12:30 - 14.30', 32),
(191, 'Jumat', '10:30 - 12.30', 32),
(192, 'Selasa', '12:30 - 14.30', 33),
(193, 'Rabu', '08:30 - 10.30', 33),
(194, 'Rabu', '10:30 - 12.30', 33),
(195, 'Kamis', '12:30 - 14.30', 33),
(196, 'Senin', '08:30 - 10.30', 34),
(197, 'Selasa', '14:30 - 16.30', 34),
(198, 'Rabu', '12:30 - 14.30', 34),
(199, 'Kamis', '14:30 - 16.30', 34),
(200, 'Jumat', '10:30 - 12.30', 34),
(201, 'Jumat', '10:30 - 12.30', 33),
(202, 'Senin', '08:30 - 10.30', 35),
(203, 'Senin', '10:30 - 12.30', 35),
(204, 'Selasa', '14:30 - 16.30', 35),
(205, 'Rabu', '10:30 - 12.30', 35),
(206, 'Kamis', '08:30 - 10.30', 35),
(207, 'Kamis', '10:30 - 12.30', 35),
(208, 'Jumat', '10:30 - 12.30', 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_jadwalsemprodosen`
--

CREATE TABLE `web_app_jadwalsemprodosen` (
  `id` bigint(20) NOT NULL,
  `tanggal` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_jadwalsemprodosen`
--

INSERT INTO `web_app_jadwalsemprodosen` (`id`, `tanggal`, `user_id`) VALUES
(25, '25/02/2023', 65),
(26, '27/02/2023', 65),
(27, '28/02/2023', 65),
(35, '20/02/2023', 42),
(38, '27/02/2023', 42),
(39, '06/03/2023', 42);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_jadwalsidang`
--

CREATE TABLE `web_app_jadwalsidang` (
  `id` bigint(20) NOT NULL,
  `daftar_sidang_id` bigint(20) DEFAULT NULL,
  `penguji1_id` bigint(20) DEFAULT NULL,
  `penguji2_id` bigint(20) DEFAULT NULL,
  `ruang_id` bigint(20) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_jamsemprodosen`
--

CREATE TABLE `web_app_jamsemprodosen` (
  `id` bigint(20) NOT NULL,
  `jam_mulai` varchar(200) DEFAULT NULL,
  `jam_selesai` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_jamsemprodosen`
--

INSERT INTO `web_app_jamsemprodosen` (`id`, `jam_mulai`, `jam_selesai`, `user_id`) VALUES
(2, '07:30', '09:30', 42);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_kelas`
--

CREATE TABLE `web_app_kelas` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `angkatan_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_kelas`
--

INSERT INTO `web_app_kelas` (`id`, `nama`, `angkatan_id`) VALUES
(1, 'TK-42-01', 3),
(2, 'TK-42-02', 3),
(3, 'TK-42-03', 3),
(5, 'TK-42-04', 3),
(6, 'TK-42-05', 3),
(7, 'TK-42-06', 3),
(8, 'TK-43-01', 4),
(9, 'TK-43-02', 4),
(10, 'TK-43-03', 4),
(11, 'TK-43-04', 4),
(12, 'TK-43-05', 4),
(13, 'TK-43-06', 4),
(14, 'TK-41-01', 2),
(15, 'TK-41-02', 2),
(16, 'TK-41-03', 2),
(17, 'TK-41-04', 2),
(18, 'TK-41-05', 2),
(19, 'TK-41-06', 2),
(20, 'TK-40-01', 1),
(21, 'TK-40-02', 1),
(22, 'TK-40-03', 1),
(23, 'TK-40-04', 1),
(24, 'TK-40-05', 1),
(25, 'TK-40-06', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_lab`
--

CREATE TABLE `web_app_lab` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_lab`
--

INSERT INTO `web_app_lab` (`id`, `nama`) VALUES
(1, 'Evconn'),
(2, 'I-Smile'),
(3, 'Magics'),
(4, 'Rnest'),
(5, 'SEA'),
(6, 'Seculab');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_order`
--

CREATE TABLE `web_app_order` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `proposal_id` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_order`
--

INSERT INTO `web_app_order` (`id`, `user_id`, `date_created`, `proposal_id`, `status`) VALUES
(32, 13, '2023-02-15 15:32:34.859425', 20, 1),
(33, 9, '2023-02-16 10:03:53.077071', 20, 1),
(34, 83, '2023-02-16 10:33:27.998223', 20, 1),
(38, 84, '2023-02-16 10:57:57.617330', 20, 0),
(39, 85, '2023-02-16 12:13:09.542847', 18, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_profil_mahasiswa`
--

CREATE TABLE `web_app_profil_mahasiswa` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `nim` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `bakat` varchar(200) DEFAULT NULL,
  `foto_profil` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nilai_proposal` decimal(5,2) DEFAULT NULL,
  `berkas_nilai` varchar(200) NOT NULL,
  `CD_1` int(11) DEFAULT NULL,
  `CD_2` int(11) DEFAULT NULL,
  `CD_3` int(11) DEFAULT NULL,
  `individual_performance` int(11) DEFAULT NULL,
  `presentation` int(11) DEFAULT NULL,
  `buku_ta` int(11) DEFAULT NULL,
  `final_report` int(11) DEFAULT NULL,
  `individual_performance_ta` int(11) DEFAULT NULL,
  `nilai_ta` decimal(5,2) DEFAULT NULL,
  `paper` int(11) DEFAULT NULL,
  `presentasi_demo` int(11) DEFAULT NULL,
  `progress_report` int(11) DEFAULT NULL,
  `sidang_ta` int(11) DEFAULT NULL,
  `batas_revisi` varchar(200) DEFAULT NULL,
  `revisi` varchar(10000) DEFAULT NULL,
  `hari_ini` varchar(200) DEFAULT NULL,
  `judul_ta` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_profil_mahasiswa`
--

INSERT INTO `web_app_profil_mahasiswa` (`id`, `nama`, `nim`, `email`, `bakat`, `foto_profil`, `date_created`, `user_id`, `nilai_proposal`, `berkas_nilai`, `CD_1`, `CD_2`, `CD_3`, `individual_performance`, `presentation`, `buku_ta`, `final_report`, `individual_performance_ta`, `nilai_ta`, `paper`, `presentasi_demo`, `progress_report`, `sidang_ta`, `batas_revisi`, `revisi`, `hari_ini`, `judul_ta`) VALUES
(3, 'Rehan Kebab', 1103184068, 'koneksi.ken111@gmail.com', 'IOT', '', '2022-12-12 08:01:39.365935', 13, '79.60', 'pdf/nilai/Proposal_Agung_Panjimasjaya.pdf', 90, 88, 82, 75, 70, 82, 83, 79, '77.45', 69, 81, 77, 71, '28/02/2023', 'Tidak ada revisi, selamat anda sudah lulus yeeeee', NULL, NULL),
(8, 'Agung Panjimasjaya', 1103184054, 'apanji133@gmail.com', 'Web Programming, Security, Python', '', '2022-12-21 05:46:20.753416', 9, '75.20', 'pdf/nilai/1103184054_Agung_Panjimasjaya_Proposal.pdf', 75, 87, 69, 77, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'John Cena', 1103184012, 'apanji@student.telkomuniversity.ac.id', 'Smackdown, Gulat', '', '2022-12-29 11:04:30.973606', 45, NULL, 'pdf/nilai/1103184054_Agung_Panjimasjaya_Proposal_MFagaMB.pdf', NULL, NULL, NULL, NULL, NULL, 75, 80, 80, '77.40', 78, 76, 85, 75, '14/02/2023', 'Perbaiki Buku TA', NULL, NULL),
(11, 'Zack', 1103184013, 'abc@gmail.com', 'Makan dan Tidur', '', '2022-12-29 11:12:18.686031', 40, NULL, 'pdf/nilai/1103184054_Agung_Panjimasjaya_Proposal_8ZRruEM.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Gihon Godwin Silitonga', 1103184067, 'abc@gmail.com', 'Makan, Game dan Tidur', '', '2022-12-29 11:20:22.203812', 8, NULL, 'pdf/nilai/1103184054_Agung_Panjimasjaya_Proposal_sw4vqse.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Christiano Ronaldo', 1103184080, 'abc@gmail.com', 'GOAT', '', '2022-12-29 11:26:10.474247', 62, NULL, 'pdf/nilai/1103184054_Agung_Panjimasjaya_Proposal_Cku8GJq.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Lionel Messi', 1103184010, 'lyunelmessit@gmail.com', 'GOAT', '', '2023-01-13 15:47:55.284639', 63, NULL, 'pdf/nilai/1103184054_Agung_Panjimasjaya_Proposal.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Naufal Ridha Bisono', 1103184111, 'naufal@gmail.com', 'Game', '', '2023-01-27 18:07:15.487071', 64, NULL, 'pdf/nilai/1103184054_TA_PA___Telkom_University.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'TM. ALVIAN SYAFRIL', 1103150080, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:21:05.199057', 83, NULL, 'pdf/nilai/filedummy.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'NUGROHO BAGUS DARMAWAN', 1103184142, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:41:30.721066', 84, NULL, 'pdf/nilai/filedummy_ByG0dXZ.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20/02/2023', 'ABC', NULL, NULL),
(18, 'ISNI DWITINIARDI', 1103180183, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:44:51.383838', 85, NULL, 'pdf/nilai/filedummy_zIw8Xo3.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'AGUNG RYANTO', 1103150057, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:48:02.841488', 86, NULL, 'pdf/nilai/filedummy_g69965W.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'FAHMI KEMAL FASHA', 1103184042, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:51:32.796878', 87, NULL, 'pdf/nilai/filedummy_0MKUBuD.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'MUHAMMAD RIVAN AULYA', 1103180034, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:54:32.102890', 88, NULL, 'pdf/nilai/filedummy_ESd3Paj.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'ABHISTA RIZKY PRATAMA', 1103184108, 'abc@gmail.com', 'ABC', '', '2023-02-04 16:58:32.435572', 89, NULL, 'pdf/nilai/filedummy_EvWD11z.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20/02/2023', 'QWERTYUIOPASDFGHJKLZXCVBNM', '07/02/2023', 'PERANCANGAN BACKEND PADA APLIKASI PENCATATAN DAN TRACKING DOKUMEN'),
(23, 'BAYU KURNIA PRATAMA', 1103183178, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:01:44.111042', 90, NULL, 'pdf/nilai/filedummy_xFxUIrK.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'M.HAMZAH. MA\'RUFI PANE', 1103184128, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:03:39.045260', 91, NULL, 'pdf/nilai/filedummy_yLbQjK9.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'FATHONI WASESO JATI', 1103180147, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:05:55.054444', 92, NULL, 'pdf/nilai/filedummy_39tTdoG.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'DANIEL R SILALAHI', 1103183232, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:11:48.196273', 93, NULL, 'pdf/nilai/filedummy_ZKoJYsE.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'DEVID ALFIAN', 1103184082, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:14:05.597600', 94, NULL, 'pdf/nilai/filedummy_THixHRs.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'TEJA KUSUMA', 1103184200, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:16:35.035555', 95, NULL, 'pdf/nilai/filedummy_6PcDdEs.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'ALFIAN FAKHREZI', 1103184132, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:18:43.303842', 96, NULL, 'pdf/nilai/filedummy_PnGdh62.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'M. GHALIB RISWANDI', 1103184126, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:21:02.815869', 97, NULL, 'pdf/nilai/filedummy_r8ON3WH.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'DEWI SWARNI BR GINTING', 1103183135, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:39:35.971014', 98, NULL, 'pdf/nilai/filedummy_j2kfkvk.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'FADEL ANFASHA PUTRA', 1103180177, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:43:48.552721', 99, NULL, 'pdf/nilai/filedummy_JhvNtW8.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'RIDHO ADHA HARDIYANTO', 1103184116, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:46:39.764242', 100, NULL, 'pdf/nilai/filedummy_JMPwmRH.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'DIAH AISYAH', 1103184023, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:48:25.973773', 101, NULL, 'pdf/nilai/filedummy_c7utB6h.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'RIZKI FAUZI ANDARU', 1103174135, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:50:43.556179', 102, NULL, 'pdf/nilai/filedummy_3L8Af21.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'RADITYA BAYU ANANDA', 1103170111, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:55:48.639309', 103, NULL, 'pdf/nilai/filedummy_sOJ8tYz.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'RAFI FAKHRI HIDAYAT', 1103184170, 'abc@gmail.com', 'ABC', '', '2023-02-04 17:59:12.359947', 113, NULL, 'pdf/nilai/filedummy_VI69puF.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'IZZAN DWI RAIHAN', 1103170219, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:01:13.031489', 105, NULL, 'pdf/nilai/filedummy_lWbrWHI.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'MUHAMMAD REYHAN ISLAMEY', 1103170062, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:03:13.185709', 106, NULL, 'pdf/nilai/filedummy_7nrS68l.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'SHINTA ROUDLOTUL HANAFIA', 1103184057, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:05:38.000313', 107, NULL, 'pdf/nilai/filedummy_YbzMHzT.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'HENDRY SUBAGJA', 1103180103, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:07:31.482827', 108, NULL, 'pdf/nilai/filedummy_VYkorvh.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'MUHAMMAD NUR ZAINUL ZAKI', 1103160171, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:09:27.956272', 109, NULL, 'pdf/nilai/filedummy_PZGxytc.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'MUHAMMAD FARHAN ARDHI NUGRAHA', 1103184067, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:11:41.746951', 110, NULL, 'pdf/nilai/filedummy_DJ5eXpN.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'BAYU PUTRA ANGGARA', 1103150021, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:13:38.196772', 111, NULL, 'pdf/nilai/filedummy_ga1wM2P.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'MUHAMMAD FIKRU AL BAYYAN', 1103183217, 'abcd@gmail.com', 'ABC', '', '2023-02-04 18:16:03.962790', 112, NULL, 'pdf/nilai/filedummy_SOPYobu.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'ADINE NAYLA', 1103184014, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:20:02.239839', 114, NULL, 'pdf/nilai/filedummy_tnmUU43.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'MUHAMMAD ABDUL GHOFAR', 1103180172, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:21:44.626591', 115, NULL, 'pdf/nilai/filedummy_cRDED7G.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'ALVIYANDRI ADILLAH IQBAL', 1103184209, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:23:52.023330', 116, NULL, 'pdf/nilai/filedummy_ppibdvi.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'YOSA AMARTYA RAHMAD', 1103184035, 'abc@gmail.com', 'ABC', '', '2023-02-04 18:25:28.548297', 117, NULL, 'pdf/nilai/filedummy_xXSIBmg.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_profil_staff`
--

CREATE TABLE `web_app_profil_staff` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `nip` varchar(200) DEFAULT NULL,
  `kode_dosen` varchar(5) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `kelompok_keahlian` varchar(200) DEFAULT NULL,
  `foto_profil` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_profil_staff`
--

INSERT INTO `web_app_profil_staff` (`id`, `nama`, `nip`, `kode_dosen`, `email`, `kelompok_keahlian`, `foto_profil`, `date_created`, `user_id`) VALUES
(3, 'Ir. AGUS VIRGONO M.T.', '93660027-1', 'AGV', 'abc@gmail.com', 'Seculab', '', '2022-12-29 10:46:28.177391', 46),
(4, 'ASHRI DINIMAHARAWATI S.Pd., M.T', '20930008-1', 'IHA', 'abc@gmail.com', 'SEA', '', '2022-12-29 10:47:07.567164', 47),
(5, 'BUDHI IRAWAN S.Si., M.T.', '08740064-1', 'BIR', 'abc@gmail.com', 'SEA', '', '2022-12-29 10:48:26.589242', 48),
(6, 'Ir. BURHANUDDIN DIRGANTORO M.T.', '93680020-1', 'BRH', 'abc@gmail.com', 'SEA', '', '2022-12-29 10:49:20.077736', 49),
(7, 'FAIRUZ AZMI ST., MT.', '15890008-1', 'FZA', 'abc@gmail.com', 'Rnest', '', '2022-12-29 10:50:14.887986', 51),
(8, 'CASI SETIANINGSIH S.T., M.T.', '19890019-1', 'CSI', 'abc@gmail.com', 'I-Smile', '', '2022-12-29 10:50:44.512843', 50),
(9, 'FAISAL CANDRASYAH HASIBUAN S.T., M.T.', '20910005-1', 'FCB', 'abc@gmail.com', 'Rnest', '', '2022-12-29 10:51:44.176991', 52),
(10, 'MUHAMMAD FARIS RURIAWAN S.T., M.T.', '20920031-1', 'FRW', 'abc', 'Seculab', '', '2022-12-29 10:52:20.970972', 55),
(11, 'MUHAMMAD NASRUN S.Si., M.T.', '10750046-1', 'MNR', 'abc@gmail.com', 'I-Smile', '', '2022-12-29 10:53:12.258722', 56),
(12, 'Dr. MARISA W. PARYASTO S.T., M.T.', '13750017-3', 'MPY', 'abc@gmail.com', 'I-Smile', '', '2022-12-29 10:54:32.839913', 54),
(13, 'Dr. META KALLISTA S.Si., M.Si.', '18890135-3', 'MKT', 'abc', 'I-Smile', '', '2022-12-29 10:55:25.716147', 53),
(14, 'RANDY ERFA SAPUTRA S.T., M.T.', '15870030-1', 'RES', 'abc@gmail.com', 'Evconn', '', '2022-12-29 10:58:26.762055', 57),
(15, 'ROSWAN LATUCONSINA S.T., M.T.', '14780013-1', 'RLC', 'abc', 'SEA', '', '2022-12-29 10:59:06.022810', 58),
(16, 'Dr. TITO WALUYO PURBOYO S. Si., S.T., M.PMat.', '14730053-1', 'TWP', 'abc@gmail.com', 'I-Smile', '', '2022-12-29 11:00:03.285970', 59),
(17, 'UMAR ALI AHMAD Ph.D.', '11850763-1', 'UAA', 'abc@gmail.com', 'SEA', '', '2022-12-29 11:00:47.140508', 60),
(18, 'Dr. YUDHA PURWANTO S.T., M.T.', '02770066-1', 'YDP', 'abc@gmail.com', 'Seculab', '', '2022-12-29 11:01:21.078192', 61),
(19, 'AGUNG NUGROHO JATI S.T., M.T.', '10880005-1', 'ANG', 'abc@gmail.com', 'Rnest', '', '2023-02-04 15:29:49.929245', 66),
(20, 'ANDREW BRIAN OSMOND S.T., M.T.', '14860078-1', 'ABO', 'abc@gmail.com', 'Magics', '', '2023-02-04 15:32:23.945825', 67),
(21, 'ANGGUNMEKA LUHUR PRASASTI S.T., M.T.', '15900014-1', 'AGL', 'abc@gmail.com', 'Magics', '', '2023-02-04 15:35:07.009205', 68),
(22, 'Dr. Eng. ASIF AWALUDIN S.T., M.Sc.', '22800003-3', 'WAL', 'abc@gmail.com', 'Evconn', '', '2023-02-04 15:38:48.246555', 69),
(23, 'ASTRI NOVIANTY S.T., M.T.', '10800053-1', 'ANY', 'abc@gmail.com', 'I-Smile', '', '2023-02-04 15:40:43.717268', 70),
(24, 'Dipl.-Ing. DICK MARYOPI Ph.D.', '19830004-3', 'DOI', 'abc@gmail.com', 'Evconn', '', '2023-02-04 15:43:21.115435', 71),
(25, 'FUSSY MENTARI DIRGANTARA S.T., M.T.', '20950005-3', 'FUY', 'abc@gmail.com', 'Magics', '', '2023-02-04 15:46:10.042240', 72),
(26, 'IZAZI MUBAROK S.ST., M.Sc.', '22850001-3', 'IZY', 'abc@gmail.com', 'Seculab', '', '2023-02-04 15:47:50.757996', 73),
(27, 'NOVERA ISTIQOMAH S.T., M.T.', '18890138-3', 'NVO', 'abc@gmail.com', 'Magics', '', '2023-02-04 15:50:36.745222', 74),
(28, 'PRAYITNO ABADI S.Si., M.Si.', '20840004-3', 'PYO', 'abc@gmail.com', 'Rnest', '', '2023-02-04 15:52:17.310324', 75),
(29, 'Dr. PURBA DARU KUSUMA S.T., M.T.', '10800047-1', 'PBD', 'abc@gmail.com', 'I-Smile', '', '2023-02-04 15:53:43.775648', 76),
(30, 'RATNA ASTUTI NUGRAHAENI S.T.,M.T', '20930005-1', 'NGE', 'abc@gmail.com', 'I-Smile', '', '2023-02-04 15:55:23.973706', 77),
(31, 'Dr. REZA RENDIAN SEPTIAWAN S.Si, M.Si, M.Sc', '20910011-3', 'RER', 'abc@gmail.com', 'I-Smile', '', '2023-02-04 15:57:26.538586', 78),
(32, 'Dr. RISMAN ADNAN MATTOTORANG S.Si., M.Si.', '21750003-3', 'TOR', 'abc@gmail.com', 'SEA', '', '2023-02-04 15:58:59.937453', 79),
(33, 'SURYA MICHRANDI NASUTION S.T., M.T.', '13860021-1', 'SMC', 'abc@gmail.com', 'Rnest', '', '2023-02-04 16:00:41.750796', 80),
(34, 'Dr. WENDI HARJUPA M. Eng', '20790002-3', 'WEJ', 'abc@gmail.com', 'Rnest', '', '2023-02-04 16:02:46.026048', 81),
(35, 'WILDAN PANJI TRESNA Ph.D.', '21850001-3', 'WPT', 'abc@gmail.com', 'Rnest', '', '2023-02-04 16:05:19.551930', 82);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_proposal`
--

CREATE TABLE `web_app_proposal` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `skill` varchar(200) DEFAULT NULL,
  `pbb1` varchar(200) DEFAULT NULL,
  `pbb2` varchar(200) DEFAULT NULL,
  `pengusul` varchar(200) DEFAULT NULL,
  `lab` varchar(200) DEFAULT NULL,
  `jml_mhs` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `penelitian_sebelumnya` varchar(200) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_proposal`
--

INSERT INTO `web_app_proposal` (`id`, `judul`, `skill`, `pbb1`, `pbb2`, `pengusul`, `lab`, `jml_mhs`, `user_id`, `penelitian_sebelumnya`, `date_created`) VALUES
(18, 'Penjadwalan Kelas Otomatis Menggunakan Algoritma Evolusi Berbasis Website', 'AI, Website', 'RES', 'CSI', 'CSI', 'I-Smile', 3, 50, 'Penjadwalan Kelas Otomatis Menggunakan Algoritma Genetika Berbasis Website', '2023-01-18 16:29:15.650135'),
(20, 'Kunci Otomatis Menggunakan Sidik Jari', 'IOT, AI', 'RLC', 'CSI', 'CSI', 'Rnest', 3, 50, 'None', '2023-01-18 17:31:22.942910');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_ruangsidang`
--

CREATE TABLE `web_app_ruangsidang` (
  `id` bigint(20) NOT NULL,
  `nama_ruang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_ruangsidang`
--

INSERT INTO `web_app_ruangsidang` (`id`, `nama_ruang`) VALUES
(1, 'N.202'),
(2, 'N.208'),
(3, 'N.208A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_sempro`
--

CREATE TABLE `web_app_sempro` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `nim` int(11) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `tanggal` varchar(200) DEFAULT NULL,
  `jam` varchar(200) DEFAULT NULL,
  `pbb1` varchar(50) DEFAULT NULL,
  `pbb2` varchar(50) DEFAULT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `cd1` varchar(200) DEFAULT NULL,
  `cd2` varchar(200) DEFAULT NULL,
  `cd3` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_sempro`
--

INSERT INTO `web_app_sempro` (`id`, `nama`, `nim`, `kelas`, `tanggal`, `jam`, `pbb1`, `pbb2`, `judul`, `user_id`, `date_created`, `cd1`, `cd2`, `cd3`) VALUES
(10, 'Rehan Kebab', 1103184068, 'TK-42-06', '27/02/2023', '07:30 - 09:30', 'RLC', 'UAA', 'Penjadwalan Otomatis Menggunakan Algoritma Genetika', 13, '2023-02-15 15:15:17.538212', 'pdf/CD1/filedummy.pdf', 'pdf/CD2/filedummy.pdf', 'pdf/CD3/filedummy.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_app_user_kelas`
--

CREATE TABLE `web_app_user_kelas` (
  `id` bigint(20) NOT NULL,
  `kelas_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `angkatan_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `web_app_user_kelas`
--

INSERT INTO `web_app_user_kelas` (`id`, `kelas_id`, `user_id`, `date_created`, `angkatan_id`) VALUES
(25, 7, 13, '2022-12-18 06:46:01.207445', 3),
(26, 7, 42, '2022-12-18 06:47:15.991728', 3),
(27, 7, 9, '2022-12-20 16:30:33.696971', 3),
(28, 7, 63, '2023-01-13 15:48:03.888864', 3),
(29, 7, 64, '2023-01-27 18:07:24.405043', 3),
(30, 13, 65, '2023-01-30 15:48:21.617231', 4),
(31, 1, 83, '2023-02-04 16:21:20.913753', 3),
(32, 5, 84, '2023-02-04 16:41:38.157933', 3),
(33, 2, 85, '2023-02-04 16:44:57.336238', 3),
(34, 1, 86, '2023-02-04 16:48:09.615160', 3),
(35, 3, 87, '2023-02-04 16:51:41.112882', 3),
(36, 5, 88, '2023-02-04 16:54:40.220298', 3),
(37, 1, 89, '2023-02-04 16:58:39.185361', 3),
(38, 5, 90, '2023-02-04 17:01:49.510391', 3),
(39, 2, 91, '2023-02-04 17:03:45.558139', 3),
(40, 2, 92, '2023-02-04 17:06:00.963039', 3),
(41, 6, 93, '2023-02-04 17:12:15.555548', 3),
(42, 2, 94, '2023-02-04 17:14:11.476183', 3),
(43, 5, 95, '2023-02-04 17:16:42.073675', 3),
(44, 3, 96, '2023-02-04 17:18:49.291432', 3),
(45, 6, 97, '2023-02-04 17:21:08.017772', 3),
(46, 7, 98, '2023-02-04 17:39:42.731598', 3),
(47, 7, 99, '2023-02-04 17:43:53.907337', 3),
(48, 5, 100, '2023-02-04 17:46:45.022899', 3),
(49, 7, 101, '2023-02-04 17:48:30.607905', 3),
(50, 18, 102, '2023-02-04 17:50:49.102571', 2),
(51, 1, 103, '2023-02-04 17:55:54.529895', 3),
(52, 7, 113, '2023-02-04 17:59:21.272115', 3),
(53, 3, 105, '2023-02-04 18:01:18.058709', 3),
(54, 3, 106, '2023-02-04 18:03:18.402914', 3),
(55, 2, 107, '2023-02-04 18:05:43.149116', 3),
(56, 3, 108, '2023-02-04 18:07:36.531945', 3),
(57, 1, 109, '2023-02-04 18:09:34.685472', 3),
(58, 15, 110, '2023-02-04 18:11:47.672389', 2),
(59, 3, 111, '2023-02-04 18:13:42.974039', 3),
(60, 5, 112, '2023-02-04 18:16:10.298377', 3),
(61, 1, 114, '2023-02-04 18:20:07.053048', 3),
(62, 2, 115, '2023-02-04 18:21:51.122206', 3),
(63, 6, 116, '2023-02-04 18:23:58.605899', 3),
(64, 7, 117, '2023-02-04 18:25:33.723502', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeks untuk tabel `web_app_angkatan`
--
ALTER TABLE `web_app_angkatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `web_app_daftarsidang`
--
ALTER TABLE `web_app_daftarsidang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_file`
--
ALTER TABLE `web_app_file`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_jadwalkelasdosen`
--
ALTER TABLE `web_app_jadwalkelasdosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_app_jadwalkelasd_dosen_id_7d00c94a_fk_web_app_p` (`dosen_id`);

--
-- Indeks untuk tabel `web_app_jadwalsemprodosen`
--
ALTER TABLE `web_app_jadwalsemprodosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_app_jadwalsemprodosen_user_id_ed49878c_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_jadwalsidang`
--
ALTER TABLE `web_app_jadwalsidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_app_jadwalsidang_daftar_sidang_id_4703a213_fk_web_app_d` (`daftar_sidang_id`),
  ADD KEY `web_app_jadwalsidang_penguji1_id_f29995dd_fk_web_app_p` (`penguji1_id`),
  ADD KEY `web_app_jadwalsidang_penguji2_id_2f22e7cf_fk_web_app_p` (`penguji2_id`),
  ADD KEY `web_app_jadwalsidang_ruang_id_591ffa1c_fk_web_app_ruangsidang_id` (`ruang_id`);

--
-- Indeks untuk tabel `web_app_jamsemprodosen`
--
ALTER TABLE `web_app_jamsemprodosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_app_jamsemprodosen_user_id_a8a903f1_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_kelas`
--
ALTER TABLE `web_app_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_app_kelas_angkatan_id_6774bfed_fk_web_app_angkatan_id` (`angkatan_id`);

--
-- Indeks untuk tabel `web_app_lab`
--
ALTER TABLE `web_app_lab`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `web_app_order`
--
ALTER TABLE `web_app_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_app_order_mahasiswa_id_49d21723_uniq` (`user_id`);

--
-- Indeks untuk tabel `web_app_profil_mahasiswa`
--
ALTER TABLE `web_app_profil_mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_profil_staff`
--
ALTER TABLE `web_app_profil_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_proposal`
--
ALTER TABLE `web_app_proposal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_app_proposal_user_id_0383c712` (`user_id`);

--
-- Indeks untuk tabel `web_app_ruangsidang`
--
ALTER TABLE `web_app_ruangsidang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `web_app_sempro`
--
ALTER TABLE `web_app_sempro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `web_app_user_kelas`
--
ALTER TABLE `web_app_user_kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_app_user_kelas_user_id_d23d0bcd_uniq` (`user_id`),
  ADD KEY `web_app_user_kelas_kelas_id_80248f97_fk_web_app_kelas_id` (`kelas_id`),
  ADD KEY `web_app_user_kelas_angkatan_id_641d32ac_fk_web_app_angkatan_id` (`angkatan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT untuk tabel `web_app_angkatan`
--
ALTER TABLE `web_app_angkatan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `web_app_daftarsidang`
--
ALTER TABLE `web_app_daftarsidang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `web_app_file`
--
ALTER TABLE `web_app_file`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `web_app_jadwalkelasdosen`
--
ALTER TABLE `web_app_jadwalkelasdosen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT untuk tabel `web_app_jadwalsemprodosen`
--
ALTER TABLE `web_app_jadwalsemprodosen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `web_app_jadwalsidang`
--
ALTER TABLE `web_app_jadwalsidang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1587;

--
-- AUTO_INCREMENT untuk tabel `web_app_jamsemprodosen`
--
ALTER TABLE `web_app_jamsemprodosen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `web_app_kelas`
--
ALTER TABLE `web_app_kelas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `web_app_lab`
--
ALTER TABLE `web_app_lab`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `web_app_order`
--
ALTER TABLE `web_app_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `web_app_profil_mahasiswa`
--
ALTER TABLE `web_app_profil_mahasiswa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `web_app_profil_staff`
--
ALTER TABLE `web_app_profil_staff`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `web_app_proposal`
--
ALTER TABLE `web_app_proposal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `web_app_ruangsidang`
--
ALTER TABLE `web_app_ruangsidang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `web_app_sempro`
--
ALTER TABLE `web_app_sempro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `web_app_user_kelas`
--
ALTER TABLE `web_app_user_kelas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_daftarsidang`
--
ALTER TABLE `web_app_daftarsidang`
  ADD CONSTRAINT `web_app_daftarsidang_user_id_a2e71d04_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_file`
--
ALTER TABLE `web_app_file`
  ADD CONSTRAINT `web_app_file_user_id_a0c09052_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_jadwalkelasdosen`
--
ALTER TABLE `web_app_jadwalkelasdosen`
  ADD CONSTRAINT `web_app_jadwalkelasd_dosen_id_7d00c94a_fk_web_app_p` FOREIGN KEY (`dosen_id`) REFERENCES `web_app_profil_staff` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_jadwalsemprodosen`
--
ALTER TABLE `web_app_jadwalsemprodosen`
  ADD CONSTRAINT `web_app_jadwalsemprodosen_user_id_ed49878c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_jadwalsidang`
--
ALTER TABLE `web_app_jadwalsidang`
  ADD CONSTRAINT `web_app_jadwalsidang_daftar_sidang_id_4703a213_fk_web_app_d` FOREIGN KEY (`daftar_sidang_id`) REFERENCES `web_app_daftarsidang` (`id`),
  ADD CONSTRAINT `web_app_jadwalsidang_penguji1_id_f29995dd_fk_web_app_p` FOREIGN KEY (`penguji1_id`) REFERENCES `web_app_profil_staff` (`id`),
  ADD CONSTRAINT `web_app_jadwalsidang_penguji2_id_2f22e7cf_fk_web_app_p` FOREIGN KEY (`penguji2_id`) REFERENCES `web_app_profil_staff` (`id`),
  ADD CONSTRAINT `web_app_jadwalsidang_ruang_id_591ffa1c_fk_web_app_ruangsidang_id` FOREIGN KEY (`ruang_id`) REFERENCES `web_app_ruangsidang` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_jamsemprodosen`
--
ALTER TABLE `web_app_jamsemprodosen`
  ADD CONSTRAINT `web_app_jamsemprodosen_user_id_a8a903f1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_kelas`
--
ALTER TABLE `web_app_kelas`
  ADD CONSTRAINT `web_app_kelas_angkatan_id_6774bfed_fk_web_app_angkatan_id` FOREIGN KEY (`angkatan_id`) REFERENCES `web_app_angkatan` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_order`
--
ALTER TABLE `web_app_order`
  ADD CONSTRAINT `web_app_order_user_id_6bd0dcad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_profil_mahasiswa`
--
ALTER TABLE `web_app_profil_mahasiswa`
  ADD CONSTRAINT `web_app_profil_mahasiswa_user_id_d1267148_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_profil_staff`
--
ALTER TABLE `web_app_profil_staff`
  ADD CONSTRAINT `web_app_profil_staff_user_id_ed39b9b2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_proposal`
--
ALTER TABLE `web_app_proposal`
  ADD CONSTRAINT `web_app_proposal_user_id_0383c712_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_sempro`
--
ALTER TABLE `web_app_sempro`
  ADD CONSTRAINT `web_app_sempro_user_id_5f164bf9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `web_app_user_kelas`
--
ALTER TABLE `web_app_user_kelas`
  ADD CONSTRAINT `web_app_user_kelas_angkatan_id_641d32ac_fk_web_app_angkatan_id` FOREIGN KEY (`angkatan_id`) REFERENCES `web_app_angkatan` (`id`),
  ADD CONSTRAINT `web_app_user_kelas_kelas_id_80248f97_fk_web_app_kelas_id` FOREIGN KEY (`kelas_id`) REFERENCES `web_app_kelas` (`id`),
  ADD CONSTRAINT `web_app_user_kelas_user_id_d23d0bcd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
