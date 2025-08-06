# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `Sqlproject_1`

This project is a guided hands-on SQL practice exercise, completed as part of my learning journey into business analytics. It simulates real-world retail sales data and involves setting up a database, cleaning data, performing exploratory data analysis (EDA), and answering business questions using SQL queries.
The project helped me solidify foundational SQL skills—an essential part of a business analyst's toolkit.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `Sqlproject_1`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
Create database Sqlproject_1;

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
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

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
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
select * from RetailSales
 where sale_date = "2022-11-05";
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
select * from RetailSales
where category ="clothing" and quantiy >="4" and sale_date between "2022-11-01" and "2022-11-30" ;
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
sum(total_sale) as "TOTAL SALES VIA CATEGORY" from RetailSales Group by 1;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select round(avg(age),2) as "AVG AGE" from RetailSales
  where category ="Beauty" ;
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
 select * from RetailSales
   where total_sale > "1000";
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
 select category, gender,
   count(transactions_id) as "Total Transaction" from RetailSales group by category, gender
   order by category ASc;
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
      Select 
      YEAR(sale_date) as "Year",
      MONTH(sale_date) as "Month",
      round(avg(total_sale),2) as "AVG TOTAL SALES"
      from RetailSales
      order by 1,3 desc;
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales**:
```sql
select Customer_id as "Customer",total_sale as "Total Sales"
      from RetailSales
      order by total_sale desc
      limit 5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
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
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This guided project was a great introduction to real-world SQL applications in business analytics. It helped me practice essential data analysis tasks such as cleaning, aggregating, filtering, and deriving business insights using SQL.
As someone beginning a career in analytics, this project marks my first step toward building a strong and practical portfolio.

## Author - Hammad Alam

I'm a PGDM graduate from Chandragupt Institute of Management Patna, aiming to build a career in business analytics. This is my first project on GitHub and part of my continuous learning journey.

Let’s connect:https://www.linkedin.com/in/hammad-alam-758a661b9?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app

Thank you for your support, and I look forward to connecting with you!
