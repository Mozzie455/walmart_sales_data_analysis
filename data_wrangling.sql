/*
Created by: Joshua Mutiso
Create date: 06/05/2025
Title: Data Wrangling
Description: The first step of data inspection where NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values
*/
-- Create a database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Load the database
USE walmartSales;

-- Create a table
CREATE TABLE IF NOT EXISTS sales(
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6,4) NOT NULL,
total DECIMAL(12,4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL(10,2) NOT NULL,
gross_margin_pct FLOAT(11,9),
gross_income DECIMAL(12,4) NOT NULL,
rating FLOAT(2,1)
);

-- Select columns with null values in them. 
SELECT * FROM walmartsales.sales;