/*
Created by: Joshua Mutiso
Create date: 06/05/2025
Title: Exploratory Data Analysis (EDA)
Description: Exploratory data analysis is done to answer the listed questions and aims of this project
*/
-- Load the database
USE walmartSales;

/* Generic Question */
-- How many unique cities does the data have?
SELECT
  DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT
  DISTINCT city, branch
FROM sales;

/* Product */
-- How many unique product lines does the data have?
SELECT
 COUNT(DISTINCT product_line)
FROM sales;
 
-- What is the most common payment method?
SELECT
 payment_method, 
 COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;

-- What is the most selling product line?
SELECT
 product_line, 
 COUNT(product_line) AS nums
FROM sales
GROUP BY product_line
ORDER BY nums DESC;

-- What is the total revenue by month?
SELECT
 month_name AS month,
 SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC; 

-- What month had the largest COGS?
SELECT 
  month_name AS month,
  SUM(cogs) AS cogs
 FROM sales
 GROUP BY month_name
 ORDER BY cogs DESC;
 
-- What product line had the largest revenue?
SELECT 
 product_line,
 SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC; 

-- What is the city with the largest revenue?
SELECT 
 city,
 branch,
 SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC; 

-- What product line had the largest VAT?
SELECT 
 product_line,
 ROUND(MAX(VAT), 2) AS max_tax
FROM sales
GROUP BY product_line
ORDER BY max_tax DESC; 

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT 
	product_line,
	ROUND(AVG(total),2) AS avg_sales,
	(CASE WHEN AVG(total) > (SELECT AVG(total) FROM sales) THEN "Good"
	ELSE "Bad"
	END) AS Remarks
FROM sales
GROUP BY product_line;

-- Which branch sold more products than average product sold?
SELECT
 branch,
 SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);
 
-- What is the most common product line by gender?
SELECT 
 gender,
 product_line,
 COUNT(product_line) AS common_product
FROM sales
GROUP BY gender, product_line
ORDER BY common_product DESC;
 
-- What is the average rating of each product line?
SELECT 
   ROUND(AVG(rating),2) AS avg_rating,
   product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;   