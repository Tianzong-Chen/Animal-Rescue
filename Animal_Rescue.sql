drop table Disability_Type;
drop table Train;
drop table Trainer;
drop table Disabled_Pet;
drop table Rescue;
drop table Treat;
drop table Pet_Adopt_Live;
drop table Adopter_Contact;
drop table Vet;
drop table Employee_Work;
drop table Dorm_Offer;
drop table Donate;
drop table Branch;
drop table Donor;
drop table Treatment;
drop table Dorm_Type;
drop table Job_Status;

CREATE TABLE Branch (
    Branch_Number int not null,
    City varchar(10) not null,
    Street varchar(35) not null,
    Postal_Code char(7) not null,
    Unit_Number int not null,
    primary key (Branch_Number)
);

grant select on Branch to public;

CREATE TABLE Dorm_Offer(
    Dorm_Number int not null,
    Capacity int not null,
    Dorm_Type varchar(20) not null,
    Branch_Number int not null,
    primary key (Dorm_Number, Branch_Number),
	foreign key (Branch_Number) references Branch(Branch_Number) ON DELETE CASCADE,
    CHECK (Capacity <= 20 AND Capacity > 0)
);

grant select on Dorm_Offer to public;

CREATE TABLE Employee_Work(
    Employee_SIN char(11) not null,
    Employee_Name varchar(25) not null,
    Phone_Number char(10) not null,
    Email varchar(30) not null,
    Job_Status varchar(10) not null,
    Branch_Number int,
    primary key (Employee_SIN),
    foreign key (Branch_Number) references Branch(Branch_Number) ON DELETE SET NULL
);

grant select on Employee_Work to public;

CREATE TABLE Adopter_Contact(
    Adopter_SIN char(11) not null,
    Adopter_Name varchar(20) not null,
    Phone_Number char(10) null,
    Employee_SIN char(11) default '792-183-808' not null,
    City varchar(20),
	Street varchar(35),
    Postal_Code char(7),
    Unit_Number int,
    Adopted_Time int,
    primary key (Adopter_SIN),
    foreign key (Employee_SIN) references Employee_Work(Employee_SIN) ON DELETE SET NULL
);

grant select on Adopter_Contact to public;

CREATE TABLE Pet_Adopt_Live(
    Pet_ID int not null,
    Pet_Name varchar(10) not null,
    Gender char(1) not null,
    Age int not null, 
    Breed varchar(20) not null,
    Species varchar(20) not null,
    Dorm_Number int null,
    Branch_Number int null,
    Adopter_SIN char(11) null,
    primary key (Pet_ID),
    foreign key (Dorm_Number, Branch_Number) references Dorm_Offer(Dorm_Number, Branch_Number) ON DELETE SET NULL,
    foreign key (Adopter_SIN) references Adopter_Contact(Adopter_SIN) ON DELETE SET NULL,
    CHECK (Age <= 20 AND Age >= 0)
);

grant select on Pet_Adopt_Live to public;

CREATE TABLE Disabled_Pet(
    Disability_Type varchar(20) not null,
    Pet_ID int not null,
    primary key (Pet_ID),
    foreign key (Pet_ID) references Pet_Adopt_Live(Pet_ID) ON DELETE CASCADE
);

grant select on Disabled_Pet to public;

CREATE TABLE Disability_Type(
    Disability_Type varchar(30) not null,
    Additional_Care_Type varchar(30) not null,
    primary key (Disability_Type)
);

grant select on Disability_Type to public;

CREATE TABLE Trainer (
    Employee_SIN char(11) not null,
    Training_Skill varchar(20) default 'Physical skill' not null,
    primary key (Employee_SIN),
    foreign key (Employee_SIN) references Employee_Work(Employee_SIN) ON DELETE CASCADE
);

grant select on Trainer to public;

CREATE TABLE Train(
    Pet_ID int not null,
    Employee_SIN char(11) not null,
    Training_Type varchar(20) not null,
    primary key (Employee_SIN, Pet_ID),
    foreign key (Employee_SIN) references Trainer(Employee_SIN),
    foreign key (Pet_ID) references Pet_Adopt_Live(Pet_ID) ON DELETE CASCADE 
);

grant select on Train to public;

CREATE TABLE Donor(
    Phone_Number char(10) not null,
    Donor_SIN char(11) not null,
    Email varchar(30) not null,
    Donor_Name varchar(25) not null,
    primary key (Donor_SIN)
);

grant select on Donor to public;

CREATE TABLE Donate(
    Donor_SIN char(11) not null,
    Branch_Number int not null,
    Amount int not null,
    primary key (Donor_SIN, Branch_Number),
    foreign key (Donor_SIN) references Donor(Donor_SIN),
    foreign key (Branch_Number) references Branch(Branch_Number),
    CHECK (Amount > 0)
);

grant select on Donate to public;

CREATE TABLE Treatment(
    Date_diagnosed varchar(20) not null,
    Reference_Number int not null,
    Pet_Symptom varchar(20) not null,
    Treat_Approach varchar(20) not null,
    primary key (Reference_Number)
);

grant select on Treatment to public;

CREATE TABLE Vet(
    Employee_SIN char(11) not null,
    Speciality varchar(50) not null,
    primary key (Employee_SIN),
    foreign key (Employee_SIN) references Employee_Work(Employee_SIN) ON DELETE CASCADE
);

grant select on Vet to public;

CREATE TABLE Treat(
    Employee_SIN char(11) not null,
    Reference_Number int not null,
    Pet_ID int not null,
    primary key (Employee_SIN, Reference_Number, Pet_ID),
    foreign key (Employee_SIN) references Vet(Employee_SIN),
    foreign key (Reference_Number) references Treatment(Reference_Number) ON DELETE CASCADE,
    foreign key (Pet_ID) references Pet_Adopt_Live(Pet_ID) ON DELETE CASCADE
);

grant select on Treat to public;

CREATE TABLE Dorm_Type(
    Dorm_Type varchar(20) not null,
    Furniture_Type varchar(20) not null,
    primary key (Dorm_Type)
);

grant select on Dorm_Type to public;

CREATE TABLE Job_Status(
    Job_Status varchar(10) not null,
    Benefit_Type varchar(60) not null,
    primary key (Job_Status)
);

grant select on Job_Status to public;

CREATE TABLE Rescue(
    Found_City varchar(40) not null,
    Pet_ID int not null,
    Employee_SIN char(11) not null,
    primary key (Employee_SIN, Pet_ID),
    foreign key (Employee_SIN) references Employee_Work(Employee_SIN) ON DELETE CASCADE,
    foreign key (Pet_ID) references Pet_Adopt_Live(Pet_ID) ON DELETE CASCADE
);

grant select on Rescue to public;


insert into Branch
values(001, 'Vancouver', 'Lower Mall', 'V6T 1Z4', 101);

insert into Branch
values(002, 'Richmond', 'Cooney Road', 'V6Y 2J4', 103);

insert into Branch
values(003, 'Vancouver', 'Beatty Street', 'V6B 2M6', 102);

insert into Branch
values(004, 'Vancouver', 'W Broadway', 'V6R 2G2', 107);

insert into Branch
values(005, 'Vancouver', 'W 2nd Avenue', 'V5Y 3N7', 105);

insert into Branch
values(006, 'Burnaby', '5771 Marine Way', 'V3N 2V8', 106);

-- Dorm_offer

insert into Dorm_Offer
values(1, 20, 'General Dorm', 001);

insert into Dorm_Offer
values(2, 3, 'Cat Dorm', 001);

insert into Dorm_Offer
values(3, 5, 'Dog Dorm', 001);

insert into Dorm_Offer
values(4, 5, 'Cat Dorm', 001);

insert into Dorm_Offer
values(5, 10, 'Dog Dorm', 001);

insert into Dorm_Offer
values(1, 2, 'Chipmunk Dorm', 002);

insert into Dorm_Offer
values(2, 2, 'Cat Dorm', 002);

insert into Dorm_Offer
values(3, 3, 'Dog Dorm', 002);

insert into Dorm_Offer
values(4, 5, 'Dog Dorm', 002);

insert into Dorm_Offer
values(5, 10, 'Cat Dorm', 002);

insert into Dorm_Offer
values(1, 5, 'Cat Dorm', 003);

insert into Dorm_Offer
values(2, 10, 'Dog Dorm', 003);

insert into Dorm_Offer
values(3, 5, 'Bird Dorm', 003);

insert into Dorm_Offer
values(4, 10, 'Cat Dorm', 003);

insert into Dorm_Offer
values(5, 10, 'Bird Dorm', 003);

insert into Dorm_Offer
values(1, 8, 'Dog Dorm', 004);

insert into Dorm_Offer
values(2, 6, 'Alpaca Dorm', 004);

insert into Dorm_Offer
values(3, 3, 'Cat Dorm', 004);

insert into Dorm_Offer
values(4, 5, 'Cat Dorm', 004);

insert into Dorm_Offer
values(1, 10, 'Cat Dorm', 005);

insert into Dorm_Offer
values(2, 7, 'Dog Dorm', 005);

insert into Dorm_Offer
values(3, 5, 'Bird Dorm', 005);

insert into Dorm_Offer
values(1, 10, 'Dog Dorm', 006);

-- Employee_work

insert into Employee_Work
values('792-183-808', 'Shawn Muse', '7781932823', 'Shawn.M@gmail.com', 'Full-time', 003);

insert into Employee_Work
values('382-162-403', 'Lucy Regina', '7787028319', 'Lucy.reg@gmail.com', 'Part-time', 001);

insert into Employee_Work
values('593-802-140', 'Carlos Pavito', '7782003182', 'CPavito.13@gmail.com', 'Part-time', 003);

insert into Employee_Work
values('692-102-555', 'Parvis Chong', '7789921742', 'Parvis.C@gmail.com', 'Stu_Volt', 004);

insert into Employee_Work
values('153-196-271', 'Tianyi Hu', '7780261932', 'HuTian@126.com', 'Full-time', 002);

insert into Employee_Work
values('291-288-948', 'Charles Evan', '7783027193', 'Charles.189@gmail.com', 'Intern', 002);

insert into Employee_Work
values('372-281-382', 'Armon Smith', '7782017302', 'Armon.S@gmail.com', 'Stu_Volt', 003);

insert into Employee_Work
values('832-472-291', 'Paul Tard', '7783088120', 'PTard.23@gmail.com', 'Soci_Volt', 001);

insert into Employee_Work
values('472-184-210', 'Lucia Xin', '7782018372', 'Luciaxin10@4830.com', 'Part-time', 003);

insert into Employee_Work
values('702-183-808', 'Huangyu Bu', '7783027142', 'HuangYB.10085@gmail.com', 'Soci-Volt', 005);

insert into Employee_Work
values('760-271-281', 'Alex Simon', '7780592183', 'Alex.S@gmail.com', 'Full-time', 004);

insert into Employee_Work
values('110-392-194', 'Kayla Puth', '7788017492', 'Kayla.PT35@gmail.com', 'Full-time', 006);

-- Adopter_Contact

insert into Adopter_Contact
values('281-382-238', 'Jack Liu', '7782910272', '692-102-555', 'Vancouver', 'Broadway Street', 'V6T 1Z7', 104, 12);

insert into Adopter_Contact
values('372-183-238', 'Leo Partiza', '7782017428', '382-162-403', 'Richmond', 'Marinaside Street', 'V6T 1T2', 110, 5);

insert into Adopter_Contact
values('271-385-972', 'Iris Hiddleston', '7783026832', '153-196-271', 'Toronto', 'Thurlow Street', 'V4I 4R2', 124, 6);

insert into Adopter_Contact
values('760-183-362', 'Luke Smith', '7780284629', '832-472-291', 'Burnaby', 'Bourbon Blvd', 'V6X 4J7', 241, 24);

insert into Adopter_Contact
values('659-183-562', 'Davis Garcia', '7780372016', '593-802-140', 'Vancouver', 'Arbutus Street', 'V1K 3Tp', 725, 8);

-- Pet_Adopt_Live

insert into Pet_Adopt_Live
values(0001, 'Angel', 'F', 8, 'Pekingese', 'Dog', 3, 001, null);

insert into Pet_Adopt_Live
values(0002, 'Betty', 'F', 9, 'Golden Retriever', 'Dog', 3, 002, null);

insert into Pet_Adopt_Live
values(0003, 'Jack', 'M', 1, 'Corgi', 'Dog', 2, 003, null);

insert into Pet_Adopt_Live
values(0004, 'Denial', 'M', 5, 'Crossbred', 'Dog', 1, 004, '281-382-238');

insert into Pet_Adopt_Live
values(0005, 'Frank', 'M', 6, 'Pugs', 'Dog', 2, 005, '372-183-238');

insert into Pet_Adopt_Live
values(0006, 'May', 'M', 1, 'Labrador Retriever', 'Dog', 3, 001, '372-183-238');

insert into Pet_Adopt_Live
values(0007, 'July', 'M', 2, 'German Shepherd', 'Dog', 3, 002, '271-385-972');

insert into Pet_Adopt_Live
values(0008, 'Joseph', 'M', 3, 'Golden Retriever', 'Dog', 2, 003, '271-385-972');

insert into Pet_Adopt_Live
values(0009, 'June', 'F', 3, 'Husky', 'Dog', 1, 004, '760-183-362');

insert into Pet_Adopt_Live
values(0010, 'Ding', 'M', 2, 'Persian Cat', 'Cat', 2, 001, '760-183-362');

insert into Pet_Adopt_Live
values(0011, 'Jessica', 'F', 0, 'Siamese Cat', 'Cat', 2, 002, '659-183-562');

insert into Pet_Adopt_Live
values(0012, 'Zoe', 'F', 2, 'British Shorthair', 'Cat', 1, 003, '659-183-562');

insert into Pet_Adopt_Live
values(0013, 'Sunny', 'F', 2, 'Cross breed', 'Dog', 1, 006, '659-183-562');

insert into Pet_Adopt_Live
values(0014, 'Haha', 'F', 4, 'Pekingese', 'Dog', 3, 001, null);

insert into Pet_Adopt_Live
values(0015, 'Jennie', 'F', 5, 'Golden Retriever', 'Dog', 3, 002, null);

insert into Pet_Adopt_Live
values(0016, 'Mark', 'M', 6, 'Corgi', 'Dog', 2, 003, null);

insert into Pet_Adopt_Live
values(0017, 'Jackson', 'M', 7, 'Crossbred', 'Dog', 1, 004, null);

insert into Pet_Adopt_Live
values(0018, 'Will', 'M', 11, 'Pugs', 'Dog', 2, 005, null);

-- Disabled_Pet

insert into Disabled_Pet
values('Deformed Limb', 0001);

insert into Disabled_Pet 
values('Deaf', 0002);

insert into Disabled_Pet
values('Blind', 0003);

insert into Disabled_Pet
values('Emotional unstable', 0004);

insert into Disabled_Pet
values('Insulin dependent', 0005);

insert into Disabled_Pet
values('Deformed Limb', 0014);

insert into Disabled_Pet 
values('Deaf', 0015);

insert into Disabled_Pet
values('Blind', 0016);

insert into Disabled_Pet
values('Emotional unstable', 0017);

insert into Disabled_Pet
values('Insulin dependent', 0018);


-- Disability_Type

insert into Disability_Type
values('Deformed Limb', 'wheelchair');

insert into Disability_Type
values('Blind', 'assistant');

insert into Disability_Type
values('Deaf', 'assistant');

insert into Disability_Type
values('Emotional unstable', 'accompany');

insert into Disability_Type
values('Insulin dependent', 'continuous medication');

-- Trainer

insert into Trainer
values('382-162-403', 'Roll');

insert into Trainer
values('372-281-382', 'Shake hand');

insert into Trainer
values('593-802-140', 'Identify obstacles');

insert into Trainer
values('692-102-555', 'Potty training');

insert into Trainer
values('832-472-291', 'mental health');

-- Train

insert into Train
values(0006, '593-802-140', 'Guide blind people');

insert into Train
values(0006, '382-162-403', 'Playing');

insert into Train
values(0006, '372-281-382', 'Basic skills');

insert into Train
values(0006, '692-102-555', 'Assist hunting');

insert into Train
values(0006, '832-472-291', 'Companion');

insert into Train
values(0007, '832-472-291', 'Companion');

insert into Train
values(0008, '593-802-140', 'Guide blind people');

insert into Train
values(0009, '372-281-382', 'Basic skills');

insert into Train
values(0010, '692-102-555', 'Assist hunting');

insert into Train
values(0008, '832-472-291', 'Companion');

insert into Train
values(0008, '372-281-382', 'Basic skills');

insert into Train
values(0008, '692-102-555', 'Assist hunting');

insert into Train
values(0008, '382-162-403', 'Playing');

insert into Train
values(0011, '372-281-382', 'Basic skills');

insert into Train
values(0012, '372-281-382', 'Basic skills');

-- Donor

insert into Donor
values('7781234567', '123-456-789', 'Shown.X@gmail.com', 'Shown Xiao');

insert into Donor
values('7784567891', '001-002-345', 'James.L@gmail.com', 'James Liu');

insert into Donor
values('7789963452', '238-100-341', 'Sara.Shen@gmail.com', 'Sara Shen');

insert into Donor
values('7784522233', '239-902-344', 'Zoey.Zhang@gmail.com', 'Zoey Zhang');

insert into Donor
values('7788944455', '231-443-563', 'Jack.Lee@gamil.com', 'Jack Lee');

-- Donate

insert into Donate
values('123-456-789', 001, 100);

insert into Donate
values('001-002-345', 001, 50000);

insert into Donate
values('238-100-341', 002, 1000);

insert into Donate
values('239-902-344', 002, 30000);

insert into Donate
values('231-443-563', 001, 50000);

insert into Donate
values('231-443-563', 005, 2000);

insert into Donate
values('001-002-345', 004, 80000);

insert into Donate
values('123-456-789', 002, 900);

insert into Donate
values('238-100-341', 003, 250);

insert into Donate
values('238-100-341', 006, 7000);

-- Treatment

insert into Treatment
values('2020/03/01', 100, 'Influenza', 'Medicine');

insert into Treatment
values('2020/06/24', 201, 'Emesis', 'Medicine');

insert into Treatment
values('2020/10/07', 55, 'Ear mite', 'Medicine');

insert into Treatment
values('2020/01/11', 241, 'Epilepsy', 'Hospitalized');

insert into Treatment
values('2021/01/01', 74, 'Ascites', 'Surgery');

-- Vet

insert into Vet
values('153-196-271', 'Companion-animal Vecterinarian');

insert into Vet
values('291-288-948', 'Veterinary Specialists');

insert into Vet
values('792-183-808', 'Food-Animal Veterinarian');

insert into Vet
values('472-184-210', 'Food Safety and Inspection Veterinarian');

insert into Vet
values('702-183-808', 'Research Veterinarian');

-- Treat

insert into Treat
values('291-288-948', 100, 0001);

insert into Treat
values('792-183-808', 201, 0002);

insert into Treat
values('153-196-271', 55, 0003);

insert into Treat
values('792-183-808', 241, 0004);

insert into Treat
values('153-196-271', 74, 0005);

-- Dorm_Type

insert into Dorm_Type
values ('General Dorm', 'General_Type');

insert into Dorm_Type
values ('Cat Dorm', 'Cat_Type');

insert into Dorm_Type
values ('Dog Dorm', 'Dog_Type');

insert into Dorm_Type
values ('Chipmunk Dorm', 'Chipmunk_Type');

insert into Dorm_Type
values ('Bird Dorm', 'Bird_Type');

insert into Dorm_Type
values ('Alpaca Dorm', 'Alpaca_Type');

-- Job_Status

insert into Job_Status
values ('Full-time', 'Full insurance cover and year end bonus');

insert into Job_Status
values ('Part-time', 'Partial insurance cover');

insert into Job_Status
values ('Stu_Volt', 'Internship opportunity and certificate');

insert into Job_Status
values ('Soci_Volt', 'Certificate');

insert into Job_Status
values ('Intern', 'Full time opportunity');

-- Rescue

insert into Rescue
values ('Vancouver', 0010, '760-271-281');

insert into Rescue
values ('Richmond', 0002, '472-184-210');

insert into Rescue
values ('Richmond', 0007, '291-288-948');

insert into Rescue
values ('Burnaby', 0004, '291-288-948');

insert into Rescue
values ('Burnaby', 0006, '153-196-271');

grant select on Branch to public;
grant select on Dorm_Offer to public;
grant select on Employee_Work to public;
grant select on Adopter_Contact to public;
grant select on Pet_Adopt_Live to public;
grant select on Disabled_Pet to public;
grant select on Disability_Type to public;
grant select on Trainer to public;
grant select on Train to public;
grant select on Donor to public;
grant select on Donate to public;
grant select on Treatment to public;
grant select on Vet to public;
grant select on Treat to public;
grant select on Dorm_Type to public;
grant select on Job_Status to public;
grant select on Rescue to public;
