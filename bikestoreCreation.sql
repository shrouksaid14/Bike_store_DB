--database creation 
create database bikestores ;
use bikestores
----------------------------------------------------------------------------
create table customer (
customer_id int not null CONSTRAINT customer_id  PRIMARY KEY (customer_id), 
first_name varchar(200) not null , 
last_name varchar(200) not null , 
phone int not null , 
email varchar(200) not null ,
street varchar(200) not null ,
city varchar(200) not null ,
state varchar(200) not null ,
zip_code varchar(200) not null ) 

---------------------------------------------------------------------------
create table stores (
store_id int not null CONSTRAINT store_id  PRIMARY KEY (store_id), 
store_name varchar(200) not null , 
phone int not null , 
email varchar(200) not null ,
street varchar(200) not null ,
city varchar(200) not null ,
st_state varchar(200) not null ,
zip_code varchar(200) not null )
----------------------------------------------------------------------------------------------------------------------
create table staffs (
staff_id int not null  CONSTRAINT staff_id  PRIMARY KEY (staff_id),
first_name varchar(200) not null , 
last_name varchar(200) not null , 
phone int not null , 
email varchar(200) not null ,
active varchar(200) not null ,
manager_id int not null ,
store_id int not null, FOREIGN KEY (store_id) REFERENCES stores (store_id)) 
------------------------------------------------------------------------------------------------------------------
create table orders (
order_id int not null CONSTRAINT order_id  PRIMARY KEY (order_id),
customer_id int not null FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ,
order_status varchar not null ,
order_date date not null ,
required_date date not null ,
shipped_date date not null ,
store_id int not null ,FOREIGN KEY (store_id) REFERENCES stores (store_id),
staff_id int not null, FOREIGN KEY (staff_id) REFERENCES staffs (staff_id))

----------------------------------------------------------------------------------------------------------------

create table categories (
category_id int not null CONSTRAINT category_id  PRIMARY KEY (category_id),
category_name varchar(200) not null )
------------------------------------------------------------------------------------------------------------------------
create table brands (
brand_id int not null CONSTRAINT brand_id  PRIMARY KEY (brand_id),
brand_name varchar(200) not null )
-------------------------------------------------------------------------------------------------------------------------
create table products (
product_id int not null CONSTRAINT product_id  PRIMARY KEY (product_id) , 
product_name varchar(200) not null ,
brand_id int not null FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
category_id int not null FOREIGN KEY (category_id) REFERENCES categories(category_id),
model_year int not null ,
list_price int not null )
--------------------------------------------------------------------------------------------------------------------------
create table stockes (
store_id int not null FOREIGN KEY (store_id) REFERENCES stores(store_id),
product_id int not null FOREIGN KEY (product_id) REFERENCES products(product_id),
primary key (store_id,product_id))
---------------------------------------------------------------------------------------------------------------------------
create table order_items(
order_id int not null ,
item_id int not null ,
product_id int not null FOREIGN KEY (product_id) REFERENCES products(product_id),
quantity int not null , 
list_price DECIMAL (10, 2) not null ,
discount DECIMAL (10, 2) not null ,
primary key (order_id,item_id))
