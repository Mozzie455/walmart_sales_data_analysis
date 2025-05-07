/*
Created by: Joshua Mutiso
Create date: 06/05/2025
Title: Feature Engineering
Description: This will help use generate some new columns from existing ones.
*/
-- Load the database
USE walmartSales;

-- Add a new column to give insight of sales in the Morning, Afternoon and Evening.
SELECT
  time,
   (CASE
	  WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	  WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
      ELSE "Evening"
    END  
	) AS time_of_date       
FROM sales; 

-- Add a column in sales table
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20); 

-- Update the sales table
UPDATE sales
SET time_of_day = (
	CASE
	  WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	  WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
      ELSE "Evening"
    END
);  

SELECT * FROM walmartsales.sales;

-- Add a new column that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri).
SELECT
  date,
  dayname(date) AS day_name
 FROM sales; 
 
 -- Add a column in sales table
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10); 

-- Update the sales table
UPDATE sales
SET day_name = dayname(date);  

SELECT * FROM walmartsales.sales;

-- Add a new column that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar).
SELECT
   date,
   monthname(date)
FROM sales;

 -- Add a column in sales table
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

-- Update the sales table
UPDATE sales
SET month_name = monthname(date);

SELECT * FROM walmartsales.sales;