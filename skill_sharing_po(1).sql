-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 05, 2022 at 07:02 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skill_sharing_po`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `lang_count`
-- (See below for the actual view)
--
CREATE TABLE `lang_count` (
`book` varchar(50)
,`count` bigint
,`lang_image` varchar(500)
,`ref_id` int
,`skl_link` varchar(100)
,`skl_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likes_id` int NOT NULL,
  `sid_user` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `sid_opponent` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likes_id`, `sid_user`, `state`, `sid_opponent`) VALUES
(86, 137, 0, 1),
(87, 137, 1, 42),
(88, 137, 0, 43),
(90, 137, 1, 44),
(91, 137, 0, 59),
(92, 137, 1, 62),
(93, 137, 0, 76),
(94, 137, 1, 78),
(95, 137, 0, 79),
(96, 137, 1, 80),
(97, 137, 0, 81),
(98, 137, 1, 82),
(99, 137, 0, 83),
(100, 137, 1, 84),
(101, 137, 0, 85),
(102, 137, 1, 88),
(103, 137, 0, 90),
(104, 137, 1, 91),
(105, 137, 0, 93),
(106, 137, 1, 94),
(107, 180, 0, 1),
(108, 180, 1, 42),
(109, 180, 0, 43),
(110, 180, 1, 44),
(111, 180, 0, 59),
(113, 180, 1, 76),
(114, 180, 0, 78),
(115, 180, 1, 79),
(116, 180, 0, 80),
(117, 180, 1, 81),
(119, 180, 0, 82),
(120, 180, 1, 83),
(121, 180, 0, 84),
(122, 180, 1, 85),
(123, 180, 0, 88),
(124, 180, 1, 90),
(125, 180, 0, 91),
(126, 180, 1, 93),
(127, 180, 0, 94),
(128, 180, 1, 97),
(129, 180, 0, 98),
(130, 180, 1, 102),
(131, 180, 0, 103),
(133, 180, 1, 104),
(134, 180, 0, 105),
(135, 180, 1, 106),
(136, 180, 0, 107),
(137, 180, 0, 108),
(138, 180, 1, 109),
(139, 180, 0, 110),
(140, 180, 0, 111),
(141, 180, 1, 112),
(142, 180, 0, 113),
(143, 180, 1, 114),
(144, 180, 0, 115),
(145, 180, 1, 116),
(146, 180, 0, 117),
(147, 180, 1, 118),
(148, 180, 0, 120),
(149, 180, 1, 121),
(151, 183, 0, 1),
(153, 183, 0, 43),
(155, 183, 0, 59),
(157, 183, 0, 78),
(159, 183, 0, 80),
(162, 183, 0, 42),
(164, 183, 0, 76),
(166, 183, 0, 81),
(168, 183, 0, 83),
(170, 183, 0, 85),
(173, 183, 0, 90),
(175, 183, 0, 93),
(182, 183, 0, 103),
(185, 183, 0, 106),
(187, 183, 0, 108),
(224, 183, 0, 44),
(225, 183, 0, 79),
(226, 183, 0, 82),
(227, 183, 0, 84),
(228, 183, 0, 88),
(229, 183, 0, 91),
(230, 183, 0, 94),
(231, 183, 0, 97),
(232, 183, 0, 98),
(233, 183, 0, 102),
(234, 183, 0, 104),
(235, 183, 0, 105),
(236, 183, 0, 107),
(237, 183, 0, 109),
(238, 183, 0, 110),
(239, 183, 0, 111),
(240, 183, 0, 112),
(241, 183, 1, 113),
(242, 183, 1, 114),
(243, 183, 1, 115),
(244, 183, 1, 116),
(245, 183, 1, 117),
(246, 183, 1, 118),
(247, 183, 1, 120),
(248, 183, 1, 121),
(249, 183, 1, 122),
(250, 183, 1, 123),
(251, 183, 1, 124),
(253, 183, 1, 125),
(254, 183, 1, 126),
(255, 183, 1, 127),
(256, 183, 1, 128),
(257, 183, 1, 129),
(259, 183, 1, 130),
(260, 183, 1, 131),
(261, 183, 1, 132),
(262, 183, 1, 133),
(263, 183, 1, 134),
(264, 183, 1, 135),
(265, 183, 1, 136),
(266, 183, 1, 137),
(267, 183, 1, 138),
(268, 183, 1, 172),
(269, 183, 1, 180),
(270, 183, 1, 181),
(271, 183, 1, 182),
(272, 183, 1, 184),
(273, 128, 0, 1),
(275, 128, 0, 43),
(277, 128, 0, 59),
(278, 128, 0, 76),
(281, 128, 0, 80),
(284, 128, 0, 83),
(286, 128, 0, 85),
(288, 128, 0, 90),
(290, 128, 0, 93),
(292, 128, 0, 97),
(294, 128, 0, 44),
(296, 128, 0, 79),
(298, 128, 0, 82),
(300, 128, 0, 88),
(302, 128, 0, 94),
(303, 128, 0, 98),
(305, 128, 0, 103),
(307, 128, 0, 105),
(309, 128, 0, 107),
(311, 128, 0, 109),
(312, 128, 0, 110),
(313, 128, 0, 111),
(315, 128, 0, 113),
(317, 128, 0, 115),
(319, 128, 0, 117),
(321, 128, 0, 120),
(324, 128, 0, 123),
(326, 128, 0, 125),
(328, 128, 0, 127),
(330, 128, 0, 130),
(332, 128, 0, 132),
(335, 185, 1, 1),
(340, 128, 0, 91),
(342, 128, 0, 104),
(344, 128, 0, 108),
(346, 128, 0, 42),
(348, 128, 0, 81),
(350, 128, 0, 102),
(352, 128, 0, 112),
(356, 128, 0, 118),
(357, 128, 0, 121),
(358, 128, 0, 122),
(359, 128, 0, 124),
(364, 128, 0, 134),
(366, 128, 0, 136),
(367, 131, 0, 1),
(373, 131, 0, 43),
(375, 131, 0, 59),
(377, 131, 0, 78),
(379, 131, 0, 81),
(381, 131, 0, 83),
(387, 131, 1, 93),
(388, 131, 1, 94),
(389, 131, 0, 97),
(390, 131, 0, 98),
(391, 131, 0, 102),
(392, 131, 1, 103),
(393, 131, 1, 104),
(394, 131, 0, 105),
(395, 131, 0, 106),
(396, 131, 0, 107),
(397, 131, 1, 108),
(398, 131, 0, 109),
(399, 131, 0, 110),
(400, 131, 0, 111),
(401, 131, 0, 112),
(402, 131, 0, 113),
(403, 131, 1, 114),
(404, 131, 1, 115),
(405, 131, 1, 116),
(406, 131, 1, 117),
(407, 131, 1, 118),
(409, 131, 0, 120),
(410, 131, 0, 121),
(411, 131, 0, 122),
(412, 131, 0, 123),
(413, 131, 1, 124),
(414, 131, 1, 125),
(415, 131, 1, 126),
(416, 131, 1, 127),
(417, 131, 1, 128),
(418, 131, 1, 129),
(419, 131, 1, 130),
(420, 131, 1, 132),
(421, 131, 1, 133),
(422, 131, 1, 134),
(423, 187, 0, 1),
(424, 187, 1, 42),
(425, 187, 0, 43),
(426, 187, 1, 44),
(427, 187, 0, 59),
(428, 187, 1, 76),
(429, 187, 0, 78),
(430, 187, 1, 79),
(431, 187, 0, 81),
(432, 187, 1, 82),
(434, 128, 1, 78),
(435, 128, 0, 84),
(436, 128, 1, 106),
(437, 128, 0, 114),
(438, 128, 1, 116),
(439, 128, 0, 126),
(440, 128, 1, 129),
(441, 128, 0, 131),
(442, 128, 1, 133),
(443, 128, 0, 135),
(445, 131, 0, 42),
(446, 131, 0, 44),
(447, 131, 0, 76),
(448, 131, 0, 79),
(449, 131, 0, 82),
(450, 131, 0, 84),
(451, 131, 0, 85),
(452, 131, 0, 88),
(453, 131, 0, 90),
(454, 131, 0, 91),
(455, 196, 0, 1),
(456, 196, 1, 42),
(457, 196, 0, 43),
(458, 196, 1, 44),
(459, 196, 0, 59),
(460, 196, 1, 76),
(461, 196, 0, 78),
(462, 196, 1, 79),
(463, 196, 0, 81),
(464, 196, 1, 82);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('43W5NCaE9BtDr35XfsLCkz5PbvB1eUU7', 1659782506, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-08-06T10:41:31.196Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":206}}'),
('DqOf_rKDuUJ29DBI8tYKwqppgdmtweZl', 1659781502, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-08-06T10:24:38.935Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":197}}'),
('dx3ANYJbIo2A9XiMBLEPXLiC1x1H56BX', 1659783527, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-08-06T10:10:58.924Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":196}}');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `sid` int DEFAULT NULL,
  `ref_id` int DEFAULT NULL,
  `skl_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`sid`, `ref_id`, `skl_level`) VALUES
(88, 6, 'Expert'),
(88, 7, 'Intermediate'),
(91, 6, 'Expert'),
(91, 4, 'Expert'),
(91, 7, 'Intermediate'),
(91, 1, 'Intermediate'),
(91, 9, 'Beginner'),
(91, 8, 'Beginner'),
(93, 6, 'Expert'),
(93, 10, 'Expert'),
(93, 7, 'Intermediate'),
(93, 1, 'Intermediate'),
(93, 9, 'Beginner'),
(93, 8, 'Beginner'),
(104, 6, 'Expert'),
(104, 7, 'Intermediate'),
(104, 9, 'Beginner'),
(105, 7, 'Expert'),
(105, 1, 'Intermediate'),
(108, 6, 'Expert'),
(108, 10, 'Intermediate'),
(108, 8, 'Beginner'),
(109, 10, 'Intermediate'),
(110, 10, 'Intermediate'),
(111, 10, 'Intermediate'),
(112, 10, 'Intermediate'),
(113, 4, 'Beginner'),
(113, 10, 'Beginner'),
(113, 5, 'Beginner'),
(113, 1, 'Beginner'),
(113, 9, 'Beginner'),
(113, 8, 'Beginner'),
(114, 6, 'Beginner'),
(114, 4, 'Beginner'),
(114, 5, 'Beginner'),
(114, 8, 'Beginner'),
(115, 9, 'Expert'),
(115, 5, 'Intermediate'),
(115, 1, 'Beginner'),
(116, 4, 'Expert'),
(116, 7, 'Expert'),
(116, 1, 'Expert'),
(116, 10, 'Beginner'),
(116, 9, 'Beginner'),
(117, 4, 'Expert'),
(117, 6, 'Intermediate'),
(117, 9, 'Beginner'),
(118, 6, 'Expert'),
(118, 4, 'Expert'),
(118, 10, 'Expert'),
(118, 7, 'Expert'),
(118, 5, 'Expert'),
(118, 1, 'Expert'),
(118, 9, 'Expert'),
(118, 8, 'Expert'),
(120, 6, 'Expert'),
(121, 4, 'Expert'),
(121, 10, 'Intermediate'),
(121, 7, 'Beginner'),
(122, 4, 'Expert'),
(122, 10, 'Intermediate'),
(122, 7, 'Beginner'),
(123, 1, 'Expert'),
(124, 1, 'Beginner'),
(125, 1, 'Beginner'),
(126, 1, 'Beginner'),
(127, 1, 'Beginner'),
(128, 4, 'Expert'),
(129, 4, 'Beginner'),
(130, 4, 'Beginner'),
(131, 4, 'Beginner'),
(133, 1, 'Expert'),
(133, 4, 'Intermediate'),
(133, 6, 'Beginner'),
(135, 5, 'Expert'),
(135, 1, 'Expert'),
(135, 9, 'Expert'),
(135, 7, 'Intermediate'),
(135, 10, 'Beginner'),
(135, 8, 'Beginner'),
(137, 6, 'Expert'),
(137, 7, 'Intermediate'),
(137, 5, 'Intermediate'),
(137, 9, 'Beginner'),
(137, 8, 'Beginner'),
(138, 6, 'Expert'),
(138, 5, 'Intermediate'),
(138, 1, 'Intermediate'),
(138, 4, 'Beginner'),
(138, 9, 'Beginner'),
(138, 8, 'Beginner'),
(138, 6, 'Expert'),
(138, 5, 'Intermediate'),
(138, 9, 'Beginner'),
(138, 8, 'Beginner'),
(138, 6, 'Expert'),
(138, 5, 'Intermediate'),
(138, 9, 'Beginner'),
(138, 8, 'Beginner'),
(138, 6, 'Expert'),
(138, 5, 'Intermediate'),
(138, 9, 'Beginner'),
(138, 8, 'Beginner'),
(163, 6, 'Expert'),
(163, 10, 'Expert'),
(163, 7, 'Expert'),
(163, 5, 'Expert'),
(163, 9, 'Expert'),
(163, 8, 'Expert'),
(163, 6, 'Expert'),
(163, 10, 'Expert'),
(163, 7, 'Expert'),
(163, 5, 'Expert'),
(163, 9, 'Expert'),
(163, 8, 'Expert'),
(163, 6, 'Expert'),
(163, 10, 'Expert'),
(163, 7, 'Expert'),
(163, 5, 'Expert'),
(163, 9, 'Expert'),
(163, 8, 'Expert'),
(163, 6, 'Expert'),
(163, 10, 'Expert'),
(163, 7, 'Expert'),
(163, 5, 'Expert'),
(163, 9, 'Expert'),
(163, 8, 'Expert'),
(163, 6, 'Expert'),
(163, 10, 'Expert'),
(163, 7, 'Expert'),
(163, 5, 'Expert'),
(163, 9, 'Expert'),
(163, 8, 'Expert'),
(173, 6, 'Expert'),
(173, 4, 'Expert'),
(173, 10, 'Expert'),
(173, 6, 'Expert'),
(173, 10, 'Expert'),
(173, 7, 'Intermediate'),
(173, 6, 'Expert'),
(173, 10, 'Expert'),
(173, 7, 'Intermediate'),
(173, 6, 'Expert'),
(173, 10, 'Expert'),
(173, 7, 'Intermediate'),
(176, 6, 'Expert'),
(176, 10, 'Expert'),
(176, 7, 'Intermediate'),
(177, 6, 'Expert'),
(177, 10, 'Expert'),
(177, 7, 'Intermediate'),
(178, 6, 'Expert'),
(178, 10, 'Expert'),
(178, 7, 'Intermediate'),
(179, 6, 'Expert'),
(179, 10, 'Expert'),
(179, 7, 'Intermediate'),
(180, 6, 'Expert'),
(180, 10, 'Expert'),
(180, 7, 'Intermediate'),
(180, 6, 'Expert'),
(180, 10, 'Expert'),
(180, 7, 'Intermediate'),
(180, 9, 'Beginner'),
(180, 6, 'Expert'),
(180, 10, 'Expert'),
(180, 7, 'Intermediate'),
(180, 9, 'Beginner'),
(181, 10, 'Expert'),
(181, 1, 'Intermediate'),
(181, 4, 'Beginner'),
(180, 6, 'Expert'),
(180, 10, 'Expert'),
(180, 7, 'Intermediate'),
(180, 1, 'Intermediate'),
(180, 9, 'Beginner'),
(183, 6, 'Expert'),
(183, 4, 'Expert'),
(183, 1, 'Expert'),
(183, 10, 'Beginner'),
(183, 8, 'Beginner'),
(184, 4, 'Expert'),
(184, 9, 'Expert'),
(184, 5, 'Beginner'),
(184, 1, 'Beginner'),
(183, 6, 'Expert'),
(183, 10, 'Beginner'),
(183, 8, 'Beginner'),
(185, 1, 'Expert'),
(185, 9, 'Expert'),
(185, 7, 'Intermediate'),
(185, 10, 'Beginner'),
(94, 4, 'Expert'),
(94, 7, 'Intermediate'),
(94, 5, 'Beginner'),
(187, 4, 'Expert'),
(187, 7, 'Intermediate'),
(187, 5, 'Beginner'),
(193, 10, 'Expert'),
(193, 6, 'Intermediate'),
(193, 7, 'Beginner'),
(196, 7, 'Intermediate'),
(196, 5, 'Intermediate'),
(196, 10, 'Beginner'),
(199, 7, 'Intermediate'),
(199, 5, 'Intermediate'),
(200, 5, 'Intermediate'),
(201, 5, 'Intermediate'),
(202, 5, 'Intermediate'),
(203, 4, 'Intermediate'),
(203, 5, 'Intermediate'),
(203, 9, 'Intermediate'),
(204, 4, 'Intermediate'),
(204, 5, 'Intermediate'),
(204, 9, 'Intermediate'),
(205, 4, 'Intermediate'),
(205, 5, 'Intermediate'),
(205, 9, 'Intermediate'),
(206, 4, 'Intermediate'),
(206, 5, 'Intermediate'),
(206, 9, 'Intermediate'),
(206, 1, 'Beginner'),
(206, 6, 'Expert'),
(206, 4, 'Expert'),
(206, 5, 'Intermediate'),
(206, 9, 'Intermediate'),
(206, 7, 'Beginner'),
(206, 5, 'Beginner'),
(206, 9, 'Beginner'),
(206, 8, 'Beginner');

-- --------------------------------------------------------

--
-- Table structure for table `skill_reference`
--

CREATE TABLE `skill_reference` (
  `skl_link` varchar(100) DEFAULT NULL,
  `book` varchar(50) DEFAULT NULL,
  `ref_id` int NOT NULL,
  `skl_name` varchar(20) NOT NULL,
  `lang_image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skill_reference`
--

INSERT INTO `skill_reference` (`skl_link`, `book`, `ref_id`, `skl_name`, `lang_image`) VALUES
('https://www.learnpython.org/', 'learn the python hard way', 1, 'python', NULL),
('https://www.tutorialspoint.com/cprogramming/index.htm', 'the c programming language', 2, 'C', NULL),
('https://www.programiz.com/cpp-programming', 'c++ primer', 3, 'C++', NULL),
('https://www.w3schools.com/html/', 'learning web design', 4, 'HTMl', NULL),
('https://www.w3schools.com/cs/index.php', 'c sharp in depth', 5, 'csharp', NULL),
('https://www.tutorialspoint.com/jquery/index.htm', 'learning jquery', 6, 'JQuery', NULL),
('https://www.programiz.com/java-programming', 'head first java', 7, 'java', NULL),
('https://education.oracle.com/learning-explorer', 'OCA oracal database system', 8, 'Oracle', NULL),
('https://www.freecodecamp.org/news/learn-to-use-the-mysql-database/', 'murachs MySql', 9, 'MySql', NULL),
('https://www.tektutorialshub.com/angular-tutorial/', 'angular up and running', 10, 'Angular', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill_wish`
--

CREATE TABLE `skill_wish` (
  `ref_id` int DEFAULT NULL,
  `skl_count` int DEFAULT NULL,
  `sid` int NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `ws_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skill_wish`
--

INSERT INTO `skill_wish` (`ref_id`, `skl_count`, `sid`, `teacher_id`, `ws_id`) VALUES
(4, NULL, 138, 130, NULL),
(9, NULL, 138, NULL, NULL),
(8, NULL, 138, NULL, NULL),
(9, NULL, 138, NULL, NULL),
(8, NULL, 138, NULL, NULL),
(9, NULL, 138, NULL, NULL),
(8, NULL, 138, NULL, NULL),
(9, NULL, 138, NULL, NULL),
(8, NULL, 138, NULL, NULL),
(9, NULL, 180, NULL, NULL),
(9, NULL, 180, NULL, NULL),
(4, NULL, 181, 130, NULL),
(9, NULL, 180, NULL, NULL),
(10, NULL, 183, NULL, NULL),
(8, NULL, 183, NULL, NULL),
(5, NULL, 184, NULL, NULL),
(1, NULL, 184, NULL, NULL),
(10, NULL, 183, NULL, NULL),
(8, NULL, 183, NULL, NULL),
(10, NULL, 185, NULL, NULL),
(5, NULL, 94, NULL, NULL),
(5, NULL, 187, NULL, NULL),
(7, NULL, 193, NULL, NULL),
(10, NULL, 196, NULL, NULL),
(1, NULL, 206, NULL, NULL),
(7, NULL, 206, NULL, NULL),
(5, NULL, 206, NULL, NULL),
(9, NULL, 206, NULL, NULL),
(8, NULL, 206, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `std_name` varchar(40) DEFAULT NULL,
  `std_email` varchar(50) DEFAULT NULL,
  `std_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `salt` varchar(200) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `sid` int NOT NULL,
  `std_about` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`std_name`, `std_email`, `std_image`, `hash`, `salt`, `gender`, `sid`, `std_about`, `age`) VALUES
('rupak', 'rup@gmail.com', 'https://scontent.fktm14-1.fna.fbcdn.net/v/t39.30808-1/285874422_189224126770076_1239805710728803929_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-7&_nc_sid=7206a8&_nc_ohc=bof4HVsFyJEAX8t_U8p&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fktm14-1.fna&oh=00_AT89UbxXCKZh7-5I5WsbBpv7-NI3xqA94qdq61uW2rejpA&oe=62DBF901', '09583d493e441a3621f290bd9e23b9c741dcb9b8f34bb87a8e16dbc8e3f27bf0d1b2d86d8fbf6a1657c15a052f43f7d4fa5552cc5ffb09b6bef4d2fd', '506d0db8872444202e157c624cbd951f8e21e8f7d6949b9585964e3465c6768a', 'male', 1, NULL, NULL),
('elon musk', 'e3ddddddd@gmail.com', 'https://avatars.githubusercontent.com/u/160713?v=4', '43aa960becb7faac6197cac6a07b12007e1bee7350e7d288b8b2d65b0abd5518bc3c31eed18b62a4f1592d7d223203a7302855b93cd9943626106a45', 'f9711368026d8d015535becd7c70df870fa6b724ba9f6d0c79059ef567a229e5', 'other', 42, NULL, NULL),
('daniel radcliff ', 'iamradcliff@gmail.com', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-SMCzQVZQvYfqhUgOyWaAJCQTQfn1meO1pMChaJthkEQLd-wWsgDLeyUCsdm77c2TOc&usqp=CAU', 'e4bd5a7f95bcf3fe066529937c3b3f12142bd3463ff3bfdd984049a320ce1dc864b1033b562326a7989f293716b51b28d4e76da76380a3e89be295eb', '174f791e58ecdd43a81a327670e0db1fd3e40f0da6b5b9d817eae123875daf8e', 'other', 43, NULL, NULL),
('haruka nakamura ', 'nakamura@gmail.com', 'https://64.media.tumblr.com/cf11f1b4727b94cd20975efab834a159/0e5e1f0916e6f692-32/s540x810/16f2d50a3f919ea02436eb75203f5574b364d307.jpg', '56beae5403fd6bccfa73f1493d8be212758c102ad8b71ef728eb4a6946d98a30da69126061e6b39e796ccea4030d3c617316aa183c1282a7ec799eca', 'd05b104c7f37394cfd234d94d938a47e52be5bf72f130773cb34aca6f3adb093', 'female', 44, NULL, NULL),
('dalan', 'shresthaaa123@gmail.com', 'https://scontent.fktm14-1.fna.fbcdn.net/v/t31.18172-1/14258274_301585960205966_90312985766045399_o.jpg?stp=c33.0.200.200a_dst-jpg_p200x200&_nc_cat=109&ccb=1-7&_nc_sid=7206a8&_nc_ohc=Ky9ZdgabGVMAX8Axkfy&_nc_ht=scontent.fktm14-1.fna&oh=00_AT813s3ZiiSMv60NI2Q_r_eN7QORwPeOnfsjAfgx1t3_5w&oe=62FD7996', '0e81e1cbb39976aeebdae7d9716aaed33b23e894586720bf8e72722b7fb25216fa2dfcbaa600b94d2af8f3477e67aa265830866859e1355a58c81751', '65afd90d7211daba8dd61f2c4717934d4832f542819a402c864eecdce6e3c0e4', 'male', 59, 'i am aakash', NULL),
('mark robber ', 'robdder@gmail.com', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSnAgR5Ua1X-9FYyxM-yoGzfQVpbp73yOvyFDnfOrpivOrWjB4p', '06c8f5724161d81ee06f7fef7ce149d04ac8ea0e412753588157b1f007303f141b87cd2ada272ed0c444e85e92d0327334863b017c98b9ae60ceef62', '823f21d5eadf6b985552bd7cf06154a86ad6660482999fe108231662d9d99825', 'male', 76, 'i was a nasa scientinst ', NULL),
('mark robber ', '2robddedr@gmail.com', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSnAgR5Ua1X-9FYyxM-yoGzfQVpbp73yOvyFDnfOrpivOrWjB4p', '34263656134663c2a250ea80d8fad6dd347b4eb31acdfe55164d19c7cc8ab735ec1114da17d74dce2d3633875abb59353b139053a9dc952ec17dc7ab', '092676a040dfdced7d7f04495515aee6a58caf6fa848ae53db58f53ea8cb50e6', 'male', 78, 'i was a nasa scientinst ', NULL),
('sabita kumo ', 'sabi@gmail.com', 'https://t2.genius.com/unsafe/253x142/https%3A%2F%2Fimages.genius.com%2F7b068eea5835e5aec977526939d560e4.1000x563x1.jpg', '1513779b5cc418e4a7486874d7364653e5e1df30c635af42bfb69c31667827c3a4b99498eb532f80e17b74e95310048b21cb821c585e946b39e58890', '9bd8e3d32da9104c1056f876c0d53368d402afaddbbda64958e227993bd9018c', 'female', 79, 'he he ', NULL),
('Aashish Pant', 'aashishpnt@gmail.com', '', '90ca7322b09148f7f557ff98b5612d88f9ffd8e630ac5203fcc704059599460a26e0f319a6ee5390f53c6f2d4b848a73ce941fb2150b1ff47e009f1c', '18b26d55bee52b593d4c9281adc5182a4daaeefb44f4dae057b8892f22b405de', 'male', 81, 'hi i am aashish ', NULL),
('dfsdf', 'kaustubniraula999@gmail.com', '', 'af18806944ab2e9743376fe93a535a3b1acfe2b4567eea036d3d717e6340668d67c212af0fc1d5a93c262cf5cae525760db581e788ec2e9b14974e0f', 'd589e8a99fb640eddecd0f72ef8579e971d4ee27f51cdf43269f0d6730d26a2c', 'other', 82, 'i am long', NULL),
('Satyam Ghimire ', 'stayamghimirestar@gmail.com', '', 'a61fa78fa7796d539a9c01b3f3110edf118fd3e13c2216b11be770c92a0744404086c6c24ec3dc4803db38ab721a16012d7e4c6fb78fd1414b7de34b', '55e77ef115ae9fd707a63be9f399fa3e845f43745647ca3ce7968809bacd4186', 'male', 83, 'Hi, I am a student from Nepal.', NULL),
('rupak sharma ', 'rupakni@gmail.com', 'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.6435-9/117593191_122000416179024_2145932030300180125_n.jpg?stp=cp0_dst-jpg_e15_q65_s320x320&_nc_cat=103&ccb=1-7&_nc_sid=dd9801&efg=eyJpIjoidCJ9&_nc_ohc=vJEnHe3JpjEAX-w8tLs&_nc_ht=scontent.fktm6-1.fna&oh=00_AT8oxfcZr1u8xp_AousnJY8jfyi3dz0xI0pA3aNDUw6z8Q&oe=630063CE', '5181b53d7ae4d2aef422dc08c2c2112e163b198a75c0e4cc037962639197b31b7c12f7a0bbdc444c773f1eba7a4add4fd0284f0b9116dceede7e1c15', '4c1cf253896bb9a2fdf13e9a128f62db389b8b9b67154507d117fb6a77c7617e', 'female', 84, 'i am rupu :)', NULL),
('rupak sharma ', 'rupak0@gmail.com', 'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.6435-9/117593191_122000416179024_2145932030300180125_n.jpg?stp=cp0_dst-jpg_e15_q65_s320x320&_nc_cat=103&ccb=1-7&_nc_sid=dd9801&efg=eyJpIjoidCJ9&_nc_ohc=vJEnHe3JpjEAX-w8tLs&_nc_ht=scontent.fktm6-1.fna&oh=00_AT8oxfcZr1u8xp_AousnJY8jfyi3dz0xI0pA3aNDUw6z8Q&oe=630063CE', 'aaac4db86d08118616cc02ea8b213efb45c0499e5e976eb0a1affe67857eee227b770aee33337dd4b6b75a18f5b1ec4d189a8b7300c5c1706b1c931b', '68d37058bec268aedc04440cd49ea8b7c98fcdc99e9622e8684641e851d4635c', 'female', 85, 'i am rupu :)', NULL),
('rukehs ', 'ruku@gmail.com', 'https://media-exp1.licdn.com/dms/image/C5603AQEIP97WD2tYag/profile-displayphoto-shrink_200_200/0/1592809140248?e=1663804800&v=beta&t=CCdUDyXJYzSTfNTjzBZz6Bgis7VxV5Ys6rkwbGBqEmE', 'a99aea732cb40635f4d0fb5a87aea260bd1b69ef626119d8738991ae1c223df69ac7b12697296e2cd4c6a7992e9696df8809222d38e4b5026a3907bf', 'a9635b4cf6a1ccad115d0b34e611ab25e69b472ef20d5e2a4511fbccf1a264f9', 'female', 88, 'i am female ', NULL),
('User', 'user@gmail.com', '', '575023e87892c63aeb7baf5d4ef6a6c987907a15d4ab5085bbff043aa580e93019a84f4abef6af11c3fccc8936905b4037db7ad7cb513ce267ca1877', 'ba4162f94fb8292ba71c1419d4d257d70532ec95c81fc2ab08036312e876b0f0', 'male', 90, 'Fh', NULL),
('rupak sharma ', 'rusu@gmail.com', 'https://scontent.fktm6-1.fna.fbcdn.net/v/t39.30808-1/285874422_189224126770076_1239805710728803929_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-7&_nc_sid=7206a8&_nc_ohc=tnKYKLzN_D4AX-UtajI&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fktm6-1.fna&oh=00_AT_uMw7-CxDbh42gwnzlvnatCtJxeLv62I_hvDdq6yPabQ&oe=62DDF341', '2e46f97c13bd47bfdec8448330970e82d225fd1c073ff9656165cd48011122b584ff9dcf8c5ba6a27e93dcc30ad429b8564d072131e0786f666565b6', '8a4393ab182a82d4a939a3b9304f4f68dbd4652562f18a4357a2360b2d2ec6e2', 'none', 91, 'lauda ', NULL),
('dipu dahal', 'dipu@gmail.com', 'dipu ', 'aa317b384c8c4a73a5a6cefe51a864d5b0f5350257c832ef3e0b4538fa2fd13edb840ca8b96007b4716124685f3f56acc4c28ccfe20fae2679a46eef', 'b5e2bb7d270e7b3b70487dda014c701adcc768fb84bd24c3960619179d64d3c4', 'male', 93, 'dipu mugi ', NULL),
('Satyam Ghimire ', 'satyamghimirestar@gmail.com', '', '9e52a7dba279583035b95df3548d56338b309ca7e77a95807b285e2aeaae87d6824aa7a2142df7e3110ddf3361d069650a23bbb741d4bef9e0942fe7', 'cf3a175c77cbf38261750e92c87e3cc3d2143836c9c18aebcdd8b7d5ec6b4f74', 'male', 94, 'I am a student from Nepal ', NULL),
('kekekekekekek ', 'sjnbhttr123@gmail.com', '', '5f3e0765a2664f799d15b8f16273d3f51ccfc488b2ce6c13605c899869e4caceb71b8218f472eebb957f3661f7ebdc0200ba7ca4176c60cf2a762f7b', 'fe616862cca24cbc7a9dac6c24d8b7d8746a95e107d33bb713a7f3a539f04aa2', 'female', 97, 's', NULL),
('sujan prasad bhattarai1', '123@gmail.com', 'd', 'ff9050d9cab2be06821dd7a072a7005e4a3b03233a41df86c24e9e1956d2d0b8087e6c76aa889d474ba102794e495b423223e0bab62c02f01b79a455', 'abb6efa44c3a5fdeefd8e1abd150578018aab3f9d8d856c38f79a1b83184a98d', 'female', 98, 'd', NULL),
('sujan prasad bhattarai', 'sjnddbhttr123@gmail.com', '', 'f919ec8cdc3352379552d8dd4f532b9ae3c00c78f6d59f7188bfee901f960a07fa1599a6c046052515481a4a7fb07120e116a6b58d7e6bba149fa644', '9a7d3fcbc764cc873656fc25e3b41077716e921d2e7be9aca8dc7dad23696080', 'male', 102, 'd', 0),
('sujan prasad bhattarai', 'sjndddbhttr123@gmail.com', '', '0c40fd5b18f67cb995dfcf83ad4d648050eeb4594072615cf7e5fbc6aa1796ec29d746dbc72e3ce14c42908b69e1d85bc25f9441f561decf0529076b', 'cbafd4963fdc299cf5ae28c21a9b9b2e8414994d1e6ff25debac7c2e5466025a', 'male', 103, 'd', 0),
('sujan prasad bhattarai ', 'sjn@gmail.com', 'https://scontent.fktm14-1.fna.fbcdn.net/v/t1.18169-1/12033022_428696570670919_5202382217508133090_n.jpg?stp=c6.0.100.100a_dst-jpg_p100x100&_nc_cat=103&ccb=1-7&_nc_sid=7206a8&_nc_ohc=4SuwOU0vM4UAX_vUDTE&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fktm14-1.fna&oh=00_AT9LI2RT-_n6BZbvZopbdqIA0fXWB47vvOAW7zd4DMeA-g&oe=63012779', 'c6c24a31faa501131f56adb27c0af51bd01a40ba2fb9fc749fd7ab052b13c86a4e279d027ee5ce1158d432147461f2ccf84885422e7807cfc0726bfa', '555838ead5f3bf89f11746580e88d8840790b56d02fa45f3083df088dc4bbdc1', 'none', 104, 'なすすべもなくただ終わりを待つよ。', 20),
('dipesh', 'dipesh@gmail.com', '', '1d35798a1e5c7f8cb0b50b55ec11d4c44c5da47a46e872f775f4b540bb91089763e11ff3f857149083701012cefdd57253e4a724c025c2de18ae2207', 'ac26759fb04661309cbd793fc804201894e94e5257c7d5930f6e232ec3fab4f7', 'male', 105, 'dsfsf', 1),
('333', '2@gmail.com', 'd', '01bd3682397b6a82b038c2c82eb3f0617ab8ca5619fcde52bceb9c603d30f00b29f91741d448bbcb0397d1f54fc4f3c201f1ec2323fa4cae425957a4', '0ae165db3ba792e1e4f5edcb8640edac988b02bcc5698a28012a0ee872c93fa6', 'none', 106, 'd', 0),
('333', '23@gmail.com', 'd', 'a24634d43d1a82cd3463c33f3072418defcff78401b70aec32a02ebb530f117649d0c6c837a29cf687b7b23fd611391d72757a876bce2f65082b9ab7', '6d0e5d4331a8eed67e63519c9b7ec8e755ad98ca7f3975775c414b24eb7d28e3', 'none', 107, 'd', 0),
('076bei001', 'aakash1.762419@thc.tu.edu.np', 'https://www.healthline.com/nutrition/are-egg-yolks-bad', '58c080028caa5716456462b8f3057376252fbd3c92de47fd7cfd0150bf99b550eec46cf2a71676fbfee74ce4363e36e0eef334a21ee19de2955e5054', '408bf88aa95501335af9766c57a016d081daef6027a4607ccccc53845b6e0e13', 'male', 108, 'egg', 0),
('ddd', '234@gmaiil.com', '', '3a8765b8ae344a0d86f04f5158a51a84f9aa878e69bbeebeabfb8f1415ace1429be50968ec4120427e13a83c0e346016557ec4d5243eabc10751e1a5', '7d39c23077e69eb1f88b1db54220f638b45de096e13a8fe5b2db1bfcd641b042', 'none', 109, '2', 0),
('ddd', '2345@gmaiil.com', '', 'a354008fefd4d7604b2f9eb78e467d1678034775603a44b067dbebdb61586310847232ef4852aa0e4bb42319cca300ed732c65cf3bbf4bbed6b80572', '175626901d93cafc0cbbd7fe1488425ca7864775f6b3d4580247d9e606f0c7a8', 'none', 110, '2', 0),
('ddd', '15@gmaiil.com', '', 'e098f5ee276a1ed251aac39144b7fd3821525f4944c7a3d61c83c0e4049416923ad408a05bf0ef7a64a771ea5945aa00af5332751ceff851ff99daac', 'bed30c685bf30b2ead9b2b742377a11078eade4f976087378b4af2638b0c1fdd', 'none', 111, '2', 0),
('dddd', '1@gmail.com', '', 'd9430d594aaf9bc90d0d92f7eb7500bf33f3e90816128cd2598f711130d6836b9f7f79d0eeaf07ac4cbb72bbd5d49131cdcc1928c2afcdbf0b7ca729', 'c586be4ec8702fa1264873fc3989b0609ee275e4808c800c4f74e88b27d62ecd', 'none', 112, 'd', 0),
('sdsdsdasd', '12@gmail.com', '', '46b7242ba69a77419b3f17559214edf9737027406903040a15c16a641ad9c467673e9db9e71bf2034a89f3d7d0d54a4782096cc1d565412a9c32fcfe', '9cb0fd2042e2d44ecb3ade5564c2e5704f40e9516df5c81c8e10efb215129db4', 'none', 113, 'ddd', 0),
('text user 1 ', '1234@gmail.com', '', '736d7e12ffdaa3a1c8d681e598b3493d8063fcfaf465bd26f28e685b414d5c50f5309143cc0733ffb259202367df3ad062badcebbc622475b07d93b9', '3fd89e15887ca467c5a1259fceb415808a277c7694d9f9d5091fce3c49cd4088', 'none', 114, 'e', 0),
('Manoj Paudel', 'mnzpdel@gmail.com', '', '776f48de27831521cf92c52a9647202510458ae46989ce56a6554dd293ebd2be216edc84370072737f526009bfa74cecd63c7266b3c1ba9e422f6095', '8c9e5a702e74b67bf073b2038d82bea5a0a39e7e78ca3d2dca7171d01c97875f', 'male', 115, 'Abcd', 21),
('roshank pokherl ', 'ros@gmail.com', 'https://scontent.fktm6-1.fna.fbcdn.net/v/t39.30808-6/279015114_10225111892522577_7811807554541507506_n.jpg?stp=dst-jpg_p280x280&_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=YjVajgG5Bz0AX8VLgQY&_nc_ht=scontent.fktm6-1.fna&oh=00_AT-5zWY8To68Uh3t9ROGqAf-rx96OyYUjmwxttJFr0U6Lw&oe=62E314EE', '06ba6b396c27c27ec1fb564331a2308787a47a2133938d86e4645b6c55fb457dea1b3fea221f491e1f0d4e0e997b0bc42e11464ea7c55a08b34f8cd7', '8801734c8ec989ae7e18336c5994c7eb259a5cdef04657d2c758c901ee66ed9b', 'male', 116, 'i am roshan ', 0),
('Anu', 'anupamhb17@gmail.com', 'https://www.history.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_768/MTU3OTIzNTc5ODc1OTYwNzgy/how-photos-became-a-weapon-in-stalins-great-purges-featured-photo.jpg', 'e733e3ce1429ad0bc8fed49ac5e96353dd0618c1d3266d49437469d14d28772e2ed3b1597c0c13d922bf7dcd36c090578b6867f60991447aacd4d34f', 'fd46e7a0a14c5c776972bf9f5be4a62608d52bd6726aa9d01a2d0c6615761768', 'male', 117, 'Not an expert or intermidiate , iam just lying', 112),
('tenebri ', 'ten@gmail.com', 'https://i.redd.it/k6c538z81nd81.jpg', 'dc9a9cedbbd915ddb78b3bea4e0b6f10de9c8607e79275636205f0c687cfa3e0ce2cfbcc6d8cc1758168561f5efcb749b04850045ac3adfcf7f64e0a', 'dea1c7b3869e3e5e3d0daf236384d5cf10e30555d5532fc04112b4c0e1c2dbe5', 'female', 118, 'cute , i want to torment you ', 0),
('yorushika ', 'you@gmail.com', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABNgAAABkAQMAAABuPx8iAAAAA1BMVEX///+nxBvIAAAAJUlEQVR4Xu3AMQEAAADCIPunNsYeWAQAAAAAAAAAAAAAAAAAAOA88AABMGQBNwAAAABJRU5ErkJggg==', '82460f92f63a7d69101bbe6cec2bb0f408271751f572c616b6c8c162c643dbb072f46484a034576a804d8afc79ee45a1705ea76016b79c065b97d778', '0437507bb9cddaa6bb10c29b3450afc3c11a4b934a3cc24e37a23a0928c49785', 'female', 120, 'iite ', 0),
('dark ', 'dark@gmail.com', 'https://m.media-amazon.com/images/M/MV5BZjU4ODA0ZjktMmVlNy00YzIyLTk1Y2QtZWFjNWY4YWY1ZmY3XkEyXkFqcGdeQVRoaXJkUGFydHlJbmdlc3Rpb25Xb3JrZmxvdw@@._V1_.jpg', '0513d44d6fe2ce114e8a045a57e91f59d7795d2976223a84070b6fa4af1e2d33927aea464687ee3f2e9a38a344ccc1a7e411846e5ba5f40acd3e41e2', '09c8bbc1943ef2ca2fc4b6b4fb65e546fe8fd17a063615894eb49ffa1c7545f0', 'female', 121, 'i am dark ', 120),
('dark ', 'darku@gmail.com', 'https://m.media-amazon.com/images/M/MV5BZjU4ODA0ZjktMmVlNy00YzIyLTk1Y2QtZWFjNWY4YWY1ZmY3XkEyXkFqcGdeQVRoaXJkUGFydHlJbmdlc3Rpb25Xb3JrZmxvdw@@._V1_.jpg', '9c46e8f97231b30270acd664753ba6051030d7b0f5b09e594413e62f00174616f70a624b10df4b92d56b61af957361ae1a7e5a70d395032d3a5216bf', '34725eede08595e30808e3a9e149573b4adea62c4098fb7f81c4ddf918408bf1', 'female', 122, 'i am dark ', 120),
('rupak sharma 5', 'rupu@gmail.com', 'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.6435-9/100586197_103146628092058_2870334172994469888_n.jpg?stp=cp0_dst-jpg_e15_p64x64_q65&_nc_cat=102&ccb=1-7&_nc_sid=85a577&efg=eyJpIjoidCJ9&_nc_ohc=OeMeEnIwQc8AX99gw6G&_nc_ht=scontent.fktm6-1.fna&oh=00_AT_232mK-xqZUaEjgpRtsPUyRl9L-soGJF5h6oZfxyz50Q&oe=6309ECE8', '4aa39bf558e994d88d60c552f515165122f69daa801d7c46ea96ddad93216c7906f4d44c7a30cba18b223342e66ce25d7804c93ec84d21ff0087ffc6', '7b9ef65dda42b961e7897473cf8109b061f8a346796bff24f5903188ee621f2b', 'female', 123, 'i am test user 5 ', 0),
('python test user ', 'python1@gmail.com', 'https://static.wikia.nocookie.net/epic-seven/images/8/83/Arbiter_Vildred_Profile.png/revision/latest/scale-to-width-down/275?cb=20190831160510', 'b7f5bffc964e9cac39b6abad1435f59cd774c574fdb52b308dc0075dfb8e92b031dfa39d337678e2643d7882c86c4efb2b7ddc7500d73260106f7e3b', 'd7f427241d52e979b3eba525463e489b5eeaf8294dd1af3efe26e6bdb9ed9a82', 'none', 124, 'i am python test usuer ', 0),
('python test user ', 'python2@gmail.com', 'https://static.wikia.nocookie.net/epic-seven/images/8/83/Arbiter_Vildred_Profile.png/revision/latest/scale-to-width-down/275?cb=20190831160510', 'ac3f93c16c473d89fcdc47c68f5a59f18a0585d890b9753f3457c924309bcdea158f27357fee29fade3bda1ec5731e76d1099cd87b63f26cd4acf023', 'ef00f8a7a2c34521d1ca9e0ab2d5722c31c37bee656b1eed18e626d247ff0cdf', 'none', 125, 'i am python test usuer ', 0),
('python test user ', 'python3@gmail.com', 'https://static.wikia.nocookie.net/epic-seven/images/8/83/Arbiter_Vildred_Profile.png/revision/latest/scale-to-width-down/275?cb=20190831160510', 'fb6b4da109a23eb7289ab417609298ea9d8b3f666f0bdd925345a3cbea0de8c0bb32efd8e9d203a72d00d2f26f3478f37b8dda10d0143cc7914f2a81', '5238c86c102c3ef6d535e9ba88e3a7bd1fbacc4366f805a39a15fe8f13a0a0de', 'none', 126, 'i am python test usuer ', 0),
('python test user ', 'python4@gmail.com', 'https://static.wikia.nocookie.net/epic-seven/images/8/83/Arbiter_Vildred_Profile.png/revision/latest/scale-to-width-down/275?cb=20190831160510', '2ebd190b9aafe49ae27ff2ee58f08ab408e4c74d7798660c36801ca85f9284336d2306ff15843269541f0c744e47a3401df2d49f410fe3aaea471232', '9d881a278a59014798020894a6b1b2bab62fffa8acc3f865a38a50e3aa3dcfab', 'none', 127, 'i am python test usuer ', 0),
('test user 7', 't1@gmail.com', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/230px-Pierre-Person.jpg', '07916fe2db31771bebd511049cc3c3e2f09303dbc39d42d56950cfcc1a9b4c3c7822a9ec7587faaf7af287958ac2f29e78601e35338316ec2bb9d8e2', 'cef7d14fa70d0d1d97b84fdd99caf210d9c857a8056218b4082cb94dfcda6652', 'none', 129, 'i am html test user ', 0),
('test user 8', 't2@gmail.com', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/230px-Pierre-Person.jpg', '65fbe8340dbe2c7e2b7976f1a3af68bc7e021240c687b2455babf806d0108a0df61b6aa4d079e08235300ba0fdf5a8a1c928ddf3befa853af59f3161', '2ba378a02f1a087a9e35fff9194b6ff97d45349592d4c086e91d26f41c66d1a1', 'none', 130, 'i am html test user ', 0),
('test user 9', 't3@gmail.com', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/230px-Pierre-Person.jpg', '46edda0fc312bb8b61b42f6b6783e81cf90dcc26ae4e9e4ba12a32a12a4c63663928fe09b6ef5b29c18cdd4b7355792baa386d1e294558dbf56cbf40', 'ef5300d2d39928241b6f4b2d3217edf5c1ecd86bc3b3de17540c5fa78056079a', 'none', 131, 'i am html test user ', 0),
('luffy', 'luffy@gmail.com', '', '27a2dd4725e61a09ca1e7e47e48c5745bfcf6b2756e04995a4a60dc3c90596b124f0bccba25dfbb1f64670e1452859a3d626fb7f9274540e7142d096', '27565664e048d67e726b9fcb1a3f16e3ac99de46991b52f0f390196171c48b27', 'male', 132, 'pirate king is me', 18),
('luffy', 'lufffy@gmail.com', '', 'd3f569b7f8f613190e8e880f8e0ec738363c8f68404157946e6fce7dd58702567017716b28c125caa0b419bad9ae12f5c53fad0d92a7b159228a2238', '0b0d7d53e6b3713f23d80770ea09729104e6c9776ea4ad66eeba03519484ec0e', 'male', 133, 'pirate king is me', 0),
('JosephThapa', 'josephthapa911@gmail.com', '', 'd7158a6fb3fbe304156299a4e878554789d3b72a7f1d0859fa9fed76c6747b6b89e03a539340a8900645c10f51d8eee82508ab68ce55aa924b434e01', '38f9facfdbda3afc632ef298e65e0e26aa2dcf06678ae1cb9d80b99bb9f8ab94', 'male', 134, 'Firoekfkddodkdjsickisskdjdidjjdidjdjdjdjfufudjf', 20),
('sujan prasad bhattarai ', 's@gmail.com', 'https://i.guim.co.uk/img/media/9749405dadfc1c6a2a29a1efee67306598126a24/0_406_2016_1209/master/2016.jpg?width=620&quality=85&fit=max&s=fe9637a9c0d651a80e032bd1e7b7254a', '3666df50d075d418106f7bfa57d5afc7562c34595f42d8d36cde18b36f8af0f0373af42fdb93dd13b82bc503d37baa7b24381c0e59e4f1954d18ef62', '9fe25fa4d235581576c8b527f4dbcb2cc22d84c5bab70a87109140ff5c2f7ebf', 'male', 135, 'i am ', 20),
('sagun pudel ', 'sag@gmail.com', 'https://images.unsplash.com/photo-1493918352977-f2e88f9bc520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'a5920fe08de3db3f43e26857594cf4538c33850cccbce4929042533ab714101c93748dd1a4185cf006bcc2d734dee05e46ff6d95776bfdc05191e8c7', 'e03ec51d95fde19afc7e4b2676f27bd83e9324d40cec4d701d3b5c17c898cb6a', 'female', 136, '111', 0),
('やくしまるえつこ', 'emma@gmail.com', 'https://images.unsplash.com/photo-1460904577954-8fadb262612c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1690&q=80', '3a1b3deaf1572869a8e244ff1b0206c9e60453821983d66b1c6da4d4e7df1ad7f20db7f7cce1a60ed94157a35f32893084aaf225c9eb5eb2623f61db', '3862d8bd170222ff2c48bcc4d80ec57e67d56286fdc0d2112484a21e6a2d3620', 'none', 137, 'ｓｄｓｄ', 0),
('愛ミョン', 'ai@gmail.com', 'https://images.unsplash.com/photo-1470101691117-2571c356a668?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80', 'a220e69c84f4495df3f25247eebd60c611afa318a08e2ec6b1a044116011b2d9459b4c480e045b5ca47bfcd9d227e00b5fed22413085dddc4c6b8629', 'fbabf19d1bde46162943e609c59c577650efe723faff82238678371a4acb203a', 'female', 138, 'dd', 0),
('GIGA CHAD', 'chad@gmail.com', 'https://i1.sndcdn.com/artworks-ywcx1pUzUGGvjwmH-BUNWRA-t500x500.jpg', 'f8c035b6739b217d3401d8513bb1a0b11e4695497431f8b838ac0d5db3375409a9e31e1969d83ce226bc07be4f61c6401a38c7e21fcb690caecbe4d9', '4c2e2187dd9c5279e01b6d7d86e7406cef2cc4519bac3c3ffc5c42f2d0a2099c', 'male', 172, 'I AMffffffffffffffff ', 0),
('jessi pinkman ', 'pink@gmail.com', '', '4951e6cb4b731d3972b1455b5172109a5be34eb82f10229212975b04af16246bffe6b874b412183064a69a546428a4fe770c5e4f898e242b71fedfc6', '1a778e483c6745227626b7af40cf234be3518294f2b5458ab508ae3e4c5110e4', 'male', 180, 'this is the purest metho of all time ', 0),
('mr white ', 'white@gmail.com', '', 'c5b460194bd54714d7b1f9e9cff2a44a07feb5a938b25f0740e5c2d59f6feafdba4caede79bccf59319411c78c1c6d4cc010fb5c3781d5bf5093b6e0', '0a2e444df00a5103175435b78481e5dfb4456b9289c419e9c1dbed6a9ee5accd', 'none', 181, '12345', 0),
('Pradeeo Chheri', 'pradeepop38@gmail.com', '', '76f626f7d2b6f6b49f953bc343a199e5020200c0ffc87d07bb1c6f25eb029d3848c75e194975b520a2ac3d948dab123f17fa0525fe01fe7e162cbb89', '31c38698918ee8d476c1d7d67ecd1eb9099a19900e7bca1325c578b63871368d', 'male', 182, 'I dont want to write anything in this description', 22),
('Pradeep Chhetri', 'pradeepop3@gmail.com', '', '7aeacf89f06010c4d278534d2bd1053e910c66f561011ab968bb3ddf7ee20c6546b199e11560d26e90c57b55913d5ede31817f01ef4924fdded3926c', '534d8da7517a77242648f68f648aee3291643e44255d334365ad403e59c3c1eb', 'male', 183, 'I dont want to write anything in this description', 0),
('laxman rijal ', 'lax@gmail.com', 'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.6435-1/71525578_2463732570530876_1327507419768553472_n.jpg?stp=c0.30.100.100a_dst-jpg_p100x100&_nc_cat=110&ccb=1-7&_nc_sid=7206a8&_nc_ohc=amMXlw3guXgAX9zaMC7&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fktm6-1.fna&oh=00_AT89IYczJlytXcOh45UwT19rEKMQTLmlPzij53R-wYH1Sw&oe=630F325E', '44a8c801668aa159c18c3710d3cda45c68e9c277dbaaa8552bef8ad6cc6b65bbfcb44fa0d59e22a0bd99eff51f8425eeaf491b8a2a9e2df533614efa', 'adc33e9dc7133f7feaa7bf3bd32174629b2d2919e6cc5ada46cb3a7c64fe74f8', 'none', 184, '吾輩わlaxである', 22),
('hari bahadur', 'haridai@gmail.com', '', '01ba3b149e4728e6cdbac3473c115d3bd5cb9b6a70f25dca5261343769d77740b6eab4d7a51d8b540198f3ded25803fd0fd2c4f450d209f30e04da9b', '4d0acb6c80ab765d779eee471d6209697536478e38376126a9c14a3d1dc09c7a', 'female', 185, 'ehhi ehhi', 0),
('Maytas Ghimire', 'satyamghimirestar123@gmail.com', '', '58856c1089f4ef9cbad21aca4df4118179bc386a2b795f87e13a5ddf858c2124800f9ffe9e9d55547eb7ec354b874dda00b8ea3291b3fccf9b36b800', '64df8848b89c1eeba974086b9515a6a3c9d22ceabc52fde685e81acc696627de', 'male', 187, 'hi, i am a student in thapathali campus. i live in', 0),
('rupak sharma', 'T@gmail.com', '', 'd847260710fc5c970e2d82ba78f8cdfc98009d8e137318d99f16f641881d8feafdf78b0e3e4b3f39ecc4449a219364777b3558539bd839d5282d99fa', 'd76215e7133854458d668756fdfe2b0775cd9fc3743d91ee439e97119f3e1825', 'none', 192, 'sdfs', 0),
('Test', 'test@gmail.com', 'hulululu', '5bbdd4a4795cc502fcdb67c3c9ede1ce24c45da965fc3135ce6b471659178e8a1acbe0f04886472540db14d55a166bb2114d5153935b34697133c4c3', '0763584a99aa7d32e2eb1ee3c700a630100f8ef146076f6e6a7469b1d70a6f7c', 'other', 193, 'short', 43),
('ayush acharya', 'sss@gmail.com', '', 'fe9998609a1147fdb063298d162d4d6ba53269a6f955a620a313f69de0c6bbc4798e6ec0c6654ddfa518a806550f1007aeec51139d38e8a674e383c4', '7548fd4db554d90e97333ba183eef632b7d58c1114becbc0fb3cbf3f882fedd5', 'none', 194, 'sss', 0),
('ayush acharya', '1ss2s@gmail.com', '', '661335bc24159589872b3986d69c1ecaa72ab8f1c2dd4f0c8d5010eb71a6ae35bac5e9c1d6f7d181f820d10aeeea18ee384e5eb704c7dd0d7a5a2423', 'af6c51c0fe4c002d19d8dbcc8795826dd551b42550df44e18439b95ab4398e81', 'none', 195, 'sss', 0),
('ayush acharya', 'ss2s@gmail.com', '', '379bbebf0f29caa04d11bb42f5df1797e740c3474b85597f5f954edcccf1e95203f7e15e28bd629ec2b93a67f4ad17106ea49e586a220c086a6b4395', '48210a9be4a00d0c644aa2f3b7d82f66a388cb876ad25bdb4e661762fbf1bbc3', 'none', 196, 'sss', 0),
('sujan prasad bhattarai', '2sjnbhttr1@gmail.com', '', '3ed8e097cfe62e9693b8d1fcf7ad6a3cbb2f63efada4110856f77a2fc30522796d1d8630de8b0f4af7d5c1b04fbb17e048dd407d3363904b203e1a7c', 'b29cd2b2985add3cf7ffb2d7f7209f5a57d83238c1fa12ffa1438d00830eb101', 'none', 197, 'sss', 0),
('sdfsdfs', 'rup1@gmail.com', '', 'b0e17fbc639a5a9def2c55c7f2cf1017de33f51d1dcde589a1195665186030c2d288a4fc7912ab4877f852d4b87c0e08a615c87232c42aab4bcc3211', 'd73e2a8915a3b254bba3a45153b45f08ad5fde391adcd6aad62db061e82f8e6b', 'none', 198, 'sss', 0),
('sdfsdfs', 'r2up1@gmail.com', '', 'fdf355903cb24ac6cffaaaa6566350aab8ba729c037e28b40cfbdada3d0712c7b97c719ab35ea4e7db71d4ef40472b71d092d7600e504a1fd506a6fd', '0deb280aefe147b637243c7beb5f718550bec8afa3120bcecb0a7e429d5d5e89', 'none', 199, 'sss', 0),
('sdfsdf', '31sss@gmail.com', '', '2d99ce7c7349e0051033f9ec639f0d803775e614bdf8e0a0a8d55af22290153ec87da8bb2cad2b651dfc3aa1fcf7379f92ee16dc63b01b0f0660c4f8', 'b9438cb59c6731442dcbe034f2fbd23708e9694b7c2b1afa3800696206fe5c6b', 'none', 200, 'sss', 0),
('sdfsdf', '231sss@gmail.com', '', '44c7b245b1da42740e4fc8c0fb32282ce903da3efd158f144205b8ad8a7bd69e7c4ab7af03e4fbfc54cc712c54af2b9357796ba255a9d7b83e5a8944', '516d0b95bca785058c14b7464a93ce5d7f755a751d021dd6d36a09939fc41a05', 'none', 201, 'sss', 0),
('sdfsdf', '1231sss@gmail.com', '', 'f13a617f69e1916fb591cc9cea2c2afebd99ec385a83f3e8bc833da1f5e483bd2f3c9eee7b33ffdf33e018bc2ffeafeee6ff790c01914fe78d517ead', '69aeb96d3e9006e8a83334e86cde9fc964aa0af72349a43c3ab8c87163a6ead3', 'none', 202, 'sss', 0),
('sdfsdf', '21231sss@gmail.com', '', 'ac008653c326f6d04614f4cfb7ff4e3574c20f56a759f40145389989e6e953cd52979e04d70b120920705c4b1cc45d3c6689c4665349bc2d35bfe65c', 'f50fb69d33bea1beae857932db2ed49e2fffd99e183b74ac1b9a51c22e8f0c9a', 'none', 203, 'sss', 0),
('sdfsdf', '21231s2ss@gmail.com', '', 'e4269cf216fc48d16d4aa36dd39a74cc879745311ec703044dc223853faad3518577c20c459dabe0a1125af9258d7fdf30fcdf1679aee0e9a8e499f6', '185b5a680205b051e6ce9f7b8208b56bc1f85c8aedc70d2853ece6097e89e724', 'none', 204, 'sss', 0),
('sdfsdf', '2221231s2ss@gmail.com', '', 'd754261bdd31e7ecc32df6e95a1b4fdc5f3b18b4e5d194b5d46497e04cb42fa679225794b00c321ebe1e3267d8dc3977e6f3037b5c1cfec0820b50ef', 'b1ed38e9c48c2c536ea2dc875422944b17ef86e0fbc6ea56734966ae08298364', 'none', 205, 'sss', 0),
('sujan prasad bhattarai', '22221231s2ss@gmail.com', '', 'e776b9e25735afeacbab648b1ae8c453c3ed4c9cb3b61d3e1880d31f8834431d7e3ebaeec6980bb79798a8d560442ba2e6ca43a531448b5fb2c5a384', 'fc01f7758f6e4f1b034506a43239dbe876b39d371ba394d93e327a10c51bf3df', 'male', 206, 'sss', 0);

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `disable_key_check` BEFORE UPDATE ON `students` FOR EACH ROW begin
    SET FOREIGN_KEY_CHECKS=0;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_data`
-- (See below for the actual view)
--
CREATE TABLE `student_data` (
`age` int
,`gender` varchar(10)
,`sid` int
,`skl_level` varchar(20)
,`skl_name` varchar(20)
,`std_about` varchar(100)
,`std_image` varchar(500)
,`std_name` varchar(40)
,`teacher_id` int
);

-- --------------------------------------------------------

--
-- Table structure for table `student_skills`
--

CREATE TABLE `student_skills` (
  `skl_id` int DEFAULT NULL,
  `std_id` int NOT NULL,
  `expert` varchar(20) DEFAULT NULL,
  `intermediate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `ws_id` int NOT NULL,
  `ws_name` varchar(40) DEFAULT NULL,
  `sid` int DEFAULT NULL,
  `ws_date` varchar(20) DEFAULT NULL,
  `ws_venue` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`ws_id`, `ws_name`, `sid`, `ws_date`, `ws_venue`) VALUES
(1, 'HTMl', 128, 'Fri Aug 19 2022', 'Thapathali'),
(2, 'HTMl', 187, 'Fri Aug 26 2022', 'lkjdslkfjlsf'),
(3, 'HTMl', 130, 'Thu Aug 18 2022', 'thapathali ');

-- --------------------------------------------------------

--
-- Structure for view `lang_count`
--
DROP TABLE IF EXISTS `lang_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`nekodesu`@`%` SQL SECURITY DEFINER VIEW `lang_count`  AS SELECT `sr`.`skl_name` AS `skl_name`, `skills`.`ref_id` AS `ref_id`, `sr`.`book` AS `book`, `sr`.`skl_link` AS `skl_link`, `sr`.`lang_image` AS `lang_image`, count(`skills`.`ref_id`) AS `count` FROM (`skills` join `skill_reference` `sr` on((`skills`.`ref_id` = `sr`.`ref_id`))) GROUP BY `skills`.`ref_id``ref_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `student_data`
--
DROP TABLE IF EXISTS `student_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`nekodesu`@`%` SQL SECURITY DEFINER VIEW `student_data`  AS SELECT `students`.`std_name` AS `std_name`, `students`.`sid` AS `sid`, `students`.`std_image` AS `std_image`, `students`.`gender` AS `gender`, `students`.`age` AS `age`, `students`.`std_about` AS `std_about`, `sr`.`skl_name` AS `skl_name`, `skills`.`skl_level` AS `skl_level`, `sw`.`teacher_id` AS `teacher_id` FROM (((`students` left join `skills` on((`students`.`sid` = `skills`.`sid`))) join `skill_reference` `sr` on((`skills`.`ref_id` = `sr`.`ref_id`))) left join `skill_wish` `sw` on((`students`.`sid` = `sw`.`sid`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likes_id`),
  ADD UNIQUE KEY `sid_user` (`sid_user`,`sid_opponent`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD KEY `sid` (`sid`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `skill_reference`
--
ALTER TABLE `skill_reference`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `skill_wish`
--
ALTER TABLE `skill_wish`
  ADD KEY `sid` (`sid`),
  ADD KEY `ws_id` (`ws_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `std_email` (`std_email`);

--
-- Indexes for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD UNIQUE KEY `std_id` (`std_id`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`ws_id`),
  ADD KEY `sid` (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likes_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `sid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `workshop`
--
ALTER TABLE `workshop`
  MODIFY `ws_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  ADD CONSTRAINT `skills_ibfk_2` FOREIGN KEY (`ref_id`) REFERENCES `skill_reference` (`ref_id`);

--
-- Constraints for table `skill_wish`
--
ALTER TABLE `skill_wish`
  ADD CONSTRAINT `skill_wish_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  ADD CONSTRAINT `skill_wish_ibfk_2` FOREIGN KEY (`ws_id`) REFERENCES `workshop` (`sid`);

--
-- Constraints for table `workshop`
--
ALTER TABLE `workshop`
  ADD CONSTRAINT `workshop_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
