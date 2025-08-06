Create database Sqlproject_1;
Use Sqlproject_1;
create table RetailSales (
transactions_id	int primary key,
sale_date date,
sale_time	time,
customer_id	int ,
gender	varchar(15),
age	int,
category varchar(25),
quantiy	int,
price_per_unit	float,
cogs	float,
total_sale float
);

select * from RetailSales
where transactions_id is null
or
sale_date  is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or
cogs is null
or
total_sale is null;
delete from RetailSales
where  transactions_id is null
or
sale_date  is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or
cogs is null
or
total_sale is null;

select * from RetailSales;
select count(*) from RetailSales;

select count(transactions_id ) as "TOTAL NO OF SALES" from RetailSales;

select count(distinct customer_id) as "TOTAL NO OF SALES" from RetailSales;


-- Data anaysis for business key problems and its solution.

-- Write an SQL query to retrive all the column for the sales made on 2021-11-05?

select * from RetailSales
 where sale_date = "2022-11-05"; 
 
 -- Write a SQL query to retrive all the transaction where the category ="clothing" and the quantity sold is more than 10 in the month month of november 2022.
select * from RetailSales
where category ="clothing" and quantiy >="4" and sale_date between "2022-11-01" and "2022-11-30" ;

-- Write a SQL query to calculate total sales for each category.
select category,
sum(total_sale) as "TOTAL SALES VIA CATEGORY" from RetailSales Group by 1;

 -- Write a SQL query to find the average age of customers who purchase items from the 'Beauty' Category.
 select round(avg(age),2) as "AVG AGE" from RetailSales
  where category ="Beauty" ;
  
   -- Write a SQL query to find all the transcation where  total sales is greater than 1000.
   select * from RetailSales
   where total_sale > "1000";
   
   
   -- Write a SQL query to find the total no of transaction done by each gender in each category.
   select category, gender,
   count(transactions_id) as "Total Transaction" from RetailSales group by category, gender
   order by category ASc;
   
      -- Write a SQL query to calculate the average sales for each month.Find out best selling month in each year
     
      Select 
      YEAR(sale_date) as "Year",
      MONTH(sale_date) as "Month",
      round(avg(total_sale),2) as "AVG TOTAL SALES"
      from RetailSales
      order by 1,3 desc;
      
         -- Write a SQL query to find the top 5 coutomer based on the highest total sales.
         
	select Customer_id as "Customer",total_sale as "Total Sales"
      from RetailSales
      order by total_sale desc
      limit 5;
      
             -- Write a SQL query to find the no of unique cutomers who purchase item from each categories.
	

 Select 
 category,
 count(distinct Customer_id ) 
 from RetailSales 
 group by category
 HAVING COUNT(DISTINCT category) = (SELECT COUNT(DISTINCT category) FROM RetailSales );

-- Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternooon between 12 & 17, Evening >17)

 with shift_sales
 as
 (
select *,
   case
   when extract(hour from sale_time) < 12 then "Morning"
   when extract(hour from sale_time) between 12 and 17 then "Afternoon"
   else "Evening"
   end as "Shift"
 from RetailSales
 )
 select
 shift,
 count(transactions_id) as "Total Order"
 from shift_sales
 group by  shift;
   
   