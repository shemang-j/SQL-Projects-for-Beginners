
# 🧮 Project 1: Analyze Amazon Sales Data

## 📘 Project Overview
In this project, you'll analyze real-world e-commerce sales data to uncover basic trends and performance metrics.  
You'll practice foundational **SQL** skills to summarize and clean the dataset.

---

## 🎯 Learning Objectives
- Practice writing basic SQL queries using `SELECT`, `FROM`, and `WHERE`
- Learn how to clean and filter data using logical operators and keywords
- Aggregate and summarize data using common SQL functions
- Gain confidence exploring real-world datasets with simple analysis

--- 

<details>
<summary><h2>🧩 Practice Questions</h2></summary>
Here are some beginner-friendly questions to get you started:

1. How many total rows (sales records) are in the dataset?  
2. What is the total revenue generated across all sales?  
3. Which product category had the highest total quantity sold?  
4. What is the average sales amount per transaction?  
5. How many unique SKUs were sold?  
6. What are the top 5 most sold SKUs based on quantity?  
7. Which month had the highest total sales revenue?  
8. How many sales were B2B transactions vs non-B2B?  
9. Which fulfilment method was used most frequently?  
10. How many sales were made for each product size?

</details>

---

<details>
<summary><h2>🧾 About the Dataset</h2></summary>

This dataset provides an in-depth look at the profitability of e-commerce sales.  
It contains data on a variety of sales channels (e.g. **Shiprocket**, **INCREFF**) and financial information including expenses and profits.  

Included in the dataset are:  
- SKU codes, design numbers, stock levels, product categories, sizes, and colors  
- MRPs across multiple stores (Ajio MRP, Amazon MRP, Amazon FBA MRP, Flipkart MRP, Limeroad MRP, Myntra MRP, Paytm MRP)  
- Transactional parameters such as **Date of Sale**, **Month**, **Category**, **Fulfilled By**, **B2B**, **Status**, **Quantity**, **Currency**, and **Gross Amount**  

This is a useful dataset for anyone trying to uncover the profitability of e-commerce sales in today’s marketplace.

## 📊 Column Description

| **Column Name**     | **Description**                                      |
|----------------------|------------------------------------------------------|
| `Category`           | Type of product. *(String)*                         |
| `Size`               | Size of the product. *(String)*                     |
| `Date`               | Date of the sale. *(Date)*                          |
| `Status`             | Status of the sale. *(String)*                      |
| `Fulfilment`         | Method of fulfilment. *(String)*                    |
| `Style`              | Style of the product. *(String)*                    |
| `SKU`                | Stock Keeping Unit. *(String)*                      |
| `ASIN`               | Amazon Standard Identification Number. *(String)*   |
| `Courier Status`     | Status of the courier. *(String)*                   |
| `Qty`                | Quantity of the product. *(Integer)*                |
| `Amount`             | Amount of the sale. *(Float)*                       |
| `B2B`                | Business-to-business sale. *(Boolean)*              |
| `Currency`           | The currency used for the sale. *(String)*          |

You can download the dataset from Kaggle here:  
[E-Commerce Sales Dataset on Kaggle](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data)   

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
