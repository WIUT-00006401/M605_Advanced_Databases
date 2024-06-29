-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 29 2024 г., 17:52
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `online_shop`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddOrder` (IN `p_Description` TEXT, IN `p_CustomerID` INT, IN `p_ProductID` INT, IN `p_Quantity` INT, IN `p_Price` DECIMAL(10,2))   BEGIN
    DECLARE newOrderID INT;

    -- Insert into Orders table
    INSERT INTO Orders (Description, CustomerID)
    VALUES (p_Description, p_CustomerID);
    
    -- Get the last inserted OrderID
    SET newOrderID = LAST_INSERT_ID();
    
    -- Insert into OrderItems table
    INSERT INTO OrderItems (Quantity, Price, OrderID, ProductID)
    VALUES (p_Quantity, p_Price, newOrderID, p_ProductID);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`CategoryID`, `Name`) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home & Garden'),
(4, 'Books'),
(5, 'Toys'),
(6, 'Sports & Outdoors'),
(7, 'Health & Beauty'),
(8, 'Automotive'),
(9, 'Pets'),
(10, 'Food & Grocery'),
(11, 'Jewelry'),
(12, 'Baby & Kids');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `LastLoginTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Password` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Email`, `LastLoginTime`, `Password`, `Address`, `Phone`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2024-06-22 08:00:00', 'passwordhash1', '123 Main St, City A, Country X', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2024-06-21 07:30:00', 'passwordhash2', '456 Elm St, City B, Country Y', '234-567-8901'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2024-06-20 06:45:00', 'passwordhash3', '789 Oak St, City C, Country Z', '345-678-9012'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '2024-06-19 05:15:00', 'passwordhash4', '321 Pine St, City D, Country X', '456-789-0123'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '2024-06-18 04:30:00', 'passwordhash5', '654 Cedar St, City E, Country Y', '567-890-1234'),
(6, 'Dana', 'Wilson', 'dana.wilson@example.com', '2024-06-17 03:45:00', 'passwordhash6', '987 Birch St, City F, Country Z', '678-901-2345'),
(7, 'Eve', 'Martinez', 'eve.martinez@example.com', '2024-06-16 02:30:00', 'passwordhash7', '432 Spruce St, City G, Country X', '789-012-3456'),
(8, 'Frank', 'Garcia', 'frank.garcia@example.com', '2024-06-15 01:15:00', 'passwordhash8', '876 Maple St, City H, Country Y', '890-123-4567'),
(9, 'Grace', 'Clark', 'grace.clark@example.com', '2024-06-14 00:00:00', 'passwordhash9', '321 Fir St, City I, Country Z', '901-234-5678'),
(10, 'Hank', 'Lee', 'hank.lee@example.com', '2024-06-12 23:45:00', 'passwordhash10', '654 Willow St, City J, Country X', '012-345-6789'),
(11, 'Ivy', 'Walker', 'ivy.walker@example.com', '2024-06-12 10:30:00', 'passwordhash11', '987 Aspen St, City K, Country Y', '123-456-7891'),
(12, 'Jack', 'Young', 'jack.young@example.com', '2024-06-11 09:15:00', 'passwordhash12', '432 Palm St, City L, Country Z', '234-567-8902'),
(13, 'Kathy', 'Allen', 'kathy.allen@example.com', '2024-06-10 08:00:00', 'passwordhash13', '876 Oakwood St, City M, Country X', '345-678-9013'),
(14, 'Larry', 'Scott', 'larry.scott@example.com', '2024-06-09 07:30:00', 'passwordhash14', '321 Redwood St, City N, Country Y', '456-789-0124'),
(15, 'Mona', 'Hill', 'mona.hill@example.com', '2024-06-08 06:45:00', 'passwordhash15', '654 Pinecone St, City O, Country Z', '567-890-1235'),
(16, 'Nate', 'King', 'nate.king@example.com', '2024-06-07 05:15:00', 'passwordhash16', '987 Cedarwood St, City P, Country X', '678-901-2346'),
(17, 'Olivia', 'Perez', 'olivia.perez@example.com', '2024-06-06 04:30:00', 'passwordhash17', '432 Birchwood St, City Q, Country Y', '789-012-3457'),
(18, 'Paul', 'Taylor', 'paul.taylor@example.com', '2024-06-05 03:45:00', 'passwordhash18', '876 Sprucewood St, City R, Country Z', '890-123-4568'),
(19, 'Quinn', 'Adams', 'quinn.adams@example.com', '2024-06-04 02:30:00', 'passwordhash19', '321 Maplewood St, City S, Country X', '901-234-5679'),
(20, 'Rachel', 'Baker', 'rachel.baker@example.com', '2024-06-03 01:15:00', 'passwordhash20', '654 Firwood St, City T, Country Y', '012-345-6780');

-- --------------------------------------------------------

--
-- Структура таблицы `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `orderitems`
--

INSERT INTO `orderitems` (`OrderItemID`, `Quantity`, `Price`, `OrderID`, `ProductID`) VALUES
(1, 2, 499.99, 1, 5),
(2, 1, 1499.99, 1, 10),
(3, 3, 29.99, 2, 15),
(4, 2, 49.99, 2, 20),
(5, 1, 79.99, 3, 25),
(6, 4, 179.99, 3, 30),
(7, 2, 16.99, 4, 35),
(8, 3, 11.99, 4, 40),
(9, 1, 29.99, 5, 45),
(10, 2, 11.99, 5, 50),
(11, 1, 2.99, 6, 55),
(12, 2, 4.79, 6, 60),
(13, 3, 1299.99, 7, 2),
(14, 1, 1499.99, 7, 7),
(15, 4, 79.99, 8, 12),
(16, 2, 49.99, 8, 17),
(17, 1, 49.99, 9, 22),
(18, 3, 149.99, 9, 27),
(19, 2, 14.99, 10, 32),
(20, 1, 9.99, 10, 37),
(21, 5, 20.00, 11, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`OrderID`, `Description`, `OrderDate`, `CustomerID`) VALUES
(1, 'Fast shipping requested', '2024-06-25 22:00:00', 1),
(2, 'Gift order for friend', '2024-06-24 22:00:00', 2),
(3, 'Priority delivery', '2024-06-17 22:00:00', 3),
(4, 'Bulk order for event', '2024-06-15 22:00:00', 4),
(5, 'Subscription renewal', '2024-06-27 22:00:00', 5),
(6, 'Standard delivery', '2024-06-03 22:00:00', 6),
(7, 'Order with gift wrap', '2024-05-29 22:00:00', 7),
(8, 'Urgent delivery needed', '2024-06-17 22:00:00', 8),
(9, 'Special instructions included', '2024-06-02 22:00:00', 9),
(10, 'First-time order', '2024-06-24 22:00:00', 10),
(11, 'Test Order Description', '2024-06-24 22:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`ProductID`, `Name`, `Description`, `Price`, `Images`, `Comment`, `SupplierID`, `CategoryID`) VALUES
(1, 'Smartphone X', 'High-end smartphone with advanced features', 799.99, 'image1.jpg', 'Great phone!', 1, 1),
(2, 'Laptop Y', 'Thin and powerful laptop for professionals', 1299.99, 'image2.jpg', 'Excellent performance', 2, 1),
(3, 'Wireless Headphones Z', 'Noise-cancelling wireless headphones', 249.99, 'image3.jpg', 'Clear sound quality', 3, 1),
(4, 'Smart TV A', '4K Ultra HD Smart TV with HDR', 999.99, 'image4.jpg', 'Vivid colors and smart features', 4, 1),
(5, 'Gaming Console B', 'Next-gen gaming console with powerful GPU', 499.99, 'image5.jpg', 'Immersive gaming experience', 5, 1),
(6, 'Tablet C', 'Versatile tablet for work and entertainment', 399.99, 'image6.jpg', 'Portable and lightweight', 6, 1),
(7, 'Camera D', 'Professional DSLR camera for photographers', 1499.99, 'image7.jpg', 'High-resolution images', 7, 1),
(8, 'Wireless Router E', 'High-speed wireless router for home networking', 129.99, 'image8.jpg', 'Reliable internet connectivity', 8, 1),
(9, 'Smart Watch F', 'Fitness tracker and smartwatch with health features', 299.99, 'image9.jpg', 'Tracks fitness metrics', 9, 1),
(10, 'Desktop Computer G', 'Powerful desktop computer for multitasking', 1499.99, 'image10.jpg', 'Ideal for office use', 10, 1),
(11, 'Men\'s Winter Jacket', 'Warm and stylish jacket for cold weather', 149.99, 'jacket1.jpg', 'Comfortable fit', 11, 2),
(12, 'Women\'s Denim Jeans', 'Classic denim jeans with a modern twist', 79.99, 'jeans1.jpg', 'Durable and trendy', 12, 2),
(13, 'Men\'s Formal Suit', 'Elegant suit for formal occasions', 299.99, 'suit1.jpg', 'Tailored fit', 13, 2),
(14, 'Women\'s Casual Dress', 'Comfortable and versatile dress', 59.99, 'dress1.jpg', 'Perfect for everyday wear', 14, 2),
(15, 'Men\'s Sports T-shirt', 'Breathable and lightweight sports t-shirt', 29.99, 'tshirt1.jpg', 'Moisture-wicking fabric', 15, 2),
(16, 'Women\'s Running Shoes', 'Lightweight running shoes with excellent grip', 89.99, 'shoes1.jpg', 'Supportive and comfortable', 8, 2),
(17, 'Men\'s Sweater', 'Cozy sweater for chilly evenings', 49.99, 'sweater1.jpg', 'Soft and warm', 5, 2),
(18, 'Women\'s Skirt', 'Stylish skirt for various occasions', 39.99, 'skirt1.jpg', 'Flattering fit', 12, 2),
(19, 'Men\'s Casual Shorts', 'Relaxed fit shorts for casual wear', 34.99, 'shorts1.jpg', 'Versatile and comfortable', 8, 2),
(20, 'Women\'s Blouse', 'Elegant blouse for professional settings', 49.99, 'blouse1.jpg', 'Sophisticated look', 14, 2),
(21, 'Outdoor Patio Set', 'Complete patio furniture set for outdoor relaxation', 699.99, 'patio_set.jpg', 'Durable and weather-resistant', 2, 3),
(22, 'Indoor Plant Stand', 'Modern plant stand for indoor plants', 49.99, 'plant_stand.jpg', 'Adds elegance to home decor', 5, 3),
(23, 'Robot Vacuum Cleaner', 'Smart vacuum cleaner for hands-free cleaning', 299.99, 'robot_vacuum.jpg', 'Efficient cleaning performance', 15, 3),
(24, 'Kitchen Knife Set', 'Premium set of chef knives for culinary enthusiasts', 129.99, 'knife_set.jpg', 'Sharp and durable blades', 11, 3),
(25, 'Gardening Tool Kit', 'Essential tools for gardening and landscaping', 79.99, 'gardening_tools.jpg', 'Comfortable grip handles', 6, 3),
(26, 'Wall Art Decor', 'Contemporary wall art for living spaces', 89.99, 'wall_art.jpg', 'Enhances room aesthetics', 3, 3),
(27, 'Smart Thermostat', 'Energy-saving thermostat for home climate control', 149.99, 'thermostat.jpg', 'Programmable settings', 2, 3),
(28, 'Electric Pressure Washer', 'Powerful pressure washer for cleaning outdoor surfaces', 199.99, 'pressure_washer.jpg', 'High-pressure cleaning performance', 10, 3),
(29, 'Solar Garden Lights', 'Decorative solar-powered lights for garden illumination', 39.99, 'garden_lights.jpg', 'Automatic dusk-to-dawn operation', 8, 3),
(30, 'Air Purifier', 'HEPA filter air purifier for cleaner indoor air', 179.99, 'air_purifier.jpg', 'Captures allergens and pollutants', 4, 3),
(31, 'The Great Gatsby', 'Classic novel by F. Scott Fitzgerald', 12.99, 'great_gatsby.jpg', 'A timeless masterpiece', 1, 4),
(32, 'To Kill a Mockingbird', 'Pulitzer Prize-winning novel by Harper Lee', 14.99, 'mockingbird.jpg', 'Insightful and thought-provoking', 2, 4),
(33, '1984', 'Dystopian novel by George Orwell', 10.99, '1984.jpg', 'A chilling vision of the future', 3, 4),
(34, 'The Catcher in the Rye', 'Controversial novel by J.D. Salinger', 11.99, 'catcher_in_the_rye.jpg', 'Captures teenage angst', 4, 4),
(35, 'Harry Potter and the Sorcerer\'s Stone', 'First book in the Harry Potter series by J.K. Rowling', 16.99, 'harry_potter.jpg', 'Magical and enchanting', 5, 4),
(36, 'The Hobbit', 'Fantasy novel by J.R.R. Tolkien', 13.99, 'hobbit.jpg', 'An epic adventure', 6, 4),
(37, 'Pride and Prejudice', 'Classic romance novel by Jane Austen', 9.99, 'pride_and_prejudice.jpg', 'Timeless love story', 7, 4),
(38, 'The Alchemist', 'Philosophical novel by Paulo Coelho', 8.99, 'alchemist.jpg', 'Inspiring and spiritual', 8, 4),
(39, 'The Da Vinci Code', 'Mystery thriller by Dan Brown', 15.99, 'da_vinci_code.jpg', 'Intriguing and suspenseful', 9, 4),
(40, 'The Hunger Games', 'Young adult dystopian novel by Suzanne Collins', 11.99, 'hunger_games.jpg', 'Action-packed and gripping', 10, 4),
(41, 'Revlon Hair Dryer', 'Ionic hair dryer for fast drying and styling', 49.99, 'hair_dryer.jpg', 'Leaves hair smooth and shiny', 1, 7),
(42, 'Neutrogena Hydro Boost Water Gel', 'Hydrating facial moisturizer with hyaluronic acid', 19.99, 'hydro_boost.jpg', 'Keeps skin moisturized all day', 2, 7),
(43, 'Philips Sonicare Electric Toothbrush', 'Electric toothbrush for superior dental care', 69.99, 'sonicare_toothbrush.jpg', 'Improves gum health', 3, 7),
(44, 'Maybelline New York Mascara', 'Volumizing mascara for long, thick lashes', 9.99, 'mascara.jpg', 'Defines and lengthens lashes', 4, 7),
(45, 'Olay Regenerist Micro-Sculpting Cream', 'Anti-aging moisturizer with collagen peptide complex', 29.99, 'regenerist_cream.jpg', 'Firms and hydrates skin', 5, 7),
(46, 'Dove Deep Moisture Body Wash', 'Nourishing body wash with gentle cleansers', 7.99, 'dove_body_wash.jpg', 'Softens and smoothes skin', 6, 7),
(47, 'Gillette Fusion5 ProGlide Razor', 'Men\'s razor for a close shave', 12.99, 'gillette_razor.jpg', 'Smooth shaving experience', 7, 7),
(48, 'Neutrogena Makeup Remover Cleansing Towelettes', 'Makeup remover wipes for gentle cleansing', 8.99, 'neutrogena_towelettes.jpg', 'Removes waterproof makeup', 8, 7),
(49, 'CeraVe Facial Moisturizing Lotion', 'Daily face moisturizer with ceramides', 14.99, 'cerave_lotion.jpg', 'Restores and maintains skin\'s natural barrier', 9, 7),
(50, 'Schick Hydro Silk Razor', 'Women\'s razor with moisturizing serum', 11.99, 'schick_razor.jpg', 'Hydrates skin during shaving', 10, 7),
(51, 'Organic Quinoa', 'Nutritious whole grain quinoa', 7.99, 'quinoa.jpg', 'High in protein and fiber', 1, 10),
(52, 'Extra Virgin Olive Oil', 'Premium quality olive oil from Italy', 12.99, 'olive_oil.jpg', 'Great for cooking and salads', 2, 10),
(53, 'Whole Wheat Bread', 'Healthy whole wheat bread loaf', 3.49, 'whole_wheat_bread.jpg', 'Rich in fiber', 3, 10),
(54, 'Fresh Strawberries', 'Sweet and juicy strawberries', 4.99, 'strawberries.jpg', 'Perfect for snacking and desserts', 4, 10),
(55, 'Organic Baby Spinach', 'Fresh organic spinach leaves', 2.99, 'spinach.jpg', 'Rich in vitamins and antioxidants', 5, 10),
(56, 'Almond Butter', 'Smooth almond butter spread', 9.99, 'almond_butter.jpg', 'Great source of healthy fats', 6, 10),
(57, 'Free-Range Eggs', 'Farm-fresh free-range eggs', 5.49, 'eggs.jpg', 'High in protein and omega-3s', 7, 10),
(58, 'Organic Greek Yogurt', 'Creamy organic Greek yogurt', 3.99, 'greek_yogurt.jpg', 'Probiotic-rich and delicious', 8, 10),
(59, 'Green Tea', 'Premium Japanese green tea leaves', 6.99, 'green_tea.jpg', 'Antioxidant-packed and soothing', 9, 10),
(60, 'Dark Chocolate Bar', 'Rich dark chocolate with 70% cocoa', 4.79, 'dark_chocolate.jpg', 'Indulgent and antioxidant-rich', 10, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `producttags`
--

CREATE TABLE `producttags` (
  `ProductTagID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `TagID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `producttags`
--

INSERT INTO `producttags` (`ProductTagID`, `ProductID`, `TagID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 5),
(16, 16, 6),
(17, 17, 7),
(18, 18, 8),
(19, 19, 9),
(20, 20, 10),
(21, 21, 1),
(22, 22, 2),
(23, 23, 3),
(24, 24, 4),
(25, 25, 5),
(26, 26, 6),
(27, 27, 7),
(28, 28, 8),
(29, 29, 9),
(30, 30, 10),
(31, 31, 1),
(32, 32, 2),
(33, 33, 3),
(34, 34, 4),
(35, 35, 5),
(36, 36, 6),
(37, 37, 7),
(38, 38, 8),
(39, 39, 9),
(40, 40, 10),
(41, 41, 1),
(42, 42, 2),
(43, 43, 3),
(44, 44, 4),
(45, 45, 5),
(46, 46, 6),
(47, 47, 7),
(48, 48, 8),
(49, 49, 9),
(50, 50, 10),
(51, 51, 1),
(52, 52, 2),
(53, 53, 3),
(54, 54, 4),
(55, 55, 5),
(56, 56, 6),
(57, 57, 7),
(58, 58, 8),
(59, 59, 9),
(60, 60, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `returneditems`
--

CREATE TABLE `returneditems` (
  `ReturnID` int(11) NOT NULL,
  `ReturnDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ReturnReason` text DEFAULT NULL,
  `ReturnQuantity` int(11) DEFAULT NULL,
  `OrderItemID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `returneditems`
--

INSERT INTO `returneditems` (`ReturnID`, `ReturnDate`, `ReturnReason`, `ReturnQuantity`, `OrderItemID`) VALUES
(1, '2024-06-29 12:34:14', 'Wrong color', 1, 1),
(2, '2024-06-29 12:34:14', 'Defective item', 1, 2),
(3, '2024-06-29 12:34:14', 'Size too small', 1, 3),
(4, '2024-06-29 12:34:14', 'Not as described', 1, 4),
(5, '2024-06-29 12:34:14', 'Damaged during shipping', 1, 5),
(6, '2024-06-29 12:34:14', 'Item missing parts', 1, 6),
(7, '2024-06-29 12:34:14', 'Expired product', 1, 7),
(8, '2024-06-29 12:34:14', 'Changed mind', 1, 8),
(9, '2024-06-29 12:34:14', 'Duplicate order', 1, 9),
(10, '2024-06-29 12:34:14', 'Wrong item received', 1, 10),
(12, '2024-06-29 13:24:42', NULL, 1, 1);

--
-- Триггеры `returneditems`
--
DELIMITER $$
CREATE TRIGGER `check_return_quantity` BEFORE INSERT ON `returneditems` FOR EACH ROW BEGIN
    DECLARE original_quantity INT;
    DECLARE total_returned_quantity INT;

    -- Get the original quantity from the OrderItems table
    SELECT Quantity INTO original_quantity
    FROM OrderItems
    WHERE OrderItemID = NEW.OrderItemID;

    -- Calculate the total returned quantity for this OrderItemID including the new row
    SELECT COALESCE(SUM(ReturnQuantity), 0) INTO total_returned_quantity
    FROM ReturnedItems
    WHERE OrderItemID = NEW.OrderItemID;

    SET total_returned_quantity = total_returned_quantity + NEW.ReturnQuantity;

    -- Check if the total returned quantity is greater than the original quantity
    IF total_returned_quantity > original_quantity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Total return quantity exceeds the original order quantity';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `LastLoginTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Password` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `FirstName`, `LastName`, `Email`, `LastLoginTime`, `Password`, `Address`, `Phone`) VALUES
(1, 'Michael', 'Smith', 'michael.smith@supplier.com', '2024-06-22 08:00:00', 'supplierpass1', '12 Supplier St, City A, Country X', '123-456-7890'),
(2, 'Emma', 'Jones', 'emma.jones@supplier.com', '2024-06-21 07:30:00', 'supplierpass2', '34 Vendor St, City B, Country Y', '234-567-8901'),
(3, 'Liam', 'Brown', 'liam.brown@supplier.com', '2024-06-20 06:45:00', 'supplierpass3', '56 Distributor St, City C, Country Z', '345-678-9012'),
(4, 'Sophia', 'Davis', 'sophia.davis@supplier.com', '2024-06-19 05:15:00', 'supplierpass4', '78 Wholesaler St, City D, Country X', '456-789-0123'),
(5, 'James', 'Miller', 'james.miller@supplier.com', '2024-06-18 04:30:00', 'supplierpass5', '90 Manufacturer St, City E, Country Y', '567-890-1234'),
(6, 'Olivia', 'Wilson', 'olivia.wilson@supplier.com', '2024-06-17 03:45:00', 'supplierpass6', '12 Supplier Ave, City F, Country Z', '678-901-2345'),
(7, 'Noah', 'Moore', 'noah.moore@supplier.com', '2024-06-16 02:30:00', 'supplierpass7', '34 Vendor Ave, City G, Country X', '789-012-3456'),
(8, 'Ava', 'Taylor', 'ava.taylor@supplier.com', '2024-06-15 01:15:00', 'supplierpass8', '56 Distributor Ave, City H, Country Y', '890-123-4567'),
(9, 'William', 'Anderson', 'william.anderson@supplier.com', '2024-06-14 00:00:00', 'supplierpass9', '78 Wholesaler Ave, City I, Country Z', '901-234-5678'),
(10, 'Isabella', 'Thomas', 'isabella.thomas@supplier.com', '2024-06-12 23:45:00', 'supplierpass10', '90 Manufacturer Ave, City J, Country X', '012-345-6789'),
(11, 'Ethan', 'Jackson', 'ethan.jackson@supplier.com', '2024-06-12 10:30:00', 'supplierpass11', '12 Supplier Blvd, City K, Country Y', '123-456-7891'),
(12, 'Mia', 'White', 'mia.white@supplier.com', '2024-06-11 09:15:00', 'supplierpass12', '34 Vendor Blvd, City L, Country Z', '234-567-8902'),
(13, 'Alexander', 'Harris', 'alexander.harris@supplier.com', '2024-06-10 08:00:00', 'supplierpass13', '56 Distributor Blvd, City M, Country X', '345-678-9013'),
(14, 'Charlotte', 'Martin', 'charlotte.martin@supplier.com', '2024-06-09 07:30:00', 'supplierpass14', '78 Wholesaler Blvd, City N, Country Y', '456-789-0124'),
(15, 'Lucas', 'Thompson', 'lucas.thompson@supplier.com', '2024-06-08 06:45:00', 'supplierpass15', '90 Manufacturer Blvd, City O, Country Z', '567-890-1235');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `TagID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`TagID`, `Name`) VALUES
(4, 'Best Seller'),
(6, 'Clearance'),
(1, 'Eco-Friendly'),
(10, 'Free Shipping'),
(9, 'Handmade'),
(5, 'Limited Edition'),
(2, 'New Arrival'),
(8, 'Organic'),
(3, 'Sale'),
(7, 'Seasonal');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Индексы таблицы `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Индексы таблицы `producttags`
--
ALTER TABLE `producttags`
  ADD PRIMARY KEY (`ProductTagID`),
  ADD UNIQUE KEY `ProductID` (`ProductID`,`TagID`),
  ADD KEY `TagID` (`TagID`);

--
-- Индексы таблицы `returneditems`
--
ALTER TABLE `returneditems`
  ADD PRIMARY KEY (`ReturnID`),
  ADD KEY `OrderItemID` (`OrderItemID`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`TagID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `producttags`
--
ALTER TABLE `producttags`
  MODIFY `ProductTagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `returneditems`
--
ALTER TABLE `returneditems`
  MODIFY `ReturnID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Ограничения внешнего ключа таблицы `producttags`
--
ALTER TABLE `producttags`
  ADD CONSTRAINT `producttags_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `producttags_ibfk_2` FOREIGN KEY (`TagID`) REFERENCES `tags` (`TagID`);

--
-- Ограничения внешнего ключа таблицы `returneditems`
--
ALTER TABLE `returneditems`
  ADD CONSTRAINT `returneditems_ibfk_1` FOREIGN KEY (`OrderItemID`) REFERENCES `orderitems` (`OrderItemID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
