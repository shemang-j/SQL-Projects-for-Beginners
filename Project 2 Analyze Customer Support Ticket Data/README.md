
# 🧮 Project 2: Analyze Customer Support Ticket Data

## 📘 Project Overview
This project focuses on exploring customer support ticket data to understand common issues and how they are handled. You'll work with real-world support data to surface patterns and trends that inform customer service operations.

---

## 🎯 Learning Objectives
- Write SQL queries to explore customer service-related datasets
- Clean and standardize text-based fields
- Aggregate data to find trends in issue types, resolution times, and volumes
- Practice filtering and summarizing operational data

--- 

<details>
<summary><h2>🧩 Practice Questions</h2></summary>
Here are some beginner-friendly questions to get you started:

1. How many support tickets are in the dataset?
2. What are the most common issue types reported?
3. How many tickets were submitted through each support channel?
4. What is the average resolution time across all tickets?
5. How many tickets were resolved on the same day they were submitted?
6. How many tickets were submitted each month?
7. What is the total number of unresolved tickets?

</details>

---

<details>
<summary><h2>🧾 About the Dataset</h2></summary>

The Customer Support Ticket Dataset is a dataset that includes customer support tickets for various tech products. It consists of customer inquiries related to hardware issues, software bugs, network problems, account access, data loss, and other support topics. The dataset provides information about the customer, the product purchased, the ticket type, the ticket channel, the ticket status, and other relevant details.

## 📊 Column Description

| **Column Name**              | **Description**                                                                 |
|-------------------------------|---------------------------------------------------------------------------------|
| `Ticket ID`                   | A unique identifier for each ticket. *(String / Integer)*                      |
| `Customer Name`               | The name of the customer who raised the ticket. *(String)*                     |
| `Customer Email`              | The email address of the customer. *(String)*                                  |
| `Customer Age`                | The age of the customer. *(Integer)*                                            |
| `Customer Gender`             | The gender of the customer. *(String)*                                          |
| `Product Purchased`           | The tech product purchased by the customer. *(String)*                         |
| `Date of Purchase`            | The date when the product was purchased. *(Date)*                              |
| `Ticket Type`                 | The type of ticket (e.g., technical issue, billing inquiry, product inquiry). *(String)* |
| `Ticket Subject`              | The subject or topic of the ticket. *(String)*                                 |
| `Ticket Description`          | The description of the customer's issue or inquiry. *(Text)*                   |
| `Ticket Status`               | The current status of the ticket (e.g., open, closed, pending). *(String)*      |
| `Resolution`                  | The resolution or solution provided for closed tickets. *(Text)*               |
| `Ticket Priority`             | The priority level assigned to the ticket (e.g., low, medium, high, critical). *(String)* |
| `Ticket Channel`              | The channel through which the ticket was raised (e.g., email, phone, chat). *(String)* |
| `First Response Time`         | The time taken to provide the first response to the customer. *(Interval / Time)* |
| `Time to Resolution`          | The time taken to resolve the ticket. *(Interval / Time)*                      |
| `Customer Satisfaction Rating`| The customer’s satisfaction rating for closed tickets (on a scale of 1 to 5). *(Integer)* |

You can download the dataset from Kaggle here:  
[Customer Support Ticket Dataset](https://www.kaggle.com/datasets/suraj520/customer-support-ticket-dataset)   

</details>


---

<details>
<summary><h2>🧠 Solution</h2></summary>

1️⃣ How many support tickets are in the dataset?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT
	COUNT(*) AS number_of_support_ticketrs
FROM 
	customer_tickets;
  ```
</details>

**Results:**
 | **number_of_support_ticketrs** 	|
|------------------------------	|
| 8469                         	|

2️⃣ What are the most common issue types reported?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT
	ticket_subject,
	COUNT(ticket_subject) AS number_of_support_tickets
FROM 
	customer_tickets
GROUP BY 
	ticket_subject
ORDER BY 
	number_of_support_tickets DESC
LIMIT 5;
  ```
</details>

**Results:**
 | **ticket_subject**        	| **number_of_support_tickets** 	|
|-------------------------	|-----------------------------	|
| Refund request        	| 576                         	|
| Software bug          	| 574                         	|
| Product compatibility 	| 567                         	|
| Delivery problem      	| 561                         	|
| Hardware issue        	| 547                         	|

3️⃣ How many tickets were submitted through each support channel?

 <details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT
	ticket_channel,
	COUNT(ticket_channel) AS number_of_support_channels
FROM 
	customer_tickets
GROUP BY 
	ticket_channel
ORDER BY 
	number_of_support_channels DESC;
  ```
</details>

**Results:**
| **ticket_channel** 	| **number_of_support_channels** 	|
|------------------	|------------------------------	|
| Email          	| 2143                         	|
| Phone          	| 2132                         	|
| Social media   	| 2121                         	|
| Chat           	| 2073                         	|

4️⃣ What is the average resolution time across all tickets?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    AVG(time_to_resolution - first_response_time) AS avg_resolution_time
FROM 
    customer_tickets
WHERE 
    first_response_time IS NOT NULL 
    AND time_to_resolution IS NOT NULL;
  ```
</details>

**Results:**
| **avg_resolution_time** 	|
|-------------------------	|
| -00:03:27.735645        	|

5️⃣ How many tickets were resolved on the same day they were submitted?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
	COUNT(*) AS same_day_resolved_tickets
FROM 
	customer_tickets
WHERE 
	DATE(time_to_resolution) = DATE(first_response_time)
	AND time_to_resolution IS NOT NULL
    AND first_response_time IS NOT NULL;
  ```
</details>

**Results:**
| **same_day_resolved_tickets** 	|
|-------------------------------	|
| 2558                          	|

6️⃣ How many tickets were submitted each month?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
    TO_CHAR(date_of_purchase, 'month') AS month,
    COUNT(*) AS total_tickets
FROM 
    customer_tickets
GROUP BY 
    month
ORDER BY 
    MIN(date_of_purchase);
  ```
</details>

**Results:**
| **month** 	| **total_tickets** 	|
|-----------	|-------------------	|
| january   	| 736               	|
| february  	| 715               	|
| march     	| 672               	|
| april     	| 718               	|
| may       	| 701               	|
| june      	| 678               	|
| july      	| 727               	|
| august    	| 691               	|
| september 	| 696               	|
| october   	| 735               	|
| november  	| 704               	|
| december  	| 696               	|

7️⃣ What is the total number of unresolved tickets?

<details>
  <summary>Click to expand answer!</summary>

  ##### Answer
  ```sql
SELECT 
	COUNT(*) AS unresolved_tickets
FROM 
	customer_tickets
WHERE 
	time_to_resolution IS NULL;
  ```
</details>

**Results:**
| **unresolved_tickets** 	|
|------------------------	|
| 5700                   	|
