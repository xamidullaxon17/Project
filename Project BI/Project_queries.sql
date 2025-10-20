select * from pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS AVG_Order_Value FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS AVG_Pizzas_Per_Order from pizza_sales; -- CAST(12 AS CHAR); sonni int, float yoki stringga o'giradi

SELECT DAYNAME(order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY Order_Day ORDER BY Total_Orders;

SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY Month_Name;

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTHNAME(order_date) = 'January') AS Total_Sales 
FROM pizza_sales WHERE MONTHNAME(order_date) = 'January' GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales WHERE QUARTER(order_date) = 1 GROUP BY pizza_size;

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue DESC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Quantity ASC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders DESC LIMIT 5;


