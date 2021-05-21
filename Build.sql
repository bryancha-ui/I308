DROP TABLE IF EXISTS violation_payments CASCADE;
DROP TABLE IF EXISTS violations CASCADE;
DROP TABLE IF EXISTS receipt CASCADE;
DROP TABLE IF EXISTS vehicle CASCADE;
DROP TABLE IF EXISTS parking_users_phone CASCADE;
DROP TABLE IF EXISTS parking_user CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS permits CASCADE;
 
CREATE TABLE permits (
permit_id INT NOT NULL,
type VARCHAR(10) NOT NULL,
active_months INT NOT NULL,
cost VARCHAR(10) NOT NULL,
PRIMARY KEY (permit_id)
) ENGINE = innodb;
 
CREATE TABLE locations (
lot_id INT NOT NULL,
address VARCHAR(30) NOT NULL,
permit_id INT NOT NULL,
PRIMARY KEY (lot_id),
FOREIGN KEY (permit_id) REFERENCES permits(permit_id)
) ENGINE = innodb;
 
 
CREATE TABLE employees(
empid INT NOT NULL,
SSN VARCHAR(15) NOT NULL,
nameFirst VARCHAR(30) NOT NULL,
nameLast VARCHAR(30),
email VARCHAR(30),
position VARCHAR(15),
PRIMARY KEY (empid)
)ENGINE =innodb;
 
CREATE TABLE parking_user(
user_id INT NOT NULL,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30),
dob DATE,
PRIMARY KEY (user_id)
) ENGINE = innodb;
 
CREATE TABLE parking_users_phone(
user_id INT NOT NULL,
phone VARCHAR(15),
type VARCHAR(30),
FOREIGN KEY (user_id) REFERENCES parking_user(user_id)
) ENGINE = innodb;
 
CREATE TABLE vehicle(
lp_num INT NOT NULL,
make VARCHAR(30),
model VARCHAR(30),
state VARCHAR(2),
user_id INT NOT NULL,
PRIMARY KEY (lp_num),
FOREIGN KEY (user_id) REFERENCES parking_user(user_id)
) ENGINE = innodb;
 
CREATE TABLE receipt(
lp_num INT NOT NULL,
permit_id INT NOT NULL,
payment_type VARCHAR(30),
pdate DATE,
expdate DATE,
FOREIGN KEY (lp_num) REFERENCES vehicle(lp_num),
FOREIGN KEY (permit_id) REFERENCES permits(permit_id)
) ENGINE = innodb;
 
CREATE TABLE violations(
violation_num INT NOT NULL,
lp_num INT NOT NULL,
date DATE,
Fine_amount VARCHAR(10),
lot_id INT NOT NULL,
PRIMARY KEY (violation_num),
FOREIGN KEY (lp_num) REFERENCES vehicle(lp_num),
FOREIGN KEY (lot_id) REFERENCES locations(lot_id)
) ENGINE = innodb;
 
CREATE TABLE violation_payments (
violation_number INT NOT NULL,
empid INT NOT NULL,
lp_num INT NOT NULL,
payment_types VARCHAR(30),
appeal VARCHAR(10),
paydate DATE,
FOREIGN KEY (violation_number) REFERENCES violations(violation_num),
FOREIGN KEY (empid) REFERENCES employees(empid),
FOREIGN KEY (lp_num) REFERENCES vehicle(lp_num)
) ENGINE = innodb;
 
 
INSERT INTO permits (permit_id, type, active_months ,cost) VALUES
(1, 'ST', 12, '$174.00'),
(2, 'STsz', 6, '$87.00'),
(3, 'STev', 12, '$87.00'),
(4, 'CH', 12, '$236.00'),
(5, 'CHs', 6, '$86.50'),
(6, 'Reserved', 6, '$187.50'),
(7, 'Athletic', 6, '$65.00'),
(8, 'Service', 12, '$297.00'),
(9, 'EMPfa', 6, '$236.95'),
(10, 'EMPs', 6, '$189.56'),
(11, 'EMP24hr', 6, '$289.56'),
(12, 'EMSf', 6, '$82.10'),
(13, 'EMSs',  6, '$65.68'),
(14, 'retired', 12, '$205.92'),
(15, 'D', 12, '$87.00'),
(16, 'DFA', 12, '$87.00'),
(17, 'DEM', 12, '$87.00'),
(18, 'DRE', 12, '$87.00'),
(19, 'TD', 12, '$87.00'),
(20, 'VTD', 12, '$87.00'),
(21, 'ATWGarageSp',  6, '$185.80'),
(22, 'ATWGaragef', 6, '$232.25');
 
INSERT INTO locations (lot_id, address,permit_id) VALUES
 (1, '79342 Cottonwood Crossing',2),
 (2, '262 Arkansas Center',3),
 (3, '94 Troy Park',4),
 (4, '1418 Maryland Pass',5),
 (5, '32 Vidon Circle',6),
 (6, '77406 Rowland Point',7),
 (7, '794 Jay Drive',8),
 (8, '1 Hermina Plaza',9),
 (9, '880 4th Pass',10),
 (10, '718 Daystar Point',11),
 (11, '54 Lighthouse Bay Terrace',12),
 (12, '2 Mockingbird Street',13),
 (13, '856 American Terrace',14),
(14, '87 Mallard Point',15),
(15, '98 Northridge Way',16),
(16, '12051 Dorton Circle',17),
 (17, '77782 Nevada Road',18),
 (18, '7448 Melby Parkway',19),
 (19, '77 Toban Center',20),
 (20, '844 Anzinger Park',21),
 (21, '844 Anzinger Park',22),
 (22, '844 Anzinger Park',1);
 
 
INSERT INTO employees(empid, SSN, nameFirst, nameLast, email, position) VALUES
(0001, '265-46-1530', 'Ignatius', 'Giovanitti', 'igiovanitti0@ustream.tv', 'attendant'), 
(0002, '545-734-7664', 'Lavina', 'Stopper', 'lstopper1@marketwatch.com', 'supervisor'),
(0003, '361-63-0823','Cecily','Beenham','cbeenham2@mac.com','attendant'),
(0004, '556-59-0022','Antons','Stapley','astapley3@webnode.com','attendant'),
(0005, '694-20-6231','Dory','Raddan','draddan4@eracht24.de','attendant'),
(0006, '454-58-8551','Myrta','Nehls','mnehls5@usa.gov','manager'),
(0007, '688-10-2717','Georgianna','Ogden','gogden6@nyu.edu','attendant'),
(0008, '644-63-2184','Hagen','Evershed','hevershed7@yahoo.com','attendant'),
(0009, '242-43-3993','Erika','Chstney', 'echstney8@cyberchimps.com','supervisor'),
(0010, '559-45-6758','Mychal','Baitson','mbaitson9@freewebs.com','attendant'),
(0011, '561-15-8866','Felisha','Arnull', 'farnulla@wp.com','attendant'),
(0012, '920-38-7086', 'Robbie', 'Colvin', 'rcolvinb@sphinn.com', 'supervisor'),
(0013, '220-27-3056', 'Egor', 'Fernandes', 'efernandesc@sciencedirect.com', 'attendant'),
(0014, '929-33-2407', 'Josy', 'Leither', 'jleitherd@bbb.org', 'attendant'),
(0015, '141-70-7705', 'Gloria', 'Phlippsen', 'gphlippsene@xrea.com', 'attendant'),
(0016, '259-57-2382', 'Bryon', 'Gudyer', 'bgudyerf@iu.edu', 'attendant'),
(0017, '345-17-0393', 'Berte', 'Lundy', 'blundyg@alibaba.com', 'attendant'),
(0018, '205-23-0759', 'Leonora', 'Izkovicz', 'lizkoviczh@google.com.hk','attendant'), 
(0019, '658-42-6683', 'Lillian', 'Cahey', 'lcaheyi@tinyurl.com', 'attendant'),
(0020, '200-05-6968','Marylinda','Filppetti', 'mfilppettij@disqus.com', 'attendant');
 
INSERT INTO parking_user (user_id, fname, lname, dob) VALUES
(11, 'Gwen', 'Shortland', '1950-09-09'),
(22, 'Orelee', 'Kruschev', '1980-04-03'),
(33, 'Kerstin', 'Biglin', '1986-08-26'),
(44, 'Warren', 'Ciccarelli', '1955-09-03'),
(55, 'Luigi', 'Casotti', '1955-06-14'),
(66, 'Gibby', 'Morin', '1983-10-19'),
(77, 'Rafi', 'Oxbrow', '1949-08-12'),
(88, 'Orelia', 'Hassin', '1960-02-24'),
(99, 'Corrine', 'Malyj', '1991-05-09'),
(1010, 'Bank', 'Lang', '1982-03-25'),
(1111, 'Dyna', 'Creggan', '1944-12-03'),
(1212, 'Mac', 'Lawrance', '1993-06-03'),
(1313, 'Jenine', 'Barnbrook', '1974-03-13'),
(1414, 'Jessie', 'Seeler', '1986-03-12'),
(1515, 'Meridel', 'Gorch', '1996-08-25'),
(1616, 'Lani', 'Clements', '1945-04-17'),
(1717, 'Klement', 'Bristoe', '1943-01-26'),
(1818, 'Maynord', 'Duggon', '1967-07-03'),
(1919, 'Tammara', 'Scorrer', '1972-06-22'),
(2020, 'Herbie', 'Blaydes', '1999-07-26'),
(2121, 'Nicola', 'Barkess', '1997-03-17'),
(2222, 'Baillie', 'Courtese', '1969-07-03'),
(2323, 'Jolie', 'Shakle', '1941-07-19'),
(2424, 'Wolf', 'Tomney', '1967-03-16'),
(2525, 'Carolyne', 'Clunie', '1966-10-20');
 
INSERT INTO parking_users_phone(user_id, phone, type) VALUES
(11, '763-353-0849', 'mobile'),
(22, '985-509-1986', 'mobile'),
(33, '543-702-4324', 'mobile'),
(44, '349-326-6064', 'home'),
(55, '839-747-0140', 'mobile'),
(66, '602-280-3302', 'mobile'),
(77, '482-326-9370', 'home'),
(88, '899-111-7295', 'home'),
(99, '153-819-3449', 'mobile'),
(1010, '145-653-2998', 'mobile'),
(1111, '619-329-7470', 'mobile'),
(1212, '625-763-4867', 'mobile'),
(1313, '942-734-3989', 'mobile'),
(1414, '572-590-4941', 'home'),
(1515, '105-296-2065', 'home'),
(1616, '986-515-5663', 'mobile'),
(1616, '357-911-7598', 'home'),
(1818, '499-345-3431', 'home'),
(1919, '315-610-1019', 'mobile'),
(2020, '731-339-7138', 'mobile'),
(2121, '928-373-9483', 'home'),
(2121, '197-349-2862', 'mobile');
 
INSERT INTO vehicle (lp_num, make, model, state, user_id) VALUES
(0001, 'Porsche', '911', 'IN', 55),
(0002, 'Hyundai', 'Tiburon', 'OH', 66),
(0003, 'Ford', 'Thunderbird', 'OH', 77),
(0004, 'Ford', 'Focus', 'OH', 88),
(0005, 'Alfa Romeo', 'Spider', 'NY', 99),
(0006, 'Chevrolet', 'Caprice', 'NC', 1010),
(0007, 'BMW', '7 Series', 'OH', 1111),
(0008, 'Chevrolet', 'Silverado 2500', 'NY', 1212),
(0009, 'Lotus', 'Exige', 'IL', 1313),
(0010, 'Pontiac', '6000', 'IL', 1414),
(0011, 'GMC', 'Savana', 'NC', 1515),
(0012, 'Chevrolet', 'Suburban 2500', 'NY',1616),
(0013, 'Hyundai', 'Accent', 'CO',1717),
(0014, 'Pontiac', 'Solstice', 'IN', 1818),
(0015, 'Honda', 'Accord', 'OH', 1919),
(0016, 'Scion', 'xD', 'CT', 2323),
(0017, 'Volkswagen', 'GLI', 'IN', 2121),
(0018, 'Chevrolet', 'Malibu', 'OH', 2222),
(0019,'Mazda', 'MX-6', 'OH', 2020),
(0020, 'Cadillac', 'Escalade', 'OH', 2424),
(0021, 'Cadillac', 'Escalade', 'IN', 11),
(0022, 'Cadillac', 'Escalade', 'IN', 22),
(0023, 'Cadillac', 'Escalade', 'IN', 33),
(0024, 'Cadillac', 'Escalade', 'IN', 44),
(0025, 'Cadillac', 'Escalade', 'IN', 2525);
 
INSERT INTO receipt (lp_num, permit_id, payment_type, pdate, expdate) VALUES
(0001, 1, 'mastercard', '2020-06-28', '2021-06-28'),
(0002, 2, 'americanexpress', '2020-09-15', '2021-06-15'),
(0003, 3, 'visa','2020-12-12', '2021-12-12'),
(0004, 4, 'americanexpress', '2020-04-07', '2021-04-07'),
(0005, 5, 'americanexpress', '2021-03-01', '2021-09-01'),
(0006, 6, 'americanexpress', '2020-06-06', '2021-01-06'),
(0007, 7, 'americanexpress', '2020-04-13', '2020-10-13'),
(0008, 8, 'americanexpress', '2021-01-21', '2022-01-21'),
(0009, 9, 'americanexpress', '2021-01-12', '2021-07-12'),
(0010, 18, 'visa','2020-09-01', '2021-09-01'),
(0011, 8, 'mastercard', '2020-09-04', '2021-03-04'),
(0012, 14, 'visa','2020-05-07', '2021-05-07'),
(0013, 9, 'americanexpress', '2020-06-21', '2021-01-21'),
(0014, 14, 'visa','2021-02-22', '2022-02-22'),
(0015, 15, 'americanexpress', '2020-04-12', '2021-04-12'),
(0016, 16, 'mastercard', '2020-05-29', '2021-05-29'),
(0017, 17, 'visa', '2020-10-14', '2021-10-14'),
(0018, 18, 'visa', '2020-11-09', '2021-11-09'),
(0019, 19, 'visa', '2021-03-12', '2022-03-12'),
(0020, 20, 'visa', '2020-05-06' ,'2021-05-06');
 
INSERT INTO violations (violation_num, lp_num, date, fine_amount, lot_id) VALUES 
(100, 0001, '2020-04-28', '$40',1),
(200, 0002, '2018-12-11','$50', 2),
(300,0003, '2020-04-03','$55', 3),
(400,0004, '2019-05-07','$60', 4),
(500, 0005, '2020-08-20','$90', 5),
(600, 0006, '2020-09-29','$60', 6),
(700, 0007, '2018-11-24','$55', 7),
(800, 0008, '2020-07-07','$70', 8),
(900, 0009, '2020-12-26','$50', 9),
(1000, 0010,'2018-11-05','$70', 11),
(1100, 0011, '2019-06-07','$50', 12),
(1200, 0012, '2019-04-03','$80', 10),
(1300, 0013, '2018-09-15', '$60',13),
(1400, 0014, '2018-06-16', '$50', 14),
(1500, 0015, '2020-07-11','$70', 15),
(1600, 0016, '2018-07-22','$80', 16),
(1700, 0017, '2018-05-22','$40', 17),
(1800,0018, '2019-12-07','$50', 19),
(1900, 0019, '2019-12-11','$50', 19),
(2000,0020, '2020-06-20','$70', 20),
(2100,0020, '2019-01-01','$70', 20),
(2200,0001, '2020-09-25','$40', 13),
(2300,0001,'2018-05-31','$55', 3),
(2400,0011,'2018-07-11','$60', 13),
(2500, 0018 ,'2018-12-05','$60', 13);
 
INSERT INTO violation_payments(violation_number, empid, lp_num, payment_types, appeal, paydate) VALUES
(100, 0001, 0001, 'cash', 'no','2021-09-04'),
(200, 0002, 0002, 'credit card', 'no', '2020-13-05'),
(300, 0003, 0003, 'cash', 'yes', '2018-05-06'),
(400, 0004, 0004, 'check', 'no', '2018-20-08'),
(500, 0005, 0005, 'cash', 'yes', '2020-21-09'),
(600, 0006, 0006, 'cash', 'yes', '2018-25-10'),
(700, 0007, 0007, 'credit card', 'no', '2018-17-11'),
(800, 0008, 0008, 'cash', 'no', '2019-19-09'),
(900, 0009, 0009, 'check', 'no', '2020-21-01'),
(1000, 0010, 0010, 'cash', 'no', '2019-10-04'),
(1100, 0011, 0011, 'credit card', 'no', '2019-12-03'),
(1200, 0012, 0012, 'credit card', 'no', '2020-02-12'),
(1300, 0013, 0013, 'cash', 'no', '2018-07-06'),
(1400, 0014, 0014, 'check', 'no', '2019-10-02'),
(1500, 0015, 0015, 'credit card', 'yes', '2020-14-03'),
(1600, 0016, 0016, 'cash', 'no', '2020-13-05'),
(1700, 0017, 0017, 'credit card', 'no', '2020-12-10'),
(1800, 0018, 0018, 'cash', 'no', '2020-19-05'),
(1900, 0019, 0019, 'cash', 'no', '2020-23-04'),
(2000, 0020, 0001, 'cash', 'no', '2021-22-08');
