
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

1️⃣ How many customer records are in the dataset?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
	COUNT(*) AS customer_records
FROM 
	marketing_campaign;
  ```
</details>

**Results:**
 | **customer_records** |
|----------------------|
| 2240                 |

2️⃣ How many customers accepted each of the five marketing campaigns?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
	SUM(AcceptedCmp1::INT) AS first_campaign,
	SUM(AcceptedCmp2::INT) AS second_campaign,
	SUM(AcceptedCmp3::INT) AS third_campaign,
	SUM(AcceptedCmp4::INT) AS fourth_campaign,
	SUM(AcceptedCmp5::INT) AS fifth_campaign
FROM 
	marketing_campaign;
  ```
</details>

**Results:**
 | **first_campaign** | **second_campaign** | **third_campaign** | **fourth_campaign** | **fifth_campaign** |
|--------------------|---------------------|--------------------|---------------------|--------------------|
| 144                | 30                  | 163                | 167                 | 163                |

3️⃣ What is the overall acceptance rate across all marketing campaigns?

 <details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
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
  ```
</details>

**Results:**
| **overall_acceptance** |
|------------------------|
| 5.96                   |

4️⃣ How many customers belong to each education level?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
	education,
	COUNT(*) AS number_of_customers
FROM 
	marketing_campaign
GROUP BY 
	education
ORDER BY
	number_of_customers DESC;
  ```
</details>

**Results:**
| **education** | **number_of_customers** |
|---------------|-------------------------|
| Graduation    | 1127                    |
| PhD           | 486                     |
| Master        | 370                     |
| 2n Cycle      | 203                     |
| Basic         | 54                      |

5️⃣ What is the average income of customers who accepted the most recent campaign?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    ROUND(AVG(Income), 2) AS avg_income_accepted
FROM 
    marketing_campaign
WHERE 
    Response = TRUE;
  ```
</details>

**Results:**
| **avg_income_accepted** |
|-------------------------|
| 60209.68                |

6️⃣ Which purchase channel had the highest number of purchases?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT
	SUM(NumWebPurchases) AS Web_Purchases,
    SUM(NumCatalogPurchases) AS Catalog_Purchases,
    SUM(NumStorePurchases) AS Store_Purchases
FROM
	marketing_campaign;
  ```
</details>

**Results:**
| **web_purchases** | **catalog_purchases** | **store_purchases** |
|-------------------|-----------------------|---------------------|
| 9150              | 5963                  | 12970               |

7️⃣ How many customers visited the website more than five times in the last month?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    COUNT(*) AS customers_with_more_than_5_visits
FROM 
    marketing_campaign
WHERE 
    NumWebVisitsMonth > 5;
  ```
</details>

**Results:**
| **customers_with_more_than_5_visits** |
|---------------------------------------|
| 1170                                  |

8️⃣ What is the average number of days since the last purchase across all customers?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    ROUND(AVG(Recency), 2) AS avg_days_since_last_purchase
FROM 
    marketing_campaign;
  ```
</details>

**Results:**
| **avg_days_since_last_purchase** |
|----------------------------------|
| 49.11                            |

9️⃣ How many customers made at least one purchase using a discount?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    COUNT(*) AS customers_with_discount_purchases
FROM 
    marketing_campaign
WHERE 
    NumDealsPurchases >= 1;
  ```
</details>

**Results:**
| **customers_with_discount_purchases** |
|---------------------------------------|
| 2194                                  |

