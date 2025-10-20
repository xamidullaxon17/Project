select * from pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

SELECT SUM(quantity) AS total_pizza_sold
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / COUNT(DISTINCT order_id) AS avg_pizzas_per_order
FROM pizza_sales;

SELECT TO_CHAR(order_date, 'Day') AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales GROUP BY order_day ORDER BY total_orders;

SELECT TO_CHAR(order_date, 'Month') AS month_name,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales GROUP BY month_name;

SELECT pizza_category,
       CAST(SUM(total_price) * 100.0 / (
           SELECT SUM(total_price)
           FROM pizza_sales
           WHERE TRIM(TO_CHAR(order_date, 'Month')) = 'January'
       ) AS DECIMAL(10,2)) AS total_sales_pct
FROM pizza_sales
WHERE TRIM(TO_CHAR(order_date, 'Month')) = 'January'
GROUP BY pizza_category;

SELECT pizza_size,
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales,
       CAST(SUM(total_price) * 100.0 / (
           SELECT SUM(total_price) FROM pizza_sales
       ) AS DECIMAL(10,2)) AS pct
FROM pizza_sales WHERE EXTRACT(QUARTER FROM order_date) = 1 GROUP BY pizza_size;

SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales GROUP BY pizza_name ORDER BY total_revenue DESC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales GROUP BY pizza_name ORDER BY total_quantity ASC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name ORDER BY total_orders DESC LIMIT 5;







