/*
select * from client;
select * from staff;
select * from owner;
select * from property;
select * from offers;
select * from estate_agent;
select * from viewing;
*/

/*
SELECT address_city, asking_price
FROM client INNER JOIN offers
ON client.client_id = offers.client_id;
*/

/*
SELECT date, title, first_name, last_name
FROM viewing INNER JOIN client
ON client.client_id = viewing.client_id;
*/



-- DELETE Existing Tables

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS viewing;
DROP TABLE IF EXISTS estate_agent;
DROP TABLE IF EXISTS offers;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS client;

PRAGMA foreign_keys = ON;

-- CREATE tables

CREATE TABLE client (
client_id INTEGER PRIMARY KEY AUTOINCREMENT
,title VARCHAR (5) NOT NULL
,first_name 	INTEGER (100) NOT NULL
,last_name INTEGER (100) NOT NULL
,address_house_no VARCHAR (8)
,address_street VARCHAR (255) NOT NULL
,address_town VARCHAR (255) NOT NULL
,address_city VARCHAR (255) NOT NULL
,address_post_code CHAR (8)
,tel_no CHAR (15)
);

CREATE TABLE staff (
staff_id INTEGER PRIMARY KEY AUTOINCREMENT 
,title VARCHAR (5) NOT NULL
,first_name VARCHAR (100) NOT NULL
,last_name VARCHAR (100) NOT NULL
,address_house_no VARCHAR (7)
,address_street VARCHAR (255)
,address_town VARCHAR (255)
,address_city VARCHAR (255)
,address_post_code CHAR (8)
,tel_no CHAR (15) NOT NULL
,email VARCHAR (75) NOT NULL
);

CREATE TABLE owner (
owner_id INTEGER PRIMARY KEY AUTOINCREMENT
,title VARCHAR (5) NOT NULL
,first_name INTEGER (100) NOT NULL
,last_name INTEGER (100) NOT NULL
,address_house_no VARCHAR (8) NOT NULL
,address_street VARCHAR (100) NOT NULL
,address_town INTEGER (100) NOT NULL
,address_city VARCHAR (255) NOT NULL
,address_post_code CHAR (8) NOT NULL
,tel_no CHAR (15) NOT NULL
,house_flat VARCHAR (5) NOT NULL
);

CREATE TABLE property (
property_id INTEGER PRIMARY KEY AUTOINCREMENT 
,address_house_no VARCHAR (8) NOT NULL
,address_street VARCHAR (255) NOT NULL
,address_town INTEGER (100) NOT NULL
,address_city VARCHAR (255) NOT NULL
,address_post_code CHAR (8) NOT NULL
,tel_no CHAR (15) NOT NULL
,owner_id INTEGER (10)
,FOREIGN KEY (owner_id) 
REFERENCES owner (owner_id)
);

CREATE TABLE offers (
offers_id INTEGER PRIMARY KEY AUTOINCREMENT
,asking_price DECIMAL (9, 6) NOT NULL
,offer DECIMAL (9, 6) NOT NULL
,accepted_offer DECIMAL (9, 6) NOT NULL
,rejected_offer DECIMAL (9, 6) NOT NULL
,property_id INTEGER (10)
,client_id INTEGER (10)
,FOREIGN KEY (property_id) 
REFERENCES property (property_id)
,FOREIGN KEY (client_id) 
REFERENCES client (client_id)
);

CREATE TABLE estate_agent (
estate_agent_id INTEGER PRIMARY KEY AUTOINCREMENT 
,estate_agent_company INTEGER (100) NOT NULL
,estate_agent_name INTEGER (100) NOT NULL
,address_no VARCHAR (8)
,address_street VARCHAR (255) NOT NULL
,address_town VARCHAR (255) NOT NULL
,address_city VARCHAR (255) NOT NULL
,address_post_code CHAR (8)
,tel_no CHAR (15) NOT NULL
,property_id INTEGER (10)
,FOREIGN KEY (property_id)
REFERENCES property (property_id)
);

CREATE TABLE viewing (
viewing_id INTEGER PRIMARY KEY AUTOINCREMENT 
,date DATE (8) NOT NULL
,time TIME (6) NOT NULL
,staff_id INTEGER (10)
,client_id INTEGER (10)
,property_id INTEGER (10)
,FOREIGN KEY (staff_id) 
REFERENCES staff (staff_id)
,FOREIGN KEY (client_id) 
REFERENCES client (client_id)
,FOREIGN KEY (property_id) 
REFERENCES property (property_id)
);

-- INSERT data INTO the CLIENT TABLE

insert into client (client_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no) 
values (1, 'Mrs', 'Adriena', 'Concannon', '1975', 'Miller', 'Manchester', 'Manchester', '55-070', '689-406-1684');
insert into client (client_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no) 
values (2, 'Mrs', 'Fredrika', 'Dayment', '3', 'Dunning', 'Manchester', 'Manchester', '67-070', '320-902-2122');
insert into client (client_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no) 
values (3, 'Rev', 'Darya', 'Cusick', '8259', 'Saint Paul', 'Manchester', 'Manchester', '27-479', '266-913-7125');
insert into client (client_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no) 
values (4, 'Honorable', 'Tudor', 'Spragg', '956', 'Miller', 'Manchester', 'Manchester', '50-478', '410-341-3738');

-- INSERT data INTO the STAFF TABLE

insert into staff (staff_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, email) 
values (1, 'Mr', 'Suki', 'Foot', '8335', 'Morrow', 'Manchester', 'Manchester', '36-245', '413-635-0001', 'sfoot0@ezinearticles.com');
insert into staff (staff_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, email) 
values (2, 'Ms', 'Cad', 'Berth', '9', 'Coleman', 'Manchester', 'Manchester', '36-789', '853-115-0543', 'cberth1@discuz.net');
insert into staff (staff_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, email) 
values (3, 'Mrs', 'Hammad', 'Windows', '2', 'Shoshone', 'Manchester', 'Manchester', '62-992', '739-631-3378', 'hwindows2@bing.com');
insert into staff (staff_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, email) 
values (4, 'Ms', 'Philippine', 'Guilliland', '13', 'Ohio', 'Manchester', 'Manchester', '65-261', '410-243-3202', 'pguilliland3@google.cn');

-- INSERT data INTO the OWNER TABLE

insert into owner (owner_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, house_flat) 
values (1, 'Honorable', 'Meggi', 'Carrick', '043', 'Elka', 'Manchester', 'Manchester', '2378', '409-501-0166', 'house');
insert into owner (owner_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, house_flat) 
values (2, 'Mr', 'Nikaniki', 'Faudrie', '2148', 'Merry', 'Manchester', 'Manchester', '6109', '226-439-3817', 'house');
insert into owner (owner_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, house_flat) 
values (3, 'Honorable', 'Kelly', 'Shrieve', '3046', 'Maple', 'Manchester', 'Manchester', '8309', '852-502-3823', 'house');
insert into owner (owner_id, title, first_name, last_name, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, house_flat) 
values (4, 'Mrs', 'Ali', 'De Gowe', '330', 'Bunting', 'Manchester', 'Manchester', '4505', '872-524-8511', 'house');

-- INSERT data INTO the PROPERTY TABLE

insert into property (property_id, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, owner_id) 
values (1, '14872', 'School', 'Manchester', 'Manchester', '1341', '262-172-4742', 1);
insert into property (property_id, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, owner_id) 
values (2, '9', 'Oneill', 'Manchester', 'Manchester', '1326', '682-930-8914', 2);
insert into property (property_id, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, owner_id) 
values (3, '49', 'Wayridge', 'Manchester', 'Manchester', '5222', '350-680-1991', 3);
insert into property (property_id, address_house_no, address_street, address_town, address_city, address_post_code, tel_no, owner_id) 
values (4, '7966', 'Hanson', 'Manchester', 'Manchester', '10705', '914-574-5041', 4);

-- INSERT data INTO the OFFERS TABLE

insert into offers (offers_id, asking_price, offer, accepted_offer, rejected_offer, property_id, client_id) values (1, '£200000.00', '£19500.00', '£195000.00', '£000000.00', 1, 1);
insert into offers (offers_id, asking_price, offer, accepted_offer, rejected_offer, property_id, client_id) values (2, '£285000.00', '£285000.00', '£285000.00', '£000000.00', 2, 2);
insert into offers (offers_id, asking_price, offer, accepted_offer, rejected_offer, property_id, client_id) values (3, '£265000.00', '£000000.00', '£000000.00', '£000000.00', 3, 3);
insert into offers (offers_id, asking_price, offer, accepted_offer, rejected_offer, property_id, client_id) values (4, '£245000.00', '£245000.00', '£245000.00', '£000000.00', 4, 4);

-- INSERT data INTO the ESTATE_AGENT TABLE

insert into estate_agent (estate_agent_id, estate_agent_company, estate_agent_name, address_no, address_street, address_town, address_city, address_post_code, tel_no, property_id) 
values (1, 'Klein-Wintheiser', 'Bordie Annis', '40261', 'Schurz', 'Manchester', 'Manchester', '09300-000', '933-212-9587', 1);
insert into estate_agent (estate_agent_id, estate_agent_company, estate_agent_name, address_no, address_street, address_town, address_city, address_post_code, tel_no, property_id) 
values (2, 'Miller and Sons', 'Twila Rama', '928', 'Lake View', 'Manchester', 'Manchester', '2760-012', '678-280-8462', 2);
insert into estate_agent (estate_agent_id, estate_agent_company, estate_agent_name, address_no, address_street, address_town, address_city, address_post_code, tel_no, property_id) 
values (3, 'Upton, Parisian and Schmitt', 'Doll Scarth', '07', 'Pepper Wood', 'Manchester', 'Manchester', '861-0312', '478-366-7914', 3);
insert into estate_agent (estate_agent_id, estate_agent_company, estate_agent_name, address_no, address_street, address_town, address_city, address_post_code, tel_no, property_id) 
values (4, 'Ruecker Inc', 'Agneta Surcombe', '1387', 'Eastwood', 'Manchester', 'Manchester', '888-0312', '788-830-8209', 4);

-- INSERT data INTO the VIEWING TABLE

insert into viewing (viewing_id, date, time, staff_id, client_id, property_id) 
values (1, '10/08/2020', '12:34 PM', 1, 1, 1);
insert into viewing (viewing_id, date, time, staff_id, client_id, property_id) 
values (2, '06/09/2020', '2:04 PM', 2, 2, 2);
insert into viewing (viewing_id, date, time, staff_id, client_id, property_id) 
values (3, '28/08/2020', '3:52 PM', 3, 3, 3);
insert into viewing (viewing_id, date, time, staff_id, client_id, property_id) 
values (4, '27/09/2020', '2:51 PM', 4, 4, 4);
