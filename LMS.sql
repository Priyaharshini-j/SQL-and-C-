create table lms_members(
	member_id VARCHAR(10) primary key,
	member_name varchar(30),
	city varchar(20),
	register_date date,
	expire_date date,
	membership_status varchar(15)
);
create table lms_supplier_details(
	supplier_id VARCHAR(3) primary key,
	supplier_name varchar(30),
	supplier_address varchar(50),
	supplier_contact int,
	supplier_email varchar(15)
);
create table lms_fine_details(
	fine_range varchar(3) primary key,
	fine_amount int
);
create table lms_book_details(
	book_code VARCHAR(10) primary key,
	book_title varchar(50),
	category varchar(15),
	author varchar(30),
	publication varchar(30),
	publish_date date,
	book_edition int,
	price int,
	rack_number varchar(3),
	date_arrival date,
	supplier_id VARCHAR(3),
	constraint fk_supplier_id
		foreign key (supplier_id) references lms_supplier_details(supplier_id)
);
create table lms_book_issue(
	book_issue_no int identity(1,1) primary key,
	member_id VARCHAR(10),
	book_code VARCHAR(10),
	date_issue date,
	date_return date,
	date_returned date,
	fine_range varchar(3),
	constraint fk_member_id
		foreign key (member_id) references lms_members(member_id),
	constraint fk_book_details
		foreign key (book_code) references lms_book_details(book_code),
	constraint fk_fine_details
		foreign key (fine_range) references lms_fine_details(fine_range),
);

--Solutions
--Question 1
exec sp_help lms_book_details;
--Question 2
select * from lms_fine_details;
--Question 3
select * from lms_members where city = 'CHENNAI';
--Question 4
select member_id, member_name, city, membership_status from lms_members where membership_status = 'PERMANENT';
--Question 5
select bi.member_id, lm.member_name
	from lms_book_issue bi
		inner join lms_members lm
			on bi.member_id = lm.member_id
				where bi.book_code = 'BL000002';
--Question 6
select book_code, book_title, author from lms_book_details where author like 'P%';
--Question 7
select count(*) as NO_OF_BOOKS from lms_book_details where category = 'JAVA';
--Question 8
select category, count(*) as NO_OF_BOOKS from lms_book_details group by category;
--Question 9
select count(*) as NO_OF_BOOKS from lms_book_details where author = 'Prentice Hall';
--Question 10
select bi.book_code, bd.book_title
	from lms_book_issue bi
		inner join lms_book_details bd
			on bi.book_code = bd.book_code
				where bi.date_issue = '2012-04-01';
--Question 11
select member_id, member_name, register_date, expire_date from lms_members where expire_date < '2013-04-01';
--Question 12
select member_id, member_name, register_date, membership_status
	from lms_members
		where register_date < '2012-03-01'
			and
				membership_status = 'TEMPORARY';
--Question 13
select member_id, member_name from lms_members where city = 'CHENNAI' OR city = 'DELHI';
--Question 14
select concat(book_title, ' is written by ', author) from lms_book_details;
--Question 15
select avg(price) as AVERAGEPRICE from lms_book_details where category = 'JAVA';

--Question 16
select supplier_id, supplier_name, supplier_email from lms_supplier_details where supplier_email like '%gmail.com';

--ques17
SELECT supplier_id,supplier_name,coalesce(supplier_contact,supplier_email,supplier_address) from lms_supplier_details ;

--Question 18
SELECT mem.member_id, mem.member_name, bd.book_code, bd.book_title from lms_book_details bd, lms_members mem
INNER JOIN  lms_book_issue bi ON mem.member_id = bi.member_id;

--Question 19
SELECT mem.member_id, mem.member_name, fd.fine_range, fd.fine_amount from lms_members mem, lms_fine_details fd
INNER JOIN lms_book_issue bi  ON fd.fine_amount>100;



--QUESTION 23
--DISPLAY RACK NUMBER , NO_OF_BOOKS IN EACH ACK WITHALIAS NAME 'NOOFBOOKS' AND SORT BY RACK NUMBER IN ASCENDING UMBER
SELECT rack_number, COUNT(book_code) AS NOOFBOOKS FROM lms_book_details GROUP BY (rack_number)

/*
--QUESTION 24
SELECT book_issue_no,member_name,register_date,expire_date,book_title,category,author,price,date_issue,date_return,date_returned,date_issue,fine_amount FROM lms_book_issue
INNER JOIN (lms_members
INNER JOIN(lms_book_details ON lms_fine_details 
*/
--QUESTION 26
--DISPLAY ONLY THE FIRST THREE RECORDS
SELECT TOP (3) * FROM lms_supplier_details;

--QUESTION 27
--DISPLAY RECORDS OF ALL SUPPLIERS EXCLUDING THE FIRST 3 SUPPLIERS
SELECT SUPPLIER_ID,supplier_name, supplier_address,supplier_contact,supplier_email FROM lms_supplier_details WHERE supplier_id BETWEEN 'S03' AND 'SO7';

--QUESTION 28
--RENAME MEMBER TABLE TO LMS_MEMBERS_DETAILS
EXEC sp_rename 'lms.members','lms_members_details';

--QUESTION 29
--delete all the rows of the table
TRUNCATE TABLE lms_fine_details;
SELECT * FROM lms_fine_details;

--QUESTION 30
--SELECT ALL NAMES OF THE BOOK
SELECT DISTINCT (book_title) FROM lms_book_details;
select * from lms_book_details;



