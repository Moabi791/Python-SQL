 Create table my_contacts (
	cont_id bigserial,
	first_name varchar(50),
	last_name varchar(50),
	mobile_no varchar(50),
	gender varchar(1),
	email varchar (50),
	birthday varchar(50), 
	city varchar(50),
	zip_code varchar(50),
	seeking varchar (50),
	status_id integer,
	primary key(cont_id)
);

create table my_contact_interests (
	cont_id integer references my_contacts(cont_id),
	interest_id integer references interests(interest_id),
	constraint cont_interest_key primary key (cont_id)
);


create table contact_seeking (
	seeking_id integer references seeking(seeking_id),
	contact_id integer references my_contacts(cont_id)
);

Create table profession (
    prof_id integer NOT NULL,
    "Profession" character varying[100],
    PRIMARY KEY (prof_id)
);


Create table zip_code (
zip_code integer,
city varchar(50),
province  varchar(50),
CONSTRAINT zip_code_key PRIMARY KEY (zip_code),
CONSTRAINT check_zip_code_not_zero CHECK (zip_code < 4 )
);

create table status (
	status_id bigserial,
	status varchar(50),
	primary key (status_id)
);


create table interests (
	interest_id bigserial,
	interest varchar,
	constraint interest_key primary key (interest_id)	
);

create table seeking (
	seeking_id bigserial,
	seeking varchar
);

Insert into profession (profession_name)
values 
('Accountant'),
('Advertising Sales Agent'),
('Auditors'),
('Chief Executives'),
('Investment Fund Managers'),
('Sales Agent'),
('Computer Programmers'),
('Web Developers'),
('Athletic Trainer'),
('Dentists'),
('Appraisers,Real Estate'),
('Sales Engineers'),
('Magistrate Judge'),
('Fire Investigators'),
('Airline Pilots');

Insert into zip_code(zip_code,city,province)
values
(0299,'Pretoria','Gauteng'),
(0499,'Mafikeng','North-West'),
(0999,'Polokwane','Limopo'),
(1799,'Krugersdorp','Gauteng'),
(4099,'Ethekwini','KwaZulu-Natal'),
(4730,'Umzinkulu','KwaZulu-Natal'),
(9399,'Bloemfontein','Free-State'),
(8999,'Gordonia','Northern-Cape'),
(6099,'Port-Elizabeth','Eastern-Cape'),
(6499,'Queenstown','Eastern-Cape'),
(6699,'Beaufort West','Western Cape'),
(7599,'Pinelands','Western Cape'),
(8099,'Steenberg','Western-Cape'),
(3199,'Umlazi','KwaZulu-Natal'),
(1399,'Nelspruit','Mpumalanga');


Insert into status(status_id,status)
values
('1','{looking}'),
('2','{married}'),
('3','{single}'),
('4','{engaged}'),
('5','{complicated}'),
('6','{taken}');


Insert into interests(interest)
values
('traveling'),
('reading novels'),
('exercising'),
('politics'),
('cooking'),
('sex toys'),
('dancing'),
('pets');

Insert into contact_interests (contact)
values
('pets'),
('reading novels'),
('traveling'),
('playing outdoor'),
('pets'),
('role play'),
('dancing'),
('drinks'),
('clubing'),
('clubing'),
('role play'),
('cooking'),
('politics');

	
Insert into public.seeking (seeking_id,seeking)
values
('1','{male}'),
('2','{female}'),
('3','{Transgender}'),
('4','{Gay male}'),
('5','{Lesbain}');


Insert into my_contacts (first_name, last_name, mobile_no, email, gender, birthday, profession, zip_code,status_id,seeking)
values 	('Mohau', 'Booysen', '27 735668314', 'mohaubooysen@gmail.com', 'M', '03-03-1998', 'Accountant', 0299,'2','2'),
		('Lesego', 'Mogana', '27 783452256', 'lesegomogana@gmail.com', 'M', '04-02-1997', 'Advertising Sales Agent', 0499,'1','2'),
		('Danicia', 'Ruiters', '27 639268214', 'daniciaruiters@gmail.co,za', 'F', '31-07-1997', 'Auditors', 0999,'1','1'),
		('Mkhize', 'Magala', '27 633338310', 'mkhizemagala@thebomb.co.za', 'M','21-06-1999', 'Chief Executives',  1799,'3','3'),
		('Lerato', 'Mkhize', '27 825121449', 'leratomkhize@thegirl.com', 'F', '11-04-2000', 'Investment Fund Managers', 4099,'4','5'),
		('Rimarco', 'Daniels', '27 836542298', 'rimarcodaniels@ricardo.co.za', 'M', '06-03-1998', 'Sales Agent', 4730,'5','2'),
		('Tracey', 'Lottering', '27 623569231', 'traceylottering@gmail.com', 'F', '05-12-1999', 'Computer Programmers',  9399,'6','1'),
		('Tokelo', 'Sejane', '27 73981023', 'tokelosejane@skhoffi.com', 'M', '26-05-2000', 'Web Developers', 8999,'2','2'),
		('Nikita', 'Bushang', '27 635443219', 'nikitabushang@nikki.com', 'F', '07-07-2000','Athletic Trainer', 6099,'4','5'),
		('Meleg', 'Mess', '27 639887451', 'melegmess@gmail.co.za', 'M', '21-06-2000', 'Dentists', 6499,'2','2'),
		('Khanyi', 'Mbau', '27 635447823', 'khanyimbau@khanyi.com', 'F', '17-04-1998','Athletic Trainer', 6099,'1','5'),
		('Bonang', 'Ntai', '27 625692210', 'bonangntai@thegirl.com', 'F', '23-05-1999','Accountant', 9301,'3','1'),
		('Bongani', 'Zungu', '27 8256598', 'bonganizungu@rangers.co.za', 'M', '18-07-1999','Auditors', 8401,'5','2'),
		('Kagisho', 'Senatle', '27 987692210', 'kagishosenatle@gmail.com', 'M', '20-08-1998','Chief Executives', 9320,'5','2'),
		('Kerileng', 'Hlahla', '27 431038820', 'kerikeri@gmail.com', 'F', '23-05-2000','Magistrate Judge', 8773,'1','5');


select my_contacts.first_name,my_contacts.last_name,
			profession.prof_id,
			my_contacts.status_id,
			my_contacts.zip_code
			from my_contacts left join profession
			on profession.prof_id = status_id
			left join zip_code
			on zip_code.zip_code = zip_code.zip_code
			order by my_contacts;
			
			
drop table my_contacts;
drop table my_contact_interests;
drop table profession;
drop table status;
drop table seeking;
drop table zip_code;
drop table contact_seeking;
drop table interests;

select * from my_contacts;
select * from zip_code;
select * from profession;
select * from status;
select * from interests;
select * from contact_interests;
select * from contact_seeking;
select * from seeking;

delete from seeking;
delete from my_contacts; 
delete from zip_code;
delete from profession;
delete from status;
delete from interests;
delete from contact_interests;
delete from contact_seeking;

