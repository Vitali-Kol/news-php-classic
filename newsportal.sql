SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Eesti'),
(2, 'Maailm'),
(3, 'Krimi');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `login` varchar(20) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `registration_date` date NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `username`, `job`, `email`, `login`, `password`, `status`, `registration_date`, `pass`) VALUES
(1, 'admin', 'Portal admin', 'admin@newsportal.ee', 'admin', '$2y$12$pxB2ofiiNZkxObmbBvBOyegwCjHCVFYhapjiSsdYXUaJ9Z1IH6pQW', 'admin', '2019-11-05', '123456'),
(2, 'anonim', 'Portal anonim', 'user@newsportal.ee', 'anonim', '$2y$10$dYK1sCogKL/zZBef.V/gBeynL5mdt0QxZlwvEUBkS0jkdXYRMPHRa', 'user', '2019-11-05', '111111');

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `picture` longblob DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `news` (`id`, `title`, `text`, `picture`, `category_id`, `user_id`) VALUES
(1, 'Moskva lõksu langenud Lukašenka ei lase opositsiooni rihma lõdvemaks', 'Enne eilseid valimisi said kümned Valgevene opositsiooni esindajad teada, et ei saa kandideerida. Eile toimusid Valgevenes parlamendivalimised, mille kritiseerijad nimetab opositsioon 110-kohaist Valgevene parlamendi alamkoda kõigest kummitempliks, ametis olnud 1994. aastast saadik. Selle aja jooksul on Valgevenes toimunud valimisi kuulutanud ebaausateks, kirjutab uudisteagentuur AFP.', '', 2, 1),
(2, 'Politseikopter leidis rappa jõhvikaid korjama läinud mehe üles', 'PPA lennusalga kopteri meeskond leidis laupäeva õhtul Ida-Virumaal rabas eksinud mehe, kelle tervis oli korras.', '', 3, 1),
(3, 'MHÖMMIKUNE ERISAADE | Kas Helmed süüdistasid Kaja Kallast tõesti \"Mary Krossi tegemises\"? Kas Tommi Mäkinen maksab Eestis hiigelpalku?', '20. sünnipäeva nädala puhul tervitab Delfi viiel hommikul oma kasutajaid erisaate hommikuvaljaandega, vaadates otsa eelmise päeva, värske hommiku ja eelseisva päeva peamistele uudisteemadele. Täna olid hommikusaate stuudios Delfi peatoimetaja Karoliina Vasli, Ärilehe ajakirjanik Siiri Liiva ja Delfi tegevtoimetaja Tarmo Paju, peateemadeks Kaja Kallase vastu suunatud ähvardused, värske Ärilehe artikkel Eestis tegutsevast Tommi Mäkineni rallitiimist ja uued poliitreitingud. Eelseoleval laupäeval täitub Delfil 20. tegevusaasta.', '', 1, 1),
(4, 'Mart Järvik ei ilmunud korruptsioonivastase erikomisjoni ette', 'Maaeluminister Mart Järvik ei osalenud täna riigikogu korruptsioonivastase erikomisjoni istungil, põhjendades seda tiheda töögraafikuga.', '', 1, 1);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `text` varchar(500) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `comments` (`id`, `news_id`, `text`, `date`) VALUES
(1, 1, 'Huvitav artikkel!', '2019-11-30 18:20:10'),
(2, 2, 'Hea töö politseilt!', '2019-11-30 18:45:00'),
(3, 2, 'Õnneks leiti kiiresti.', '2019-11-30 19:00:15'),
(4, 4, 'test22', '2019-11-30 19:15:55');
