-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2023 at 03:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multivendor_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house_no` varchar(40) NOT NULL,
  `floor_no` varchar(40) NOT NULL,
  `flat_no` varchar(40) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `langitude` varchar(255) NOT NULL,
  `location` int(11) NOT NULL,
  `address_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`) VALUES
(4, 40, 8),
(10, 34, 8),
(11, 40, 23),
(12, 40, 22),
(13, 40, 8),
(14, 34, 36),
(15, 34, 36),
(16, 34, 8),
(17, 34, 8),
(18, 34, 22);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name_en` varchar(100) NOT NULL,
  `cat_name_ar` varchar(100) NOT NULL,
  `cat_img` varchar(250) NOT NULL,
  `cat_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name_en`, `cat_name_ar`, `cat_img`, `cat_created`) VALUES
(1, '\r\nlaptob\r\n', 'لابتوب', 'labtop.png', '2023-10-15 21:00:00'),
(2, 'mobile', 'موبايل', 'mobile.png', '2023-10-15 21:00:00'),
(3, 'television', 'تلفزيون', 'tv.png', '2023-10-16 12:55:41'),
(4, 'shoes', 'احذيه', 'shoes.png', '2023-10-20 01:58:06'),
(5, 'watches', 'ساعات', 'Watches.png', '2023-10-20 01:58:59'),
(6, 'Clothing', 'ملابس', 'Clothing.png', '2023-10-20 11:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `cupon`
--

CREATE TABLE `cupon` (
  `cupon_id` int(11) NOT NULL,
  `cupon_name` varchar(150) NOT NULL,
  `cupon_count` int(20) NOT NULL,
  `cupon_expired` datetime NOT NULL,
  `cupon_discount` int(11) NOT NULL,
  `count_per_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cupon`
--

INSERT INTO `cupon` (`cupon_id`, `cupon_name`, `cupon_count`, `cupon_expired`, `cupon_discount`, `count_per_user`) VALUES
(1, 'amr esmail', 0, '2023-11-18 23:59:59', 10, 2),
(2, 'ahmed ali', 6, '2023-11-18 06:30:47', 12, 2),
(3, 'ismail galal', 3, '2023-11-19 22:13:39', 15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `favourite_id` int(11) NOT NULL,
  `favourite_usersid` int(11) NOT NULL,
  `favourite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`favourite_id`, `favourite_usersid`, `favourite_itemsid`) VALUES
(6, 41, 36),
(10, 40, 48),
(11, 40, 39);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name_en` varchar(200) NOT NULL,
  `item_name_ar` varchar(200) NOT NULL,
  `item_description_en` varchar(250) NOT NULL,
  `item_description_ar` varchar(250) NOT NULL,
  `item_img` varchar(250) NOT NULL,
  `item_price` float NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_discount` smallint(6) NOT NULL,
  `item_active` tinyint(1) NOT NULL,
  `item_craeted` timestamp NOT NULL DEFAULT current_timestamp(),
  `item_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name_en`, `item_name_ar`, `item_description_en`, `item_description_ar`, `item_img`, `item_price`, `item_quantity`, `item_discount`, `item_active`, `item_craeted`, `item_category`) VALUES
(7, 'iphone 13 pro max', 'ايفون13', 'The iPhone 13 is the successor to Apple\'s best selling iPhone 12, and it improves upon a successful formula: $800 price for a flagship processor and a 6.1-inch screen size that is not too large, nor too small. The iPhone 13 brings a new Apple A15 Bio', 'يعد iPhone 13 هو خليفة iPhone 12 الأكثر مبيعًا من Apple، وهو يعمل على تحسين صيغة ناجحة: سعر 800 دولار للمعالج الرئيسي وحجم شاشة 6.1 بوصة ليس كبيرًا جدًا ولا صغيرًا جدًا. يقدم iPhone 13 شريحة Apple A15 Bionic الجديدة وتحسينات عليه', 'iphone13.png', 25000, 10, 40, 1, '2023-10-23 19:58:23', 2),
(8, 'iphone 15 pro max', 'ايفون15', 'The iPhone 15 Plus comes with 6.7-inch OLED display and Apple Bionic 16 processor. On the Back there is a Dual camera setup with 48MP main camera and 12MP Ultra-wide sensor.', 'يأتي هاتف \"iPhone 15 Plus\" بشاشة \"OLED\" مقاس 6.7 بوصة ومعالج \"Apple Bionic 16\". يوجد في الخلف إعداد كاميرا مزدوجة مع كاميرا رئيسية بدقة 48 ميجابكسل ومستشعر فائق الاتساع بدقة 12 ميجابكسل.', 'iphone15.png', 70000, 10, 20, 1, '2023-10-23 20:03:11', 2),
(12, 'samsung galaxy note 20 ultra', 'سامسونج جالاكسي نوت 20', 'The Samsung Galaxy Note 20 Ultra closely follows the Galaxy S20 Ultra in terms of design. Specs-wise, we have the Snapdragon 865 chipset and an Exynos one to match in all non-US regions accompanied by 12GB of RAM and up to 512GB storage. At the back ', 'يتبع \"Samsung Galaxy Note 20 Ultra\" عن كثب هاتف \"Galaxy S20 Ultra\" من حيث التصميم. من حيث المواصفات، لدينا مجموعة شرائح \"Snapdragon 865\" و \"Exynos\" لتتناسب مع جميع المناطق خارج الولايات المتحدة مصحوبة بذاكرة وصول عشوائي (RAM) تبلغ 12 جيجابايت ومساحة ', 'galaxynote20ultra.png', 34000, 10, 10, 1, '2023-10-23 22:45:46', 2),
(14, 'huawei p50 pro', 'هواوي \"p50\" برو\r\n', 'The Huawei P50 Pro uses the new operating system from Huawei - HarmonyOS. Specifications include 6.6-inch OLED display with 120Hz refresh rate, Qualcomm Snapdragon 888 4G processor, 4360mAh battery with 66Wcharging speed and 50W wireless charging spe', 'يستخدم هاتف \"Huawei P50 Pro\" نظام التشغيل الجديد من هواوي - \"HarmonyOS\". تشمل المواصفات شاشة OLED مقاس 6.6 بوصة مع معدل تحديث 120 هرتز، ومعالج \"Qualcomm Snapdragon 888 4G\" وبطارية 4360 مللي أمبير مع سرعة شحن 66 وات وسرعة شحن لاسلكي 50 وات، وإعداد كام', 'huaweip50.png', 25000, 10, 30, 1, '2023-10-23 22:55:44', 2),
(15, '2021 Apple MacBook Pro (14-inch, Apple M1 Pro chip with 8â€‘core CPU and 14â€‘core GPU, 16GB RAM, 512GB SSD) - Space Grey', '\"2021 Apple MacBook Pro\" (14 بوصة، شريحة \"Apple M1 Pro\" مع وحدة معالجة مركزية 8 أنوية ووحدة معالجة رسومات 14 نواة، وذاكرة وصول عشوائي سعتها 16 جيجابايت، ومحرك أقراص SSD سعة 512 جيجابايت) - رمادي فلكي', 'Brand Name	Apple\r\nScreen Size	14 Inches\r\nColor	Space Gray\r\nHard Disk Size	512 GB\r\nCPU Model	Apple M1\r\nRAM Memory Installed	16 GB\r\nOperating System	Mac OS\r\nGraphics Description	Integrated\r\nCPU Speed	3.2 GHz\r\nItem Weight	2.65 Kilograms', 'اسم العلامة التجارية أبل\r\nحجم الشاشة 14 بوصة\r\nاللون رمادي فضائي\r\nحجم القرص الصلب 512 جيجا بايت\r\nنموذج وحدة المعالجة المركزية أبل M1\r\nذاكرة الوصول العشوائي المثبتة 16 جيجابايت\r\nنظام التشغيل ماك OS\r\nوصف الرسومات متكامل\r\nسرعة وحدة المعالجة المركزية 3.2 ', 'MacBookPro.png', 88000, 5, 15, 1, '2023-10-27 20:36:52', 1),
(18, '13-inch MacBook Air: Apple M2 chip with 8-core CPU and 8-core GPU, 256GB - Midnight', 'جهاز \"MacBook Air\" مقاس 13 بوصة: شريحة \"Apple M2\" مع وحدة معالجة مركزية 8 النواة ووحدة معالجة رسومات 8 نواة، وسعة 256 جيجابايت ', 'Brand Name	Apple\r\nScreen Size	13 Inches\r\nHard Disk Size	256 GB\r\nCPU Model	6X86\r\nRAM Memory Installed	8 GB\r\nOperating System	Mac OS\r\nGraphics Description	Dedicated\r\nCPU Speed	0.13\r\nHard Disk Description	Emmc\r\nResolution	1280 x 720', 'اسم العلامة التجارية أبل\r\nحجم الشاشة 13 بوصة\r\nحجم القرص الصلب 256 جيجا بايت\r\nنموذج وحدة المعالجة المركزية 6X86\r\nذاكرة الوصول العشوائي المثبتة 8 جيجابايت\r\nنظام التشغيل ماك OS\r\nوصف الرسومات مخصص\r\nسرعة وحدة المعالجة المركزية 0.13\r\nوصف القرص الصلب \"Emmc\"', 'MacBookAir1.png', 61500, 5, 25, 1, '2023-10-27 20:49:33', 1),
(20, 'HP Victus 15-fb0028nr Gaming Laptop - Ryzen 7-5800H 8-Cores, 16GB RAM, 512GB SSD, NVIDIA RTX3050Ti 4GB GDDR6 Graphics, 15.6\" FHD (1920x1080) IPS 144Hz, Backlit Keyboard, Windows 11- Mica Silver', 'لاب توب اتش بي \"Victus 15-fb0028nr\" للألعاب - \"Ryzen 7\"-\"5800H 8-Cores\"، رام 16 جيجا، 512 جيجا SSD، رسومات \"NVIDIA RTX3050Ti\" 4 جيجا GDDR6، شاشة 15.6 بوصة FHD (1920x1080) IPS 144 هرتز، لوحة مفاتيح بإض', '\r\nBrand Name	HP\r\nModel Name	15-fb0028nr\r\nScreen Size	15.6 Inches\r\nHard Disk Size	512 GB\r\nCPU Model	AMD Ryzen 7 5800H\r\nRAM Memory Installed	16 GB\r\nOperating System	Windows 11\r\nSpecial Features	Graphics : NVIDIA® GeForce RTX™ 3050 Ti Laptop GPU (4 GB G', 'اسم العلامة التجارية :HP\r\nاسم الموديل 15-\"fb0028nr\"\r\nحجم الشاشة 15.6 بوصة\r\nحجم القرص الصلب 512 جيجا بايت\r\nطراز وحدة المعالجة المركزية AMD Ryzen 7 5800H\r\nذاكرة الوصول العشوائي المثبتة 16 جيجابايت\r\nنظام التشغيل ويندوز 11\r\nميزات خاصة للرسومات: وحدة معال', 'HPVictus15.png', 44000, 7, 0, 1, '2023-10-27 21:01:56', 1),
(22, 'HP Victus 15-fa0032dx Gaming Laptop - 12th Intel Core i7-12650H 10-Cores, 16GB RAM, 512GB SSD, NVIDIA RTX3050Ti 4GB GDDR6 Graphics, 15.6\" FHD (1920x1080) IPS 144Hz, Backlit KB, Windows 11- Mica Silver', 'لاب توب اتش بي فيكتوس 15-fa0032dx للألعاب - معالج انتل كور i7-12650H الثاني عشر، 10 نواة، رام 16 جيجا، 512 جيجا اس اس دي، رسومات \"NVIDIA RTX3050Ti\" 4 جيجا GDDR6، شاشة 15.6 بوصة فل اتش دي (1920x1080) I', 'Brand Name	HP\r\nModel Name	15-fa0032dx\r\nScreen Size	15.6 Inches\r\nColor	Silver Mica\r\nHard Disk Size	512 GB\r\nCPU Model	Intel Core i7\r\nRAM Memory Installed	16 GB\r\nOperating System	Windows 11\r\nSpecial Features	Graphics : NVIDIA® GeForce RTX™ 3050 Ti Lapto', 'اسم العلامة التجارية HP\r\nاسم الموديل 15-fa0032dx\r\nحجم الشاشة 15.6 بوصة\r\nاللون فضي ميكا\r\nحجم القرص الصلب 512 جيجا بايت\r\nطراز وحدة المعالجة المركزية Intel Core i7\r\nذاكرة الوصول العشوائي المثبتة 16 جيجابايت\r\nنظام التشغيل ويندوز 11\r\nميزات خاصة للرسومات: ', 'HPVictus2.png', 46000, 10, 0, 1, '2023-10-27 21:06:03', 1),
(23, 'HP 15s-eq2009ne Laptop - Ryzen 7 5700U 8-Cores, 8GB RAM, 512GB SSD, AMD Radeon Graphics, 15.6\" FHD (1920 x 1080) micro-edge anti-glare 250 nits, Dos - Jet Black', 'لاب توب اتش بي 15s-eq2009ne - رايزن 7 5700U ثماني النواة، رام 8 جيجا، 512 جيجا اس اس دي، رسومات ايه ام دي راديون، شاشة 15.6 بوصة فل اتش دي (1920 × 1080) ميكرو ايدج مضادة للتوهج 250 شمعة في المتر المرب', 'Brand Name	HP\r\nModel Name	15s-eq2009ne\r\nScreen Size	15.6 Inches\r\nColor	Black\r\nHard Disk Size	512 GB\r\nCPU Model	Ryzen 7 5700U\r\nRAM Memory Installed	8 GB\r\nOperating System	DOS\r\nSpecial Features	AMD Ryzen™ 7 5700U (up to 4.3 GHz max boost clock, 8 MB L3', 'اسم العلامة التجارية HP\r\nاسم الموديل 15s-eq2009ne\r\nحجم الشاشة 15.6 بوصة\r\nلون أسود\r\nحجم القرص الصلب 512 جيجا بايت\r\nوحدة المعالجة المركزية طراز Ryzen 7 5700U\r\nذاكرة الوصول العشوائي المثبتة 8 جيجابايت\r\nنظام التشغيل دوس\r\nميزات خاصة AMD Ryzen™ 7 5700U (تص', 'HP15s.png', 25600, 1, 5, 1, '2023-10-27 21:25:58', 1),
(24, 'Samsung 43 Inch Full HD Smart LED TV with Built-in Receiver - Black - UA43T5300AUXEG\r\nVisit the SAMSUNG Store', 'تلفزيون سامسونج 43 بوصة ذكي LED بدقة Full HD مع رسيفر داخلي - أسود - UA43T5300AUXEG\r\nقم بزيارة متجر سامسونج', 'Screen Size	43 Inches\r\nBrand Name	SAMSUNG\r\nSupported Internet Services	Netflix, Amazon Instant Video, YouTube\r\nDisplay Technology	LED\r\nItem Dimensions D x W x H	17D x 98W x 59.7H centimeters\r\nColor	black\r\nMounting Type	Table Mount\r\nItem Weight	8.4 Ki', 'حجم الشاشة 43 بوصة\r\nاسم العلامة التجارية سامسونج\r\nخدمات الإنترنت المدعومة: Netflix، Amazon Instant Video، YouTube\r\nتكنولوجيا العرض LED\r\nأبعاد المنتج العمق × العرض × الارتفاع 17 عمق × 98 عرض × 59.7 ارتفاع سم\r\nلون أسود\r\nنوع التركيب: حامل الطاولة\r\nوزن ا', 'Samsung43.png', 9499, 15, 14, 1, '2023-10-27 21:45:15', 3),
(25, 'Samsung 32 Inch Full HD Smart LED TV with Built-in Receiver - Black - UA32T5300AUXEG', 'تلفزيون سامسونج 32 بوصة ذكي \"LED\" بدقة \"Full HD\" مع رسيفر داخلي - أسود - \"UA32T5300AUXEG\"', 'Screen Size	32 Inches\r\nBrand Name	SAMSUNG\r\nSupported Internet Services	Netflix, Amazon Instant Video, YouTube\r\nDisplay Technology	LED\r\nItem Dimensions D x W x H	15.1D x 73.7W x 46.5H centimeters\r\nResolution	720p\r\nRefresh Rate	240\r\nModel Name	UA32T530', 'حجم الشاشة 32 بوصة\r\nاسم العلامة التجارية سامسونج\r\nخدمات الإنترنت المدعومة: Netflix، Amazon Instant Video، YouTube\r\nتكنولوجيا العرض LED\r\nأبعاد المنتج D × العرض × الارتفاع 15.1 عمق × 73.7 عرض × 46.5 ارتفاع سم\r\nالقرار 720p\r\nمعدل التحديث 240\r\nاسم الموديل', 'Samsung32.png', 6289, 10, 35, 1, '2023-10-27 21:48:43', 3),
(26, 'Samsung 65 Inch 4K UHD Smart LED TV with Built-in Receiver and Remote Control - Black - UA65CU7000UXEG [2023 Model]', 'تلفزيون سامسونج 65 بوصة ذكي 4K UHD LED مع رسيفر داخلي وجهاز تحكم عن بعد - أسود - UA65CU7000UXEG [موديل 2023]', 'Screen Size	65 Inches\r\nBrand Name	Samsung\r\nSupported Internet Services	Netflix, Amazon Instant Video, YouTube\r\nDisplay Technology	LED\r\nItem Dimensions D x W x H	28.2D x 144.9W x 90.7H centimeters\r\nResolution	4K\r\nRefresh Rate	60\r\nSpecial Features	Flat', 'حجم الشاشة 65 بوصة\r\nاسم العلامة التجارية سامسونج\r\nخدمات الإنترنت المدعومة: Netflix، Amazon Instant Video، YouTube\r\nتكنولوجيا العرض LED\r\nأبعاد المنتج D × العرض × الارتفاع 28.2 عمق × 144.9 عرض × 90.7 ارتفاع سم\r\nالقرار 4K\r\nمعدل التحديث 60\r\nميزات خاصة مس', 'Samsung65.png', 17259, 15, 22, 1, '2023-10-27 21:55:37', 3),
(27, 'Xiaomi Redmi Watch Lite 2 Smartwatch (1.55 Inch TFTLCD Touch Screen, Measurement/Monitoring Heart Rate & Sleep Cycle, GPS, Barometric & Altimeter, 17 Sports Modes, 5 ATM, 10 Days Battery Life) Black', 'ساعة ذكية \"Xiaomi Redmi Watch Lite 2\" (شاشة لمس \"TFTLCD\" مقاس 1.55 بوصة، قياس/مراقبة معدل ضربات القلب ودورة النوم، نظام تحديد المواقع العالمي (GPS)، مقياس الضغط الجوي ومقياس الارتفاع، 17 وضعًا رياضيًا', 'Brand Name	Xiaomi\r\nModel Name	Xiaomi Redmi\r\nStyle	Modern\r\nColor	Black\r\nScreen Size	1.55 Inches\r\nSpecial Features	Time Display, Elevation Tracker, GPS\r\nItem Shape	Square\r\nTarget Audience	unisex adults\r\nCompatible Devices	Smartphone\r\nDisplay Type	LCD', 'اسم العلامة التجارية Xiaomi\r\nاسم الموديل شياومي ريدمي\r\nالطراز حديث\r\nلون أسود\r\nحجم الشاشة 1.55 بوصة\r\nميزات خاصة: عرض الوقت، متتبع الارتفاع، نظام تحديد المواقع العالمي (GPS).\r\nشكل السلعة مربع\r\nالجمهور المستهدف من الجنسين البالغين\r\nالأجهزة المتوافقة اله', 'XiaomiRedmiWatch.png', 1699, 20, 0, 1, '2023-10-27 22:00:30', 5),
(29, 'Smart Watch WS89 Ultra Wireless Charger Smart Smart and Modern, Comfortable Hand Wear High Quality Materials Smart Watch with Metal Band and 2 Silicone Bands', 'ساعة ذكية WS89 شاحن لاسلكي الترا ساعة ذكية ذكية وعصرية ومريحة للارتداء باليد خامات عالية الجودة ساعة ذكية بسوار معدني و2 شريط سيليكون', 'Brand Name	Generic\r\nStyle	Modern\r\nColor	blue\r\nItem Shape	Round\r\nTarget Audience	Unisex Adults, Unisex Youth\r\nCompatible Devices	Smartphone\r\nBand Material Type	Silicone\r\nBand Color	Black\r\nConnectivity Technology	Bluetooth\r\nCase Material Type	Metal', 'اسم العلامة التجارية عام\r\nالطراز حديث\r\nلون أزرق\r\nشكل السلعة مستدير\r\nالجمهور المستهدف للجنسين البالغين والشباب من الجنسين\r\nالأجهزة المتوافقة الهاتف الذكي\r\nنوع مادة السوار: سيليكون\r\nلون السوار أسود\r\nتقنية الاتصال بلوتوث\r\nنوع مادة الهيكل: معدن', 'SmartWatchWS89.png', 1750, 15, 10, 1, '2023-10-27 22:13:04', 5),
(30, 'Tommy Hilfiger Trainers , white', 'حذاء رياضي من تومي هيلفيغر، أبيض', 'Sneaker by TOMMY JEANS\r\nModel: WMNS Tommy Jeans Skate Sneaker\r\nMaterial: Leather/durable fabric\r\nExtras: rounded toe/6-hole lacing/logo details/lightly profiled outsole/removable padded insole\r\nplatform height approx. 2.5cm\r\nheel height approx. 3cm\r\n', 'حذاء رياضي من تومي جينز\r\nالموديل: WMNS Tommy Jeans حذاء تزلج رياضي\r\nالمواد: جلد/نسيج متين\r\nالإضافات: مقدمة مستديرة/ رباط بـ 6 فتحات/ تفاصيل الشعار/ نعل خارجي خفيف الشكل/ نعل داخلي مبطن قابل للإزالة\r\nارتفاع المنصة تقريبًا. 2.5 سم\r\nارتفاع الكعب تقريبًا', 'TommyHilfigerTrainers.png', 2550, 20, 0, 1, '2023-10-27 22:21:38', 4),
(31, 'Tommy Hilfiger Trainers , blue/white/brown\r\n', 'حذاء رياضي من تومي هيلفيغر، أزرق/أبيض/بني', 'trainers by Tommy Hilfiger\r\nmodel: Modern Prep Monogram\r\nMaterial: Leather/durable fabric\r\nExtras: Rounded cap/7-hole lacing/logo details/profiled outsole/removable insole\r\nplatform height approx. 2.5cm\r\nheel height approx. 4cm\r\nouter material: leath', 'حذاء رياضي من تومي هيلفيغر\r\nالموديل: المونوغرام الإعدادي الحديث\r\nالمواد: جلد/نسيج متين\r\nالإضافات: غطاء مستدير/ رباط ذو 7 فتحات/ تفاصيل الشعار/ نعل خارجي محدد/ نعل داخلي قابل للإزالة\r\nارتفاع المنصة تقريبًا. 2.5 سم\r\nارتفاع الكعب تقريبًا. 4 سم\r\nالمادة ا', 'TommyHilfigerTrainers2.png', 2900, 20, 0, 1, '2023-10-27 22:24:29', 4),
(33, 'Vans Classic Old Skool trainers in black and white', 'حذاء \"Vans Classic Old Skool\" باللونين الأبيض والأسود', 'Your casualwear companions\r\nLow-profile design\r\nLace-up fastening\r\nPadded cuff\r\nSignature Vans branding\r\nOld Skool stripe to sides\r\n\'Off The Wall\' heel tab\r\nReinforced toe caps\r\nDurable rubber outsole\r\nSignature waffle tread', 'رفاقك في الملابس الكاجوال\r\nتصميم منخفض المستوى\r\nإغلاق برباط\r\nصفعة مبطنة\r\nالعلامة التجارية فانز المميزة\r\nشريط Old Skool على الجانبين\r\nعروة الكعب \"Off The Wall\".\r\nأغطية أصابع معززة\r\nنعل خارجي مطاطي متين\r\nمداس الوافل المميز', 'VansClassic.png', 450, 20, 0, 1, '2023-10-27 23:04:05', 4),
(34, 'Vans Lowland trainers in freshman tan', 'حذاء Vans Lowland باللون البني الفاتح', 'Low-profile design\r\nLace-up fastening\r\nPadded tongue and cuff\r\nSignature Vans branding\r\nPerforated for ventilation\r\nDurable rubber outsole\r\nTextured grip tread', 'تصميم منخفض المستوى\r\nإبزيم برباط\r\nلسان وأساور مبطنة\r\nالعلامة التجارية فانز المميزة\r\nمثقوبة للتهوية\r\nنعل خارجي مطاطي متين\r\nمداس ذو قبضة مزخرفة', 'VansLowland.png', 550, 20, 32, 1, '2023-10-27 23:06:58', 4),
(36, 'Levi\'s t-shirt in navy with sport chest logo', 'تي شيرت Levi\'s باللون الأزرق الداكن مع شعار الصدر الرياضي', 'The ultimate all-rounder\r\nCrew neck\r\nShort sleeves\r\nLogo print\r\nRegular fit', 'في نهاية التيشرت كل مستدير\r\nطاقم الرقبة\r\nأكمام قصيرة\r\nطباعة الشعار\r\nتناسب منتظم', 'Levishirt.png', 500, 10, 50, 1, '2023-10-27 23:17:55', 6),
(37, 'Vans colourblock t-shirt in white and green', 'تيشيرت من Vans باللونين الأبيض والأخضر', 'Basket-worthy find\r\nCrew neck\r\nShort sleeves\r\nLogo print to chest\r\nRegular fit', 'طاقم الرقبة\r\nأكمام قصيرة\r\nطباعة الشعار على الصدر\r\nتناسب منتظم', 'Vanscolourblock.png', 650, 10, 20, 1, '2023-10-27 23:25:53', 6),
(38, 'oversized t-shirt in ribbed velour with embroidery logo in green', 'تي شيرت كبير الحجم من القطيفة المضلعة مع شعار مطرز باللون الأخضر', 'The ultimate all-rounder\r\nCrew neck\r\nShort sleeves\r\nLogo embroidery detail\r\nOversized fit', 'في نهاية التيشرت كل مستدير\r\nطاقم الرقبة\r\nأكمام قصيرة\r\nتفاصيل تطريز الشعار\r\nمقاس كبير', 'oversized1.png', 400, 10, 50, 1, '2023-10-27 23:29:56', 6),
(39, 'oversized t-shirt in washed brown with angel back print', 'تي شيرت كبير الحجم باللون البني المغسول مع طباعة خلفية ملائكية', 'The ultimate all-rounder\r\nCrew neck\r\nDrop shoulders\r\nGraphic print details\r\nOversized fit', 'في نهاية التيشرت كل مستدير\r\nطاقم الرقبة\r\nإسقاط الكتفين\r\nتفاصيل طباعة جرافيك\r\nمقاس كبير', 'oversized2.png', 600, 10, 44, 1, '2023-10-27 23:33:07', 6),
(41, 'Komono harlow estate watch in silver', 'ساعة كومونو هارلو إستيت باللون الفضي', 'Something for your wrist\r\nModel number: KOM-W4128\r\nBracelet strap\r\nCircular bezel\r\nBranded dial\r\nDash hour markers\r\nQuartz movement\r\nFold-over clasp\r\n3ATM – water resistant to 30 metres (100 feet)\r\nIn other words, it’s splash and rain resistant\r\n2 ye', 'شيء لمعصمك\r\nرقم الموديل: KOM-W4128\r\nحزام سوار\r\nمدي دائري\r\nقرص ذو علامة تجارية\r\nعلامات ساعة داش\r\nحركة الكوارتز\r\nمشبك قابل للطي\r\n3ATM - مقاومة للماء حتى عمق 30 مترًا (100 قدم)\r\nوبعبارة أخرى، فهو مقاوم للرذاذ والمطر\r\nضمان التصنيع لمدة عامين', 'watchsilver.png', 750, 10, 35, 1, '2023-10-28 22:06:32', 5),
(42, 'Komono winston watch in black\r\n', 'ساعة كومونو ونستون باللون الأسود', 'Something for your wrist\r\nLeather strap\r\nMixed hour markers\r\nQuartz movement\r\nPin-buckle fastening\r\nTwin keepers\r\n3ATM – water resistant to 30 metres (100 feet)\r\nIn other words, it’s splash and rain resistant', 'شيء لمعصمك\r\nحزام من الجلد\r\nعلامات ساعة مختلطة\r\nحركة الكوارتز\r\nإبزيم بدبوس\r\nحراس التوأم\r\n3ATM - مقاومة للماء حتى عمق 30 مترًا (100 قدم)\r\nوبعبارة أخرى، فهو مقاوم للرذاذ والمطر', 'winstonwatch.png', 750, 10, 10, 1, '2023-10-28 22:09:31', 5),
(43, 'Casio MQ24S skeleton series silicone watch in black', 'ساعة كاسيو MQ24S هيكلية من السيليكون باللون الأسود', 'Something for your wrist\r\nSilicone strap\r\nBranded dial\r\nNumbered hour markers\r\nQuartz movement\r\nPin-buckle fastening\r\nSingle keeper', 'شيء لمعصمك\r\nحزام سيليكون\r\nقرص ذو علامة تجارية\r\nعلامات الساعة مرقمة\r\nحركة الكوارتز\r\nإبزيم بدبوس\r\nحارس واحد', 'CasioWatches.png', 900, 15, 15, 1, '2023-10-28 22:14:14', 5),
(45, 'Xiaomi Redmi Note 12 Pro+ Plus 5G (12GB+256GB, Blue)', 'هاتف Xiaomi Redmi Note 12 Pro+ Plus 5G (12 جيجابايت+256 جيجابايت، أزرق)', '\r\nBrand Name	Xiaomi\r\nModel Name	Xiaomi Redmi Note 12\r\nWireless Provider	Unlocked\r\nOperating System	Android 12.0\r\nCellular Technology	5G\r\nMemory Storage Capacity	256 GB\r\nConnectivity Technology	Wi-Fi\r\nColor	Blue\r\nScreen Size	6.67 Inches\r\nWireless Netw', 'اسم العلامة التجارية Xiaomi\r\nاسم الموديل Xiaomi Redmi Note 12\r\nموفر الشبكة اللاسلكية مفتوح\r\nنظام التشغيل أندرويد 12.0\r\nالتكنولوجيا الخلوية 5G\r\nسعة تخزين الذاكرة 256 جيجابايت\r\nتقنية الاتصال بالواي فاي\r\nلون أزرق\r\nحجم الشاشة 6.67 بوصة\r\nتقنية الشبكات الل', 'XiaomiNote12.png', 16500, 15, 500, 1, '2023-10-28 22:21:29', 2),
(48, 'Galaxy S23 Ultra 5G Dual SIM Green 12GB RAM 512GB ', 'جالاكسي S23 ألترا 5G ثنائي الشريحة، أخضر، 12 جيجابايت رام، 512 جيجابايت', 'Brand	SAMSUNG\r\nModel name	Galaxy S23 Ultra\r\nWireless carrier	Unlocked for All Carriers\r\nOperating system	Android 13.0\r\nCellular technology	5G', 'ماركة سامسونج\r\nاسم الموديل جالاكسي S23 الترا\r\nالناقل اللاسلكي مفتوح لجميع شركات النقل\r\nنظام التشغيل أندرويد 13.0\r\nالتكنولوجيا الخلوية 5G', 'GalaxyS23.png', 50000, 20, 5000, 1, '2023-10-28 22:28:08', 2),
(50, 'Samsung Galaxy M52 - Dual SIM, 8GB RAM, 128GB, 5G - White - 1 year Warranty', 'سامسونج جالاكسي M52 - ثنائي الشريحة، 8 جيجا رام، 128 جيجا، شبكة الجيل الخامس - ابيض - ضمان لمدة سنة', 'Brand Name	SAMSUNG\r\nModel Name	Galaxy M52\r\nWireless Provider	Unlocked for All Carriers\r\nOperating System	Android 11.0\r\nCellular Technology	5G\r\nMemory Storage Capacity	128 GB\r\nConnectivity Technology	Bluetooth, Wi-Fi, USB\r\nColor	White\r\nScreen Size	6.7', 'اسم العلامة التجارية سامسونج\r\nاسم الموديل جالاكسي M52\r\nموفر الشبكة اللاسلكية مفتوح لجميع شركات النقل\r\nنظام التشغيل أندرويد 11.0\r\nالتكنولوجيا الخلوية 5G\r\nسعة تخزين الذاكرة 128 جيجابايت\r\nتقنية الاتصال بلوتوث، واي فاي، USB\r\nاللون الابيض\r\nحجم الشاشة 6.7 ', 'SamsungGalaxyM52.png', 11500, 18, 400, 1, '2023-10-28 22:36:23', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `item_cat`
-- (See below for the actual view)
--
CREATE TABLE `item_cat` (
`cat_id` int(11)
,`cat_name_en` varchar(100)
,`cat_name_ar` varchar(100)
,`cat_img` varchar(250)
,`cat_created` timestamp
,`item_id` int(11)
,`item_name_en` varchar(200)
,`item_name_ar` varchar(200)
,`item_description_en` varchar(250)
,`item_description_ar` varchar(250)
,`item_img` varchar(250)
,`item_price` float
,`item_quantity` int(11)
,`item_discount` smallint(6)
,`item_active` tinyint(1)
,`item_craeted` timestamp
,`item_category` int(11)
,`price_after_discount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `item_whole`
-- (See below for the actual view)
--
CREATE TABLE `item_whole` (
`cat_id` int(11)
,`cat_name_en` varchar(100)
,`cat_name_ar` varchar(100)
,`cat_img` varchar(250)
,`cat_created` timestamp
,`item_id` int(11)
,`item_name_en` varchar(200)
,`item_name_ar` varchar(200)
,`item_description_en` varchar(250)
,`item_description_ar` varchar(250)
,`item_img` varchar(250)
,`item_price` float
,`item_quantity` int(11)
,`item_discount` smallint(6)
,`item_active` tinyint(4)
,`item_craeted` timestamp
,`item_category` int(11)
,`price_after_discount` double
,`favourite` int(1)
,`cart` int(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `verify_code` varchar(250) NOT NULL,
  `user_approval` varchar(10) NOT NULL,
  `account_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `img_profile` varchar(250) DEFAULT NULL,
  `feature_ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `email`, `password`, `phone`, `verify_code`, `user_approval`, `account_created`, `img_profile`, `feature_ban`) VALUES
(33, 'amr esmail', 'amrgalalamr1@gmail.com', '20122001', '01006539084', '73181', '0', '2023-10-09 21:17:12', NULL, 0),
(34, 'amr esmail', 'amrgalalamr11@gmail.com', '20122001', '01006539084', '19259', '0', '2023-10-09 21:19:40', NULL, 0),
(35, 'amr esmail', 'amrgalalamr15@gmail.com', '20122001', '01006539084', '93408', '0', '2023-10-09 21:26:06', NULL, 0),
(36, 'amr esmail', 'amrgalalamr150@gmail.com', '20122001', '01006539084', '53433', '0', '2023-10-09 21:28:34', NULL, 0),
(37, 'amr esmail', 'amrgalalam150@gmail.com', '20122001', '01006539084', '85395', '0', '2023-10-09 21:29:21', NULL, 0),
(39, 'amr esmail', 'amrgalala10@gmail.com', '20122001', '01006539084', '89893', '0', '2023-10-09 21:30:38', NULL, 0),
(40, 'amr esmail', 'amrgaala10@gmail.com', '20122001', '01006539084', '26875', '0', '2023-10-09 21:32:07', NULL, 0),
(41, 'amr esmail', 'yyttrexcghiiihgffv@gmail.com', 'amrgalal20122001001', '01006539084', '50575', '1', '2023-10-11 16:57:06', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_cupon`
--

CREATE TABLE `user_cupon` (
  `user_cupon_id` int(11) NOT NULL,
  `user_cupon_userid` int(11) DEFAULT NULL,
  `user_cupon_cuponid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_cupon`
--

INSERT INTO `user_cupon` (`user_cupon_id`, `user_cupon_userid`, `user_cupon_cuponid`) VALUES
(4, 41, 2),
(11, 41, 3),
(12, 41, 3),
(19, 41, 1),
(20, 41, 1),
(21, 40, 1),
(22, 40, 1),
(23, 39, 1);

-- --------------------------------------------------------

--
-- Structure for view `item_cat`
--
DROP TABLE IF EXISTS `item_cat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item_cat`  AS   (select `categories`.`cat_id` AS `cat_id`,`categories`.`cat_name_en` AS `cat_name_en`,`categories`.`cat_name_ar` AS `cat_name_ar`,`categories`.`cat_img` AS `cat_img`,`categories`.`cat_created` AS `cat_created`,`items`.`item_id` AS `item_id`,`items`.`item_name_en` AS `item_name_en`,`items`.`item_name_ar` AS `item_name_ar`,`items`.`item_description_en` AS `item_description_en`,`items`.`item_description_ar` AS `item_description_ar`,`items`.`item_img` AS `item_img`,`items`.`item_price` AS `item_price`,`items`.`item_quantity` AS `item_quantity`,`items`.`item_discount` AS `item_discount`,`items`.`item_active` AS `item_active`,`items`.`item_craeted` AS `item_craeted`,`items`.`item_category` AS `item_category`,`items`.`item_price` - `items`.`item_price` * `items`.`item_discount` / 100 AS `price_after_discount` from (`items` join `categories` on(`items`.`item_category` = `categories`.`cat_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `item_whole`
--
DROP TABLE IF EXISTS `item_whole`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item_whole`  AS SELECT `item_cat`.`cat_id` AS `cat_id`, `item_cat`.`cat_name_en` AS `cat_name_en`, `item_cat`.`cat_name_ar` AS `cat_name_ar`, `item_cat`.`cat_img` AS `cat_img`, `item_cat`.`cat_created` AS `cat_created`, `item_cat`.`item_id` AS `item_id`, `item_cat`.`item_name_en` AS `item_name_en`, `item_cat`.`item_name_ar` AS `item_name_ar`, `item_cat`.`item_description_en` AS `item_description_en`, `item_cat`.`item_description_ar` AS `item_description_ar`, `item_cat`.`item_img` AS `item_img`, `item_cat`.`item_price` AS `item_price`, `item_cat`.`item_quantity` AS `item_quantity`, `item_cat`.`item_discount` AS `item_discount`, `item_cat`.`item_active` AS `item_active`, `item_cat`.`item_craeted` AS `item_craeted`, `item_cat`.`item_category` AS `item_category`, `item_cat`.`price_after_discount` AS `price_after_discount`, 0 AS `favourite`, 0 AS `cart` FROM `item_cat` WHERE !(`item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `favourite`) where `item_cat`.`item_id` = `favourite`.`favourite_itemsid`)) AND !(`item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `cart`) where `item_cat`.`item_id` = `cart`.`cart_itemsid`))union select `item_cat`.`cat_id` AS `cat_id`,`item_cat`.`cat_name_en` AS `cat_name_en`,`item_cat`.`cat_name_ar` AS `cat_name_ar`,`item_cat`.`cat_img` AS `cat_img`,`item_cat`.`cat_created` AS `cat_created`,`item_cat`.`item_id` AS `item_id`,`item_cat`.`item_name_en` AS `item_name_en`,`item_cat`.`item_name_ar` AS `item_name_ar`,`item_cat`.`item_description_en` AS `item_description_en`,`item_cat`.`item_description_ar` AS `item_description_ar`,`item_cat`.`item_img` AS `item_img`,`item_cat`.`item_price` AS `item_price`,`item_cat`.`item_quantity` AS `item_quantity`,`item_cat`.`item_discount` AS `item_discount`,`item_cat`.`item_active` AS `item_active`,`item_cat`.`item_craeted` AS `item_craeted`,`item_cat`.`item_category` AS `item_category`,`item_cat`.`price_after_discount` AS `price_after_discount`,1 AS `favourite`,1 AS `cart` from `item_cat` where `item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `favourite`) where `item_cat`.`item_id` = `favourite`.`favourite_itemsid`) and `item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `cart`) where `item_cat`.`item_id` = `cart`.`cart_itemsid`) union select `item_cat`.`cat_id` AS `cat_id`,`item_cat`.`cat_name_en` AS `cat_name_en`,`item_cat`.`cat_name_ar` AS `cat_name_ar`,`item_cat`.`cat_img` AS `cat_img`,`item_cat`.`cat_created` AS `cat_created`,`item_cat`.`item_id` AS `item_id`,`item_cat`.`item_name_en` AS `item_name_en`,`item_cat`.`item_name_ar` AS `item_name_ar`,`item_cat`.`item_description_en` AS `item_description_en`,`item_cat`.`item_description_ar` AS `item_description_ar`,`item_cat`.`item_img` AS `item_img`,`item_cat`.`item_price` AS `item_price`,`item_cat`.`item_quantity` AS `item_quantity`,`item_cat`.`item_discount` AS `item_discount`,`item_cat`.`item_active` AS `item_active`,`item_cat`.`item_craeted` AS `item_craeted`,`item_cat`.`item_category` AS `item_category`,`item_cat`.`price_after_discount` AS `price_after_discount`,1 AS `favourite`,0 AS `cart` from `item_cat` where `item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `favourite`) where `item_cat`.`item_id` = `favourite`.`favourite_itemsid`) and !(`item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `cart`) where `item_cat`.`item_id` = `cart`.`cart_itemsid`)) union select `item_cat`.`cat_id` AS `cat_id`,`item_cat`.`cat_name_en` AS `cat_name_en`,`item_cat`.`cat_name_ar` AS `cat_name_ar`,`item_cat`.`cat_img` AS `cat_img`,`item_cat`.`cat_created` AS `cat_created`,`item_cat`.`item_id` AS `item_id`,`item_cat`.`item_name_en` AS `item_name_en`,`item_cat`.`item_name_ar` AS `item_name_ar`,`item_cat`.`item_description_en` AS `item_description_en`,`item_cat`.`item_description_ar` AS `item_description_ar`,`item_cat`.`item_img` AS `item_img`,`item_cat`.`item_price` AS `item_price`,`item_cat`.`item_quantity` AS `item_quantity`,`item_cat`.`item_discount` AS `item_discount`,`item_cat`.`item_active` AS `item_active`,`item_cat`.`item_craeted` AS `item_craeted`,`item_cat`.`item_category` AS `item_category`,`item_cat`.`price_after_discount` AS `price_after_discount`,0 AS `favourite`,1 AS `cart` from `item_cat` where !(`item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `favourite`) where `item_cat`.`item_id` = `favourite`.`favourite_itemsid`)) and `item_cat`.`item_id` in (select `item_cat`.`item_id` from (`item_cat` join `cart`) where `item_cat`.`item_id` = `cart`.`cart_itemsid`) limit 10000000  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_userid` (`address_userid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemsid` (`cart_itemsid`),
  ADD KEY `cart_usersid` (`cart_usersid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`cupon_id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`favourite_id`),
  ADD KEY `favourite_itemsid` (`favourite_itemsid`),
  ADD KEY `favourite_usersid` (`favourite_usersid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`) USING BTREE,
  ADD KEY `item_category` (`item_category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `user_cupon`
--
ALTER TABLE `user_cupon`
  ADD PRIMARY KEY (`user_cupon_id`),
  ADD KEY `user_cupon_userid` (`user_cupon_userid`),
  ADD KEY `user_cupon_cuponid` (`user_cupon_cuponid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cupon`
--
ALTER TABLE `cupon`
  MODIFY `cupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `favourite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user_cupon`
--
ALTER TABLE `user_cupon`
  MODIFY `user_cupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_userid`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`favourite_itemsid`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`favourite_usersid`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_category`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `user_cupon`
--
ALTER TABLE `user_cupon`
  ADD CONSTRAINT `user_cupon_ibfk_1` FOREIGN KEY (`user_cupon_userid`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_cupon_ibfk_2` FOREIGN KEY (`user_cupon_cuponid`) REFERENCES `cupon` (`cupon_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
