USE AirRate
GO

CREATE SCHEMA Person
GO

DROP TABLE Person.UserInfo
CREATE TABLE Person.UserInfo(
	UserId int IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	Age int NOT NULL,
	Gender bit, 
	City nvarchar(50) NOT NULL,
	[Login] nvarchar(255) NOT NULL,
	[Password] nvarchar(255) NOT NULL,
	Email nvarchar(255) NOT NULL,
	PRIMARY KEY (UserId))
GO

CREATE SCHEMA City
GO

CREATE TABLE City.City(
	CityId int IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	PRIMARY KEY(CityId))
GO

CREATE TABLE City.District(
	DistrictId int IDENTITY(1, 1) NOT NULL,
	CityId int NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	PRIMARY KEY(DistrictId))
GO

CREATE SCHEMA Rating
GO

CREATE TABLE Rating.Rating(
	RatingId int IDENTITY(1, 1) NOT NULL,
	UserId int NOT NULL,
	DistrictId int NOT NULL,
	Rating float NOT NULL,
	PRIMARY KEY(RatingId))
GO

CREATE SCHEMA Complaints
GO

CREATE TABLE Complaints.Complaints(
	ComplaintsId int IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(255) NOT NULL,
	UserId int NOT NULL,
	DistrictId int NOT NULL,
	PRIMARY KEY(ComplaintsId))
GO

ALTER TABLE Rating.Rating
	ADD CONSTRAINT FK_Rating_UserID FOREIGN KEY (UserId)
		REFERENCES Person.UserInfo (UserId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
GO

ALTER TABLE Rating.Rating
	ADD CONSTRAINT FK_Rating_DistrictId FOREIGN KEY (DistrictId)
		REFERENCES City.District (DistrictId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
GO

ALTER TABLE City.District
	ADD CONSTRAINT FK_District_CityId FOREIGN KEY (CityId)
		REFERENCES City.City (CityId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
GO

ALTER TABLE Complaints.Complaints
	ADD CONSTRAINT FK_Complaints_UserId FOREIGN KEY (UserId)
		REFERENCES Person.UserInfo (UserId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
GO

--DELETE FROM Person.UserInfo
INSERT INTO Person.UserInfo([Name], Surname, Age, Gender, City, [Login], [Password], Email)
VALUES
('Dmitriy', 'Karimov', 25, 1, 'Omsk', 'DK2555', '123456', 'DK2555@mail.ru'),
('Ivan', 'Novikov', 23, 1, 'Omsk', 'IN2355', '123456', 'IN2355@mail.ru'),
('Julia', 'Panina', 20, 0, 'Omsk', 'JP2055', '123456', 'JP2055@mail.ru'),
('Ekaterina', 'Fomina', 34, 0, 'Omsk', 'EF3455', '123456', 'EF3455@mail.ru'),
('Olga', 'Glumieva', 26, 0, 'Omsk', 'OG2655', '123456', 'OG2655@mail.ru')
GO

SELECT * FROM Person.UserInfo

--DELETE FROM City.City
INSERT INTO City.City([Name])
VALUES
('Omsk')
GO

SELECT * FROM City.City

--DELETE FROM City.District
INSERT INTO City.District(CityId, [Name])
VALUES
(1, 'Kirovskiy'),
(1, 'Leninskiy'),
(1, 'Octoberskiy'),
(1, 'Sovietskiy'),
(1, 'Central')
GO

SELECT * FROM City.District

--DELETE FROM Rating.Rating
INSERT INTO Rating.Rating(UserId, DistrictId, Rating)
VALUES
(1, 1, 3.5),
(1, 2, 3.7),
(1, 3, 3.6),
(1, 4, 3.2),
(1, 5, 4.1),
(2, 1, 3.4),
(2, 2, 3.5),
(2, 3, 3.4),
(2, 4, 3.1),
(2, 5, 4.3),
(3, 1, 2.1),
(3, 2, 4.5),
(3, 3, 3.6),
(3, 4, 2.3),
(3, 5, 3.7),
(4, 1, 3.4),
(4, 2, 3.4),
(4, 3, 4.1),
(4, 4, 2.1),
(4, 5, 3.5),
(5, 1, 4.1),
(5, 2, 3.4),
(5, 3, 3.5),
(5, 4, 4.1),
(5, 5, 4.7)
GO

SELECT * FROM Rating.Rating

--DELETE FROM Complaints.Complaints
INSERT INTO Complaints.Complaints([Name], [Description], UserId, DistrictId)
VALUES
('Strange smell', 'There is a strange smell in the central part. At the intersection of st. Lenin and Karl-Marx', 1, 5),
('Hard breathe', 'It`s hard to breathe on Pushkin Street, the smell of burning is in the air.', 2, 3),
('Impossible to be outside', 'It is impossible to be outside, it is hard to breathe and my eyes are teary.', 3, 2),
('Horrible smell', 'It`s hard to be on Zavertyaev Street, you feel very unpleasant burning rubber.', 4, 1),
('Exhaust smell', 'The smell of something burning is distinctly felt in the street.', 5, 4)
GO

SELECT * FROM Complaints.Complaints

SELECT AVG(Rating) AS 'Average rating for District'
FROM Rating.Rating
WHERE DistrictId = 1

SELECT AVG(Rating) AS 'Average rating for City'
FROM Rating.Rating
JOIN City.District ON Rating.DistrictId = District.DistrictId
WHERE District.CityId = 1