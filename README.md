
# CODE-Challenge



## Description


This repository presents a project completed as part of the CODE Challenge for CODE University.

The main idea behind this project is to change my hometown's ecological situation. To achieve this, I decided to develop an easy-to-use mobile app where local citizens could report poor air quality in their area and monitor other notifications. Before starting the development, I analysed the target audience and created two personas to reflect the overall needs and concerns better. 

To gain the first feedback as soon as possible, I made a mock-up with Figma that reflected the planned functionality. I had tons of inspiration from the Figma Community as well. At the same time, I was thinking about what would happen in the background since all the complaints have to be stored somewhere. This was when I got introduced to SQL, which I used to create my first-ever databases. You can find them below, together with the code. All the data is solely testing data. 

In summary, I had a unique and rewarding experience where I learned a lot. As for the next, I would like to develop a SWIFT application for the IOS platform and a Kotlin application for the Android platform, also I would like to develop a website to extend the functionality of the site for advanced PC users in the future.


## Overall structure. 

I had to make links between the data tables.
                                             
The first image shows a diagram of how the tables are connected with each other. I have created a total of five tables: Complaints, user information, rating, district and city.

### Result screen
![image](https://user-images.githubusercontent.com/87894035/228008977-bfb617c4-1ab4-4c0a-be9f-f0c17dadd123.png)

##  Table with users' complaints.
After setting up the links, I created a table of complaints.

### Code solution:
```
 CREATE TABLE Complaints.Complaints(
	ComplaintsId int IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(255) NOT NULL,
	UserId int NOT NULL,
	DistrictId int NOT NULL,
	PRIMARY KEY(ComplaintsId))
GO
```
### Test data introduction:
```
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
```

#### Result screen
![image](https://user-images.githubusercontent.com/87894035/228015307-7b42b11a-3878-4de7-92ea-90e7578f07ee.png)

The complaints table contains the complaint number, the complaint name, description, user ID and the district ID of the district where the user sent the complaint.

## Table with city districts.
The next step was to create a table of districts.
The district table contains data about the district number, Id city and district name.

### Code solution:
```
 CREATE TABLE City.District(
	DistrictId int IDENTITY(1, 1) NOT NULL,
	CityId int NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	PRIMARY KEY(DistrictId))
GO
```
### Test data introduction:
```
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
```
### Result screen
![image](https://user-images.githubusercontent.com/87894035/228016473-fd687aeb-a803-4215-918b-7c4e4217b512.png)

## City Table.
After creating the districts table, I created a city table.
The city table contains data about the city ID and the name of the city. Since I based my challenge on solving the problem of the residents of my hometown. The test data in this table is my city data.

### Code solution:
```
CREATE SCHEMA City
GO

CREATE TABLE City.City(
	CityId int IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	PRIMARY KEY(CityId))
GO
```
### Test data introduction:
```
--DELETE FROM City.City
INSERT INTO City.City([Name])
VALUES
('Omsk')
GO
```

### Result screen
![image](https://user-images.githubusercontent.com/87894035/228018858-5a2f545e-8a36-46d6-a00f-76bf9626cdbd.png)


## User information.

In order to save user data and for properly working of authorisation and registration , I have created a table with personal user information.

The user data table is shown in the fifth image. It contains data about names, surnames, age, gender of users, as well as their login, password token and email.

### Code solution:
```
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
```
### Test data introduction:
```
--DELETE FROM Person.UserInfo
INSERT INTO Person.UserInfo([Name], Surname, Age, Gender, City, [Login], [Password], Email)
VALUES
('Dmitriy', 'Karimov', 25, 1, 'Omsk', 'DK2555', '123456', 'DK2555@mail.ru'),
('Ivan', 'Novikov', 23, 1, 'Omsk', 'IN2355', '123456', 'IN2355@mail.ru'),
('Julia', 'Panina', 20, 0, 'Omsk', 'JP2055', '123456', 'JP2055@mail.ru'),
('Ekaterina', 'Fomina', 34, 0, 'Omsk', 'EF3455', '123456', 'EF3455@mail.ru'),
('Olga', 'Glumieva', 26, 0, 'Omsk', 'OG2655', '123456', 'OG2655@mail.ru')
GO
```

### Result screen
![image](https://user-images.githubusercontent.com/87894035/228018487-8f298cd0-1bae-44b1-8d70-4b189a7a5400.png)

## Rating table.
I have created a rating table to save data of the air users' ratings.

The image number 6 shows the users' rating table, divided by the areas they have rated. It contains the user ID, the district ID and the rating the user has given it.

### Code solution:
```
CREATE SCHEMA Rating
GO

CREATE TABLE Rating.Rating(
	RatingId int IDENTITY(1, 1) NOT NULL,
	UserId int NOT NULL,
	DistrictId int NOT NULL,
	Rating float NOT NULL,
	PRIMARY KEY(RatingId))
GO
```

### Test data introduction:
```
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
```
### Result screen

![image](https://user-images.githubusercontent.com/87894035/228018895-d225ce50-8700-412b-97c0-81e922d91901.png)

## Average rating table for district and for city.
To output the average district rating, I have created a table of the average district rating.
  
Air cleanliness rating specifically, which is calculated with the help of function (AVG) shown below. The sum of the ratings given by the users is calculated and then divided by the number of users who gave a rating. 

### Code solution:
```
SELECT * FROM Complaints.Complaints

SELECT AVG(Rating) AS 'Average rating for District'
FROM Rating.Rating
WHERE DistrictId = 1
```
### Result screen
![image](https://user-images.githubusercontent.com/87894035/228020095-3d8a4617-097c-4578-8141-887e46d14075.png)
 
Calculation of the city's air cleanliness index, which is calculated using the function shown below. The sum of the neighbourhood ratings is calculated and then the result is divided by the number of districts.

### Code solution:
```
SELECT AVG(Rating) AS 'Average rating for City'
FROM Rating.Rating
JOIN City.District ON Rating.DistrictId = District.DistrictId
WHERE District.CityId = 1
```
### Result screen
![image](https://user-images.githubusercontent.com/87894035/228020153-32d6f7cf-7eca-4190-9d59-072da6eecbd8.png)
