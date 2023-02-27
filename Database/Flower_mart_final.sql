CREATE DATABASE  IF NOT EXISTS `flower_mart_final`;
USE `flower_mart_final`;


DROP TABLE IF EXISTS `customer_order`;

CREATE TABLE `customer_order` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`order_date` DATETIME NOT NULL,
	`total_amount` DECIMAL(9,2) NOT NULL,
	`payment_mode` INT NOT NULL,
	`delivery_status` varchar(255) NOT NULL,
	`address_id` INT NOT NULL,
	PRIMARY KEY (`order_id`)
);

DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
	`type_id` INT NOT NULL AUTO_INCREMENT,
	`user_type` varchar(255) NOT NULL,
	PRIMARY KEY (`type_id`)
);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`fname` varchar(255) NOT NULL,
	`lname` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`contact` INT(10) NOT NULL,
	`user_type_id` INT NOT NULL,
	PRIMARY KEY (`user_id`)
);

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
	`add_id` INT NOT NULL AUTO_INCREMENT,
	`line_1` varchar(255) NOT NULL,
	`line_2` varchar(255) NOT NULL,
	`city` varchar(255) NOT NULL,
	`state` varchar(255) NOT NULL,
	`pincode` INT(12) NOT NULL,
	`user_id` INT NOT NULL,
	PRIMARY KEY (`add_id`)
);

DROP TABLE IF EXISTS `payment_details`;

CREATE TABLE `payment_details` (
	`payment_id` INT NOT NULL,
	`payment_type` varchar(255) NOT NULL,
	`transaction_id` INT NOT NULL,
	PRIMARY KEY (`payment_id`)
);

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`p_name` varchar(255) NOT NULL,
	`image` blob NOT NULL,
	`cat_id` INT NOT NULL,
	`availablity` BOOLEAN NOT NULL,
	`price` DECIMAL(9,2) NOT NULL,
	PRIMARY KEY (`product_id`)
);

DROP TABLE IF EXISTS `product_categries`;

CREATE TABLE `product_categries` (
	`cat_id` INT NOT NULL AUTO_INCREMENT,
	`cat_name` varchar(255) NOT NULL,
	PRIMARY KEY (`cat_id`)
);

DROP TABLE IF EXISTS `florist_products`;

CREATE TABLE `florist_products` (
	`florist_id` INT NOT NULL AUTO_INCREMENT,
	`stocks` INT NOT NULL,
	`price` DECIMAL NOT NULL,
	`user_id` INT NOT NULL,
	PRIMARY KEY (`florist_id`)
);

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
	`order_detail_id` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`product_quantity` INT NOT NULL,
	`product_rate` DECIMAL(9,2) NOT NULL,
	`product_amount` DECIMAL(9,2) NOT NULL,
	PRIMARY KEY (`order_detail_id`)
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`cart_id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`total_amount` DECIMAL(9,2) NOT NULL,
	PRIMARY KEY (`cart_id`)
);

DROP TABLE IF EXISTS `cart_details`;

CREATE TABLE `cart_details` (
	`cart_detail_id` INT NOT NULL AUTO_INCREMENT,
	`cart_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`product_quantity` INT NOT NULL,
	`product_rate` DECIMAL(9,2) NOT NULL,
	`product_amount` DECIMAL(9,2) NOT NULL,
	PRIMARY KEY (`cart_detail_id`)
);

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
	`feedback_id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`florist_id` INT NOT NULL,
	`rating` INT NOT NULL,
	`comment` varchar(255) NOT NULL,
	PRIMARY KEY (`feedback_id`)
);

ALTER TABLE `customer_order` ADD CONSTRAINT `customer_order_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `customer_order` ADD CONSTRAINT `customer_order_fk1` FOREIGN KEY (`payment_mode`) REFERENCES `payment_details`(`payment_id`);

ALTER TABLE `customer_order` ADD CONSTRAINT `customer_order_fk2` FOREIGN KEY (`address_id`) REFERENCES `address`(`add_id`);

ALTER TABLE `user` ADD CONSTRAINT `user_fk0` FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`type_id`);

ALTER TABLE `address` ADD CONSTRAINT `address_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`cat_id`) REFERENCES `product_categries`(`cat_id`);

ALTER TABLE `florist_products` ADD CONSTRAINT `florist_products_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_fk0` FOREIGN KEY (`order_id`) REFERENCES `customer_order`(`order_id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `cart` ADD CONSTRAINT `cart_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_fk0` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);

ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `feedbacks` ADD CONSTRAINT `feedbacks_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `feedbacks` ADD CONSTRAINT `feedbacks_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);

ALTER TABLE `feedbacks` ADD CONSTRAINT `feedbacks_fk2` FOREIGN KEY (`florist_id`) REFERENCES `florist_products`(`florist_id`);













