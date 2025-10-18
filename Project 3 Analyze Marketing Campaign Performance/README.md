
# 🧮 Project 3: Analyze Marketing Campaign Performance

## 📘 Project Overview

In this project, you'll analyze marketing campaign performance data to uncover trends and insights. You'll work with real-world marketing data to evaluate campaign effectiveness and audience engagement.

---

## 🎯 Learning Objectives
- Write SQL queries to explore marketing campaign datasets
- Clean and standardize data fields
- Aggregate data to find trends in campaign performance metrics
- Practice filtering and summarizing marketing data
  
--- 

<details>
<summary><h2>🧩 Practice Questions</h2></summary>
Here are some beginner-friendly questions to get you started:

1. How many customer records are in the dataset?
2. How many customers accepted each of the five marketing campaigns?
3. What is the overall acceptance rate across all marketing campaigns?
4. How many customers belong to each education level?
5. What is the average income of customers who accepted the most recent campaign?
6. Which purchase channel had the highest number of purchases?
7. How many customers visited the website more than five times in the last month?
8. What is the average number of days since the last purchase across all customers?
9. How many customers made at least one purchase using a discount?

</details>

---

<details>
<summary><h2>🧾 About the Dataset</h2></summary>

A response model can provide a significant boost to the efficiency of a marketing campaign by increasing responses or reducing expenses. The objective is to predict who will respond to an offer for a product or service.

## 📊 Column Description

| **Column Name**           | **Description**                                                                 |
|----------------------------|---------------------------------------------------------------------------------|
| `AcceptedCmp1`             | 1 if the customer accepted the offer in the 1st campaign, 0 otherwise. *(Boolean / Integer)* |
| `AcceptedCmp2`             | 1 if the customer accepted the offer in the 2nd campaign, 0 otherwise. *(Boolean / Integer)* |
| `AcceptedCmp3`             | 1 if the customer accepted the offer in the 3rd campaign, 0 otherwise. *(Boolean / Integer)* |
| `AcceptedCmp4`             | 1 if the customer accepted the offer in the 4th campaign, 0 otherwise. *(Boolean / Integer)* |
| `AcceptedCmp5`             | 1 if the customer accepted the offer in the 5th campaign, 0 otherwise. *(Boolean / Integer)* |
| `Response` *(target)*      | 1 if the customer accepted the offer in the last campaign, 0 otherwise. *(Boolean / Integer)* |
| `Complain`                 | 1 if the customer complained in the last 2 years. *(Boolean / Integer)*         |
| `DtCustomer`               | Date of the customer’s enrolment with the company. *(Date)*                     |
| `Education`                | Customer’s level of education. *(String)*                                      |
| `Marital`                  | Customer’s marital status. *(String)*                                          |
| `Kidhome`                  | Number of small children in the customer’s household. *(Integer)*              |
| `Teenhome`                 | Number of teenagers in the customer’s household. *(Integer)*                   |
| `Income`                   | Customer’s yearly household income. *(Numeric)*                                |
| `MntFishProducts`          | Amount spent on fish products in the last 2 years. *(Numeric)*                 |
| `MntMeatProducts`          | Amount spent on meat products in the last 2 years. *(Numeric)*                 |
| `MntFruits`                | Amount spent on fruit products in the last 2 years. *(Numeric)*                |
| `MntSweetProducts`         | Amount spent on sweet products in the last 2 years. *(Numeric)*                |
| `MntWines`                 | Amount spent on wine products in the last 2 years. *(Numeric)*                 |
| `MntGoldProds`             | Amount spent on gold products in the last 2 years. *(Numeric)*                 |
| `NumDealsPurchases`        | Number of purchases made with a discount. *(Integer)*                          |
| `NumCatalogPurchases`      | Number of purchases made using the catalogue. *(Integer)*                      |
| `NumStorePurchases`        | Number of purchases made directly in stores. *(Integer)*                       |
| `NumWebPurchases`          | Number of purchases made through the company’s website. *(Integer)*            |
| `NumWebVisitsMonth`        | Number of visits to the company’s website in the last month. *(Integer)*        |
| `Recency`                  | Number of days since the last purchase. *(Integer)*                            |


You can download the dataset from Kaggle here:  
[Marketing Campaign](https://www.kaggle.com/datasets/rodsaldanha/arketing-campaign)   

</details>


---

<details>
<summary><h2>🧠 Solution</h2></summary>

1️⃣ How many total rows (sales records) are in the dataset?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    COUNT(*) AS Total_sales_record
FROM
    sales;
  ```
</details>

**Results:**
 | **total_sales_record**|
|----------------------|
| 128975               |

2️⃣ What is the total revenue generated across all sales?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    SUM(amount) AS Total_revenue
FROM
    sales;
  ```
</details>

**Results:**
 | **total_revenue** 	|
|-------------------	|
| 78592678.30       	|

3️⃣ Which product category had the highest total quantity sold?

 <details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    category AS product_category,
    SUM(qty) AS Total_quantity_sold
FROM
    sales
GROUP BY category
ORDER BY Total_quantity_sold DESC
LIMIT 5;
  ```
</details>

**Results:**
| **product_category** 	| **total_quantity_sold** 	|
|----------------------	|-------------------------	|
| Set                  	| 45289                   	|
| kurta                	| 45045                   	|
| Western Dress        	| 13943                   	|
| Top                  	| 9903                    	|
| Ethnic Dress         	| 1053                    	|

4️⃣ What is the average sales amount per transaction?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    order_id, 
	AVG(amount) AS Average_sales
FROM
    sales
GROUP BY order_id
LIMIT 5;
  ```
</details>

**Results:**
| **product_category** 	| **total_quantity_sold** 	|
|----------------------	|-------------------------	|
| Set                  	| 45289                   	|
| kurta                	| 45045                   	|
| Western Dress        	| 13943                   	|
| Top                  	| 9903                    	|
| Ethnic Dress         	| 1053                    	|

5️⃣ How many unique SKUs were sold?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT DISTINCT
    COUNT(sku) AS Number_of_unique_SKUs
FROM
    sales;
  ```
</details>

**Results:**
| **number_of_unique_skus** 	|
|---------------------------	|
| 128975                    	|

6️⃣ What are the top 5 most sold SKUs based on quantity?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    sku AS SKUs, 
	qty AS Quantity
FROM
    sales
ORDER BY Quantity DESC
LIMIT 5;
  ```
</details>

**Results:**
| **skus**           	| **quantity** 	|
|--------------------	|--------------	|
| BL017-63BLACK      	| 15           	|
| JNE2305-KR-533-XXL 	| 13           	|
| JNE2305-KR-533-L   	| 9            	|
| SET268-KR-NP-XS    	| 8            	|
| J0013-SKD-XXXL     	| 5            	|

7️⃣ Which month had the highest total sales revenue?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    TO_CHAR(date, 'MONTH') AS Month, 
	SUM(amount) AS sales
FROM
    sales
GROUP BY Month
ORDER BY sales DESC;
  ```
</details>

**Results:**
| **month** 	| **sales**   	|
|-----------	|-------------	|
| APRIL     	| 28838708.32 	|
| MAY       	| 26226476.75 	|
| JUNE      	| 23425809.38 	|
| MARCH     	| 101683.85   	|

8️⃣ How many sales were B2B transactions vs non-B2B?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
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
  ```
</details>

**Results:**
| **b2b_transactions** 	| **non_b2b** 	|
|----------------------	|-------------	|
| 871                  	| 128104      	|

9️⃣ Which fulfilment method was used most frequently?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    fulfilment, 
	COUNT(fulfilment) AS unique_fulfilment
FROM
    sales
GROUP BY fulfilment;
  ```
</details>

**Results:**
| **fulfilment** 	| **unique_fulfilment** 	|
|----------------	|-----------------------	|
| Amazon         	| 89698                 	|
| Merchant       	| 39277                 	|

🔟 How many sales were made for each product size?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    size, 
	COUNT(size) AS number_of_sales_made
FROM
    sales
GROUP BY size
ORDER BY number_of_sales_made DESC;
  ```
</details>

**Results:**
| **size** 	| **number_of_sales_made** 	|
|----------	|--------------------------	|
| M        	| 22711                    	|
| L        	| 22132                    	|
| XL       	| 20876                    	|
| XXL      	| 18096                    	|
| S        	| 17090                    	|
| 3XL      	| 14816                    	|
| XS       	| 11161                    	|
| 6XL      	| 738                      	|
| 5XL      	| 550                      	|
| 4XL      	| 427                      	|
| Free     	| 378                      	|

