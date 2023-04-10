select * from lms_book_details;
select * from lms_book_issue;
select * from lms_fine_details;
select * from lms_members;
select * from lms_supplier_details;

exec sp_help lms_members;

ALTER TABLE lms_book_issue drop column book_issue_status;

insert into lms_fine_details values ('R0', 0.00), ('R1', 20.00), ('R2', 50.00), ('R3', 75.00), ('R4', 10.00), ('R5', 150.00);
INSERT INTO lms_members VALUES
	('LM001','AMIT','CHENNAI','2012-02-12','2013-02-11','TEMPORARY'),
	('LM002','ABDHUL','DELHI','2012-04-10','2013-04-09','TEMPORARY'),
	('LM003','GAYAN','CHENNAI','2012-05-13','2013-05-12','PERMANENT'),
	('LM004','RADHA','CHENNAI','2012-04-22','2013-04-21','TEMPORARY'),
	('LM005','GURU','BANGALORE','2012-03-30','2013-05-16','TEMPORARY'),
	('LM006','MOHAN','CHENNAI','2012-04-12','2013-05-16','TEMPORARY')

	INSERT INTO lms_supplier_details VALUES
	('S01', 'SINGAPORE SHOPPEE',	'CHENNAI',	98941235,	'sing@gmail.com'),
	('S02', 'JK Stores',	'MUMBAI',	99401234,	'jks@yahoo.com'),
	('S03', 'ROSE BOOK STORE',	'TRIVANDRUM',	94444112,	'rose@gmail.com'),
	('S04', 'KAVARI STORE',	'DELHI',	86300014	,'kavi@redif.com'),
	('S05', 'EINSTEN BOOK GALLARY',	'US',	95420000,	'eingal@aol.com'),
	('S06', 'AKBAR STORE',	'MUMBAI',	78556231, 'akbakst@aol.com');

insert into lms_book_details values
	('BL000010', 'Java ForvDummies', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 575.00, 'A1', '2011-05-10','S01'),
	('BL000002', 'Java: The Complete R...', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750.00, 'A1', '2011-05-10','S03'),
	('BL000003', 'Java How To Do Prog...', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-05-10', 6, 600.00, 'A1', '2012-05-10','S01'),
	('BL000004', 'Java: The Complete R...', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750.00, 'A1', '2012-05-11','S01'),
	('BL000005', 'Java How To Do Prog..', 'JAVA', 'Paul J. Deitel',	'Prentice Hall', '1999-12-10',	6, 600.00, 'A1', '2012-05-11','S01'),
	('BL000006', 'Java: The Complete R..', 'JAVA',	'Herbert Schildt', 'Tata Mcgraw Hill',	'2011-10-10', 5, 750.00, 'A1', '2012-05-12','S03'),
	('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar', 'BPB Publications',	'2010-12-11', 9, 500.00, 'A3', '2010-11-03','S03'),
	('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar',	'BPB Publications', '2010-05-12', 9, 500.00, 'A3', '2011-08-09','S04'),
	('BL000009', 'Let Us C', 'C', 'Yashavant Kanetkar',	'BPB Publications', '2010-05-12', 9, 550.00, 'A3', '2011-08-09','S04'),
	('BL000011', 'Let Us C++', 'C',	'Yashavant Kanetkar', 'BPB Publications', '2010-05-12',	9, 650.00, 'A3', '2011-08-09','S04')
insert into lms_book_issue values
	('LM001', 'BL000010',	'2012-05-01',	'2012-05-16',	'2012-05-16',	'R0'),
	('LM002', 'BL000002',	'2012-05-01',	'2012-05-06',	'2012-05-16',	'R2'),
	('LM003', 'BL000007',	'2012-04-01',	'2012-04-16',	'2012-04-20',	'R1'),
	('LM004', 'BL000005',	'2012-04-01',	'2012-04-16',	'2012-04-20',	'R1'),
	('LM005', 'BL000008',	'2012-03-30',	'2012-04-15',	'2012-04-20',	'R1'),
	('LM005', 'BL000008',	'2012-04-20',	'2012-05-05',	'2012-05-05',	'R0'),
	('LM003', 'BL000007',	'2012-04-22',	'2012-05-07',	'2012-05-25',	'R4')