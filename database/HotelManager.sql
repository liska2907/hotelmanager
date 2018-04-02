drop database HotelManager;
create database if not exists HotelManager;
use HotelManager;
create table tb_user_boss
	(
		id_user_boss SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
		account VARCHAR(10), 
		fullname VARCHAR(30), 
		password VARCHAR(30), 
		tel VARCHAR(30),
		PRIMARY KEY (id_user_boss)
	);
create table tb_user_emp
	(
		id_user_emp SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
		account VARCHAR(10), 
		fullname VARCHAR(30), 
		password VARCHAR(30), 
		role BIT, 
		tel VARCHAR(30),
		boss_owner SMALLINT UNSIGNED NOT NULL REFERENCES tb_user_boss(id_user_boss) ON UPDATE CASCADE ON DELETE CASCADE,
		PRIMARY KEY (id_user_emp)
	);
create table tb_hotel
	(
		id_hotel SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
		fullname VARCHAR(30), 
		owner SMALLINT UNSIGNED NOT NULL REFERENCES tb_user_boss(id_user_boss) ON UPDATE CASCADE ON DELETE CASCADE,
		PRIMARY KEY (id_hotel)
	);
create table tb_room_type
	(
		id_room_type SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
		description VARCHAR(30),
        PRIMARY KEY (id_room_type)
	);
create table tb_room
	(
		id_room SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
		room_number VARCHAR(10),
		hotel_owner SMALLINT UNSIGNED NOT NULL REFERENCES tb_hotel(id_hotel) ON UPDATE CASCADE ON DELETE CASCADE,
		type_room SMALLINT UNSIGNED NOT NULL REFERENCES tb_room_type(id_room_type) ON UPDATE CASCADE ON DELETE CASCADE,
		status TINYINT,
		PRIMARY KEY (id_room)
	);
create table tb_product
	(
		id_product SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
		product_name VARCHAR(30),
		price DECIMAL(10,3),
		hotel_owner SMALLINT UNSIGNED NOT NULL REFERENCES tb_hotel(id_hotel) ON UPDATE CASCADE ON DELETE CASCADE,
		PRIMARY KEY (id_product)
	);
create table tb_hour_price
	(
		id_hours SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
		description VARCHAR(30),
		price DECIMAL(10,3),
		hotel_owner SMALLINT UNSIGNED NOT NULL REFERENCES tb_hotel(id_hotel) ON UPDATE CASCADE ON DELETE CASCADE,
		PRIMARY KEY (id_hours)
	);
create table tb_bill
	(
		id_bill MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
		owner SMALLINT UNSIGNED REFERENCES tb_user_emp(id_user_emp) ON UPDATE CASCADE ON DELETE CASCADE,
		room_owner SMALLINT UNSIGNED REFERENCES tb_room(id_room) ON UPDATE CASCADE ON DELETE CASCADE,
		bill_date DATETIME,
		PRIMARY KEY (id_bill)
	);
create table tb_bill_detail
	(	
		id_bill_detail SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
		product_used SMALLINT UNSIGNED REFERENCES tb_product(id_product) ON UPDATE CASCADE ON DELETE CASCADE,
		hours_used TIME,
		bill_owner MEDIUMINT UNSIGNED REFERENCES tb_bill(id_bill) ON UPDATE CASCADE ON DELETE CASCADE,
		hours_price DECIMAL(10,3),
		product_price DECIMAL(10,3),
        PRIMARY KEY (id_bill_detail)
	);

