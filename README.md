## This README file is for the CPSC 304 project by Joyce Cao, Yilin Wei, Tianzong Chen from UBC in WT2, 2021. The main purpose for this project is to demonstrate the basic query skills learned from CPSC 304.

### Background and Topic about the application:
This is a simple application mainly for the basic usage of an animal recuse orgaization.
The idea is to help the organization to better organize the information by using a databsed connected application.

### Goals:
- Be able to have a basic graphical user interface with multiple-page switch and input handling.
- Be able to show clear instruction for user to understand.
- Be able to create tables in a database for the application.
- Be able to let user store and extrat information.
- Be able to show the result properly.

### ER diagram
![Screen Shot 2021-03-18 at 06 44 36](https://user-images.githubusercontent.com/32403102/111636149-6fd51d00-87b5-11eb-957f-0a4de499eeee.png)
    
### Instructions
#### Homepage: 
- Within the Homepage, clicking on the **“ABOUT US”** will navigate you to the “About Us” page where you can view the information about our branches and their details. 
- Clicking on the “DONATE NOW” will navigate you to the **“Donation now”** page, where you can do donations and view all the donations we have received so far. 
- Clicking on the “TAKE A CUITE HOME” will navigate you to the **“Take a cutie home”** page, where you can view information of all the adopters who have adopted animals from our institute. 
- Clicking on the **“Go see our cuties”** will navigate you to the page where you can take a glance at all our cute animals and their information.

#### About us Page: 
- On this page, we have a DELETE SQL query “Delete a branch” and an AGGREGATION with Having SQL query called“These Dorm’s capacity is larger than the average of all dorms”.
- When one of our branches went bankrupt, we needed to run the **“Delete a branch”** to delete it from our database. We can enter the branch number into the entry bar and click on the “Delete” button. Then the corresponding branch will be deleted, and the system will update the information of other tables that are related to the branch table. 
- For our convenience, when we want to check which dorms have a larger capacity than the others, we can click on the “Submit” button under the title **“These Dorm’s capacity is larger than the average of all dorms”**. Then, a table contains all-satisfying dorms and their capacity will show up on the page. 
- Moreover, this page has four other simple select SQL queries you can play with. They are called **“Our available branches”**, **“Available Dorms”**, **“Our friends”** and **“Employees we have”** respectively. After you click on the “Submit” button under their title, the corresponding table will show up on the page, and it contains all the information of “Branch table”, “Dorm_Offer table ”, “Pet_Adopt_Live table ” and “Employee_Work table” depending on your actions. 
- Clicking on the “HOME” button on the right top corner will navigate you back to the Homepage.

#### Donate now page: 
- This page is all about donations. 
- The **“Insert Values into Donor and Donate Tables”** is an INSERT query, which is used to create a record for a new donor. The information we need is the donor's name, phone number, SIN number, email, and the amount of money he or she donated. After entering all required information into the entry bar, we just need to click on the “Insert” button and that new donor’s record will be stored in our database. 
- The **“Update value in Donate Table”** is an UPDATE operation. When a donor who exists in our database donates to us again, we should use this functionality to update his or her donation record. For doing this, we need to provide the donor’s SIN number and the branch number he or she donated to. We also need to enter the amount of money this donor donated before and after this time’s donation. After filling out all the entry bars and clicking on the “Update” button, the record of the value of how much this donor donated to the corresponding branch will be updated by our system.  
**Note: These two commands are not public and can only be ran by employees.**  
- The **“Max, Min, and Avg amount of money donated to each branch”** is an AGGREGATION SQL query. For doing statistics and data analysis of each branch, we need to know which donor donated the most, which donor donated the least, and what’s the average amount among all the donations. Based on these data, we may prepare some thanks gifts to these donors for some special festivals. If we want to run this query, we just need to click on the “Submit” button, and a table will show up. The table will list the MAX, MIN, and AVG amount of money each branch received. 
- Furthermore, this page has two more simple select queries. One is **“Display the Tuples in Donor Table”** which will show all the data of our Donor table. Another is **“Display the Tuples in Donate Table”** which will show all the data of our Donate table. To run these two queries, we just need to click on the “Submit” button under their title. 
- Clicking on the “HOME” button on the right top corner will navigate you back to the Homepage. 

#### Take a cutie home page (Pet Page):
- Within this page, we have an AGGREGATION with Having SQL query named “They adopted more than one animal”, and a simple SELECT SQL query named “All Adopters”.
- After you click on the “Submit” under **“They adopted more than one animal”**, a table will show up on the page. This table contains the name and SIN number of all adopters who donated more than one animal, and the number of animals they adopted. 
- If you click on the “Submit” under **“All Adopters”**, the table contains the name, the SIN number and the phone number of all adopters will show up on the page.
- Clicking on the “HOME” button on the right top corner will navigate you back to the Homepage. 

#### Go see our cuties page: 
- This page has two main sections, they are “Know more about us” and “We’ve learned a lot”. 
- Within the “Know more about us” section, we have three parts called “Cuties’ basic information”, “Kitty or Puppy?” and “Little friends need help!”. These features are designed to help people to view the detailed information about all the animals in our branches. 
- Under the **“Cuties’ basic information”**, we have attributes “Pet ID”, “Pet name”, “Gender”, “Age”, “Breed” and “Species”. You can select any number of them that you are interested in and click on the “Submit” button. Then, a table with all the attributes you selected will show up on the page. 
- Under the **“Kitty or Puppy?”** part, you can select “Dog” or “Cat” and click on the “Submit” button. Then, depending on your option, the showing-up table will contain detailed information about all dogs or cats in our branches. It includes the “PET_ID”, “PET_NAME”, “GENDER”, “AGE”, “BREED” and “SPECIES” of each animal. 
- If you are attracted to our animals and decide to adopt them, we highly recommend you to use the **“Little friends need help!”** quey. This query can tell you whether or not the animal you like requires special treatment and what kind of treatments they need if they are. There are four treatment types you can choose, or you can just select “All” for including all of them. Once you have selected the treatments you want to check, you can just click on the “Submit” button and view the table our system returns. The table will tell you the “PET_ID”, “PET_NAME”, “DISABILITY_TYPE” and “ADDITIONAL_CARE_TYPE”.
- In addition to treating sick animals, we also provide training classes for some talented animals. That’s why we let the half bottom of this page be the “We’ve learned a lot” section. In this section, we have two parts called “Awesome trainers” and “Skillable Stars”. 
 - Under the **“Awesome trainers”**, we have attributes “Trainer name”, “Trainer id”, “Trainer email”, and “Trainer specialty”. You can select any number of them that you want to know about and click on the “Submit” button. Then, a table with all the attributes you selected will show you the information about all our trainers. 
- The **“Skillable Stars”** runs on a DIVISION SQL query. If you click on the “Submit” button under it, the table that lists the ID and the Name of animals who have learned all the classes we provide will show up. 
- Clicking on the “HOME” button on the right top corner will navigate you back to the Homepage.



