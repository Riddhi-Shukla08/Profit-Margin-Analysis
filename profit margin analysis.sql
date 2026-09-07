CREATE DATABASE marketing_analysis;

USE marketing_analysis;

CREATE TABLE superstore (
    order_id VARCHAR(20),
    order_date DATE,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    quantity INT,
    discount DECIMAL(5,2),
    sales DECIMAL(12,2),
    profit DECIMAL(12,2)
);

SELECT * FROM superstore LIMIT 10;

USE marketing_analysis;

SELECT
    SUM(sales) AS Total_Sales,
    SUM(profit) AS Total_Profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore;

USE marketing_analysis;

SELECT
    region,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY region
ORDER BY Profit_Margin_Percent DESC;

SELECT
    category,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY category
ORDER BY Profit_Margin_Percent DESC;

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY Profit_Margin_Percent ASC;

SELECT
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Order_Year, Order_Month;

SELECT
    region,
    category,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY region, category
ORDER BY Profit_Margin_Percent DESC;


