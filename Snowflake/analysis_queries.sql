---- 1: KPI----------
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM SUPERSTORE_ANALYTICS.RAW_DATA.SUPERSTORE_ORDERS;

-------- 2: Time Series Trend -------------
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS order_month,
SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM SUPERSTORE_ANALYTICS.RAW_DATA.SUPERSTORE_ORDERS
GROUP BY order_month
ORDER BY order_month;

-----------3: Sales, Profit, Orders by State and Segment ---------
SELECT state, segment, 
       SUM(sales) AS total_sales, 
       SUM(profit) AS total_profit, 
       COUNT(DISTINCT order_id) AS total_orders
FROM SUPERSTORE_ANALYTICS.RAW_DATA.SUPERSTORE_ORDERS
GROUP BY state, segment;

--------------4: Sales, Profit, Orders by Category and Sub-Category----------
SELECT category, sub_category, 
       SUM(sales) AS total_sales, 
       SUM(profit) AS total_profit, 
       COUNT(DISTINCT order_id) AS total_orders
FROM SUPERSTORE_ANALYTICS.RAW_DATA.SUPERSTORE_ORDERS
GROUP BY category, sub_category;

-------------------5: Top 10 Customers by Sales----------------------------
SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM SUPERSTORE_ANALYTICS.RAW_DATA.SUPERSTORE_ORDERS
GROUP BY customer_id, customer_name
ORDER BY sales_rank
LIMIT 10;


-------------- 6: Top 10 "Manufacturers" -------------------
SELECT 
    product_id, 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM SUPERSTORE_ANALYTICS.RAW_DATA.SUPERSTORE_ORDERS
GROUP BY product_id, product_name
ORDER BY total_sales DESC
LIMIT 10;
