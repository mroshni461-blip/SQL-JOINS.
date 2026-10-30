Note : Create the following dummy tables in MySQL Workbench using CREATE FUNCTION

create database joins ;
use joins ;

create table customers(
customer_id int primary key,
customer_name varchar(100),
city varchar(50)
);


insert into Customers()
values
(1 , "John Smith" ,"New York"),
(2 ,"Mary Johnson" ,"Chicago"),
(3 ,"Peter Adams" ,"Los Angeles"),
(4 ,"Nancy Miller","Houston" ) ,
(5 , "Robert White" ,"Miami" ) ;

select *  from customers ;





create table orders(
order_id int primary key,
customer_id int,
order_date date,
amount float,
foreign key (customer_id) references customers(customer_id) ) ;


INSERT INTO Orders () VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 5, '2024-10-12', 400); 

                                                                           




create table payments(
payment_id varchar(10) primary key ,
customer_id int,
order_date date,
amount float ,
foreign key (customer_id) references customers(customer_id) );

INSERT INTO Payments () VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

create table employees (
emp_id int primary key ,
emp_name varchar(100),
manager_id int 
);

INSERT INTO Employees () VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);

Question 1. Retrieve all customers who have placed at least one order

select distinct c.customer_id , c.customer_name ,order_id
from customers c
join  orders o
on  c.customer_id = o.customer_id;
        
Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

select c.customer_id , c.customer_name  ,o.order_id ,o.amount
from customers c
join  orders o
on c.customer_id = o.customer_id ;

Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown 
customers.

select  c.customer_id , c.customer_name  ,o.order_id ,o.amount
from  customers c
right join  orders o
on c.customer_id = o.customer_id ;

Question 4. Display all customers and orders, whether matched or not.

select  c.customer_id , c.customer_name  ,o.order_id ,o.amount
from  customers c
left join  orders o
on c.customer_id = o.customer_id 
union
select  c.customer_id , c.customer_name  ,o.order_id ,o.amount
from  customers c
right join  orders o
on c.customer_id = o.customer_id ;

Question 5. Find customers who have not placed any orders.

SELECT c.customer_id , c.customer_name  ,o.order_id 
FROM CUSTOMERS C 
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.ORDER_ID 
WHERE ORDER_ID IS NULL ;

Question 6. Retrieve customers who made payments but did not place any orders.

SELECT C.CUSTOMER_ID ,C.CUSTOMER_NAME,O. order_ID 
FROM CUSTOMERS C
INNER JOIN PAYMENTS P
ON C.CUSTOMER_ID = P.CUSTOMER_ID
LEFT join orders o
on c.customer_id = o.customer_id
where order_ID IS NULL ;


Question 7. Generate a list of all possible combinations between Customers and ORDERS.

SELECT C.CUSTOMER_ID ,C.CUSTOMER_NAME,O. order_ID 
FROM CUSTOMERS C
CROSS JOIN ORDERS O
on c.customer_id = o.customer_id ;


Question 8. Show all customers along with order and payment amounts in one table

SELECT C.CUSTOMER_ID ,C.CUSTOMER_NAME,O. order_ID ,O.AMOUNT,P.AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
on c.customer_id = o.customer_id 
LEFT JOIN PAYMENTS P
on c.customer_id = P.customer_id ;

Question 9. Retrieve all customers who have both placed orders and made payments

SELECT  C.CUSTOMER_ID ,C.CUSTOMER_NAME,O.ORDER_ID 
FROM CUSTOMERS C
INNER JOIN ORDERS O
on c.customer_id = o.customer_id 
INNER JOIN PAYMENTS P
on c.customer_id = P.customer_id ;





