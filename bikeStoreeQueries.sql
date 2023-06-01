use BikeStores
---------------------------------------------------------------------------------
--1-
select COUNT(customer_id) as 'all customers have phone number' from sales.customers where customers.phone is not null ;
--*****************************************************************************
--2-
select CONCAT(first_name , last_name) as full_name from sales.customers 
select DISTINCT CONCAT(first_name , last_name) as full_name_un  from sales.customers
--here only one dublicated in full name 

select first_name from sales.customers --1445 row--
select DISTINCT first_name from sales.customers --1265 row--
--here 180 dublicates in first_name

select last_name from sales.customers --1445 row--
select DISTINCT last_name from sales.customers --753 row--
--here 692 dublicates in last_name
--*******************************************************************************
--3-
select customer_id as 'customer ID' , CONCAT(first_name , last_name) as 'customer Full Name' , phone as 'customer phone number' from sales.customers

--********************************************************************************
--4-
select COUNT(customer_id) as 'number of customers' from sales.customers
--********************************************************************************
--5- 
select sc.first_name , sc.phone ,so.required_date from sales.customers sc inner join sales.orders so on sc.customer_id=so.customer_id
--********************************************************************************
--6-
select MAX(order_date) as 'recent order' , MIN (order_date) as 'oldest order' from sales.orders
--********************************************************************************
--7-
select item_id  from sales.order_items where list_price>500
--********************************************************************************
--8-
select quantity from production.stocks where store_id=1
--********************************************************************************
--9-
select pp.product_name from production.products pp inner join production.brands pb on pp.brand_id=pb.brand_id  where pb.brand_name = 'Electra'
