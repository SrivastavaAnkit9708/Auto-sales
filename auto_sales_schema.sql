CREATE TABLE auto_sales (
    order_number INT,
    quantity_ordered INT,
    price_each DECIMAL(10,2),
    orderline_number INT,
    sales DECIMAL(12,2),
    order_date DATE,
    days_since_lastorder INT,
    status VARCHAR(50),
    product_line VARCHAR(100),
    msrp INT,
    product_code VARCHAR(50),
    customer_name VARCHAR(255),
    phone VARCHAR(50),
    address_line1 VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    last_name VARCHAR(100),
    first_name VARCHAR(100),
    deal_size VARCHAR(50)
);

-- Total records
SELECT COUNT(*) FROM auto_sales;

-- Total sales
SELECT ROUND(SUM(sales),2) AS total_sales
FROM auto_sales;

-- Product line wise sales
SELECT product_line,
       ROUND(SUM(sales),2) AS total_sales
FROM auto_sales
GROUP BY product_line
ORDER BY total_sales DESC;

-- Country wise sales
SELECT country,
       ROUND(SUM(sales),2) AS total_sales
FROM auto_sales
GROUP BY country
ORDER BY total_sales DESC;

-- Year wise sales trend
SELECT YEAR(order_date) AS year,
       ROUND(SUM(sales),2) AS total_sales
FROM auto_sales
GROUP BY year
ORDER BY year;
