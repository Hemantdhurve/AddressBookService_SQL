
--UC1 Created database of AddressBook service
create database AddressBook_Service;

use AddressBook_Service;
--UC2 Ability to create Addressbook Table with attributes
create table Addressbook (
FirstName varchar(25),
LastName varchar(25),
Address varchar(300),
City varchar(50),
State varchar(50),
PhoneNumber bigint,
Zip int,
Email varchar(100)
) 

select * from Addressbook;

--UC3 Inserting New Contact to Addressbook

insert into Addressbook (FirstName,LastName,Address,City,State,PhoneNumber,Zip,Email)
values ('Hemant','Dhurve','Krushna Nagari','Bhandara','Maharashtra',7798051897,441905,'hemantdhurve007@gmail.com'),
       ('Mrunal','Roy','Shakti Nagar','Bagalkot','Karnataka',9997778885,521456,'mrunalroy@gmail.com'),
	   ('Nishi','Kapoor','Gandhi Chowk','Surat','Gujarat',9309285645,409785,'kapoorNishi@yahoo.com'),
	   ('Vishal','Yadav','Vijay Nagar','Hyderabad','Telengana',8888555220,441552,'vishyadav@gmail.com'),
	   ('Jethalal','Gada','Gokul Dham Society','Mumbai','Maharashtra',9787875582,409665,'tappukepappa@reddit.com')

select * from Addressbook;

--UC4 Ability to Edit Existing person using their First Name

update Addressbook set FirstName='Nikhil' where FirstName='Vishal';

--Optional Email part updating
update Addressbook set Email='nikhilyadav@reddit.com' where Email='vishyadav@gmail.com';

--UC5  Ability to Delete Person using First Name

delete from Addressbook where FirstName='Nishi'; 
select * from Addressbook;

--UC6 Ability to Retrive Person Belonging from City or State

select * from Addressbook where City='Hyderabad' or State='Maharashtra';
select FirstName from Addressbook where City='Bhandara' or State='Maharashtra';

--UC7 Ability to understand Size using Count Function

select count(City) from AddressBook;

select count(State) from AddressBook;

select count(*) as Statecount ,State  from AddressBook group by state;

select count(*) as Citycount ,City from AddressBook group by City;

--UC8  Ability to sort alphabetically by prson name for a given city

select * from Addressbook order by City asc;
select FirstName,LastName,Address,State from Addressbook order by City asc;

select City,FirstName from Addressbook order by FirstName asc;

--UC9 Identify each AddressBook with name and type
--Altering table
alter table Addressbook add AddressbookName varchar(30),Type varchar(30);

--Updating Table column with Name and type
update Addressbook set AddressbookName='H', Type='Family' where FirstName='Hemant';
update Addressbook set AddressbookName='M', Type='Family' where FirstName='Mrunal';
update Addressbook set AddressbookName='N', Type='Friend' where FirstName='Nikhil';
update Addressbook set AddressbookName='J', Type='Profession' where FirstName='Jethalal';

select * from Addressbook;

--UC10 Get number of Contact Persons i.e Count by Type
select COUNT(Type) as FriendsCircle from Addressbook where Type='Friend' group by type;

select COUNT(Type) as FamilyMember from Addressbook where Type='Family' group by type;

select COUNT(Type) as Partners from Addressbook where Type='Profession' group by type;


--UC11 Ability to Add Person to both Friend and Family


insert into Addressbook values('Sonu','Dhurve','Shivaji Nagar','Nagpur','Maharashtra',8526452584,415825,'Sonudh@yahoo.com','S','Family'),
	  ('Sonu','Dhurve','Shivaji Nagar','Nagpur','Maharashtra',8526452584,415825,'Sonudh@yahoo.com','S','Friend');

select * from Addressbook;

--Checking it working as expected or not
select COUNT(Type) as FamilyCount from Addressbook where Type='Family' group by Type; 
select COUNT(Type) as FriendCount from Addressbook where Type='Friend' group by Type; 
select COUNT(Type) as PartnerCount from Addressbook where Type='Profession' group by Type; 


