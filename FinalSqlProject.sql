
-- create database--

CREATE DATABASE db_library;

--Go into the db_library database--

USE db_library;

--Create Publisher table --

CREATE TABLE PUBLISHER (
	Name VARCHAR(75) NOT NULL,
	Address VARCHAR(75) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

--insert values into publisher table --

INSERT INTO PUBLISHER
	(Name, Address, Phone)
	VALUES
	('Picador USA', '175 5th Ave, New York, NY 10010', '800-221-7945'), 
	('Viking', '345 Hudson St New York, NY 10014', '212-366-2000'), 
	('Harper Collins Publishers', '195 Broadway New York, NY 10007', '800-242-7737'),
	('Anchor', '1745 Broadway New York, NY 10019', '866-761-6685'), 
	('Ace Books', '1745 Broadway New York, NY 10019', '866-761-6685'), 
	('St. Martin''s Press', '175 5th Avenue New York, NY 10010', '800-221-7945'), 
	('Pocket Books', '1230 Avenue of the Americas New York NY 10020', '212-698-7033'), 
	('Allen & Unwin', '228 Queen Street Auckland, New Zealand', '64-9-377-3800'), 
	('Scribner', '1230 avenue of the americas new york ny 10020', '212-698-7000'), 
	('Laura Geringer Books', '195 Broadway New York, NY 10007', '800-242-7737'), 
	('Artisan', '225 Varick Street New York, NY 10014', '212-254-5900'), 
	('Houghton Mifflin Harcour', '9205 Southpark Center Loop Orlando, FL 32819', '800.225.3362') 
;
	
--Create Book table--

CREATE TABLE BOOK (
	Bookid INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(75) NOT NULL
);

--insert values into table book--

INSERT INTO BOOK
	(Title,PublisherName)
	VALUES
	('The Lost Tribe', 'Picador USA'),
	('It', 'Viking'),
	('The Poisonwood Bible', 'Harper Collins Publishers'),
	('NOS4A2', 'Harper Collins Publishers'),
	('The Dead Path', 'Anchor'),
	('Dune', 'Ace Books'),
	('The Silence of the Lambs', 'St. Martin''s Press'),
	('Swan Song', 'Pocket Books'),
	('The Lord of the Rings', '	Allen & Unwin'),
	('American Gods', 'Harper Collins Publishers'),
	('Watership Down', 'Scribner'),
	('Where the Wild Things Are', 'Harper Collins Publishers'),
	('If You Give a Mouse a Cookie', 'Laura Geringer Books'),
	('Where the Sidewalk Ends', 'Harper Collins Publishers'),
	('Bridge to Terabithia', 'Harper Collins Publishers'),
	('Stardust', 'Harper Collins Publishers'),
	('Weetzie Bat', 'Harper Collins Publishers'),
	('Joy of Cooking', 'Scribner'),
	('The French Laundry Cookbook', 'Artisan'),
	('The Baking Bible', 'Houghton Mifflin Harcourt')
;

--create table book_authors using bookid as fk--

CREATE TABLE BOOK_AUTHORS (
	Bookid INT NOT NULL CONSTRAINT fk_Bookid FOREIGN KEY REFERENCES BOOK(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR (50) NOT NULL
);

--insert values into book_authors--

INSERT INTO BOOK_AUTHORS
	(Bookid, AuthorName)
	VALUES
	(100, 'Mark Lee'),
	(101, 'Stephen King'),
	(102, 'Barbara Kingsolver'),
	(103, 'Joe Hill'),
	(104, 'Stephen M. Irwin'),
	(105, 'Frank Herbert'),
	(106, 'Thomas Harris'),
	(107, 'Robert R. McCammon'),
	(108, 'J. R. R. Tolkien'),
	(109, 'Neil Gaiman'),
	(110, 'Richard Adams'),
	(111, 'Maurice Sendak'),
	(112, 'Laura Joffe Numeroff'),
	(113, 'Shel Silverstein'),
	(114, 'Katherine Paterson'),
	(115, 'Neil Gaiman'),
	(116, 'Francesca Lia Block'),
	(117, 'Irma S. Rombauer'),
	(118, 'Thomas Keller'),
	(119, 'Rose Levy Beranbaum')
;

--create table library_branch --

CREATE TABLE LIBRARY_BRANCH (
	Branchid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR (50) NOT NULL,
	Address VARCHAR (75) NOT NULL
);

--inset values into library_branch --

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown', '7660 Clarewood Houston, Texas 77036'),
	('Central', '6400 High Star Dr, Houston, TX 77074'),
	('Morris Frank', '10103 Fondren, Houston, TX 77035'),
	('Southwest', '6100 Hillcroft St # 100, Houston, TX 77081')
;
	
--create table book_copies --

CREATE TABLE BOOK_COPIES (
	Bookid INT NOT NULL CONSTRAINT fkey_Bookid FOREIGN KEY REFERENCES BOOK(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	Branchid INT NOT NULL CONSTRAINT fk_Branchid FOREIGN KEY REFERENCES LIBRARY_BRANCH(Branchid) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

-- insert values into book_copies --

INSERT INTO BOOK_COPIES
	(Bookid, Branchid, No_Of_Copies)
	VALUES
	(100, 1, 4),
	(100, 2, 3),
	(100, 3, 2),
	(100, 4, 2),
	(101, 2, 4),
	(101, 3, 2),
	(102, 1, 5),
	(102, 2, 4),
	(102, 3, 3),
	(102, 4, 2),
	(103, 1, 2),
	(103, 2, 2),
	(103, 3, 3),
	(103, 4, 3),
	(104, 1, 2),
	(104, 2, 2),
	(104, 4, 3),
	(105, 1, 4),
	(106, 1, 3),
	(106, 2, 4),
	(107, 3, 3),
	(107, 4, 2),
	(108, 1, 3),
	(109, 1, 3),
	(110, 1, 2),
	(110, 2, 2),
	(111, 3, 4),
	(112, 4, 6),
	(112, 1, 2),
	(112, 2, 4),
	(113, 1, 3),
	(113, 2, 2),
	(114, 3, 2),
	(114, 4, 2),
	(115, 1, 3),
	(115, 2, 2),
	(115, 3, 2),
	(115, 4, 3),
	(116, 1, 2),
	(117, 2, 3),
	(117, 3, 4),
	(118, 4, 3),
	(119, 1, 2),
	(119, 2, 2),
	(119, 3, 4),
	(119, 4, 2)
;

-- create table borrower --
CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	Name VARCHAR(50),
	Address VARCHAR (75),
	Phone VARCHAR (50)
);

-- input values into table borrower --

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Henry Smith', '546 Ryegrass Ln Houston, TX 77074', '281-404-1234'),
	('Jerry Tanner', '87 Middleton Ct Houston, TX 77074', '281-590-3434'),
	('Jane Garcia', '454 Circle Ln Houston, TX 77036', '281-690-4321'),
	('Biff Campbell', '125 Silver Rd Houston, TX 77036', '281-345-6576'),
	('Charles Beckett', '346 Montana Dr Houston, TX 77035', '281-345-8887'),
	('Danny Boothe', '404 Montana Dr Houston, TX 77035', '281-404-9567'),
	('Matthew Gunner', '2 Asher Ave Houston, TX 77081', '281-345-0987'),
	('Rose Martinez', '67 Box Ct Houston, TX 77081', '281-389-0192'),
	('Seth Kim', '9045 Sunset Dr Houston, TX 77081', '281-567-8374'),
	('Kathy Warren', '1023  Houston, TX 77074', '281-4908-9797')
;

-- create table book_loans --

CREATE TABLE BOOK_LOANS (
	Bookid INT NOT NULL CONSTRAINT forkey_Bookid FOREIGN KEY REFERENCES BOOK(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	Branchid INT NOT NULL CONSTRAINT forkey_Branchid FOREIGN KEY REFERENCES LIBRARY_BRANCH(Branchid) ON UPDATE CASCADE ON DELETE CASCADE,
    CardNo INT NOT NULL CONSTRAINT forkey_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

-- input values into table book_loans --

INSERT INTO BOOK_LOANS
	(Bookid, Branchid, CardNo, DateOut, DueDate)
	VALUES
	(100, 2, 209, '2017-08-14', '2017-09-14'),
	(101, 2, 209, '2017-08-14', '2017-09-14'),
	(104, 2, 209, '2017-08-14', '2017-09-14'),
	(106, 2, 209, '2017-08-14', '2017-09-14'),
	(119, 2, 209, '2017-08-14', '2017-09-14'),
	(115, 2, 209, '2017-08-14', '2017-09-14'),
	(112, 2, 209, '2017-08-14', '2017-09-14'),
	(117, 2, 209, '2017-08-14', '2017-09-14'),
	(110, 2, 209, '2017-08-14', '2017-09-14'),
	(113, 2, 209, '2017-08-14', '2017-09-14'),
	(102, 1, 203, '2017-09-25', '2017-10-25'),
	(108, 1, 203, '2017-09-25', '2017-10-25'),
	(109, 1, 203, '2017-09-25', '2017-10-25'),
	(112, 1, 203, '2017-09-25', '2017-10-25'),
	(100, 1, 203, '2017-09-25', '2017-10-25'),
	(115, 1, 203, '2017-09-25', '2017-10-25'),
	(116, 1, 203, '2017-09-25', '2017-10-25'),
	(100, 4, 206, '2017-09-14', '2017-10-14'),
	(103, 4, 206, '2017-09-14', '2017-10-14'),
	(112, 4, 206, '2017-09-14', '2017-10-14'),
	(102, 4, 206, '2017-09-14', '2017-10-14'),
	(114, 4, 206, '2017-09-14', '2017-10-14'),
	(118, 4, 206, '2017-09-14', '2017-10-14'),
	(119, 4, 206, '2017-09-14', '2017-10-14'),
	(107, 4, 206, '2017-09-14', '2017-10-14'),
	(100, 4, 208, '2017-10-01', '2017-11-01'),
	(102, 4, 208, '2017-10-01', '2017-11-01'),
	(104, 4, 208, '2017-10-01', '2017-11-01'),
	(107, 4, 208, '2017-10-01', '2017-11-01'),
	(118, 4, 208, '2017-10-01', '2017-11-01'),
	(115, 4, 208, '2017-10-01', '2017-11-01'),
	(112, 4, 208, '2017-10-01', '2017-11-01'),
	(117, 3, 205, '2017-09-03', '2017-10-03'),
	(119, 3, 205, '2017-09-03', '2017-10-03'),
	(114, 3, 205, '2017-09-03', '2017-10-03'),
	(115, 3, 205, '2017-09-03', '2017-10-03'),
	(107, 3, 205, '2017-09-03', '2017-10-03'),
	(117, 3, 204, '2017-09-30', '2017-10-30'),
	(111, 3, 204, '2017-09-30', '2017-10-30'),
	(119, 3, 204, '2017-09-30', '2017-10-30'),
	(114, 3, 204, '2017-09-30', '2017-10-30'),
	(112, 4, 207, '2017-09-17', '2017-10-17'),
	(115, 4, 207, '2017-09-17', '2017-10-17'),
	(118, 4, 207, '2017-09-17', '2017-10-17'),
	(102, 1, 202, '2017-09-22', '2017-10-22'),
	(115, 1, 202, '2017-09-22', '2017-10-22'),
	(100, 1, 202, '2017-09-22', '2017-10-22'),
	(106, 2, 200, '2017-10-02', '2017-11-02'),
	(112, 2, 200, '2017-10-02', '2017-11-02'),
	(117, 2, 200, '2017-10-02', '2017-11-02')
;
	