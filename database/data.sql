#insert into tb_user_boss table
insert into tb_user_boss(account, fullname, password, tel) values ('thudq', 'dinh quang thu', '12345678', '0932244669');
insert into tb_user_boss(account, fullname, password, tel) values ('tamdq', 'dinh quang tam', '12345678', '0913043318');
#insert into tb_user_emp table 
insert into tb_user_emp(account, fullname, password, role, tel, boss_owner) values ('thanhlv', 'le van thanh', '12345678', 0, '0967326726', 2);
insert into tb_user_emp(account, fullname, password, role, tel, boss_owner) values ('huongnv', 'nguyen van huong', '12345678', 1, '0983728723', 2);
#insert into tb_hotel table
insert into tb_hotel(fullname, owner) values ('bao khanh', 2);
insert into tb_hotel(fullname, owner) values ('hai ly', 2);
#insert into tb_room_type table
insert into tb_room_type(description) value ('phong don');
#insert into tb_room table
insert into tb_room(room_number, hotel_owner, type_room, status) values ('201', 1, 1, 0);
insert into tb_room(room_number, hotel_owner, type_room, status) values ('202', 1, 1, 1);
insert into tb_room(room_number, hotel_owner, type_room, status) values ('203', 1, 1, 2);
insert into tb_room(room_number, hotel_owner, type_room, status) values ('203', 2, 1, 2);
#insert into tb_product
insert into tb_product(product_name, price, hotel_owner) values ('bo huc', '15.000', 1);
insert into tb_product(product_name, price, hotel_owner) values ('c2', '10.000', 1);
insert into tb_product(product_name, price, hotel_owner) values ('lavie', '10.000', 1);
#insert into tb_hour_price
insert into tb_hour_price(description, price, hotel_owner) values ('first_hour', '70.000', 1);
insert into tb_hour_price(description, price, hotel_owner) values ('second_hours', '90.000', 1);
insert into tb_hour_price(description, price, hotel_owner) values ('next_hours', '10.000', 1);
insert into tb_hour_price(description, price, hotel_owner) values ('night', '150.000', 1);
insert into tb_hour_price(description, price, hotel_owner) values ('all_day', '250.000', 1);
insert into tb_hour_price(description, price, hotel_owner) values ('first_hour', '70.000', 2);
insert into tb_hour_price(description, price, hotel_owner) values ('second_hours', '90.000', 2);
insert into tb_hour_price(description, price, hotel_owner) values ('next_hours', '10.000', 2);
insert into tb_hour_price(description, price, hotel_owner) values ('night', '150.000', 2);
insert into tb_hour_price(description, price, hotel_owner) values ('all_day', '250.000', 2);
#insert into tb_bill
insert into tb_bill(owner, room_owner, bill_date) values(3, 1, '2018-01-31 20:30:30');
insert into tb_bill(owner, room_owner, bill_date) values(3, 2, '2018-02-28 20:31:30');
insert into tb_bill(owner, room_owner, bill_date) values(3, 3, '2018-03-31 20:32:30');
insert into tb_bill(owner, room_owner, bill_date) values(3, 1, '2018-04-30 20:33:30');
#insert into tb_bill_detail
insert into tb_bill_detail(product_used, hours_used, bill_owner, hours_price, product_price) values (1, '11:12:00', 1, '100.000', '30.000' );
insert into tb_bill_detail(product_used, hours_used, bill_owner, hours_price, product_price) values (1, '11:12:00', 2, '100.000', '30.000' );
insert into tb_bill_detail(product_used, hours_used, bill_owner, hours_price, product_price) values (1, '11:12:00', 3, '100.000', '30.000' );