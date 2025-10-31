------------1. Dashboard KPI Summary--------------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.kpi_summary AS
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM RAW_DATA.SUPERSTORE_ORDERS;
----------2. Monthly Trend (Sales/Profit/Orders)------------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.monthly_trend AS
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS order_month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM RAW_DATA.SUPERSTORE_ORDERS
GROUP BY order_month
ORDER BY order_month;
---------3. Sales by State------------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.sales_by_state AS
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM RAW_DATA.SUPERSTORE_ORDERS
GROUP BY state
ORDER BY total_sales DESC;
-----------4. Sales by Segment---------------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.sales_by_segment AS
SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM RAW_DATA.SUPERSTORE_ORDERS
GROUP BY segment
ORDER BY total_sales DESC;
--------5. Sales by Category & Sub-Category----------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.sales_by_cat_subcat AS
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM RAW_DATA.SUPERSTORE_ORDERS
GROUP BY category, sub_category
ORDER BY total_sales DESC;
------6. Top 10 Customers by Sales----------------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.top_customers AS
SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM RAW_DATA.SUPERSTORE_ORDERS
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;
------------7. Top 10 Products by Sales---------
CREATE OR REPLACE VIEW SUPERSTORE_ANALYTICS.ANALYTICS.top_products AS
SELECT
    product_id,
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM RAW_DATA.SUPERSTORE_ORDERS
GROUP BY product_id, product_name
ORDER BY total_sales DESC
LIMIT 10;
