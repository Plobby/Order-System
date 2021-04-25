-- Create the database
CREATE DATABASE IF NOT EXISTS Data CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Display the database
SHOW DATABASES LIKE "Data";

-- Select the database
USE Data;

-- Create customers table
CREATE TABLE IF NOT EXISTS Customers 
	(Email VARCHAR(50) NOT NULL, Firstname VARCHAR(20) NOT NULL, Lastname VARCHAR(20) NOT NULL, HouseNo VARCHAR(16) NOT NULL, PostCode VARCHAR(8) NOT NULL, City VARCHAR(30), PRIMARY KEY (Email)) ENGINE = INNODB;

-- Create services table
CREATE TABLE IF NOT EXISTS Services 
	(Name VARCHAR(30) NOT NULL, Description TEXT NOT NULL, Price DECIMAL(6,2) NOT NULL, PRIMARY KEY (Name)) ENGINE = INNODB;

-- Create orders table
CREATE TABLE IF NOT EXISTS Orders 
	(CustomerEmail VARCHAR(50) NOT NULL, OrderDate DATETIME NOT NULL, StaffEmail VARCHAR(50) NOT NULL, PRIMARY KEY (CustomerEmail, OrderDate)) ENGINE = INNODB;

-- Create staff table
CREATE TABLE IF NOT EXISTS Staff 
	(Email VARCHAR(50) NOT NULL, Firstname VARCHAR(20) NOT NULL, Lastname VARCHAR(20) NOT NULL, PRIMARY KEY (Email)) ENGINE = INNODB;

-- Create order details table	
CREATE TABLE IF NOT EXISTS OrderDetails 
	(CustomerEmail VARCHAR(50) NOT NULL, OrderDate DATETIME NOT NULL, ServiceName VARCHAR(30) NOT NULL, ServiceOrderedPrice DECIMAL(7,2), Discount DECIMAL(6,2), Quantity TINYINT UNSIGNED DEFAULT 1, PRIMARY KEY (CustomerEmail, OrderDate, ServiceName)) ENGINE = INNODB;

-- Create accounts table
CREATE TABLE IF NOT EXISTS Accounts 
	(CustomerEmail VARCHAR(50) NOT NULL, Username VARCHAR(20) NOT NULL, Password VARCHAR(64) NOT NULL, Logout DATETIME NOT NULL, PRIMARY KEY (CustomerEmail)) ENGINE = INNODB;

-- Alter orders table to add foreign key constraints
ALTER TABLE Orders 
	ADD FOREIGN KEY (CustomerEmail) REFERENCES Customers(Email) ON DELETE CASCADE, 
	ADD FOREIGN KEY (StaffEmail) REFERENCES Staff(Email) ON DELETE CASCADE;

-- Alter order details table to add foreign key constraints
ALTER TABLE OrderDetails 
	ADD FOREIGN KEY (CustomerEmail) REFERENCES Customers(Email) ON DELETE CASCADE, 
	ADD FOREIGN KEY (ServiceName) REFERENCES Services(Name) ON DELETE CASCADE;

-- Alter accounts table to add foreign keys table and replace a column
ALTER TABLE Accounts 
	ADD FOREIGN KEY (CustomerEmail) REFERENCES Customers(Email) ON DELETE CASCADE, 
	DROP COLUMN Logout,
	ADD COLUMN LastLogin DATETIME;

-- Alter accounts table to move a column
ALTER TABLE Accounts 
	MODIFY COLUMN LastLogin DATETIME NOT NULL AFTER CustomerEmail;
	
-- Insert customers data
INSERT INTO Customers 
	(Email, Firstname, Lastname, HouseNo, PostCode, City)
VALUES 
	("kandrews@gmail.com", "Keira", "Andrews", "20", "DH69 9ZE", "Durham"), 
	("djameson@outlook.com", "David", "Jameson", "9093", "LS57 7XJ", "Leeds"), 
	("kstanley@yahoo.co.uk", "Kajal", "Stanley", "9945", "W54 0PG", "West london"), 
	("mariophan@outlook.com", "Mario", "Phan", "84", "HP95 9RG", "Hemel hempstead"), 
	("anewman@gmail.com", "Ainsley", "Newman", "43", "DL18 2QW", "Darlington"), 
	("lorenhurst@outlook.com", "Loren", "Hurst", "505", "DE78 1OY", "Derby"), 
	("teganwicks@outlook.com", "Tegan", "Wicks", "68", "ME96 5MW", "Rochester"), 
	("arjundrew@outlook.com", "Arjun", "Drew", "9208", "TF46 1FS", "Telford"), 
	("mpiper@yahoo.co.uk", "Marni", "Piper", "748", "N49 1QG", "North london"), 
	("shume@yahoo.co.uk", "Sanaa", "Hume", "820", "HG94 5OQ", "Harrogate"), 
	("bretkeith@gmail.com", "Bret", "Keith", "338", "NP11 2WP", "Newport"), 
	("megashley@gmail.com", "Meg", "Ashley", "56", "SO88 3XA", "Southampton"), 
	("mikailsolomon@gmail.com", "Mikail", "Solomon", "11", "CT95 5FY", "Canterbury"), 
	("lyla-roserosa@yahoo.co.uk", "Lyla-Rose", "Rosa", "212", "ZE70 4JB", "Lerwick"), 
	("atillman@yahoo.co.uk", "Abul", "Tillman", "11", "HU91 0ZS", "Hull"), 
	("kailawiggins@yahoo.co.uk", "Kaila", "Wiggins", "850", "LE67 7MZ", "Leicester"), 
	("donterees@gmail.com", "Donte", "Rees", "89", "CF9 6PH", "Cardiff"), 
	("astone@gmail.com", "Anisah", "Stone", "27", "BR39 0AF", "Bromley"), 
	("aleshazavala@outlook.com", "Alesha", "Zavala", "97", "DA58 9MI", "Dartford"), 
	("cfuentes@outlook.com", "Cassian", "Fuentes", "70", "TW81 4GQ", "Twickenham"), 
	("antoniawoodard@gmail.com", "Antonia", "Woodard", "18", "BB35 2CB", "Blackburn"), 
	("hamishbaxter@yahoo.co.uk", "Hamish", "Baxter", "9161", "CB15 3DA", "Cambridge"), 
	("romyfrench@gmail.com", "Romy", "French", "40", "TQ83 6IA", "Torquay"), 
	("kpadilla@yahoo.co.uk", "Kacper", "Padilla", "96", "NE98 0FL", "Newcastle upon tyne"), 
	("graceybostock@outlook.com", "Gracey", "Bostock", "923", "GL56 4AU", "Gloucester"), 
	("sfaulkner@yahoo.co.uk", "Sidra", "Faulkner", "47", "ST23 7EC", "Stoke-on-trent"), 
	("ellennicholls@outlook.com", "Ellen", "Nicholls", "702", "NN51 1QF", "Northampton"), 
	("slin@outlook.com", "Sara", "Lin", "79", "SK76 9WU", "Stockport"), 
	("epickett@yahoo.co.uk", "Elias", "Pickett", "3", "M46 1WY", "Manchester"), 
	("laurenwaters@yahoo.co.uk", "Lauren", "Waters", "546", "BH72 1DH", "Bournemouth"), 
	("dellacurrie@outlook.com", "Della", "Currie", "257", "TS83 4ZF", "Cleveland"), 
	("dcombs@outlook.com", "Dawid", "Combs", "9157", "WS30 3ZM", "Walsall"), 
	("cadencefleming@gmail.com", "Cadence", "Fleming", "58", "EC33 6LZ", "East central london"), 
	("cecilysilva@outlook.com", "Cecily", "Silva", "50", "SW73 8NI", "South west london"), 
	("zstark@yahoo.co.uk", "Zoha", "Stark", "9420", "TD63 9EJ", "Galashiels"), 
	("lsullivan@outlook.com", "Liyana", "Sullivan", "35", "CO9 5NF", "Colchester"), 
	("conalleblanc@yahoo.co.uk", "Conal", "Leblanc", "53", "NG51 6KG", "Nottingham"), 
	("leightonmorin@yahoo.co.uk", "Leighton", "Morin", "24", "EN16 9FG", "Enfield"), 
	("tmacgregor@gmail.com", "Ty", "Macgregor", "69", "RM39 2RP", "Romford"), 
	("sclemons@gmail.com", "Shay", "Clemons", "973", "WR75 7VT", "Worcester"), 
	("laurelboyle@yahoo.co.uk", "Laurel", "Boyle", "98", "SE63 2NI", "South east london"), 
	("fhamer@yahoo.co.uk", "Fatma", "Hamer", "9115", "WF13 4GS", "Wakefield"), 
	("rlord@yahoo.co.uk", "Reuben", "Lord", "27", "NW95 9CH", "North west london"), 
	("aaustin@yahoo.co.uk", "Aiyla", "Austin", "9138", "SN64 0HY", "Swindon"), 
	("ahulme@gmail.com", "Abu", "Hulme", "17", "IV31 2EV", "Inverness"), 
	("smeyer@yahoo.co.uk", "Shae", "Meyer", "2", "CW24 1HY", "Crewe"), 
	("yehudaferguson@outlook.com", "Yehuda", "Ferguson", "202", "RG29 9QS", "Reading"), 
	("heaton@yahoo.co.uk", "Hollie", "Eaton", "373", "PA81 1NB", "Paisley"), 
	("klewis@gmail.com", "Keith", "Lewis", "5", "SR27 1IE", "Sunderland"), 
	("renesmeeruiz@gmail.com", "Renesmee", "Ruiz", "76", "OX25 2UX", "Oxford"), 
	("pknights@outlook.com", "Peyton", "Knights", "24", "B12 0BF", "Birmingham"), 
	("daniellaholland@outlook.com", "Daniella", "Holland", "717", "G74 2WJ", "Glasgow"), 
	("fjones@outlook.com", "Fraser", "Jones", "24", "GU91 6DU", "Guildford"), 
	("mohammadwynn@gmail.com", "Mohammad", "Wynn", "97", "SA83 1DH", "Swansea"), 
	("ssanchez@yahoo.co.uk", "Stewart", "Sanchez", "38", "DD19 7ON", "Dundee"), 
	("aemery@outlook.com", "Axl", "Emery", "86", "BA30 8WT", "Bath"), 
	("siddharthbarron@outlook.com", "Siddharth", "Barron", "97", "SY50 5VK", "Shrewsbury"), 
	("bosborn@gmail.com", "Bogdan", "Osborn", "1", "SP85 5PY", "Salisbury"), 
	("reyaschmitt@outlook.com", "Reya", "Schmitt", "40", "AB96 9QX", "Aberdeen"), 
	("roganjenkins@yahoo.co.uk", "Rogan", "Jenkins", "9295", "CR38 0WB", "Croydon"), 
	("jordan-leepovey@gmail.com", "Jordan-Lee", "Povey", "38", "DY21 4RA", "Dudley"), 
	("hasnainfountain@yahoo.co.uk", "Hasnain", "Fountain", "8", "LS1 2SF", "Leeds"), 
	("achaney@yahoo.co.uk", "Ashlyn", "Chaney", "8", "BN97 0EY", "Brighton"), 
	("jonathangarza@gmail.com", "Jonathan", "Garza", "9571", "SS5 6DO", "Southend-on-sea"), 
	("shakiracontreras@gmail.com", "Shakira", "Contreras", "9181", "HR47 9WM", "Hereford"), 
	("mtrejo@gmail.com", "Mahi", "Trejo", "12", "L22 9UB", "Liverpool"), 
	("rscott@yahoo.co.uk", "Rihanna", "Scott", "61", "EX65 9YT", "Exeter"), 
	("rcarr@yahoo.co.uk", "Raphael", "Carr", "8", "BL66 8CE", "Bolton"), 
	("hburn@yahoo.co.uk", "Harun", "Burn", "42", "BT94 1MS", "Belfast"), 
	("mirunabateman@outlook.com", "Miruna", "Bateman", "69", "IG99 3TM", "Ilford"), 
	("shakeelhutchings@yahoo.co.uk", "Shakeel", "Hutchings", "34", "WA83 9UH", "Warrington"), 
	("cdennis@outlook.com", "Cali", "Dennis", "574", "PL21 7VZ", "Plymouth"), 
	("jakubwinters@gmail.com", "Jakub", "Winters", "67", "EH66 5GF", "Edinburgh"), 
	("aspencer@gmail.com", "Alvin", "Spencer", "19", "BD82 2XS", "Bradford"), 
	("mariyamreed@yahoo.co.uk", "Mariyam", "Reed", "44", "PO66 1NL", "Portsmouth"), 
	("vturner@yahoo.co.uk", "Vihaan", "Turner", "57", "HX6 8MK", "Halifax"), 
	("afields@outlook.com", "Antoinette", "Fields", "1", "HD67 2AV", "Huddersfield"), 
	("ahalliday@yahoo.co.uk", "Alexandra", "Halliday", "570", "WC89 2SV", "Western central london"), 
	("ahills@outlook.com", "Abdurahman", "Hills", "7", "CV22 0SP", "Coventry"), 
	("llu@yahoo.co.uk", "Leena", "Lu", "4", "DN82 7LN", "Doncaster"), 
	("tpritchard@gmail.com", "Taya", "Pritchard", "83", "WD60 8QD", "Watford"), 
	("jrojas@yahoo.co.uk", "Jimi", "Rojas", "71", "TA14 4TA", "Taunton"), 
	("nday@gmail.com", "Nuha", "Day", "97", "WN95 9GT", "Wigan"), 
	("nigellove@outlook.com", "Nigel", "Love", "92", "OL22 1BN", "Oldham"), 
	("rprince@gmail.com", "Riaan", "Prince", "31", "PE26 2PM", "Peterborough"), 
	("ashleagibbs@outlook.com", "Ashlea", "Gibbs", "9176", "HS16 2LS", "Outer hebrides"), 
	("kbeil@gmail.com", "Krista", "Beil", "38", "TR78 9GX", "Truro"), 
	("bsears@yahoo.co.uk", "Bernard", "Sears", "72", "LU72 3GX", "Luton"), 
	("tamarjarvis@outlook.com", "Tamar", "Jarvis", "352", "DG41 8BY", "Dumfries"), 
	("amcneil@outlook.com", "Arun", "Mcneil", "46", "YO34 8FB", "York"), 
	("lrankin@outlook.com", "Leah", "Rankin", "15", "KA16 4BX", "Kilmarnock"), 
	("ahawes@yahoo.co.uk", "Alisha", "Hawes", "35", "NR82 6LN", "Norwich"), 
	("estorey@gmail.com", "Emme", "Storey", "57", "DT94 0DG", "Dorchester"), 
	("rayastein@gmail.com", "Raya", "Stein", "8", "IP74 0QT", "Ipswich"), 
	("kcarter@yahoo.co.uk", "Kacie", "Carter", "63", "RH30 4PY", "Redhill"), 
	("inayalynn@yahoo.co.uk", "Inaya", "Lynn", "9417", "PR81 0OB", "Preston"), 
	("lisa-mariehubbard@outlook.com", "Lisa-Marie", "Hubbard", "73", "CH18 2SE", "Chester"), 
	("rhonawilks@outlook.com", "Rhona", "Wilks", "22", "KT81 4HM", "Kingston upon thames"), 
	("smckay@outlook.com", "Sarah-Jane", "Mckay", "40", "CA52 0SL", "Carlisle"),
	("kenanmill@gmail.com", "Kenan", "Mill", "1", "DH12 9LK", "Durham");

-- Insert services data
INSERT INTO Services 
	(Name, Description, Price) 
VALUES 
	("Data Retrieval", "We can help recover your lost data for you!", 399.99), 
	("Hardware Upgrade", "Need some new hardware? We can help you out!", 109.99), 
	("Virus Removal", "Get rid of those pesky viruses on your system.", 49.99), 
	("Phone/Tablet Repair", "Fix up your old, broken phone or tablet with us!", 69.99), 
	("Network Repairs", "We can help setup and repair your network.", 699.99), 
	("OS Support", "Having troubles with your operating system? We can help!", 129.99), 
	("Computer Training", "We can make you an expert in no time!", 499.99), 
	("PC Crashes", "Computer keeps crashing? Let us take a look.", 49.99), 
	("Software Errors", "We can provide help with any software problem.", 14.99), 
	("Internet Connection", "Can't get connected to the internet? We can fix that.", 59.99), 
	("PC Retune", "Computer getting slow? Let us boost it back up!", 69.99), 
	("Basic Windows Install", "Let us install Windows for you!", 34.99), 
	("Full Windows Install", "Let us install Windows for you, to an expert level. All details are done for you!", 54.99), 
	("Device Unlocking", "Can't get into your device? We can unlock it for you.", 19.99), 
	("Setup", "We can help setup any new device!", 39.99), 
	("Setup and Personalise", "Not only will we help setup your new device, but we can personalise it exactly how you like it!", 49.99), 
	("Troubleshoot PC", "We can diagnose and fix your computer for you.", 54.99), 
	("Computer Healthcheck", "Let us check the health of your computer and make sure it is in tip-top condition!", 59.99), 
	("Hardware Install", "New piece of hardware? We can fit it for you!", 39.99), 
	("Printer Setup", "Can't get your printer working? Leave it to us!", 49.99), 
	("Email Support", "Got any questions? Reach us via email and we can provide you with instant online support!", 34.99), 
	("Software Installation", "Got some new software? We can get it running on your machine for you!", 39.99), 
	("File Backup", "Backing up your files is always a good idea. We can do it securely and professionally!", 39.99);
	
-- Update service descriptions
UPDATE Services
SET Description = "We can get your lost data back!"
WHERE Name = "Data Retrieval";
UPDATE Services
SET Description = "All kinds of support for your operating system problems!"
WHERE Name = "OS Support";
UPDATE Services
SET Price = 29.99
WHERE Name = "File Backup";

-- Insert staff data
INSERT INTO Staff 
	(Email, Firstname, Lastname) 
VALUES 
	("alanahcouch@yahoo.co.uk", "Alanah", "Couch"), 
	("ccobb@gmail.com", "Cara", "Cobb"), 
	("elizabethpark@outlook.com", "Elizabeth", "Park"), 
	("svelazquez@yahoo.co.uk", "Sabah", "Velazquez"), 
	("abrewer@yahoo.co.uk", "Andre", "Brewer"), 
	("acollins@yahoo.co.uk", "Atlas", "Collins"), 
	("avleenmair@gmail.com", "Avleen", "Mair"), 
	("gethinquintana@outlook.com", "Gethin", "Quintana"), 
	("fabiofigueroa@yahoo.co.uk", "Fabio", "Figueroa"), 
	("jbass@outlook.com", "Joni", "Bass"), 
	("hunderwood@gmail.com", "Ho", "Underwood"), 
	("jlove@outlook.com", "Jacque", "Love"), 
	("bdraper@yahoo.co.uk", "Bertram", "Draper"), 
	("bgraham@outlook.com", "Brielle", "Graham"), 
	("jklein@outlook.com", "Jakob", "Klein"), 
	("aworkman@yahoo.co.uk", "Austin", "Workman"), 
	("lbaxter@outlook.com", "Lucas", "Baxter"), 
	("jjones@outlook.com", "Jareth", "Jones"), 
	("gdouglas@yahoo.co.uk", "George", "Douglas"), 
	("ckirkpatrick@gmail.com", "Clara", "Kirkpatrick"),
	("sdawson@outlook.com", "Shane", "Dawson");

-- Delete retired staff member for the staff table
DELETE FROM Staff WHERE Email = "sdawson@outlook.com";

-- Insert orders data
INSERT INTO Orders 
	(CustomerEmail, OrderDate, StaffEmail) 
VALUES 
	("hburn@yahoo.co.uk", '2015-09-15 02:35:35', "acollins@yahoo.co.uk"), 
	("mariyamreed@yahoo.co.uk", '2018-10-28 10:10:10', "bdraper@yahoo.co.uk"), 
	("lyla-roserosa@yahoo.co.uk", '2000-01-27 09:25:19', "aworkman@yahoo.co.uk"), 
	("hamishbaxter@yahoo.co.uk", '2008-07-09 02:50:37', "gdouglas@yahoo.co.uk"), 
	("hburn@yahoo.co.uk", '2015-07-25 18:48:14', "bdraper@yahoo.co.uk"), 
	("ahulme@gmail.com", '2016-02-02 05:44:16', "jklein@outlook.com"), 
	("kcarter@yahoo.co.uk", '2007-05-09 13:07:07', "abrewer@yahoo.co.uk"), 
	("ellennicholls@outlook.com", '2017-06-23 06:24:06', "elizabethpark@outlook.com"), 
	("tmacgregor@gmail.com", '2001-05-01 14:38:02', "aworkman@yahoo.co.uk"), 
	("jakubwinters@gmail.com", '2008-05-21 07:30:08', "hunderwood@gmail.com"), 
	("mtrejo@gmail.com", '2013-11-15 19:41:48', "ckirkpatrick@gmail.com"), 
	("bsears@yahoo.co.uk", '2005-07-15 06:24:32', "fabiofigueroa@yahoo.co.uk"), 
	("kenanmill@gmail.com", '2003-06-02 13:04:55', "hunderwood@gmail.com"), 
	("kbeil@gmail.com", '2006-11-22 02:48:24', "acollins@yahoo.co.uk"), 
	("cfuentes@outlook.com", '2016-12-20 08:24:36', "avleenmair@gmail.com"), 
	("daniellaholland@outlook.com", '2000-06-19 15:08:53', "bdraper@yahoo.co.uk"), 
	("fjones@outlook.com", '2003-10-29 04:10:51', "aworkman@yahoo.co.uk"), 
	("vturner@yahoo.co.uk", '2011-05-28 18:48:39', "bgraham@outlook.com"), 
	("nigellove@outlook.com", '2014-03-15 14:42:47', "acollins@yahoo.co.uk"), 
	("zstark@yahoo.co.uk", '2011-07-23 21:50:35', "abrewer@yahoo.co.uk"), 
	("smckay@outlook.com", '2007-08-07 13:54:26', "gdouglas@yahoo.co.uk"), 
	("shakiracontreras@gmail.com", '2000-08-18 04:10:45', "svelazquez@yahoo.co.uk"), 
	("rlord@yahoo.co.uk", '2001-05-15 21:21:22', "aworkman@yahoo.co.uk"), 
	("lrankin@outlook.com", '2013-06-03 09:48:43', "gdouglas@yahoo.co.uk"), 
	("sclemons@gmail.com", '2012-09-16 11:55:19', "jlove@outlook.com"), 
	("cdennis@outlook.com", '2010-03-31 02:21:09', "hunderwood@gmail.com"), 
	("cfuentes@outlook.com", '2016-12-27 06:27:34', "ccobb@gmail.com"), 
	("nday@gmail.com", '2015-08-08 11:09:40', "elizabethpark@outlook.com"), 
	("ahills@outlook.com", '2011-04-30 10:28:25', "bdraper@yahoo.co.uk"), 
	("mpiper@yahoo.co.uk", '2007-07-06 19:36:26', "alanahcouch@yahoo.co.uk"), 
	("jonathangarza@gmail.com", '2000-06-21 22:13:45', "bgraham@outlook.com"), 
	("klewis@gmail.com", '2013-10-19 20:47:58', "aworkman@yahoo.co.uk"), 
	("sclemons@gmail.com", '2010-03-23 20:21:34', "jbass@outlook.com"), 
	("inayalynn@yahoo.co.uk", '2007-09-27 15:50:27', "acollins@yahoo.co.uk"), 
	("bretkeith@gmail.com", '2015-08-25 10:34:12', "abrewer@yahoo.co.uk"), 
	("astone@gmail.com", '2001-11-17 10:48:51', "svelazquez@yahoo.co.uk"), 
	("shakeelhutchings@yahoo.co.uk", '2007-02-21 17:07:55', "gdouglas@yahoo.co.uk"), 
	("jonathangarza@gmail.com", '2000-06-16 15:45:55', "lbaxter@outlook.com"), 
	("mariyamreed@yahoo.co.uk", '2001-03-01 04:37:04', "hunderwood@gmail.com"), 
	("daniellaholland@outlook.com", '2018-03-02 09:44:27', "fabiofigueroa@yahoo.co.uk"), 
	("ahills@outlook.com", '2005-02-13 10:30:45', "acollins@yahoo.co.uk"), 
	("bsears@yahoo.co.uk", '2010-04-20 18:17:21', "aworkman@yahoo.co.uk"), 
	("laurelboyle@yahoo.co.uk", '2007-12-03 21:33:37', "bdraper@yahoo.co.uk"), 
	("astone@gmail.com", '2016-08-19 06:47:03', "fabiofigueroa@yahoo.co.uk"), 
	("mpiper@yahoo.co.uk", '2011-01-06 20:27:03', "gdouglas@yahoo.co.uk"), 
	("lyla-roserosa@yahoo.co.uk", '2013-02-27 02:46:48', "fabiofigueroa@yahoo.co.uk"), 
	("klewis@gmail.com", '2009-01-24 12:06:24', "jjones@outlook.com"), 
	("roganjenkins@yahoo.co.uk", '2005-10-20 20:02:11', "elizabethpark@outlook.com"), 
	("donterees@gmail.com", '2001-01-16 07:40:12', "fabiofigueroa@yahoo.co.uk"), 
	("mariyamreed@yahoo.co.uk", '2008-01-12 18:36:25', "lbaxter@outlook.com"), 
	("lrankin@outlook.com", '2008-10-04 06:50:38', "jlove@outlook.com"), 
	("shume@yahoo.co.uk", '2016-01-20 18:22:24', "gethinquintana@outlook.com"), 
	("jonathangarza@gmail.com", '2016-09-11 19:33:44', "ckirkpatrick@gmail.com"), 
	("djameson@outlook.com", '2018-05-17 01:35:07', "bgraham@outlook.com"), 
	("renesmeeruiz@gmail.com", '2014-11-27 19:34:36', "jjones@outlook.com"), 
	("slin@outlook.com", '2005-01-03 17:30:14', "ccobb@gmail.com"), 
	("atillman@yahoo.co.uk", '2014-04-05 18:50:50', "ccobb@gmail.com"), 
	("sfaulkner@yahoo.co.uk", '2009-06-06 02:46:53', "ccobb@gmail.com"), 
	("ashleagibbs@outlook.com", '2012-11-08 20:07:17', "alanahcouch@yahoo.co.uk"), 
	("bsears@yahoo.co.uk", '2005-06-30 07:26:41', "abrewer@yahoo.co.uk"), 
	("daniellaholland@outlook.com", '2002-01-18 21:14:38', "gethinquintana@outlook.com"), 
	("cdennis@outlook.com", '2005-03-26 18:58:45', "elizabethpark@outlook.com"), 
	("shume@yahoo.co.uk", '2017-04-15 15:20:29', "aworkman@yahoo.co.uk"), 
	("sfaulkner@yahoo.co.uk", '2005-04-10 12:54:47', "bgraham@outlook.com"), 
	("aleshazavala@outlook.com", '2014-08-12 15:30:55', "svelazquez@yahoo.co.uk"), 
	("ahulme@gmail.com", '2015-06-20 02:04:54', "ccobb@gmail.com"), 
	("shakeelhutchings@yahoo.co.uk", '2015-12-06 13:50:15', "jbass@outlook.com"), 
	("romyfrench@gmail.com", '2012-04-21 13:19:30', "bdraper@yahoo.co.uk"), 
	("fhamer@yahoo.co.uk", '2018-06-01 22:53:40', "hunderwood@gmail.com"), 
	("nigellove@outlook.com", '2004-05-20 05:19:11', "acollins@yahoo.co.uk"), 
	("lyla-roserosa@yahoo.co.uk", '2013-12-24 05:27:06', "ckirkpatrick@gmail.com"), 
	("renesmeeruiz@gmail.com", '2007-12-20 06:17:35', "fabiofigueroa@yahoo.co.uk"), 
	("lyla-roserosa@yahoo.co.uk", '2017-11-21 21:23:59', "bdraper@yahoo.co.uk"), 
	("epickett@yahoo.co.uk", '2008-03-10 07:53:17', "jlove@outlook.com"), 
	("rcarr@yahoo.co.uk", '2007-12-07 18:57:09', "ccobb@gmail.com"), 
	("fjones@outlook.com", '2008-12-26 18:25:09', "jlove@outlook.com"), 
	("ahulme@gmail.com", '2009-05-13 01:42:16', "bdraper@yahoo.co.uk"), 
	("romyfrench@gmail.com", '2014-05-06 12:09:35', "bgraham@outlook.com"), 
	("mpiper@yahoo.co.uk", '2010-03-03 21:28:18', "ckirkpatrick@gmail.com"), 
	("cadencefleming@gmail.com", '2002-03-11 11:38:33', "fabiofigueroa@yahoo.co.uk"), 
	("hasnainfountain@yahoo.co.uk", '2012-01-23 15:44:55', "ckirkpatrick@gmail.com"), 
	("nday@gmail.com", '2008-02-06 15:15:51', "jjones@outlook.com"), 
	("daniellaholland@outlook.com", '2000-08-28 22:07:25', "gdouglas@yahoo.co.uk"), 
	("aemery@outlook.com", '2011-07-13 02:33:44', "gethinquintana@outlook.com"), 
	("kandrews@gmail.com", '2016-04-20 05:36:33', "acollins@yahoo.co.uk"), 
	("conalleblanc@yahoo.co.uk", '2017-05-16 10:33:55', "bgraham@outlook.com"), 
	("fjones@outlook.com", '2016-02-25 05:30:22', "avleenmair@gmail.com"), 
	("zstark@yahoo.co.uk", '2001-11-09 04:22:25', "ccobb@gmail.com"), 
	("shakeelhutchings@yahoo.co.uk", '2014-01-01 14:13:48', "hunderwood@gmail.com"), 
	("pknights@outlook.com", '2016-12-25 13:55:03', "hunderwood@gmail.com"), 
	("ahills@outlook.com", '2005-07-20 07:44:51', "elizabethpark@outlook.com"), 
	("lisa-mariehubbard@outlook.com", '2007-02-02 13:50:40', "hunderwood@gmail.com"), 
	("ahalliday@yahoo.co.uk", '2010-10-28 20:36:37', "bdraper@yahoo.co.uk"), 
	("mohammadwynn@gmail.com", '2010-08-26 23:18:24', "gdouglas@yahoo.co.uk"), 
	("shakeelhutchings@yahoo.co.uk", '2012-06-18 06:32:28', "jbass@outlook.com"), 
	("reyaschmitt@outlook.com", '2003-04-30 21:36:27', "bdraper@yahoo.co.uk"), 
	("dcombs@outlook.com", '2005-09-07 11:25:19', "gethinquintana@outlook.com"), 
	("aspencer@gmail.com", '2002-12-15 07:34:52', "abrewer@yahoo.co.uk"), 
	("dcombs@outlook.com", '2014-08-22 09:20:34', "jjones@outlook.com"), 
	("kailawiggins@yahoo.co.uk", '2005-05-24 13:29:23', "svelazquez@yahoo.co.uk"), 
	("lyla-roserosa@yahoo.co.uk", '2016-10-11 11:37:46', "gethinquintana@outlook.com"), 
	("fhamer@yahoo.co.uk", '2017-09-20 09:50:48', "abrewer@yahoo.co.uk"), 
	("ashleagibbs@outlook.com", '2011-06-22 03:48:27', "fabiofigueroa@yahoo.co.uk"), 
	("mikailsolomon@gmail.com", '2015-01-05 12:47:38', "fabiofigueroa@yahoo.co.uk"), 
	("aleshazavala@outlook.com", '2014-12-29 17:55:25', "jklein@outlook.com"), 
	("inayalynn@yahoo.co.uk", '2012-10-19 16:02:52', "gdouglas@yahoo.co.uk"), 
	("cecilysilva@outlook.com", '2017-11-26 03:14:43', "bgraham@outlook.com"), 
	("llu@yahoo.co.uk", '2014-07-16 11:43:19', "lbaxter@outlook.com"), 
	("rscott@yahoo.co.uk", '2011-06-03 11:19:21', "fabiofigueroa@yahoo.co.uk"), 
	("conalleblanc@yahoo.co.uk", '2006-05-07 11:07:38', "bgraham@outlook.com"), 
	("leightonmorin@yahoo.co.uk", '2013-10-28 07:24:13', "jjones@outlook.com"), 
	("lsullivan@outlook.com", '2012-10-20 02:07:53', "abrewer@yahoo.co.uk"), 
	("sfaulkner@yahoo.co.uk", '2003-07-27 14:19:20', "abrewer@yahoo.co.uk"), 
	("smckay@outlook.com", '2012-12-29 20:24:47', "jklein@outlook.com"), 
	("rayastein@gmail.com", '2010-06-17 02:53:04', "abrewer@yahoo.co.uk"), 
	("mikailsolomon@gmail.com", '2016-01-12 16:44:29', "alanahcouch@yahoo.co.uk"), 
	("smckay@outlook.com", '2008-02-20 06:05:42', "jklein@outlook.com"), 
	("djameson@outlook.com", '2016-04-23 12:24:57', "alanahcouch@yahoo.co.uk"), 
	("kbeil@gmail.com", '2000-05-15 03:36:28', "gdouglas@yahoo.co.uk"), 
	("siddharthbarron@outlook.com", '2018-04-20 19:34:20', "ccobb@gmail.com"), 
	("bretkeith@gmail.com", '2010-05-19 18:03:08', "lbaxter@outlook.com"), 
	("rscott@yahoo.co.uk", '2002-12-12 05:20:22', "elizabethpark@outlook.com"), 
	("rhonawilks@outlook.com", '2009-06-01 14:44:21', "bdraper@yahoo.co.uk"), 
	("kstanley@yahoo.co.uk", '2018-04-09 18:41:50', "ccobb@gmail.com"), 
	("dellacurrie@outlook.com", '2008-08-09 11:55:12', "ckirkpatrick@gmail.com"), 
	("jakubwinters@gmail.com", '2014-10-23 15:40:10', "jklein@outlook.com"), 
	("bretkeith@gmail.com", '2002-05-30 06:32:43', "gethinquintana@outlook.com"), 
	("djameson@outlook.com", '2008-02-15 08:54:26', "bdraper@yahoo.co.uk"), 
	("kbeil@gmail.com", '2009-12-17 20:47:18', "jjones@outlook.com"), 
	("renesmeeruiz@gmail.com", '2007-04-19 08:34:19', "elizabethpark@outlook.com"), 
	("jakubwinters@gmail.com", '2013-04-24 12:36:30', "bgraham@outlook.com"), 
	("lyla-roserosa@yahoo.co.uk", '2001-10-31 16:28:29', "jklein@outlook.com"), 
	("rhonawilks@outlook.com", '2018-05-18 09:16:25', "elizabethpark@outlook.com"), 
	("estorey@gmail.com", '2002-06-10 22:31:48', "elizabethpark@outlook.com"), 
	("tmacgregor@gmail.com", '2015-05-27 20:11:51', "acollins@yahoo.co.uk"), 
	("jakubwinters@gmail.com", '2009-11-01 13:24:48', "jjones@outlook.com"), 
	("graceybostock@outlook.com", '2011-06-17 21:26:17', "abrewer@yahoo.co.uk"), 
	("fjones@outlook.com", '2001-05-13 05:30:57', "gethinquintana@outlook.com"), 
	("kbeil@gmail.com", '2006-05-31 17:46:16', "acollins@yahoo.co.uk"), 
	("antoniawoodard@gmail.com", '2015-03-16 10:34:24', "acollins@yahoo.co.uk"), 
	("donterees@gmail.com", '2004-03-31 17:06:53', "jbass@outlook.com"), 
	("teganwicks@outlook.com", '2004-12-08 02:04:03', "fabiofigueroa@yahoo.co.uk"), 
	("laurelboyle@yahoo.co.uk", '2004-06-13 05:45:42', "gethinquintana@outlook.com"), 
	("tpritchard@gmail.com", '2011-03-16 19:32:49', "fabiofigueroa@yahoo.co.uk"), 
	("zstark@yahoo.co.uk", '2002-12-01 02:33:45', "hunderwood@gmail.com"), 
	("hamishbaxter@yahoo.co.uk", '2003-01-25 06:09:04', "bdraper@yahoo.co.uk"), 
	("tmacgregor@gmail.com", '2018-04-30 02:55:13', "jbass@outlook.com"), 
	("rscott@yahoo.co.uk", '2010-11-11 15:46:24', "bgraham@outlook.com"), 
	("rcarr@yahoo.co.uk", '2017-11-27 20:50:15', "gethinquintana@outlook.com"), 
	("klewis@gmail.com", '2011-03-05 11:52:44', "jbass@outlook.com"), 
	("fjones@outlook.com", '2006-03-29 16:09:09', "svelazquez@yahoo.co.uk"), 
	("sfaulkner@yahoo.co.uk", '2002-11-26 18:02:14', "hunderwood@gmail.com"), 
	("kbeil@gmail.com", '2016-07-10 20:24:18', "gethinquintana@outlook.com"), 
	("djameson@outlook.com", '2007-12-03 05:28:50', "alanahcouch@yahoo.co.uk"), 
	("rayastein@gmail.com", '2008-09-09 11:33:52', "elizabethpark@outlook.com"), 
	("astone@gmail.com", '2018-11-14 16:26:06', "alanahcouch@yahoo.co.uk"), 
	("hburn@yahoo.co.uk", '2016-09-20 11:47:09', "jlove@outlook.com"), 
	("jakubwinters@gmail.com", '2011-02-06 05:53:46', "alanahcouch@yahoo.co.uk"), 
	("hamishbaxter@yahoo.co.uk", '2001-03-28 04:38:04', "fabiofigueroa@yahoo.co.uk"), 
	("zstark@yahoo.co.uk", '2016-10-30 08:29:42', "bdraper@yahoo.co.uk"), 
	("arjundrew@outlook.com", '2015-09-01 18:32:20', "fabiofigueroa@yahoo.co.uk"), 
	("fhamer@yahoo.co.uk", '2003-11-28 03:12:38', "gdouglas@yahoo.co.uk"), 
	("mariophan@outlook.com", '2017-12-07 20:30:10', "ccobb@gmail.com"), 
	("ahalliday@yahoo.co.uk", '2009-04-30 22:56:28', "bgraham@outlook.com"), 
	("bosborn@gmail.com", '2008-08-23 20:11:48', "jklein@outlook.com"), 
	("daniellaholland@outlook.com", '2007-07-27 17:15:35', "jlove@outlook.com"), 
	("pknights@outlook.com", '2009-04-22 17:27:53', "jbass@outlook.com"), 
	("ahawes@yahoo.co.uk", '2006-08-16 11:55:54', "hunderwood@gmail.com"), 
	("mohammadwynn@gmail.com", '2013-01-21 06:43:56', "ccobb@gmail.com"), 
	("rhonawilks@outlook.com", '2017-04-25 19:33:56', "gethinquintana@outlook.com"), 
	("kpadilla@yahoo.co.uk", '2018-04-29 17:58:05', "abrewer@yahoo.co.uk"), 
	("zstark@yahoo.co.uk", '2016-05-22 01:26:13', "svelazquez@yahoo.co.uk"), 
	("sfaulkner@yahoo.co.uk", '2004-08-14 23:09:06', "alanahcouch@yahoo.co.uk"), 
	("sfaulkner@yahoo.co.uk", '2015-04-17 21:58:30', "jjones@outlook.com"), 
	("lyla-roserosa@yahoo.co.uk", '2012-01-26 19:41:47', "abrewer@yahoo.co.uk");

-- Insert order details data
INSERT INTO OrderDetails 
	(CustomerEmail, OrderDate, ServiceName, ServiceOrderedPrice, Discount, Quantity) 
VALUES 
	("conalleblanc@yahoo.co.uk", '2017-05-16 10:33:55', "Phone/Tablet Repair", 69.99, 17.00, 3), 
	("bretkeith@gmail.com", '2002-05-30 06:32:43', "Troubleshoot PC", 54.99, 4.00, 4), 
	("shakeelhutchings@yahoo.co.uk", '2015-12-06 13:50:15', "Setup", 39.99, 9.00, 2), 
	("cdennis@outlook.com", '2010-03-31 02:21:09', "Software Errors", 14.99, 6.00, 2), 
	("daniellaholland@outlook.com", '2000-08-28 22:07:25', "Software Errors", 14.99, 4.00, 4), 
	("hasnainfountain@yahoo.co.uk", '2012-01-23 15:44:55', "Printer Setup", 49.99, 7.00, 3), 
	("cdennis@outlook.com", '2010-03-31 02:21:09', "Setup", 39.99, 0.00, 1), 
	("rayastein@gmail.com", '2008-09-09 11:33:52', "Data Retrieval", 399.99, 95.00, 2), 
	("ahills@outlook.com", '2005-02-13 10:30:45', "OS Support", 129.99, 35.00, 3), 
	("cfuentes@outlook.com", '2016-12-20 08:24:36', "OS Support", 129.99, 7.00, 3), 
	("smckay@outlook.com", '2008-02-20 06:05:42', "Computer Healthcheck", 59.99, 13.00, 1), 
	("zstark@yahoo.co.uk", '2001-11-09 04:22:25', "Computer Training", 499.99, 20.00, 2), 
	("ahulme@gmail.com", '2015-06-20 02:04:54', "Full Windows Install", 54.99, 3.00, 3), 
	("graceybostock@outlook.com", '2011-06-17 21:26:17', "Computer Training", 499.99, 234.00, 3), 
	("renesmeeruiz@gmail.com", '2007-12-20 06:17:35', "Computer Healthcheck", 59.99, 19.00, 1),
	("mohammadwynn@gmail.com", '2013-01-21 06:43:56', "Internet Connection", "59.99", 20.00, 3),
	("donterees@gmail.com", '2004-03-31 17:06:53', "Software Errors", "14.99", 7.00, 4),
	("bretkeith@gmail.com", '2015-08-25 10:34:12', "Device Unlocking", "19.99", 1.00, 5),
	("sfaulkner@yahoo.co.uk", '2003-07-27 14:19:20', "Internet Connection", "59.99", 12.00, 5),
	("ahalliday@yahoo.co.uk", '2009-04-30 22:56:28', "Troubleshoot PC", "54.99", 23.00, 1),
	("sclemons@gmail.com", '2010-03-23 20:21:34', "Basic Windows Install", "34.99", 6.00, 5),
	("lyla-roserosa@yahoo.co.uk", '2012-01-26 19:41:47', "Virus Removal", "49.99", 21.00, 2),
	("kbeil@gmail.com", '2006-11-22 02:48:24', "Data Retrieval", "399.99", 85.00, 5),
	("daniellaholland@outlook.com", '2018-03-02 09:44:27', "Virus Removal", "49.99", 14.00, 4),
	("mpiper@yahoo.co.uk", '2007-07-06 19:36:26', "Basic Windows Install", "34.99", 0.00, 1),
	("llu@yahoo.co.uk", '2014-07-16 11:43:19', "OS Support", "129.99", 14.00, 5),
	("tmacgregor@gmail.com", '2018-04-30 02:55:13', "Phone/Tablet Repair", "69.99", 10.00, 2),
	("cdennis@outlook.com", '2005-03-26 18:58:45', "Setup and Personalise", "49.99", 6.00, 1),
	("cfuentes@outlook.com", '2016-12-20 08:24:36', "Network Repairs", "699.99", 52.00, 3),
	("lyla-roserosa@yahoo.co.uk", '2017-11-21 21:23:59', "Basic Windows Install", "34.99", 14.00, 1),
	("slin@outlook.com", '2005-01-03 17:30:14', "File Backup", "39.99", 4.00, 4),
	("fhamer@yahoo.co.uk", '2018-06-01 22:53:40', "Device Unlocking", "19.99", 8.00, 1),
	("hburn@yahoo.co.uk", '2015-07-25 18:48:14', "Internet Connection", "59.99", 5.00, 4),
	("lisa-mariehubbard@outlook.com", '2007-02-02 13:50:40', "Email Support", "34.99", 3.00, 3),
	("shakiracontreras@gmail.com", '2000-08-18 04:10:45', "File Backup", "39.99", 1.00, 5),
	("nday@gmail.com", '2015-08-08 11:09:40', "Software Errors", "14.99", 2.00, 3),
	("laurelboyle@yahoo.co.uk", '2004-06-13 05:45:42', "Email Support", "34.99", 7.00, 5),
	("shume@yahoo.co.uk", '2017-04-15 15:20:29', "File Backup", "39.99", 6.00, 2),
	("rlord@yahoo.co.uk", '2001-05-15 21:21:22', "Data Retrieval", "399.99", 75.00, 3),
	("fjones@outlook.com", '2016-02-25 05:30:22', "Hardware Install", "39.99", 3.00, 2),
	("mikailsolomon@gmail.com", '2016-01-12 16:44:29', "Setup", "39.99", 2.00, 1),
	("bosborn@gmail.com", '2008-08-23 20:11:48', "Email Support", "34.99", 12.00, 5),
	("rscott@yahoo.co.uk", '2011-06-03 11:19:21', "File Backup", "39.99", 0.00, 4),
	("bretkeith@gmail.com", '2002-05-30 06:32:43', "Phone/Tablet Repair", "69.99", 12.00, 2),
	("conalleblanc@yahoo.co.uk", '2006-05-07 11:07:38', "Computer Training", "499.99", 224.00, 5),
	("daniellaholland@outlook.com", '2002-01-18 21:14:38', "Troubleshoot PC", "54.99", 5.00, 3),
	("rhonawilks@outlook.com", '2018-05-18 09:16:25', "OS Support", "129.99", 42.00, 4),
	("aspencer@gmail.com", '2002-12-15 07:34:52', "Virus Removal", "49.99", 4.00, 2),
	("shakeelhutchings@yahoo.co.uk", '2007-02-21 17:07:55', "Setup and Personalise", "49.99", 21.00, 4),
	("rscott@yahoo.co.uk", '2010-11-11 15:46:24', "Computer Healthcheck", "59.99", 17.00, 2),
	("fjones@outlook.com", '2003-10-29 04:10:51', "Troubleshoot PC", "54.99", 22.00, 3),
	("mariyamreed@yahoo.co.uk", '2008-01-12 18:36:25', "Internet Connection", "59.99", 2.00, 4),
	("mpiper@yahoo.co.uk", '2010-03-03 21:28:18', "Hardware Install", "39.99", 8.00, 3),
	("shakeelhutchings@yahoo.co.uk", '2015-12-06 13:50:15', "Setup and Personalise", "49.99", 4.00, 2),
	("sfaulkner@yahoo.co.uk", '2004-08-14 23:09:06', "Phone/Tablet Repair", "69.99", 30.00, 4),
	("kandrews@gmail.com", '2016-04-20 05:36:33', "Setup and Personalise", "49.99", 3.00, 1),
	("arjundrew@outlook.com", '2015-09-01 18:32:20', "Setup", "39.99", 8.00, 2),
	("lyla-roserosa@yahoo.co.uk", '2001-10-31 16:28:29', "Full Windows Install", "54.99", 11.00, 2),
	("pknights@outlook.com", '2016-12-25 13:55:03', "Basic Windows Install", "34.99", 2.00, 1),
	("shakeelhutchings@yahoo.co.uk", '2012-06-18 06:32:28', "Device Unlocking", "19.99", 5.00, 5),
	("conalleblanc@yahoo.co.uk", '2017-05-16 10:33:55', "Email Support", "34.99", 4.00, 3),
	("teganwicks@outlook.com", '2004-12-08 02:04:03', "Phone/Tablet Repair", "69.99", 7.00, 2),
	("sfaulkner@yahoo.co.uk", '2002-11-26 18:02:14', "Data Retrieval", "399.99", 155.00, 1),
	("fjones@outlook.com", '2001-05-13 05:30:57', "Virus Removal", "49.99", 8.00, 5),
	("hasnainfountain@yahoo.co.uk", '2012-01-23 15:44:55', "PC Retune", "69.99", 25.00, 5),
	("nday@gmail.com", '2008-02-06 15:15:51', "PC Retune", "69.99", 27.00, 1),
	("jakubwinters@gmail.com", '2008-05-21 07:30:08', "PC Retune", "69.99", 30.00, 3),
	("mtrejo@gmail.com", '2013-11-15 19:41:48', "File Backup", "39.99", 18.00, 4),
	("kailawiggins@yahoo.co.uk", '2005-05-24 13:29:23', "Computer Healthcheck", "59.99", 18.00, 1),
	("zstark@yahoo.co.uk", '2001-11-09 04:22:25', "Troubleshoot PC", "54.99", 5.00, 1),
	("cadencefleming@gmail.com", '2002-03-11 11:38:33', "PC Retune", "69.99", 1.00, 2),
	("tpritchard@gmail.com", '2011-03-16 19:32:49', "Internet Connection", "59.99", 11.00, 5),
	("renesmeeruiz@gmail.com", '2007-04-19 08:34:19', "Device Unlocking", "19.99", 5.00, 4),
	("ahulme@gmail.com", '2015-06-20 02:04:54', "Troubleshoot PC", "54.99", 11.00, 2),
	("zstark@yahoo.co.uk", '2016-10-30 08:29:42', "PC Retune", "69.99", 33.00, 4),
	("klewis@gmail.com", '2009-01-24 12:06:24', "Phone/Tablet Repair", "69.99", 34.00, 5),
	("tmacgregor@gmail.com", '2001-05-01 14:38:02', "Hardware Install", "39.99", 17.00, 2),
	("hamishbaxter@yahoo.co.uk", '2003-01-25 06:09:04', "Device Unlocking", "19.99", 6.00, 3),
	("graceybostock@outlook.com", '2011-06-17 21:26:17', "Email Support", "34.99", 1.00, 3),
	("lrankin@outlook.com", '2013-06-03 09:48:43', "OS Support", "129.99", 38.00, 5),
	("hamishbaxter@yahoo.co.uk", '2001-03-28 04:38:04', "Phone/Tablet Repair", "69.99", 20.00, 5),
	("sfaulkner@yahoo.co.uk", '2015-04-17 21:58:30', "Phone/Tablet Repair", "69.99", 28.00, 1),
	("kstanley@yahoo.co.uk", '2018-04-09 18:41:50', "Hardware Upgrade", "109.99", 7.00, 3),
	("shume@yahoo.co.uk", '2016-01-20 18:22:24', "Hardware Install", "39.99", 5.00, 2),
	("romyfrench@gmail.com", '2014-05-06 12:09:35', "Basic Windows Install", "34.99", 12.00, 3),
	("kbeil@gmail.com", '2016-07-10 20:24:18', "File Backup", "39.99", 6.00, 3),
	("sfaulkner@yahoo.co.uk", '2009-06-06 02:46:53', "Troubleshoot PC", "54.99", 21.00, 4),
	("antoniawoodard@gmail.com", '2015-03-16 10:34:24', "Internet Connection", "59.99", 4.00, 3),
	("hburn@yahoo.co.uk", '2015-09-15 02:35:35', "Basic Windows Install", "34.99", 5.00, 2),
	("ahulme@gmail.com", '2009-05-13 01:42:16', "Hardware Install", "39.99", 0.00, 4),
	("bsears@yahoo.co.uk", '2010-04-20 18:17:21', "Email Support", "34.99", 16.00, 2),
	("zstark@yahoo.co.uk", '2002-12-01 02:33:45', "Setup and Personalise", "49.99", 1.00, 1),
	("zstark@yahoo.co.uk", '2016-05-22 01:26:13', "PC Retune", "69.99", 13.00, 3),
	("bretkeith@gmail.com", '2010-05-19 18:03:08', "File Backup", "39.99", 3.00, 3),
	("djameson@outlook.com", '2016-04-23 12:24:57', "Basic Windows Install", "34.99", 13.00, 4),
	("fjones@outlook.com", '2006-03-29 16:09:09', "File Backup", "39.99", 14.00, 2),
	("fhamer@yahoo.co.uk", '2017-09-20 09:50:48', "Computer Training", "499.99", 226.00, 2),
	("aleshazavala@outlook.com", '2014-12-29 17:55:25', "Software Errors", "14.99", 5.00, 1),
	("epickett@yahoo.co.uk", '2008-03-10 07:53:17', "Data Retrieval", "399.99", 142.00, 1),
	("hburn@yahoo.co.uk", '2016-09-20 11:47:09', "Data Retrieval", "399.99", 177.00, 1),
	("shakeelhutchings@yahoo.co.uk", '2014-01-01 14:13:48', "Device Unlocking", "19.99", 8.00, 1),
	("rayastein@gmail.com", '2010-06-17 02:53:04', "Software Errors", "14.99", 5.00, 2),
	("mariophan@outlook.com", '2017-12-07 20:30:10', "Hardware Install", "39.99", 12.00, 4),
	("jakubwinters@gmail.com", '2013-04-24 12:36:30', "Full Windows Install", "54.99", 23.00, 5),
	("lrankin@outlook.com", '2008-10-04 06:50:38', "Printer Setup", "49.99", 7.00, 1),
	("jakubwinters@gmail.com", '2009-11-01 13:24:48', "Software Errors", "14.99", 5.00, 3),
	("smckay@outlook.com", '2008-02-20 06:05:42', "Hardware Upgrade", "109.99", 25.00, 5),
	("mariyamreed@yahoo.co.uk", '2018-10-28 10:10:10', "Hardware Upgrade", "109.99", 25.00, 5),
	("smckay@outlook.com", '2007-08-07 13:54:26', "File Backup", "39.99", 15.00, 3),
	("dellacurrie@outlook.com", '2008-08-09 11:55:12', "Data Retrieval", "399.99", 142.00, 5),
	("lyla-roserosa@yahoo.co.uk", '2000-01-27 09:25:19', "Computer Training", "499.99", 6.00, 3),
	("dcombs@outlook.com", '2005-09-07 11:25:19', "PC Retune", "69.99", 18.00, 5),
	("astone@gmail.com", '2001-11-17 10:48:51', "Setup and Personalise", "49.99", 19.00, 1),
	("rhonawilks@outlook.com", '2017-04-25 19:33:56', "Basic Windows Install", "34.99", 5.00, 5),
	("ahulme@gmail.com", '2016-02-02 05:44:16', "PC Retune", "69.99", 32.00, 5),
	("renesmeeruiz@gmail.com", '2007-12-20 06:17:35', "Troubleshoot PC", "54.99", 4.00, 5),
	("siddharthbarron@outlook.com", '2018-04-20 19:34:20', "Hardware Install", "39.99", 12.00, 3),
	("rhonawilks@outlook.com", '2009-06-01 14:44:21', "Internet Connection", "59.99", 18.00, 2),
	("roganjenkins@yahoo.co.uk", '2005-10-20 20:02:11', "Hardware Upgrade", "109.99", 52.00, 5),
	("sfaulkner@yahoo.co.uk", '2005-04-10 12:54:47', "Full Windows Install", "54.99", 8.00, 4),
	("dcombs@outlook.com", '2014-08-22 09:20:34', "File Backup", "39.99", 4.00, 2),
	("kbeil@gmail.com", '2000-05-15 03:36:28', "Data Retrieval", "399.99", 170.00, 2),
	("vturner@yahoo.co.uk", '2011-05-28 18:48:39', "Virus Removal", "49.99", 24.00, 1),
	("lyla-roserosa@yahoo.co.uk", '2013-02-27 02:46:48', "Computer Healthcheck", "59.99", 15.00, 4),
	("nigellove@outlook.com", '2004-05-20 05:19:11', "Data Retrieval", "399.99", 47.00, 2),
	("romyfrench@gmail.com", '2012-04-21 13:19:30', "Setup", "39.99", 7.00, 5),
	("aemery@outlook.com", '2011-07-13 02:33:44', "File Backup", "39.99", 1.00, 3),
	("bsears@yahoo.co.uk", '2005-07-15 06:24:32', "Software Errors", "14.99", 7.00, 5),
	("kbeil@gmail.com", '2006-05-31 17:46:16', "Computer Healthcheck", "59.99", 9.00, 4),
	("rscott@yahoo.co.uk", '2002-12-12 05:20:22', "OS Support", "129.99", 42.00, 2),
	("ashleagibbs@outlook.com", '2011-06-22 03:48:27', "Software Errors", "14.99", 2.00, 2),
	("aleshazavala@outlook.com", '2014-08-12 15:30:55', "Basic Windows Install", "34.99", 1.00, 2),
	("bsears@yahoo.co.uk", '2005-06-30 07:26:41', "Network Repairs", "699.99", 314.00, 3),
	("sclemons@gmail.com", '2012-09-16 11:55:19', "Virus Removal", "49.99", 2.00, 2),
	("djameson@outlook.com", '2008-02-15 08:54:26', "Network Repairs", "699.99", 75.00, 5),
	("nigellove@outlook.com", '2014-03-15 14:42:47', "Device Unlocking", "19.99", 6.00, 1),
	("daniellaholland@outlook.com", '2000-08-28 22:07:25', "PC Crashes", "49.99", 15.00, 5),
	("zstark@yahoo.co.uk", '2011-07-23 21:50:35', "Network Repairs", "699.99", 196.00, 4),
	("lyla-roserosa@yahoo.co.uk", '2016-10-11 11:37:46', "OS Support", "129.99", 7.00, 3),
	("astone@gmail.com", '2016-08-19 06:47:03', "Internet Connection", "59.99", 19.00, 1),
	("ahills@outlook.com", '2005-02-13 10:30:45', "Computer Healthcheck", "59.99", 16.00, 4),
	("atillman@yahoo.co.uk", '2014-04-05 18:50:50', "Hardware Upgrade", "109.99", 54.00, 4),
	("inayalynn@yahoo.co.uk", '2012-10-19 16:02:52', "Printer Setup", "49.99", 9.00, 4),
	("fjones@outlook.com", '2008-12-26 18:25:09', "Internet Connection", "59.99", 6.00, 5),
	("ahills@outlook.com", '2011-04-30 10:28:25', "Device Unlocking", "19.99", 9.00, 4),
	("ahawes@yahoo.co.uk", '2006-08-16 11:55:54', "PC Crashes", "49.99", 20.00, 5),
	("estorey@gmail.com", '2002-06-10 22:31:48', "Email Support", "34.99", 3.00, 4),
	("leightonmorin@yahoo.co.uk", '2013-10-28 07:24:13', "PC Retune", "69.99", 1.00, 5),
	("rayastein@gmail.com", '2008-09-09 11:33:52', "Network Repairs", "699.99", 49.00, 2),
	("ashleagibbs@outlook.com", '2012-11-08 20:07:17', "Full Windows Install", "54.99", 12.00, 5),
	("smckay@outlook.com", '2012-12-29 20:24:47', "OS Support", "129.99", 28.00, 5),
	("kcarter@yahoo.co.uk", '2007-05-09 13:07:07', "Basic Windows Install", "34.99", 13.00, 3),
	("klewis@gmail.com", '2011-03-05 11:52:44', "Network Repairs", "699.99", 285.00, 4),
	("djameson@outlook.com", '2007-12-03 05:28:50', "Data Retrieval", "399.99", 169.00, 4),
	("inayalynn@yahoo.co.uk", '2007-09-27 15:50:27', "Computer Healthcheck", "59.99", 0.00, 4),
	("hamishbaxter@yahoo.co.uk", '2008-07-09 02:50:37', "Software Installation", "39.99", 18.00, 1),
	("kbeil@gmail.com", '2009-12-17 20:47:18', "Software Installation", "39.99", 16.00, 3),
	("laurelboyle@yahoo.co.uk", '2007-12-03 21:33:37', "Virus Removal", "49.99", 1.00, 5),
	("jakubwinters@gmail.com", '2011-02-06 05:53:46', "File Backup", "39.99", 4.00, 3),
	("kenanmill@gmail.com", '2003-06-02 13:04:55', "Setup and Personalise", "49.99", 16.00, 5),
	("reyaschmitt@outlook.com", '2003-04-30 21:36:27', "Virus Removal", "49.99", 14.00, 3),
	("mpiper@yahoo.co.uk", '2011-01-06 20:27:03', "Device Unlocking", "19.99", 5.00, 2),
	("jakubwinters@gmail.com", '2014-10-23 15:40:10', "Computer Training", "499.99", 53.00, 3),
	("fhamer@yahoo.co.uk", '2003-11-28 03:12:38', "Data Retrieval", "399.99", 75.00, 2),
	("cfuentes@outlook.com", '2016-12-27 06:27:34', "Internet Connection", "59.99", 28.00, 2),
	("mohammadwynn@gmail.com", '2010-08-26 23:18:24', "PC Crashes", "49.99", 12.00, 5),
	("lsullivan@outlook.com", '2012-10-20 02:07:53', "PC Crashes", "49.99", 10.00, 3),
	("donterees@gmail.com", '2001-01-16 07:40:12', "File Backup", "39.99", 4.00, 2),
	("lyla-roserosa@yahoo.co.uk", '2013-12-24 05:27:06', "Computer Training", "499.99", 176.00, 5),
	("cdennis@outlook.com", '2010-03-31 02:21:09', "Software Installation", "39.99", 16.00, 3),
	("djameson@outlook.com", '2018-05-17 01:35:07', "Computer Training", "499.99", 227.00, 5),
	("kpadilla@yahoo.co.uk", '2018-04-29 17:58:05', "Software Errors", "14.99", 1.00, 2),
	("pknights@outlook.com", '2009-04-22 17:27:53', "Printer Setup", "49.99", 13.00, 5),
	("ahills@outlook.com", '2005-07-20 07:44:51', "OS Support", "129.99", 22.00, 1),
	("renesmeeruiz@gmail.com", '2014-11-27 19:34:36', "File Backup", "39.99", 8.00, 2),
	("daniellaholland@outlook.com", '2007-07-27 17:15:35', "Troubleshoot PC", "54.99", 1.00, 3),
	("tmacgregor@gmail.com", '2015-05-27 20:11:51', "OS Support", "129.99", 8.00, 5),
	("jonathangarza@gmail.com", '2000-06-16 15:45:55', "Data Retrieval", "399.99", 46.00, 2),
	("jonathangarza@gmail.com", '2000-06-21 22:13:45', "Hardware Install", "39.99", 19.00, 1),
	("mikailsolomon@gmail.com", '2015-01-05 12:47:38', "Computer Healthcheck", "59.99", 18.00, 2),
	("astone@gmail.com", '2018-11-14 16:26:06', "Basic Windows Install", "34.99", 3.00, 1),
	("klewis@gmail.com", '2013-10-19 20:47:58', "Phone/Tablet Repair", "69.99", 12.00, 5),
	("daniellaholland@outlook.com", '2000-06-19 15:08:53', "Computer Healthcheck", "59.99", 13.00, 3),
	("cecilysilva@outlook.com", '2017-11-26 03:14:43', "Software Errors", "14.99", 4.00, 5),
	("ellennicholls@outlook.com", '2017-06-23 06:24:06', "Software Errors", "14.99", 3.00, 2),
	("ahalliday@yahoo.co.uk", '2010-10-28 20:36:37', "Network Repairs", "699.99", 342.00, 5),
	("jonathangarza@gmail.com", '2016-09-11 19:33:44', "Software Errors", "14.99", 3.00, 2),
	("mariyamreed@yahoo.co.uk", '2001-03-01 04:37:04', "Network Repairs", "699.99", 161.00, 2),
	("rcarr@yahoo.co.uk", '2007-12-07 18:57:09', "Computer Healthcheck", "59.99", 22.00, 4),
	("rcarr@yahoo.co.uk", '2017-11-27 20:50:15', "Troubleshoot PC", "54.99", 15.00, 5);

-- Insert order details data in certain columns only - the quantity will be filled by the default value
INSERT INTO OrderDetails
	(CustomerEmail, OrderDate, ServiceName, ServiceOrderedPrice, Discount)
VALUES
	("sfaulkner@yahoo.co.uk", '2009-06-06 02:46:53', "Computer Healthcheck", 59.99, 10.00),
	("llu@yahoo.co.uk", '2014-07-16 11:43:19', "Software Errors", 14.99, 2.00);

-- Insert accounts data
INSERT INTO Accounts
	(CustomerEmail, LastLogin, Username, Password)
VALUES
	("aleshazavala@outlook.com", '2017-08-04 12:37:06', "ScentedRhino", SHA2("1234", 256)),
	("rhonawilks@outlook.com", '2016-12-28 16:25:53', "DirtySkunk", SHA2("p4ssw0rd", 256)),
	("rcarr@yahoo.co.uk", '2015-07-01 04:16:02', "IronGerbil", SHA2("pass123", 256)),
	("sfaulkner@yahoo.co.uk", '2018-08-07 17:12:46', "Wolferal", SHA2("abc123", 256)),
	("amcneil@outlook.com", '2019-07-30 19:03:12', "SleepyCranberry", SHA2("fruitcake123", 256)),
	("heaton@yahoo.co.uk", '2013-05-02 08:12:16', "RecordBee", SHA2("imepic99", 256)),
	("tamarjarvis@outlook.com", '2014-04-18 06:53:42', "Griffinite", SHA2("amazingguy1!", 256)),
	("daniellaholland@outlook.com", '2016-10-23 22:10:11', "Cougarfield", SHA2("ilovecabbage7?", 256)),
	("megashley@gmail.com", '2014-07-19 17:54:12', "Laserpent", SHA2("ash7amazing!", 256)),
	("aemery@outlook.com", '2018-05-26 21:43:12', "Tweetail", SHA2("emmy3.", 256)),
	("llu@yahoo.co.uk", '2019-06-13 16:32:37', "TinyManatee", SHA2("lilguy123", 256)),
	("kpadilla@yahoo.co.uk", '2016-11-23 18:21:23', "CriminalCalf", SHA2("kaipadilla91", 256)),
	("rscott@yahoo.co.uk", '2017-02-01 03:06:09', "Sniperv", SHA2("scottyboi55", 256));

-- Query 1 - select details of all customers who have placed an order with the company
PREPARE query1 FROM
'SELECT 
	c.Email, c.Firstname, c.Lastname, c.HouseNo, c.PostCode, c.City 
FROM 
	customers c 
WHERE Email IN 
	(SELECT Email FROM customers UNION SELECT CustomerEmail FROM orders);';
EXECUTE query1;
DEALLOCATE PREPARE query1;

-- Query 2 - select details of all staff, the orders they have allocated and the order details
PREPARE query2 FROM
'SELECT 
	s.Email SEmail, s.Firstname SFirstname, s.Lastname SLastname, o.OrderDate OrderDateTime, od.ServiceName, od.ServiceOrderedPrice, od.Discount, od.Quantity 
FROM 
	staff s 
LEFT JOIN orders o ON 
	s.Email = o.StaffEmail 
RIGHT JOIN orderdetails od ON 
	o.CustomerEmail = od.CustomerEmail AND o.OrderDate = od.OrderDate 
WHERE od.OrderDate IN 
	(SELECT OrderDate FROM orders);';
EXECUTE query2;
DEALLOCATE PREPARE query2;

-- Query 3 - select all the customers and the details of the orders they have
PREPARE query3 FROM
'SELECT 
	c.Email CEmail, c.Firstname CFirstname, c.Lastname CLastname, o.OrderDate OrderDateTime, od.ServiceName, od.ServiceOrderedPrice, od.Discount, od.Quantity 
FROM 
	customers c 
LEFT JOIN orders o ON 
	c.Email = o.CustomerEmail 
RIGHT JOIN orderdetails od ON 
	o.CustomerEmail = od.CustomerEmail AND o.OrderDate = od.OrderDate 
WHERE od.OrderDate IN 
	(SELECT OrderDate FROM orders);';
EXECUTE query3;
DEALLOCATE PREPARE query3;

-- Create copy of accounts table
CREATE TABLE copy_of_accounts LIKE accounts;
INSERT INTO copy_of_accounts SELECT * FROM accounts;

-- Create copy of customers table
CREATE TABLE copy_of_customers LIKE customers;
INSERT INTO copy_of_customers SELECT * FROM customers;

-- Create copy of order details table
CREATE TABLE copy_of_orderdetails LIKE orderdetails;
INSERT INTO copy_of_orderdetails SELECT * FROM orderdetails;

-- Create copy of orders table
CREATE TABLE copy_of_orders LIKE orders;
INSERT INTO copy_of_orders SELECT * FROM orders;

-- Create copy of services table
CREATE TABLE copy_of_services LIKE services;
INSERT INTO copy_of_services SELECT * FROM services;

-- Create copy of staff table
CREATE TABLE copy_of_staff LIKE staff;
INSERT INTO copy_of_staff SELECT * FROM staff;

-- Custom procedure - this is intended to fetch account details for an account that has previous orders with the company made. It will also report the number of orders made and the total spent
DROP PROCEDURE IF EXISTS AccountOrders;
DELIMITER $$
CREATE PROCEDURE AccountOrders(IN ascend BOOLEAN)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT "Error was encountered during procedure!";
IF ascend THEN
    SELECT 
        a.CustomerEmail, a.LastLogin, a.Username, a.Password, COUNT(o.OrderDate) ordercount, (CONCAT("£", SUM(od.ServiceOrderedPrice * od.Quantity) - SUM(od.Discount * od.Quantity))) paid 
    FROM 
        accounts a 
    INNER JOIN orders o ON 
        o.CustomerEmail = a.CustomerEmail 
    INNER JOIN orderdetails od ON 
        o.CustomerEmail = od.CustomerEmail 
    AND 
        od.OrderDate = o.OrderDate 
    WHERE 
        a.CustomerEmail = o.CustomerEmail 
    GROUP BY 
        a.CustomerEmail 
    ORDER BY 
        ordercount 
    ASC;
ELSE 
	SELECT 
        a.CustomerEmail, a.LastLogin, a.Username, a.Password, COUNT(o.OrderDate) ordercount, (CONCAT("£", SUM(od.ServiceOrderedPrice * od.Quantity) - SUM(od.Discount * od.Quantity))) paid 
    FROM 
        accounts a 
    INNER JOIN orders o ON 
        o.CustomerEmail = a.CustomerEmail 
    INNER JOIN orderdetails od ON 
        o.CustomerEmail = od.CustomerEmail 
    AND 
        od.OrderDate = o.OrderDate 
    WHERE 
        a.CustomerEmail = o.CustomerEmail 
    GROUP BY 
        a.CustomerEmail 
    ORDER BY 
        ordercount 
    DESC;
END IF;
END $$
DELIMITER ;

-- Call procedure in ascending order (highlights if statement functionality)
CALL AccountOrders(True);
-- Call procedure in descending order (highlights if statement functionality)
CALL AccountOrders(False);