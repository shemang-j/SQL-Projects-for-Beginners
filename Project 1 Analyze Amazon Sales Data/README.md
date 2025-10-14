
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

## 🧩 Practice Questions
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
[E-Commerce Sales Dataset on Kaggle](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data) :contentReference[oaicite:0]{index=0}  

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
 | "total_sales_record" |
|----------------------|
| 128975               |
