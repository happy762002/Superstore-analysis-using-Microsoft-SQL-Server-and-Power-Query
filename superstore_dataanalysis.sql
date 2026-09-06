CREATE DATABASE store_analysis;

SELECT name
FROM   sys.databases;

USE store_analysis;

SELECT name
FROM   sys.tables;

/*finding the total numbers of record*/
SELECT count(*) AS numbers_of_records
FROM   superstore;

/*TOTALS ANALYSYT*/
GO 
CREATE VIEW Totals AS
SELECT count(DISTINCT order_id) AS Total_Orders,
       count(DISTINCT Customer_ID) AS Total_Customers,
       count(DISTINCT Product_ID) AS Total_Product,
       round(SUM(sales), 2) AS Total_Sales,
       round(SUM(Profit), 2) AS Total_Profit,
       round(SUM(Profit) / SUM(sales) * 100, 2) AS Margin_Percentage,
       ROUND(avg(discount) * 100, 2) AS Avg_Discount
FROM   superstore;

/*MARGIN BY SUBCATEGORIES*/
GO
CREATE VIEW margin_by_subcat AS
SELECT
    Sub_Category,
    COUNT(DISTINCT Product_ID) AS Total_Product,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Percentage,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount
FROM Superstore
GROUP BY Sub_Category;

/*DISCOUNT RANGE*/

/*CREATING CTE*/
GO
CREATE VIEW Discount_Range AS
WITH discount_data AS(
SELECT   CASE 
            WHEN discount = 0 THEN '0%' 
            WHEN discount <= 0.15 THEN '1% - 15%' 
            WHEN discount <= 0.30 THEN '16% - 30%' 
            WHEN discount <= 0.50 THEN '31% - 50%' 
            ELSE '50% +'
         END AS Discount_band,
         Product_ID,
         Sales,
         Profit
from superstore
)

SELECT   Discount_band,
         count(Product_ID) AS Total_Product,
         round(sum(sales), 2) AS Total_Sales,
         round(sum(sales) / sum(sum(sales)) OVER () * 100, 2) AS Total_Sales_percentage,
         round(sum(profit), 2) AS Total_Profit,
         round(sum(profit) / sum(sales) * 100, 2) AS Margin_pct
FROM     discount_data
GROUP BY Discount_band;

/*TOP SELLING SUBCAT BY REGION*/
GO
CREATE VIEW TOP_5_SELLING_SUBCAT_BY_REGION AS
WITH   nthsales
AS     (SELECT   Region,
                 sub_category,
                 round(sum(sales), 2) AS Total_sales,
                 round(sum(Profit), 2) AS Total_profit,
                 DENSE_RANK() OVER (ORDER BY round(sum(sales), 2) DESC) AS rnk
        FROM     superstore
        GROUP BY region, sub_category)
SELECT region,
       Sub_Category,
       Total_sales,
       Total_profit
FROM   nthsales
WHERE  rnk BETWEEN 1 AND 5;

/*TOP STATE WITH HIGHEST NUMBER OF ORDERS AND SALES*/
GO
CREATE VIEW TOP_STATE_HIGHEST_SALES AS
WITH   topstate
AS     (SELECT   state,
                 count(DISTINCT customer_id) AS Total_Customer,
                 COUNT(product_id) AS Total_Product,
                 round(SUM(sales), 2) AS Total_Sales,
                 DENSE_RANK() OVER (ORDER BY round(SUM(sales), 2) DESC) AS rnk
        FROM     superstore
        GROUP BY state)
SELECT state,
       total_customer,
       total_product,
       total_sales
FROM   topstate
WHERE  rnk BETWEEN 1 AND 5;

SELECT NAME FROM SYS.views;


SELECT *
FROM   superstore;

EXECUTE sp_help 'superstore';

EXECUTE sp_rename 'TOP_5_SELLING_SUBCAT_BY_REGION', 'TOP_SELLING_SUBCAT_BY_REGION';
