create database bank_db1;

use bank_db1;

create table bank(
bank_id int(11),
bank_naame varchar(60),
bank_code int (11),
bank_address varchar(60),
constraint bank_pk primary key(bank_id)
);

create table customer(
custid int, 
cust_name varchar(100),
cust_no int,
cust_add varchar(100),
constraint cust_pk primary key(custid)
);

create table branch(
branch_id int,
branch_name varchar(60),
branch_add varchar(60),
bank_id int,
constraint branch_pk primary key(branch_id),
constraint bank_fk foreign key(bank_id) references bank(bank_id)
);

create table account(
acc_number int,
acc_type varchar(60),
acc_balance int,
branch_id int,
constraint acc_pk primary key(acc_number),
constraint branch_fk1 foreign key(branch_id) references branch(branch_id)
);

create table loan(
loan_id int,
loan_type varchar(60),
loan_amount int,
custid int,
constraint loan_pk primary key(loan_id),
constraint cust_fk2 foreign key(custid) references customer(custid)
);

alter table customer
add acc_number int;

alter table customer
add constraint acc_fk3 foreign key(acc_number) references account(acc_number);

alter table branch
add loan_id int;

alter table branch 
add constraint loan_fk4 foreign key(loan_id) references loan(loan_id);

alter table bank
add cust_id int;

alter table bank
add constraint cust_fk5 foreign key(cust_id)references customer(custid);

