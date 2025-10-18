
CREATE TABLE marketing_campaign(
	ID INT PRIMARY KEY,
	Year_Birth INT,
	Education VARCHAR(50),
	Marital_Status VARCHAR(50),	
	Income NUMERIC(10,2),
	Kidhome INT,
	Teenhome INT,
	Dt_Customer DATE,
	Recency INT,
	MntWines NUMERIC(10,2),
	MntFruits NUMERIC(10,2),
	MntMeatProducts NUMERIC(10,2),
	MntFishProducts NUMERIC(10,2),
	MntSweetProducts NUMERIC(10,2),	
	MntGoldProds NUMERIC(10,2),
	NumDealsPurchases INT,	
	NumWebPurchases INT,
	NumCatalogPurchases INT,	
	NumStorePurchases INT,	
	NumWebVisitsMonth INT,	
	AcceptedCmp3 BOOLEAN,	
	AcceptedCmp4 BOOLEAN,	
	AcceptedCmp5 BOOLEAN,	
	AcceptedCmp1 BOOLEAN,	
	AcceptedCmp2 BOOLEAN,	
	Complain BOOLEAN,	
	Z_CostContact NUMERIC(10,2),
	Z_Revenue NUMERIC(10,2),	
	Response BOOLEAN
	);
	
	
--1. How many customer records are in the dataset?

SELECT 
	COUNT(*) AS customer_records
FROM 
	marketing_campaign;

--2. How many customers accepted each of the five marketing campaigns?

SELECT 
	SUM(AcceptedCmp1::INT) AS first_campaign,
	SUM(AcceptedCmp2::INT) AS second_campaign,
	SUM(AcceptedCmp3::INT) AS third_campaign,
	SUM(AcceptedCmp4::INT) AS fourth_campaign,
	SUM(AcceptedCmp5::INT) AS fifth_campaign
FROM 
	marketing_campaign;

--3. What is the overall acceptance rate across all marketing campaigns?

SELECT 
	ROUND(
	   (SUM(AcceptedCmp1::INT + AcceptedCmp2::INT +
	   AcceptedCmp3::INT + AcceptedCmp4::INT +
	   AcceptedCmp5::INT)::NUMERIC
	   /
	   (COUNT(*) * 5)) * 100, 2
	) AS overall_acceptance
FROM 
	marketing_campaign;

--4. How many customers belong to each education level?

SELECT 
	education,
	COUNT(*) AS number_of_customers
FROM 
	marketing_campaign
GROUP BY 
	education
ORDER BY number_of_customers DESC;

--5. What is the average income of customers who accepted the most recent campaign?

SELECT 
    ROUND(AVG(Income), 2) AS avg_income_accepted
FROM 
    marketing_campaign
WHERE 
    Response = TRUE;

--6. Which purchase channel had the highest number of purchases?
	
SELECT
	SUM(NumWebPurchases) AS Web_Purchases,
    SUM(NumCatalogPurchases) AS Catalog_Purchases,
    SUM(NumStorePurchases) AS Store_Purchases
FROM
	marketing_campaign;
--7. How many customers visited the website more than five times in the last month?

SELECT 
    COUNT(*) AS customers_with_more_than_5_visits
FROM 
    marketing_campaign
WHERE 
    NumWebVisitsMonth > 5;

--8. What is the average number of days since the last purchase across all customers?

SELECT 
    ROUND(AVG(Recency), 2) AS avg_days_since_last_purchase
FROM 
    marketing_campaign;

--9. How many customers made at least one purchase using a discount?

SELECT 
    COUNT(*) AS customers_with_discount_purchases
FROM 
    marketing_campaign
WHERE 
    NumDealsPurchases >= 1;
	
