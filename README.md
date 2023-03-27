# CODE-Challenge


To store air assessment data, user data and data on polluted areas of the city, I created a database in SQL. 
### Image #1
![image](https://user-images.githubusercontent.com/87894035/228008977-bfb617c4-1ab4-4c0a-be9f-f0c17dadd123.png)
                                              
The first image shows a diagram of how the tables are connected with each other. I have created a total of five tables: Complaints, user information, rating, district and city.

### Image #2
![image](https://user-images.githubusercontent.com/87894035/228015307-7b42b11a-3878-4de7-92ea-90e7578f07ee.png)

The complaints table contains the complaint number, the complaint name, description, user ID and the district ID of the district where the user sent the complaint.

### Image #3
![image](https://user-images.githubusercontent.com/87894035/228016473-fd687aeb-a803-4215-918b-7c4e4217b512.png)

The district table contains data about the district number, Id city and district name

### Image #4
![image](https://user-images.githubusercontent.com/87894035/228018858-5a2f545e-8a36-46d6-a00f-76bf9626cdbd.png)

The city table contains data about the city ID and the name of the city. Since I based my challenge on solving the problem of the residents of my hometown. The test data in this table is my city data.

### Image #5
![image](https://user-images.githubusercontent.com/87894035/228018487-8f298cd0-1bae-44b1-8d70-4b189a7a5400.png)

The user data table is shown in the fifth image. It contains data about names, surnames, age, gender of users, as well as their login, password token and email.

### Image #6
![image](https://user-images.githubusercontent.com/87894035/228018895-d225ce50-8700-412b-97c0-81e922d91901.png)

The image number 6 shows the users' rating table, divided by the areas they have rated. It contains the user ID, the district ID and the rating the user has given it.

### Image #7
![image](https://user-images.githubusercontent.com/87894035/228020095-3d8a4617-097c-4578-8141-887e46d14075.png)
 
Image seven shows the average air cleanliness rating specifically, which is calculated according to the principle shown in image eight. The sum of the ratings given by the users is calculated and then divided by the number of users who gave a rating.   

### Image #8
![image](https://user-images.githubusercontent.com/87894035/228034348-b2871236-5677-457e-87ab-2c5024344e71.png)



### Image #9
![image](https://user-images.githubusercontent.com/87894035/228020153-32d6f7cf-7eca-4190-9d59-072da6eecbd8.png)

Image nine shows the calculation of the city's air cleanliness index, which is calculated using the method shown in image ten. The sum of the neighbourhood ratings is calculated and then the result is divided by the number of districts.

### Image #10
![image](https://user-images.githubusercontent.com/87894035/228037356-7489ceba-aa5e-48fd-8b3c-b1e822e9c9f8.png)


