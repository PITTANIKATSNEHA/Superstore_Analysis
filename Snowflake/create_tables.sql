-- Create a new database for your project
CREATE DATABASE SUPERSTORE_ANALYTICS;
-- Use the database
USE DATABASE SUPERSTORE_ANALYTICS;
-- Create schema for raw data
CREATE SCHEMA RAW_DATA;
-- Create schema for analytics
CREATE SCHEMA ANALYTICS;

-- Create table for your Superstore data (RAW_DATA schema)
CREATE OR REPLACE TABLE RAW_DATA.superstore_orders (
    row_id INT,
    order_id VARCHAR,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR,
    customer_id VARCHAR,
    customer_name VARCHAR,
    segment VARCHAR,
    country VARCHAR,
    city VARCHAR,
    state VARCHAR,
    postal_code VARCHAR,
    region VARCHAR,
    product_id VARCHAR,
    category VARCHAR,
    sub_category VARCHAR,
    product_name VARCHAR,
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);
