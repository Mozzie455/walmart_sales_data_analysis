/*
Created by: Joshua Mutiso
Create date: 07/05/2025
Title: Exploratory Data Analysis (EDA)
Description: Exploratory data analysis is done to answer the listed questions and aims of this project
*/

/* Sales */
-- Number of sales made in each time of the day per weekday
SELECT
	 day_name, 
	 time_of_day, 
	 SUM(quantity) AS unit_sold, 
	 ROUND(SUM(total),2) AS total_amt
FROM sales
GROUP BY day_name, time_of_day
ORDER BY day_name DESC;

-- Which of the customer types brings the most revenue?
SELECT 
	 customer_type,
	 SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;
 
-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT
	 city,
	 MAX(VAT) AS VAT
FROM sales
GROUP BY city
ORDER BY VAT DESC;

-- Which customer type pays the most in VAT?
SELECT
	 customer_type,
	 MAX(VAT) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC;

/* Customers */
-- How many unique customer types does the data have?
SELECT
	 DISTINCT customer_type
FROM sales;

-- How many unique payment methods does the data have?
SELECT 
	DISTINCT payment_method
FROM sales;
    
-- What is the most common customer type?
SELECT
	 DISTINCT customer_type,
     COUNT(customer_type) AS number_of_customer
FROM sales
GROUP BY customer_type
ORDER BY number_of_customer DESC;

-- Which customer type buys the most?
SELECT 
	customer_type,
    ROUND(SUM(total),2) as total_bought
FROM sales
GROUP BY customer_type
ORDER BY total_bought DESC;
-- What is the gender of most of the customers?
SELECT
    gender,
    COUNT(*) AS gender_count
FROM sales
GROUP BY gender
ORDER BY gender_count DESC;

-- What is the gender distribution per branch?
 SELECT 
	gender, 
    branch, 
	COUNT(*) as gender_count
FROM sales
GROUP BY gender, branch 
ORDER BY branch;

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
    AVG(rating) AS avg_rating
 FROM sales
 GROUP BY time_of_day
 ORDER BY avg_rating DESC;
 
-- Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
    branch,
    AVG(rating) AS avg_rating,
    COUNT(*) AS customer_count
 FROM sales
 GROUP BY time_of_day, branch
 ORDER BY avg_rating DESC;
 
-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC; 
   
-- Which day of the week has the best average ratings per branch?
SELECT
	day_name,
    branch,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name, branch
ORDER BY avg_rating DESC; 