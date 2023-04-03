 <div id="header" align="center">
  <img src="https://media.giphy.com/media/vISmwpBJUNYzukTnVx/giphy.gif" width="300"/>
</div>

<div id="header" align="center">

 

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

![image](https://user-images.githubusercontent.com/87894035/229439734-8f93a91f-c8ad-48c6-93ce-337f960ab1a9.png)

![image](https://user-images.githubusercontent.com/87894035/229439799-10f34cff-a7f3-4ad5-8294-bc3d7ad3224b.png)


The complaints table contains the complaint number, the complaint name, description, user ID and the district ID of the district where the user sent the complaint.

### Image #3
![image](https://user-images.githubusercontent.com/87894035/228016473-fd687aeb-a803-4215-918b-7c4e4217b512.png)

![image](https://user-images.githubusercontent.com/87894035/229440064-6d341c28-e24b-41cc-a9b1-29fb76edab64.png)

![image](https://user-images.githubusercontent.com/87894035/229440349-c37e80d5-b08f-4ddd-a924-c4ff354f216a.png)


The district table contains data about the district number, Id city and district name

### Image #4
![image](https://user-images.githubusercontent.com/87894035/228018858-5a2f545e-8a36-46d6-a00f-76bf9626cdbd.png)

![image](https://user-images.githubusercontent.com/87894035/229440527-a2c7f0d5-6e4b-4da0-8b0f-611974dec74c.png)

![image](https://user-images.githubusercontent.com/87894035/229440653-8aa440b2-c94a-48bf-95b7-ba82c0d9c4a4.png)

The city table contains data about the city ID and the name of the city. Since I based my challenge on solving the problem of the residents of my hometown. The test data in this table is my city data.

### Image #5
![image](https://user-images.githubusercontent.com/87894035/228018487-8f298cd0-1bae-44b1-8d70-4b189a7a5400.png)

![image](https://user-images.githubusercontent.com/87894035/229440881-2f81275b-7243-4df6-8aca-ae035ad2ab10.png)

![image](https://user-images.githubusercontent.com/87894035/229440962-112467c0-f356-41ca-80c4-8662402a1847.png)

The user data table is shown in the fifth image. It contains data about names, surnames, age, gender of users, as well as their login, password token and email.

### Image #6
![image](https://user-images.githubusercontent.com/87894035/228018895-d225ce50-8700-412b-97c0-81e922d91901.png)

![image](https://user-images.githubusercontent.com/87894035/229441165-d228ca96-fa4d-4cf4-adf6-3a6a49c4b19c.png)

![image](https://user-images.githubusercontent.com/87894035/229441095-41f8079f-5c1d-4200-b981-5224e3b8bdb3.png)

The image number 6 shows the users' rating table, divided by the areas they have rated. It contains the user ID, the district ID and the rating the user has given it.

### Image #7
![image](https://user-images.githubusercontent.com/87894035/228020095-3d8a4617-097c-4578-8141-887e46d14075.png)
 
Image seven shows the average air cleanliness rating specifically, which is calculated with the help of function (AVG) shown in image eight. The sum of the ratings given by the users is calculated and then divided by the number of users who gave a rating.   

### Image #8
![image](https://user-images.githubusercontent.com/87894035/228034348-b2871236-5677-457e-87ab-2c5024344e71.png)



### Image #9
![image](https://user-images.githubusercontent.com/87894035/228020153-32d6f7cf-7eca-4190-9d59-072da6eecbd8.png)

Image nine shows the calculation of the city's air cleanliness index, which is calculated using the function shown in image ten. The sum of the neighbourhood ratings is calculated and then the result is divided by the number of districts.

### Image #10
![image](https://user-images.githubusercontent.com/87894035/228037356-7489ceba-aa5e-48fd-8b3c-b1e822e9c9f8.png)


