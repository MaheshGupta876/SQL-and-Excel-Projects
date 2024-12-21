show databases;
use classicmodels;

# Q1. a.	Fetch the employee number, first name and last name of those employees who are working as Sales Rep reporting to employee with employeenumber 1102 (Refer employee table)

select * FROM classicmodels.employees;
select employeenumber, firstname, lastname from employees WHERE jobtitle="sales rep" AND REPORTSTO = 1102;

# b.	Show the unique productline values containing the word cars at the end from the products table.

#distinct for remove duplicate
select * from products;
select distinct productline from products where productLine like  "%cars" ;

# Q2. a.

select * from customers;
select customerNumber, customername,
case
when country in ("USA" , "canada") then "North America"
when country in ("uk","france" ,"germany") then "Europe"
else "other" 
end as "CustomerSegment"
from customers;

# Q3. a. 

SELECT * FROM orderdetails;
SELECT productCode, sum(quantityOrdered) as Total_Ordered from orderdetails group by productcode order by Total_Ordered desc limit 10;

# Q3. b.

select * from payments;
select date_format(paymentdate, "%M") as Payment_Month, count(*) as Num_Payment from payments group by Payment_Month having Num_Payment >20  order by Num_Payment desc;


# Q4. a.

SHOW databases;
create database Customers_Order;
use Customers_Order;
Create table Customers(Customer_Id int primary key auto_increment, First_Name varchar(50) not null, Last_Name varchar(50) not null, Email varchar (255) unique, Phone_Number varchar(20));
desc customers;

# Q4. b.

Create table Orders(Order_Id int primary key auto_increment, Customer_Id int , Order_date date, Total_Amount decimal (10,2), 
foreign key(Customer_Id) references customers(Customer_Id),check (Total_Amount >0));
desc Orders;


