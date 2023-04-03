 <div id="header" align="center">
  <img src="https://media.giphy.com/media/vISmwpBJUNYzukTnVx/giphy.gif" width="300"/>
</div>

# CODE-Challenge

## Description

This repository presents a project completed as part of the CODE Entrance Challenge. 

The first time I looked at the Challenge text,a variety of thoughts came to my mind - from the difficulties of digitalisation at charity organizations to the uncontrolled dumping of plastic into water reservoirs. In order to organize my ideas, I decided to take a walk around my neighborhood. However, as soon as I opened the door, the smell of chemicals in the air hit me in the nose. I have to admit that, unfortunately, this situation is no exception in my city. Citizens often complain about the fact that it is impossible to breathe freely. Everyone applies to the government one by one, but the local administration either ignores the requests or provides the results of laboratories that have found out nothing.

So what is the reason for this bad air quality? On the one hand, my hometown of Omsk is a large industrial center with many factories, plants and all sorts of production facilities. One of the local " proud" is a very large oil refinery with a number of chemical enterprises. On the other hand, there are many landfills around the city (including illegal ones). Only recently, the government has started taking active steps to fight against rubbish, e.g. through waste-sorting and incineration plants, but the first tangible results are still a long way off.

To change this situation, I decided to develop an easy-to-use mobile app where citizens could report poor air quality in the area they are in, as well as monitoring other notifications. Before starting to develop it, it is necessary to look at the target audience in more detail.


After an initial analysis, I needed a mocap made with Figma to gain first feedback. I've rarely experienced this application; however, I was surprised by the enormous potential - I had the chance to feel like a real designer who builds user flow and works on the interface and functionality. Even after watching hours of tutorial videos, I still had some questions, which I was able to solve with the help of the awesome Figma Community. Additionally, all the data needs to be stored somewhere. I learned about SQL, which was new to me, and after studying the documentation, I built my first databases. I aimed to make these databases more dynamic and reflect events like user data changes or a new report appearing.
While testing my mock-ups on family and friends, I realised that you have to give up things you are even attached to, but which confuses the final user. Admittedly, it was challenging the first few times, but later I realised that this process is an integral part of development.
To sum up, I had a truly unique and rewarding experience, and I hope that in the future, with the help of CODE, I will be able to implement my idea completely.

To store air assessment data, user data and data on polluted areas of the city, I created a database in SQL. All data added to the table are testing samples.

### Image #1
![image](https://user-images.githubusercontent.com/87894035/228008977-bfb617c4-1ab4-4c0a-be9f-f0c17dadd123.png)
                                              
The first image shows a diagram of how the tables are connected with each other. I have created a total of five tables: Complaints, user information, rating, district and city.

### Image #2
![image](https://user-images.githubusercontent.com/87894035/228015307-7b42b11a-3878-4de7-92ea-90e7578f07ee.png)

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



The complaints table contains the complaint number, the complaint name, description, user ID and the district ID of the district where the user sent the complaint.

### Image #3
![image](https://user-images.githubusercontent.com/87894035/228016473-fd687aeb-a803-4215-918b-7c4e4217b512.png)

```
 CREATE TABLE City.District(
	DistrictId int IDENTITY(1, 1) NOT NULL,
	CityId int NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	PRIMARY KEY(DistrictId))
GO
```

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

The district table contains data about the district number, Id city and district name

### Image #4
![image](https://user-images.githubusercontent.com/87894035/228018858-5a2f545e-8a36-46d6-a00f-76bf9626cdbd.png)

```
CREATE SCHEMA City
GO

CREATE TABLE City.City(
	CityId int IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	PRIMARY KEY(CityId))
GO
```
```
--DELETE FROM City.City
INSERT INTO City.City([Name])
VALUES
('Omsk')
GO
```

The city table contains data about the city ID and the name of the city. Since I based my challenge on solving the problem of the residents of my hometown. The test data in this table is my city data.

### Image #5
![image](https://user-images.githubusercontent.com/87894035/228018487-8f298cd0-1bae-44b1-8d70-4b189a7a5400.png)

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

The user data table is shown in the fifth image. It contains data about names, surnames, age, gender of users, as well as their login, password token and email.

### Image #6
![image](https://user-images.githubusercontent.com/87894035/228018895-d225ce50-8700-412b-97c0-81e922d91901.png)

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

The image number 6 shows the users' rating table, divided by the areas they have rated. It contains the user ID, the district ID and the rating the user has given it.

### Image #7
![image](https://user-images.githubusercontent.com/87894035/228020095-3d8a4617-097c-4578-8141-887e46d14075.png)
 
Image seven shows the average air cleanliness rating specifically, which is calculated with the help of function (AVG) shown below. The sum of the ratings given by the users is calculated and then divided by the number of users who gave a rating.   

```
SELECT * FROM Complaints.Complaints

SELECT AVG(Rating) AS 'Average rating for District'
FROM Rating.Rating
WHERE DistrictId = 1
```


### Image #8
![image](https://user-images.githubusercontent.com/87894035/228020153-32d6f7cf-7eca-4190-9d59-072da6eecbd8.png)

Image nine shows the calculation of the city's air cleanliness index, which is calculated using the function shown below. The sum of the neighbourhood ratings is calculated and then the result is divided by the number of districts.

```
SELECT AVG(Rating) AS 'Average rating for City'
FROM Rating.Rating
JOIN City.District ON Rating.DistrictId = District.DistrictId
WHERE District.CityId = 1
```

