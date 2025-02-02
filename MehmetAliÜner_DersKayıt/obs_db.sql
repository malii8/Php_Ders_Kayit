-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 19 Ara 2024, 16:52:40
-- Sunucu sürümü: 10.5.25-MariaDB
-- PHP Sürümü: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `obs_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolumler`
--

CREATE TABLE `bolumler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `BolumAdi` varchar(255) DEFAULT NULL,
  `Fakulte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bursiyerler`
--

CREATE TABLE `bursiyerler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `BolumId` int(11) DEFAULT NULL,
  `Ad` varchar(255) DEFAULT NULL,
  `Soyad` varchar(255) DEFAULT NULL,
  `BursBaslangicTarihi` datetime DEFAULT NULL,
  `BursBitisTarihi` datetime DEFAULT NULL,
  `BursMiktari` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `derskayitlari`
--

CREATE TABLE `derskayitlari` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgrenciId` int(11) DEFAULT NULL,
  `DersId` int(11) DEFAULT NULL,
  `DonemId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dersler`
--

CREATE TABLE `dersler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `DersAdi` varchar(255) DEFAULT NULL,
  `DersKodu` varchar(50) DEFAULT NULL,
  `Kredi` decimal(5,2) DEFAULT NULL,
  `OgretmenId` int(11) DEFAULT NULL,
  `BolumId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `derslikler`
--

CREATE TABLE `derslikler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `DerslikAdi` varchar(100) DEFAULT NULL,
  `Kapasite` int(11) DEFAULT NULL,
  `Lokasyon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `derslik_zamanlar`
--

CREATE TABLE `derslik_zamanlar` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `DerslikId` int(11) DEFAULT NULL,
  `DersId` int(11) DEFAULT NULL,
  `ZamanId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dersprogramlari`
--

CREATE TABLE `dersprogramlari` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `DersId` int(11) DEFAULT NULL,
  `OgretmenId` int(11) DEFAULT NULL,
  `SinifId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `donemler`
--

CREATE TABLE `donemler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Donem` int(11) DEFAULT NULL,
  `BaslangicTarihi` datetime DEFAULT NULL,
  `BitisTarihi` datetime DEFAULT NULL,
  `Durum` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ekdersler`
--

CREATE TABLE `ekdersler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgretmenId` int(11) DEFAULT NULL,
  `DersId` int(11) DEFAULT NULL,
  `Tarih` datetime DEFAULT NULL,
  `Saat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `haftalar`
--

CREATE TABLE `haftalar` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `HaftaNo` int(11) DEFAULT NULL,
  `Tarih` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mailler`
--

CREATE TABLE `mailler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Email` varchar(255) DEFAULT NULL,
  `VerificationCode` varchar(100) DEFAULT NULL,
  `IsVerified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notlar`
--

CREATE TABLE `notlar` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgrenciId` int(11) DEFAULT NULL,
  `DersId` int(11) DEFAULT NULL,
  `Vize` decimal(5,2) DEFAULT NULL,
  `Final` decimal(5,2) DEFAULT NULL,
  `But` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrencigirisleri`
--

CREATE TABLE `ogrencigirisleri` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgrenciId` int(11) DEFAULT NULL,
  `KullaniciAdi` varchar(50) DEFAULT NULL,
  `Sifre` varchar(255) DEFAULT NULL,
  `AktifMi` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenciler`
--

CREATE TABLE `ogrenciler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Ad` varchar(255) DEFAULT NULL,
  `Soyad` varchar(255) DEFAULT NULL,
  `OgrenciNo` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `BolumId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogretmengirisleri`
--

CREATE TABLE `ogretmengirisleri` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgretmenId` int(11) DEFAULT NULL,
  `KullaniciAdi` varchar(50) DEFAULT NULL,
  `Sifre` varchar(255) DEFAULT NULL,
  `AktifMi` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogretmenler`
--

CREATE TABLE `ogretmenler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Ad` varchar(255) DEFAULT NULL,
  `Soyad` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `Uzmanlik` varchar(255) DEFAULT NULL,
  `Unvan` varchar(100) DEFAULT NULL,
  `Durum` tinyint(1) DEFAULT NULL,
  `BolumId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `transkriptler`
--

CREATE TABLE `transkriptler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgrenciId` int(11) DEFAULT NULL,
  `DurumYeri` varchar(255) DEFAULT NULL,
  `Yil` int(11) DEFAULT NULL,
  `Donem` int(11) DEFAULT NULL,
  `DersId` int(11) DEFAULT NULL,
  `KrediAkts` decimal(5,2) DEFAULT NULL,
  `AlinanAktsEtki` decimal(5,2) DEFAULT NULL,
  `TamamlananAktsEtki` decimal(5,2) DEFAULT NULL,
  `OrtalamaEtki` decimal(5,2) DEFAULT NULL,
  `BasariKatsayisi` decimal(5,2) DEFAULT NULL,
  `Puan` decimal(5,2) DEFAULT NULL,
  `BasariPuan` decimal(5,2) DEFAULT NULL,
  `BasariNotu` varchar(10) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `AlinanKrediAkts` decimal(5,2) DEFAULT NULL,
  `TamamlananKrediAkts` decimal(5,2) DEFAULT NULL,
  `PuanAlinanAktsOrtalama` decimal(5,2) DEFAULT NULL,
  `Yano` decimal(5,2) DEFAULT NULL,
  `Gano` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `veliler`
--

CREATE TABLE `veliler` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgrenciId` int(11) DEFAULT NULL,
  `Ad` varchar(255) DEFAULT NULL,
  `Soyad` varchar(255) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoklamalar`
--

CREATE TABLE `yoklamalar` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `OgrenciId` int(11) DEFAULT NULL,
  `HaftaId` int(11) DEFAULT NULL,
  `Durum` tinyint(1) DEFAULT NULL,
  `Donem` int(11) DEFAULT NULL,
  `Tarih` datetime DEFAULT NULL,
  `DersId` int(11) DEFAULT NULL,
  `OgretmenId` int(11) DEFAULT NULL,
  `SinifId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `zamanlar`
--

CREATE TABLE `zamanlar` (
  `Id` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Gun` varchar(20) DEFAULT NULL,
  `BaslangicSaati` time DEFAULT NULL,
  `BitisSaati` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bolumler`
--
ALTER TABLE `bolumler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `bursiyerler`
--
ALTER TABLE `bursiyerler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BolumId` (`BolumId`);

--
-- Tablo için indeksler `derskayitlari`
--
ALTER TABLE `derskayitlari`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgrenciId` (`OgrenciId`),
  ADD KEY `DersId` (`DersId`),
  ADD KEY `DonemId` (`DonemId`);

--
-- Tablo için indeksler `dersler`
--
ALTER TABLE `dersler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgretmenId` (`OgretmenId`),
  ADD KEY `BolumId` (`BolumId`);

--
-- Tablo için indeksler `derslikler`
--
ALTER TABLE `derslikler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `derslik_zamanlar`
--
ALTER TABLE `derslik_zamanlar`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DerslikId` (`DerslikId`),
  ADD KEY `DersId` (`DersId`),
  ADD KEY `ZamanId` (`ZamanId`);

--
-- Tablo için indeksler `dersprogramlari`
--
ALTER TABLE `dersprogramlari`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DersId` (`DersId`),
  ADD KEY `OgretmenId` (`OgretmenId`),
  ADD KEY `SinifId` (`SinifId`);

--
-- Tablo için indeksler `donemler`
--
ALTER TABLE `donemler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `ekdersler`
--
ALTER TABLE `ekdersler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgretmenId` (`OgretmenId`),
  ADD KEY `DersId` (`DersId`);

--
-- Tablo için indeksler `haftalar`
--
ALTER TABLE `haftalar`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `mailler`
--
ALTER TABLE `mailler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `notlar`
--
ALTER TABLE `notlar`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgrenciId` (`OgrenciId`),
  ADD KEY `DersId` (`DersId`);

--
-- Tablo için indeksler `ogrencigirisleri`
--
ALTER TABLE `ogrencigirisleri`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgrenciId` (`OgrenciId`);

--
-- Tablo için indeksler `ogrenciler`
--
ALTER TABLE `ogrenciler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BolumId` (`BolumId`);

--
-- Tablo için indeksler `ogretmengirisleri`
--
ALTER TABLE `ogretmengirisleri`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgretmenId` (`OgretmenId`);

--
-- Tablo için indeksler `ogretmenler`
--
ALTER TABLE `ogretmenler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BolumId` (`BolumId`);

--
-- Tablo için indeksler `transkriptler`
--
ALTER TABLE `transkriptler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgrenciId` (`OgrenciId`),
  ADD KEY `DersId` (`DersId`);

--
-- Tablo için indeksler `veliler`
--
ALTER TABLE `veliler`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgrenciId` (`OgrenciId`);

--
-- Tablo için indeksler `yoklamalar`
--
ALTER TABLE `yoklamalar`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OgrenciId` (`OgrenciId`),
  ADD KEY `HaftaId` (`HaftaId`),
  ADD KEY `DersId` (`DersId`),
  ADD KEY `OgretmenId` (`OgretmenId`),
  ADD KEY `SinifId` (`SinifId`);

--
-- Tablo için indeksler `zamanlar`
--
ALTER TABLE `zamanlar`
  ADD PRIMARY KEY (`Id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bolumler`
--
ALTER TABLE `bolumler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `bursiyerler`
--
ALTER TABLE `bursiyerler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `derskayitlari`
--
ALTER TABLE `derskayitlari`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `dersler`
--
ALTER TABLE `dersler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `derslikler`
--
ALTER TABLE `derslikler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `derslik_zamanlar`
--
ALTER TABLE `derslik_zamanlar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `dersprogramlari`
--
ALTER TABLE `dersprogramlari`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `donemler`
--
ALTER TABLE `donemler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ekdersler`
--
ALTER TABLE `ekdersler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `haftalar`
--
ALTER TABLE `haftalar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `mailler`
--
ALTER TABLE `mailler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `notlar`
--
ALTER TABLE `notlar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ogrencigirisleri`
--
ALTER TABLE `ogrencigirisleri`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ogrenciler`
--
ALTER TABLE `ogrenciler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ogretmengirisleri`
--
ALTER TABLE `ogretmengirisleri`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ogretmenler`
--
ALTER TABLE `ogretmenler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `transkriptler`
--
ALTER TABLE `transkriptler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `veliler`
--
ALTER TABLE `veliler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `yoklamalar`
--
ALTER TABLE `yoklamalar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `zamanlar`
--
ALTER TABLE `zamanlar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bursiyerler`
--
ALTER TABLE `bursiyerler`
  ADD CONSTRAINT `bursiyerler_ibfk_1` FOREIGN KEY (`BolumId`) REFERENCES `bolumler` (`Id`);

--
-- Tablo kısıtlamaları `derskayitlari`
--
ALTER TABLE `derskayitlari`
  ADD CONSTRAINT `derskayitlari_ibfk_1` FOREIGN KEY (`OgrenciId`) REFERENCES `ogrenciler` (`Id`),
  ADD CONSTRAINT `derskayitlari_ibfk_2` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`),
  ADD CONSTRAINT `derskayitlari_ibfk_3` FOREIGN KEY (`DonemId`) REFERENCES `donemler` (`Id`);

--
-- Tablo kısıtlamaları `dersler`
--
ALTER TABLE `dersler`
  ADD CONSTRAINT `dersler_ibfk_1` FOREIGN KEY (`OgretmenId`) REFERENCES `ogretmenler` (`Id`),
  ADD CONSTRAINT `dersler_ibfk_2` FOREIGN KEY (`BolumId`) REFERENCES `bolumler` (`Id`);

--
-- Tablo kısıtlamaları `derslik_zamanlar`
--
ALTER TABLE `derslik_zamanlar`
  ADD CONSTRAINT `derslik_zamanlar_ibfk_1` FOREIGN KEY (`DerslikId`) REFERENCES `derslikler` (`Id`),
  ADD CONSTRAINT `derslik_zamanlar_ibfk_2` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`),
  ADD CONSTRAINT `derslik_zamanlar_ibfk_3` FOREIGN KEY (`ZamanId`) REFERENCES `zamanlar` (`Id`);

--
-- Tablo kısıtlamaları `dersprogramlari`
--
ALTER TABLE `dersprogramlari`
  ADD CONSTRAINT `dersprogramlari_ibfk_1` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`),
  ADD CONSTRAINT `dersprogramlari_ibfk_2` FOREIGN KEY (`OgretmenId`) REFERENCES `ogretmenler` (`Id`),
  ADD CONSTRAINT `dersprogramlari_ibfk_3` FOREIGN KEY (`SinifId`) REFERENCES `derslikler` (`Id`);

--
-- Tablo kısıtlamaları `ekdersler`
--
ALTER TABLE `ekdersler`
  ADD CONSTRAINT `ekdersler_ibfk_1` FOREIGN KEY (`OgretmenId`) REFERENCES `ogretmenler` (`Id`),
  ADD CONSTRAINT `ekdersler_ibfk_2` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`);

--
-- Tablo kısıtlamaları `notlar`
--
ALTER TABLE `notlar`
  ADD CONSTRAINT `notlar_ibfk_1` FOREIGN KEY (`OgrenciId`) REFERENCES `ogrenciler` (`Id`),
  ADD CONSTRAINT `notlar_ibfk_2` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`);

--
-- Tablo kısıtlamaları `ogrencigirisleri`
--
ALTER TABLE `ogrencigirisleri`
  ADD CONSTRAINT `ogrencigirisleri_ibfk_1` FOREIGN KEY (`OgrenciId`) REFERENCES `ogrenciler` (`Id`);

--
-- Tablo kısıtlamaları `ogrenciler`
--
ALTER TABLE `ogrenciler`
  ADD CONSTRAINT `ogrenciler_ibfk_1` FOREIGN KEY (`BolumId`) REFERENCES `bolumler` (`Id`);

--
-- Tablo kısıtlamaları `ogretmengirisleri`
--
ALTER TABLE `ogretmengirisleri`
  ADD CONSTRAINT `ogretmengirisleri_ibfk_1` FOREIGN KEY (`OgretmenId`) REFERENCES `ogretmenler` (`Id`);

--
-- Tablo kısıtlamaları `ogretmenler`
--
ALTER TABLE `ogretmenler`
  ADD CONSTRAINT `ogretmenler_ibfk_1` FOREIGN KEY (`BolumId`) REFERENCES `bolumler` (`Id`);

--
-- Tablo kısıtlamaları `transkriptler`
--
ALTER TABLE `transkriptler`
  ADD CONSTRAINT `transkriptler_ibfk_1` FOREIGN KEY (`OgrenciId`) REFERENCES `ogrenciler` (`Id`),
  ADD CONSTRAINT `transkriptler_ibfk_2` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`);

--
-- Tablo kısıtlamaları `veliler`
--
ALTER TABLE `veliler`
  ADD CONSTRAINT `veliler_ibfk_1` FOREIGN KEY (`OgrenciId`) REFERENCES `ogrenciler` (`Id`);

--
-- Tablo kısıtlamaları `yoklamalar`
--
ALTER TABLE `yoklamalar`
  ADD CONSTRAINT `yoklamalar_ibfk_1` FOREIGN KEY (`OgrenciId`) REFERENCES `ogrenciler` (`Id`),
  ADD CONSTRAINT `yoklamalar_ibfk_2` FOREIGN KEY (`HaftaId`) REFERENCES `haftalar` (`Id`),
  ADD CONSTRAINT `yoklamalar_ibfk_3` FOREIGN KEY (`DersId`) REFERENCES `dersler` (`Id`),
  ADD CONSTRAINT `yoklamalar_ibfk_4` FOREIGN KEY (`OgretmenId`) REFERENCES `ogretmenler` (`Id`),
  ADD CONSTRAINT `yoklamalar_ibfk_5` FOREIGN KEY (`SinifId`) REFERENCES `derslikler` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
