
DROP TABLE IF EXISTS customer_tickets;
CREATE TABLE customer_tickets (

	Ticket_ID SERIAL PRIMARY KEY,
	Customer_Name VARCHAR(100),
	Customer_Email VARCHAR(150),
	Customer_Age INT,
	Customer_Gender VARCHAR(20),
	Product_Purchased VARCHAR(100),
	Date_of_Purchase DATE,
	Ticket_Type VARCHAR(50), 
	Ticket_Subject VARCHAR(100),
	Ticket_Description TEXT,
	Ticket_Status VARCHAR(50),
	Resolution TEXT,
	Ticket_Priority VARCHAR(20),
	Ticket_Channel VARCHAR(50),
	First_Response_Time TIMESTAMP,
	Time_to_Resolution TIMESTAMP,
	Customer_Satisfaction_Rating INT
	);
	

--1. How many support tickets are in the dataset?

SELECT
	COUNT(*) AS number_of_support_ticketrs
FROM customer_tickets;

--2. What are the most common issue types reported?

SELECT
	ticket_subject,
	COUNT(ticket_subject) AS number_of_support_tickets
FROM 
	customer_tickets
GROUP BY 
	ticket_subject
ORDER BY 
	number_of_support_ticketrs DESC
LIMIT 5;

--3. How many tickets were submitted through each support channel?

SELECT
	ticket_channel,
	COUNT(ticket_channel) AS number_of_support_channels
FROM 
	customer_tickets
GROUP BY 
	ticket_channel
ORDER BY 
	number_of_support_channels DESC;

--4. What is the average resolution time across all tickets?

SELECT 
    AVG(time_to_resolution - first_response_time) AS avg_resolution_time
FROM 
    customer_tickets
WHERE 
    first_response_time IS NOT NULL 
    AND time_to_resolution IS NOT NULL;

--5. How many tickets were resolved on the same day they were submitted?

SELECT 
	COUNT(*) AS same_day_resolved_tickets
FROM 
	customer_tickets
WHERE 
	DATE(time_to_resolution) = DATE(first_response_time)
	AND time_to_resolution IS NOT NULL
    AND first_response_time IS NOT NULL;

--6. How many tickets were submitted each month?

SELECT 
    TO_CHAR(date_of_purchase, 'month') AS month,
    COUNT(*) AS total_tickets
FROM 
    customer_tickets
GROUP BY 
    month
ORDER BY 
    MIN(date_of_purchase);

--7. What is the total number of unresolved tickets?

SELECT 
	COUNT(*) AS unresolved_tickets
FROM 
	customer_tickets
WHERE 
	time_to_resolution IS NULL;
