
/* Project 1: Analyze Amazon Sales Data */

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    order_id VARCHAR(50),
    date DATE,
    status VARCHAR(100),
    fulfilment VARCHAR(50),
    sales_channel VARCHAR(50),
    ship_service_level VARCHAR(50),
    style VARCHAR(100),
    sku VARCHAR(100),
    category VARCHAR(100),
    size VARCHAR(50),
    asin VARCHAR(50),
    courier_status VARCHAR(100),
    qty INTEGER,
    currency VARCHAR(10),
    amount NUMERIC(10,2),
    ship_city VARCHAR(100),
    ship_state VARCHAR(100),
    ship_postal_code VARCHAR(20),
    ship_country VARCHAR(10),
    promotion_ids TEXT,
    b2b BOOLEAN,
    fulfilled_by VARCHAR(50)
);

--1. How many total rows (sales records) are in the dataset?

SELECT 
    COUNT(*) AS Total_sales_record
FROM
    sales;

--2. What is the total revenue generated across all sales?

SELECT 
    SUM(amount) AS Total_revenue
FROM
    sales;

--3. Which product category had the highest total quantity sold?

SELECT 
    category AS product_category,
    SUM(qty) AS Total_quantity_sold
FROM
    sales
GROUP BY category
ORDER BY Total_quantity_sold DESC
LIMIT 5;

--4. What is the average sales amount per transaction?

SELECT 
    order_id, 
	AVG(amount) AS Average_sales
FROM
    sales
GROUP BY order_id
LIMIT 5;

--5. How many unique SKUs were sold?

SELECT DISTINCT
    COUNT(sku) AS Number_of_unique_SKUs
FROM
    sales;

--6. What are the top 5 most sold SKUs based on quantity?

SELECT 
    sku AS SKUs, 
	qty AS Quantity
FROM
    sales
ORDER BY Quantity DESC
LIMIT 5;

--7. Which month had the highest total sales revenue?

SELECT 
    TO_CHAR(date, 'MONTH') AS Month, 
	SUM(amount) AS sales
FROM
    sales
GROUP BY Month
ORDER BY sales DESC;

--8. How many sales were B2B transactions vs non-B2B?

SELECT 
    SUM(CASE
        WHEN b2b = TRUE THEN 1
        ELSE 0
    END) AS B2B_transactions,
    SUM(CASE
        WHEN b2b = FALSE THEN 1
        ELSE 0
    END) AS non_B2B
FROM
    sales;

--9. Which fulfilment method was used most frequently?

SELECT 
    fulfilment, 
	COUNT(fulfilment) AS unique_fulfilment
FROM
    sales
GROUP BY fulfilment;

--10. How many sales were made for each product size?

SELECT 
    size, 
	COUNT(size) AS number_of_sales_made
FROM
    sales
GROUP BY size
ORDER BY number_of_sales_made DESC;
