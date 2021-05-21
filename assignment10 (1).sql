/* SQL file for INFO I308 SP21 Assignment 8. */

/* Drop tables if they exist. Add more DROP TABLE statements as you create more tables*/
DROP TABLE IF EXISTS p_song CASCADE;
DROP TABLE IF EXISTS p_album CASCADE;
DROP TABLE IF EXISTS p_member CASCADE;
DROP TABLE IF EXISTS p_band CASCADE;
DROP TABLE IF EXISTS p_artist CASCADE;

/* Create all tables. Order matters due to foreign keys. */

CREATE TABLE p_artist (
id INT auto_increment,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30),
dob DATE,
hometown VARCHAR(40),
gender CHAR(1),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE p_band (
id INT auto_increment,
title VARCHAR(50) NOT NULL,
year_formed YEAR,
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE p_member (
artist_id INT NOT NULL,
band_id INT NOT NULL,
joined_date  DATE,
leave_date DATE,
FOREIGN KEY (artist_id) REFERENCES artist(id),
FOREIGN KEY (band_id) REFERENCES band(id)
) ENGINE = innodb;

CREATE TABLE p_album (
id INT auto_increment,
pub_year YEAR,
title VARCHAR(50),
publisher VARCHAR(50),
format CHAR(1),
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES band(id)
) ENGINE = innodb;

CREATE TABLE p_song (
album_id INT NOT NULL,
name VARCHAR(30) NOT NULL,
length TIME,
FOREIGN KEY (album_id) REFERENCES album(id)
) ENGINE = innodb;

/* Inserting data into tables. Order matters because of foreign keys. */

INSERT INTO p_artist (id, fname, lname, dob, hometown, gender) VALUES
( 100, 'Glenn ', 'Frey ', '1948-11-06 ', 'Detroit, Michigan', 'M' ),
( 101, 'Don', 'Henley', '1947-07-22', 'Gilmer, Texas', 'M' ),
(102,  'Bernie ', 'Leadon', '1947-07-19', 'San Diego, California', 'M' ),
(103, 'Randy', 'Meisner', '1946-03-08','Scottsbluff, Nebraska','M' ),
(104, 'Joe', 'Walsh', '1947-11-20','Wichita, Kansas','M' ),
(105, 'Vince', 'Gill', '1957-4-12','Norman, Oklahoma','M' ),
(106, 'Emili', 'Meake', '1988-09-18', 'Lafayette, Indiana', 'F'),
(107, 'Jeni', 'Furness', '1985-12-28', 'Gilbert, Arizona', 'F'),
(108, 'Codi', 'Langston', '2002-03-05', 'Lexington, Kentucky', 'T'),
(109, 'Kerrin', 'Woolfoot', '1987-07-14', 'Bradenton, Florida', 'F'),
(110, 'Zarla', 'Stirrup', '1981-02-08', 'Peoria, Arizona', 'F'),
(111, 'Birch', 'Hatcliffe', '1997-03-02', 'Atlanta, Georgia', 'M'),
(112, 'Blancha', 'Rapley', '1997-11-17', 'Aurora, Illinois', 'F'),
(113, 'Gilles', 'Paoli', '1983-03-11', 'Los Angeles, California', 'M'),
(114, 'Jefferson', 'Sidebottom', '2001-06-09', 'Jackson, Mississippi', 'M'),
(115, 'Philis', 'Lipmann', '1973-11-29', 'Orlando, Florida', 'F'),
(116, 'Barthel', 'Dunckley', '2000-05-08', 'Hartford, Connecticut', 'M'),
(117, 'Thatch', 'Allen', '1992-05-28', 'Oklahoma City, Oklahoma', 'M'),
(118, 'Katinka', 'Standingford', '2002-05-05', 'Washington, District of Columbia', 'F'),
(119, 'Debi', 'Marquiss', '1974-03-02', 'Mobile, Alabama', 'F'),
(120, 'Benton', 'Sheehan', '1972-07-19', 'Newport News, Virginia', 'T'),
(121, 'Giffard', 'Pointin', '1985-01-13', 'New York City, New York', 'N'),
(122, 'Sandy', 'Cleatherow', '1976-05-08', 'Denver, Colorado', 'M'),
(123, 'Clint', 'Methringham', '1982-07-25', 'Indianapolis, Indiana', 'M'),
(124, 'Carl', 'Campagne', '1997-03-02', 'Bronx, New York', 'M'),
(125, 'Isidro', 'Velasquez', '1999-10-30', 'Beaverton, Oregon', 'M'),
(126, 'Dav', 'Hayford', '1996-02-22', 'Orlando, Florida', 'M'),
(127, 'Quintina', 'Caulkett', '1975-10-30', 'Sacramento, California', 'F'),
(128, 'Nathan', 'Explosion', '1981-11-11', 'Port Richey, Florida', 'M'),
(129, 'Skwisgaar', 'Skwigelf', '1979-03-21', 'Stockholm, Sweden', 'M'),
(130, 'Toki', 'Wartooth', '1980-01-02', 'Lillehammer, Norway', 'M'),
(131, 'Pickles', NULL, '1980-10-30', 'Detroit, Michigan', 'M'),
(132, 'Ardenia', 'Adamek', '1990-01-27', 'Laredo, Texas', 'F'),
(133, 'Spike', 'Spiegel', '1973-06-27', 'Kansas City, Missouri', 'M'),
(134, 'Jet', 'Black', '1970-01-13', 'Brea, California', 'M'),
(135, 'Faye', 'Valentine', '1975-11-24', 'New Orleans, Louisiana', 'F'),
(136, 'Moina', 'Rockwill', '1974-06-22', 'Springfield, Massachusetts', 'F'),
(137, 'Isabelita', 'Bonicelli', '1988-06-23', 'Bradenton, Florida', 'F'),
(138, 'Lizzy', 'Rozsa', '1998-10-25', 'Midland, Michigan', 'F'),
(139, 'Dela', 'Tambling', '1982-10-14', 'Birmingham, Alabama', 'F')
;

INSERT INTO p_band (id, title, year_formed) VALUES
(100, 'The Eagles', '1971'),
(101, 'The Human Resources', '2001'),
(102, 'Algorithmics', '2010'),
(103, 'Buzzbeans', '1995'),
(104, 'Glorious Divanoodles', '2019'),
(105, 'DethKlok', '2007'),
(106, 'Zumba Saints', '2015'),
(107, 'Photobombers', '2012'),
(108, 'Cowboy Bebop', '1998'),
(109, 'Dynamiques', '2008')
;

INSERT INTO p_member VALUES
(103, 100, '1971-09-01', '1977-09-15'),
(101, 100, '1971-09-01', NULL),
(102, 100, '1971-09-01', '1975-12-10'),
(100, 100, '1971-09-01', '1980-07-31'),
(100, 100, '1994-04-01', '2016-01-18'),
(104, 100, '1975-12-15', NULL),
(105, 100, '2017-07-15', NULL),
(120, 103, '1995-08-05', '2005-10-03'),
(127, 103, '1995-08-05', '2001-01-01'),
(107, 103, '2001-02-17', NULL),
(126, 103, '1995-08-05', NULL),
(115, 103, '1995-08-05', NULL),
(121, 103, '2005-12-06', NULL),
(123, 101, '2001-02-14', NULL),
(110, 101, '2001-02-14', NULL),
(113, 101, '2001-02-14', NULL),
(119, 101, '2015-09-20', '2010-07-29'),
(127, 101, '2001-02-14', '2015-08-24'),
(139, 101, '2010-08-05', NULL),
(127, 106, '2015-09-04', NULL),
(109, 106, '2015-09-04', NULL),
(106, 106, '2015-09-04', NULL),
(124, 106, '2015-09-04', NULL),
(108, 104, '2019-05-21', NULL),
(114, 104, '2019-05-21', NULL),
(125, 104, '2019-05-21', NULL),
(116, 104, '2019-05-21', '2020-6-18'),
(118, 104, '2019-05-21', NULL),
(117, 102, '2010-04-25', NULL),
(126, 102, '2010-04-25', NULL),
(132, 102, '2010-04-25', '2018-09-3'),
(132, 104, '2020-07-01', NULL),
(128, 105, '2007-04-01', NULL),
(129, 105, '2007-04-01', NULL),
(130, 105, '2007-04-01', NULL),
(131, 105, '2007-04-01', NULL),
(117, 107, '2012-10-31', '2014-08-29'),
(119, 107, '2012-10-31', '2014-08-29'),
(133, 108, '1998-04-03', '2000-02-14'),
(134, 108, '1998-04-03', '2000-02-14'),
(135, 108, '1998-04-03', '2000-02-14'),
(136, 109, '2008-05-17', '2016-09-18'),
(137, 109, '2008-05-17', NULL),
(138, 109, '2008-05-17', NULL),
(112, 109, '2016-10-01', NULL)
;
/*Format is s for single album, d for double ablum */
INSERT INTO p_album (id, title, pub_year, publisher, format, band_id) VALUES
(1001,'One of These Nights','1975', 'Asylum', 's', 100),
(1002,'Hotel California','1976', 'Asylum', 's', 100),
(1003, 'The Long Run', '1979', 'Asylum', 's', 100),
(1004, 'Awaken', '1995', 'Thoughtbeat', 's', 103),
(1005, 'The Dethalbum', '2007', 'Crystal Mountain', 's', 105),
(1006, 'Corporate Hijinks', '2001', 'Thoughtbeat', 'd', 101),
(1007, 'Working for a Living', '2005', 'Thoughbeat', 's', 101),
(1008, 'Dance Dance Dance', '2016', 'Geffen', 's', 106),
(1009, 'Dethalbum 2', '2009', 'Crystal Mountain', 'd', 105),
(1010, 'Global Access', '2011', 'Thoughbeat', 's', 102),
(1011, 'Take a Picture', '2013', 'Columbia', 's', 107),
(1012, 'Sessions: Season 1', '1999', 'Shoten', 's', 108),
(1013, 'Sessions: Season 2', '2000', 'Shoten', 's', 108),
(1014, 'Here Come the Dynamiques', '2008', 'Atlantic', 's', 109),
(1015, 'Fractalization', '2015', 'Columbia', 's', 102)
;

INSERT INTO p_song VALUES 
(1001,'One of These Nights','00:04:55' ),
(1001, 'Lyin Eyes', '00:04:14' ),
(1001,'Take It to the Limit','00:03:48' ),
(1002,'TLife in the Fast Lane','00:04:46' ),
(1002,'Hotel California','00:06:30' ),
(1002,'New Kid in Town','00:05:04' ),
(1003,'The Long Run','00:03:42' ),
(1003,'I Cant Tell You Why','00:04:56' ),
(1003,'In the City','00:03:46' ),
(1003,'Heartache Tonight','00:04:27' ),
(1003,'The Sad Cafe','00:05:35' ),
(1004, 'Coffee', '00:05:01'),
(1004, 'Dreaming of Java', '00:06:21'),
(1004, 'Roasted', '00:04:11'),
(1005, 'Thunderhorse', '00:02:45'),
(1005, 'Fansong', '00:02:53'),
(1005, 'Go Into the Water', '00:04:23'),
(1006, 'Temp Job', '00:03:39'),
(1006, 'Pushing Paper', '00:04:02'),
(1006, 'Take the Company Jet', '00:03:56'),
(1006, '9 to 5', '00:04:12'),
(1006, 'Overtime Blues', '00:05:22'),
(1006, 'Water Cooler Talk', '00:04:31'),
(1007, 'Bucking For a Promotion', '00:04:11'),
(1007, 'Bringing Home the Bacon', '00:03:47'),
(1007, 'Coffee Run', '00:02:51'),
(1008, 'Sweating to the Oldies', '00:04:29'),
(1008, 'Flagdance', '00:05:17'),
(1008, 'Kung Fu Dancing', '00:04:44'),
(1009, 'The Gears', '00:03:30'),
(1009, 'Dethsupport', '00:02:42'),
(1009, 'Comet Song', '00:03:48'),
(1009, 'Volcano', '00:04:18'),
(1009, 'Burn the Earth', '00:03:59'),
(1011, 'Selfie Obsession', '00:04:22'),
(1011, 'Upgrade Fever', '00:03:52'),
(1011, 'Get in My Pic', '00:04:38'),
(1010, 'Thoughtstorm', '00:07:02'),
(1010, 'Dynaboom', '00:06:34'),
(1010, 'Club Zoom', '00:06:11'),
(1012, 'Asteroid Blues', '00:03:49'),
(1012, 'Gateway Shuffle', '00:04:17'),
(1012, 'Ganymede Elegy', '00:04:09'),
(1012, 'Jamming With Edward', '00:04:23'),
(1013, 'Jupiter Jazz', '00:04:41'),
(1013, 'Cowboy Funk', '00:04:03'),
(1013, 'Brain Scratch', '00:04:26'),
(1013, 'Boogie Wioogie Feng Shui', '00:03:55'),
(1014, 'Kiss Me, Fool', '00:04:09'),
(1014, 'Set you Straight', '00:03:56'),
(1014, 'On the Radio', '00:04:41'),
(1014, 'Only Wanna Dance With You', '00:03:48'),
(1014, 'Sunday Dreaming', '00:04:08'),
(1015, 'Tertiary', '00:05:02'),
(1015, 'Tolerance', '00:04:19'),
(1015, 'Limits', '00:03:58'),
(1015, 'Asymmetry', '00:04:40')
;

