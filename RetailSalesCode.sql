-- EDA
SELECT *
FROM RETAIL.PUBLIC.SALES;

SELECT DISTINCT PRODUCT_CATEGORY
FROM RETAIL.PUBLIC.SALES;

SELECT MIN(DATE) AS earliest_date
FROM RETAIL.PUBLIC.SALES;

SELECT MAX(DATE) AS latest_date
FROM RETAIL.PUBLIC.SALES;

SELECT MIN(Age) AS youngest_cust
FROM RETAIL.PUBLIC.SALES;

SELECT MAX(Age) AS oldest_cust
FROM RETAIL.PUBLIC.SALES;

-- PROCESSING
SELECT
COUNT(DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT customer_id) AS number_of_customers,

DAYNAME(date) AS day_name,
MONTHNAME(date) AS month_name,
DAYOFMONTH(date) AS day_of_month,

gender,
age,
product_category,
quantity,
price_per_unit,
total_amount,

SUM(IFNULL(total_amount,0)) AS total_revenue,
SUM(IFNULL(quantity,0)) AS total_quantity,

CASE 
WHEN age BETWEEN 18 AND 35 THEN 'Youth(18-35)'
WHEN age BETWEEN 36 AND 59 THEN 'Adult(36-59)'
ELSE 'Senior(60+)'
END AS Age_groups,

FROM RETAIL.PUBLIC.SALES
GROUP BY ALL;
